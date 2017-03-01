using System;
using System.Collections;
using System.IO;
using System.Net;
using System.Net.Sockets;
using System.Threading;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.Text;
using System.Collections.Generic;

// offered to the public domain for any use with no restriction
// and also with no warranty of any kind, please enjoy. - David Jeske. 

// simple HTTP explanation
// http://www.jmarshall.com/easy/http/

namespace Bend.Util {

    public class HttpProcessor {
        public TcpClient socket;        
        public HttpServer srv;

        private Stream inputStream;
        public StreamWriter outputStream;

        public String http_method;
        public String http_url;
        public String http_protocol_versionstring;
        public Hashtable httpHeaders = new Hashtable();


        private static int MAX_POST_SIZE = 10 * 1024 * 1024; // 10MB

        public HttpProcessor(TcpClient s, HttpServer srv) {
            this.socket = s;
            this.srv = srv;                   
        }
        

        private string streamReadLine(Stream inputStream) {
            int next_char;
            string data = "";
            while (true) {
                next_char = inputStream.ReadByte();
                if (next_char == '\n') { break; }
                if (next_char == '\r') { continue; }
                if (next_char == -1) { Thread.Sleep(1); continue; };
                data += Convert.ToChar(next_char);
            }            
            return data;
        }
        public void process() {                        
            // we can't use a StreamReader for input, because it buffers up extra data on us inside it's
            // "processed" view of the world, and we want the data raw after the headers
            inputStream = new BufferedStream(socket.GetStream());

            // we probably shouldn't be using a streamwriter for all output from handlers either
            outputStream = new StreamWriter(new BufferedStream(socket.GetStream()));
            try {
                parseRequest();
                readHeaders();
                if (http_method.Equals("GET")) {
                    handleGETRequest();
                } else if (http_method.Equals("POST")) {
                    handlePOSTRequest();
                }
            } catch (Exception e) {
                Console.WriteLine("Exception: " + e.ToString());
                writeFailure();
            }
            outputStream.Flush();
            // bs.Flush(); // flush any remaining output
            inputStream = null; outputStream = null; // bs = null;            
            socket.Close();             
        }

        public void parseRequest() {
            String request = streamReadLine(inputStream);
            string[] tokens = request.Split(' ');
            if (tokens.Length != 3) {
                throw new Exception("invalid http request line");
            }
            http_method = tokens[0].ToUpper();
            http_url = tokens[1];
            http_protocol_versionstring = tokens[2];

            Console.WriteLine("starting: " + request);
        }

        public void readHeaders() {
            Console.WriteLine("readHeaders()");
            String line;
            while ((line = streamReadLine(inputStream)) != null) {
                if (line.Equals("")) {
                    Console.WriteLine("got headers");
                    return;
                }
                
                int separator = line.IndexOf(':');
                if (separator == -1) {
                    throw new Exception("invalid http header line: " + line);
                }
                String name = line.Substring(0, separator);
                int pos = separator + 1;
                while ((pos < line.Length) && (line[pos] == ' ')) {
                    pos++; // strip any spaces
                }
                    
                string value = line.Substring(pos, line.Length - pos);
                Console.WriteLine("header: {0}:{1}",name,value);
                httpHeaders[name] = value;
            }
        }

        public void handleGETRequest() {
            srv.handleGETRequest(this);
        }

        private const int BUF_SIZE = 4096;
        public void handlePOSTRequest() {
            // this post data processing just reads everything into a memory stream.
            // this is fine for smallish things, but for large stuff we should really
            // hand an input stream to the request processor. However, the input stream 
            // we hand him needs to let him see the "end of the stream" at this content 
            // length, because otherwise he won't know when he's seen it all! 

            Console.WriteLine("get post data start");
            int content_len = 0;
            MemoryStream ms = new MemoryStream();
            if (this.httpHeaders.ContainsKey("Content-Length")) {
                 content_len = Convert.ToInt32(this.httpHeaders["Content-Length"]);
                 if (content_len > MAX_POST_SIZE) {
                     throw new Exception(
                         String.Format("POST Content-Length({0}) too big for this simple server",
                           content_len));
                 }
                 byte[] buf = new byte[BUF_SIZE];              
                 int to_read = content_len;
                 while (to_read > 0) {  
                     Console.WriteLine("starting Read, to_read={0}",to_read);

                     int numread = this.inputStream.Read(buf, 0, Math.Min(BUF_SIZE, to_read));
                     Console.WriteLine("read finished, numread={0}", numread);
                     if (numread == 0) {
                         if (to_read == 0) {
                             break;
                         } else {
                             throw new Exception("client disconnected during post");
                         }
                     }
                     to_read -= numread;
                     ms.Write(buf, 0, numread);
                 }
                 ms.Seek(0, SeekOrigin.Begin);
            }
            Console.WriteLine("get post data end");
            srv.handlePOSTRequest(this, new StreamReader(ms));

        }

        public void writeSuccess(string content_type="text/html") {
            // this is the successful HTTP response line
            outputStream.WriteLine("HTTP/1.0 200 OK");  
            // these are the HTTP headers...          
            outputStream.WriteLine("Content-Type: " + content_type);
            outputStream.WriteLine("Connection: close");
            // ..add your own headers here if you like

            outputStream.WriteLine(""); // this terminates the HTTP headers.. everything after this is HTTP body..
        }

        public void writeFailure() {
            // this is an http 404 failure response
            outputStream.WriteLine("HTTP/1.0 404 File not found");
            // these are the HTTP headers
            outputStream.WriteLine("Connection: close");
            // ..add your own headers here

            outputStream.WriteLine(""); // this terminates the HTTP headers.
        }
    }

    public abstract class HttpServer {

        protected int port;
        TcpListener listener;
        bool is_active = true;
       
        public HttpServer(int port) {
            this.port = port;
        }

        public void listen() {
            IPAddress ipAd = IPAddress.Parse("127.0.0.1");
            listener = new TcpListener(ipAd, port);
            listener.Start();
            while (is_active) {                
                TcpClient s = listener.AcceptTcpClient();
                HttpProcessor processor = new HttpProcessor(s, this);
                Thread thread = new Thread(new ThreadStart(processor.process));
                thread.Start();
                Thread.Sleep(1);
            }
        }

        public abstract void handleGETRequest(HttpProcessor p);
        public abstract void handlePOSTRequest(HttpProcessor p, StreamReader inputData);
    }

    public class MyHttpServer : HttpServer {

        JObject config;

        public MyHttpServer(int port, JObject _config)
            : base(port)
        {
            config = _config;
        }

        public override void handleGETRequest (HttpProcessor p)
		{
			if (p.http_url.Equals ("/Test.png"))
            {
				Stream fs = File.Open("../../Test.png",FileMode.Open);

				p.writeSuccess("image/png");
				fs.CopyTo (p.outputStream.BaseStream);
				p.outputStream.BaseStream.Flush ();
			}

            Console.WriteLine("request: {0}", p.http_url);
            p.writeSuccess();

            String parameter = p.http_url.Remove(0, 1);
            Dictionary<String, String> dic_params = new Dictionary<string, string>();

            String method = "";

            int at = parameter.IndexOf("?");
            if( at != -1)
            {
                method = parameter.Substring(0, at);
                parameter = parameter.Remove(0, at + 1);

                String[] parameters = parameter.Split('&');
                for (int i = 0; i < parameters.Length; ++i)
                {
                    String[] res = parameters[i].Split('=');
                    if (res.Length != 2)
                    {
                        continue;
                    }

                    dic_params.Add(res[0], res[1]);
                }
            }
            else
            {
                method = parameter;
            }

            if(method == "receipt_check")
            {
                String access_token = "";
                if (false == google_auth(ref access_token))
                {
                    String json = "{ \"contents_error\":\"google_auth\" }";
                    p.outputStream.WriteLine(json);

                    Console.WriteLine("google_auth failed. " + parameter);
                    return;
                }

                if (false == purchase_check(access_token, dic_params["products"], dic_params["tokens"]))
                {
                    String json = "{ \"contents_error\":\"purchase_check\" }";
                    p.outputStream.WriteLine(json);

                    Console.WriteLine("purchase_check failed. " + parameter + " access_token : " + access_token);
                    return;
                }

                String result = "";
                if (false == shop_buy(ref result, dic_params["products"], dic_params["user_no"]))
                {
                    p.outputStream.WriteLine(result);
                    return;
                }
            }
            else
            {
                p.outputStream.WriteLine("<html><body><h1>receipt server</h1>");
                //p.outputStream.WriteLine("Current Time: " + DateTime.Now.ToString());
                p.outputStream.WriteLine("url : {0}", p.http_url);

                p.outputStream.WriteLine("<form method=post action=/form>");
                p.outputStream.WriteLine("<input type=text name=foo value=foovalue>");
                p.outputStream.WriteLine("<input type=submit name=bar value=barvalue>");
                p.outputStream.WriteLine("</form>");
            }
        }

        public bool google_auth(ref String access_token)
        {
            // POST, GET 보낼 데이터 입력
            StringBuilder dataParams = new StringBuilder();
            dataParams.Append("client_id=156081241075-8f6ja9i0vp1rcdi8fkv2u05b8pk7o61h.apps.googleusercontent.com");
            dataParams.Append("&client_secret=" + config["client_secret"]);
            dataParams.Append("&refresh_token=" + config["refresh_token"]);
            dataParams.Append("&grant_type=refresh_token");

            String result = "";
            if (false == http_post("https://accounts.google.com/o/oauth2/token", dataParams.ToString(), ref result))
            {
                return false;
            }

            JObject obj = JObject.Parse(result);
            access_token = obj["access_token"].ToString();
            return true;
        }


        public bool purchase_check(String access_token, String products, String tokens)
        {
            // POST, GET 보낼 데이터 입력
            StringBuilder dataParams = new StringBuilder();
            dataParams.Append("access_token=" + access_token);

            String result = "";
            if (false == http_get("https://www.googleapis.com/androidpublisher/v2/applications/" + config["package_name"] + "/purchases/products/" + products + "/tokens/" + tokens, dataParams.ToString(), ref result))
            {
                return false;
            }

            JObject obj = JObject.Parse(result);
            access_token = obj["access_token"].ToString();
            return true;
        }

        public bool shop_buy(ref String result, String products, String user_no)
        {
            // POST, GET 보낼 데이터 입력
            StringBuilder dataParams = new StringBuilder();
            dataParams.Append("shop_item_id=" + products);
            dataParams.Append("&user_no=" + user_no);

            if (false == http_get(config["server_ip"] + "/shop/buy.json", dataParams.ToString(), ref result))
            {
                return false;
            }

            return true;
        }

        private bool http_post(String url, String parameters, ref String result)
        {
            try
            {
                // 요청 String -> 요청 Byte 변환
                byte[] byteDataParams = UTF8Encoding.UTF8.GetBytes(parameters);

                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
                request.Method = "POST";    // 기본값 "GET"
                request.ContentType = "application/x-www-form-urlencoded";
                request.ContentLength = byteDataParams.Length;

                // 요청 Byte -> 요청 Stream 변환
                Stream stDataParams = request.GetRequestStream();
                stDataParams.Write(byteDataParams, 0, byteDataParams.Length);
                stDataParams.Close();

                // 요청, 응답 받기
                HttpWebResponse response = (HttpWebResponse)request.GetResponse();

                // 응답 Stream 읽기
                Stream stReadData = response.GetResponseStream();
                StreamReader srReadData = new StreamReader(stReadData, Encoding.Default);

                // 응답 Stream -> 응답 String 변환
                result = srReadData.ReadToEnd();

#if DEBUG
                Console.WriteLine(result);
#endif // 
                return true;
            }
            catch (WebException ex)
            {
                if (ex.Status == WebExceptionStatus.ProtocolError && ex.Response != null)
                {
                    var resp = (HttpWebResponse)ex.Response;
                    if (resp.StatusCode == HttpStatusCode.NotFound)
                    {
                        Console.WriteLine(resp.StatusDescription);
                    }
                    else
                    {
                        Console.WriteLine(resp.StatusDescription);
                    }
                }
                else
                {
                    Console.WriteLine(ex.ToString());
                }
                return false;
            }
        }

        private bool http_get(String url, String parameters, ref String result)
        {
            try
            {
                // 요청 String -> 요청 Byte 변환
                byte[] byteDataParams = UTF8Encoding.UTF8.GetBytes(parameters);

                /* GET */
                // GET 방식은 Uri 뒤에 보낼 데이터를 입력하시면 됩니다.
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url + "?" + parameters);
                request.Method = "GET";

                // 요청, 응답 받기
                HttpWebResponse response = (HttpWebResponse)request.GetResponse();

                // 응답 Stream 읽기
                Stream stReadData = response.GetResponseStream();
                StreamReader srReadData = new StreamReader(stReadData, Encoding.Default);

                // 응답 Stream -> 응답 String 변환
                result = srReadData.ReadToEnd();

#if DEBUG
                Console.WriteLine(result);
#endif // 
                return true;
            }
            catch (WebException ex)
            {
                if (ex.Status == WebExceptionStatus.ProtocolError && ex.Response != null)
                {
                    var resp = (HttpWebResponse)ex.Response;
                    if (resp.StatusCode == HttpStatusCode.NotFound)
                    {
                        Console.WriteLine("Reason : " + ex.ToString() + " Desc : " + resp.StatusDescription);
                    }
                    else
                    {
                        Console.WriteLine("Reason : " + ex.ToString() + " Desc : " + resp.StatusDescription);
                    }
                }
                else
                {
                    Console.WriteLine("Reason : " + ex.ToString());
                }
                return false;
            }
        }


        private byte[] JSON_to_string(string json, ref StringBuilder sb)
        {
            byte[] pBuffer = Encoding.UTF8.GetBytes(json);
            sb.AppendFormat("Content-Length: {0}\r\n", pBuffer.Length);
            sb.Append("\r\n");
            return pBuffer;
        }

        public override void handlePOSTRequest(HttpProcessor p, StreamReader inputData) {
            Console.WriteLine("POST request: {0}", p.http_url);
            string data = inputData.ReadToEnd();

            p.writeSuccess();
            p.outputStream.WriteLine("<html><body><h1>test server</h1>");
            p.outputStream.WriteLine("<a href=/test>return</a><p>");
            p.outputStream.WriteLine("postbody: <pre>{0}</pre>", data);
            

        }
    }

    public class TestMain {
        public static int Main(String[] args) {
            string config = "";
            JObject config_json = null;

            try
            {
                StreamReader sr = new StreamReader("config.json");
                string line;
                while ((line = sr.ReadLine()) != null)
                {
                    config += line;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("cannot fild config.json " + ex);
                return 1;
            }

            try
            {
                config_json = JObject.Parse(config);
            }
            catch (Exception ex)
            {
                Console.WriteLine("cannot parse to json. [config.json] " + ex);
                return 1;
            }

            Int16 port = 8080;
            HttpServer httpServer;
            if (args.GetLength(0) > 0) {
                port = Convert.ToInt16(args[0]);
            }

            httpServer = new MyHttpServer(port, config_json);
            Console.WriteLine("recept server started. port : " + port);
            Thread thread = new Thread(new ThreadStart(httpServer.listen));
            thread.Start();
            return 0;
        }

    }

}



