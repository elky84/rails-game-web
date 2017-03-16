using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Threading;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.Runtime.InteropServices;

namespace rails_post_tool
{
    public partial class Form : System.Windows.Forms.Form
    {
        Dictionary<string, Tuple<string, string> > dic_excel = new Dictionary<string, Tuple<string, string>>();

        Dictionary<string, string> dic_server = new Dictionary<string, string>();

        string destination;

        int execute_count = 0;
        private object lockObject = new object();

        public Form()
        {
            InitializeComponent();

            NativeMethods.AllocConsole();
            Console.WriteLine("Debug Console");
        }

        ~Form()
        {
            NativeMethods.FreeConsole();
        }

        private void Form_Load(object sender, EventArgs e)
        {
            lock (lockObject)
            {
                ++execute_count;
            }
            ExecuteCommandSync("ruby -I ../../../../gundam_base/SazabiExcel ../../../../gundam_base/SazabiExcel/ExcelReader.rb data/EXCEL_LIST.xlsx EXCEL_LIST INDEX json:file " + AppDomain.CurrentDomain.BaseDirectory + "data");

            lock (lockObject)
            {
                ++execute_count;
            }
            ExecuteCommandSync("ruby -I ../../../../gundam_base/SazabiExcel ../../../../gundam_base/SazabiExcel/ExcelReader.rb data/SERVER_LIST.xlsx SERVER_LIST INDEX json:file " + AppDomain.CurrentDomain.BaseDirectory + "data");

            set_excel_list();

            set_server_list();

        }

        private void set_excel_list()
        {
            string text = System.IO.File.ReadAllText("data/EXCEL_LIST.json");

            JObject obj = JObject.Parse(text);

            foreach (var x in obj)
            {
                string name = x.Key;
                JToken value = x.Value;

                var itemObj = value;
                string excel = itemObj[1].ToString().Trim();
                string key = itemObj[2].ToString().Trim();
                add_excel(excel, excel, key);
            }
        }

        public bool add_excel(string file, string excel, string index)
        {
            dic_excel.Add(excel, Tuple.Create<string, string>(index, file));

            if (true == listbox_excel.Items.Contains(excel))
            {
                MessageBox.Show("duplicated excel file. " + excel);
                return false;
            }

            listbox_excel.Items.Add(excel);
            return true;
        }

        private void set_server_list()
        {
            string text = System.IO.File.ReadAllText("data/SERVER_LIST.json");

            JObject obj = JObject.Parse(text);

            foreach (var x in obj)
            {
                string name = x.Key;
                JToken value = x.Value;

                var itemObj = value;
                string address = itemObj[2].ToString();
                string server_name = itemObj[3].ToString();
                dic_server.Add(server_name, address);

                if (true == comboBox_Destination.Items.Contains(server_name))
                {
                    MessageBox.Show("duplicated svr. " + server_name);
                    continue;
                }

                comboBox_Destination.Items.Add(server_name);
            }

            comboBox_Destination.SelectedIndex = 0;
        }

        private void button_none_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < listbox_excel.Items.Count; ++i)
            {
                if (listbox_excel.GetItemChecked(i))
                {
                    listbox_excel.SetItemChecked(i, false);
                }
            }

            checkBox_include_SERVER_LIST.Checked = false;
        }

        private void button_all_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < listbox_excel.Items.Count; ++i)
            {
                listbox_excel.SetItemChecked(i, true);
            }

            checkBox_include_SERVER_LIST.Checked = true;
        }

        private void button_run_Click(object sender, EventArgs e)
        {
            if( false == dic_server.ContainsKey(destination))
            {
                MessageBox.Show("invalid destination. " + destination);
                return;
            }

            string address = dic_server[destination];

            for (int i = 0; i < listbox_excel.Items.Count; ++i)
            {
                if (listbox_excel.GetItemChecked(i))
                {
                    string excel = listbox_excel.Items[i].ToString();
                    if( false == dic_excel.ContainsKey(excel))
                    {
                        MessageBox.Show("invalid excel name. " + excel);
                        return;
                    }

                    Tuple<string, string> tuple = dic_excel[excel];

                    execute_async(tuple.Item2, excel, "../../schema/", tuple.Item1, address);
                }
            }

            if (true == checkBox_include_SERVER_LIST.Checked)
            {
                execute_async("SERVER_LIST_" + destination, "SERVER_LIST", "./data/", "INDEX", address);
            }

            while(true)
            {
                lock (lockObject)
                {
                    if(execute_count <= 0)
                    {
                        break;
                    }
                    Thread.Sleep(1);
                }
            }

            MessageBox.Show("Rails Post Completed");

        }

        void execute_async(string file, string excel, string dest, string index, string address)
        {
            lock (lockObject)
            {
                ++execute_count;
            }

            string cmd = "ruby -I ../../../../gundam_base/SazabiExcel ../../../../gundam_base/SazabiExcel/ExcelReader.rb " + dest + file + ".xlsx " + excel + " " + index + " rails_post:" + address;
            ExecuteCommandAsync(cmd);
        }

        private void ExecuteCommandSync(object command)
        {
            try
            {
                Console.WriteLine("execute: " + command);

                // create the ProcessStartInfo using "cmd" as the program to be run,
                // and "/c " as the parameters.
                // Incidentally, /c tells cmd that we want it to execute the command that follows,
                // and then exit.
                System.Diagnostics.ProcessStartInfo procStartInfo = new System.Diagnostics.ProcessStartInfo("cmd", "/c " + command);

                // The following commands are needed to redirect the standard output.
                // This means that it will be redirected to the Process.StandardOutput StreamReader.
                procStartInfo.RedirectStandardOutput = true;
                procStartInfo.UseShellExecute = false;
                // Do not create the black window.
                procStartInfo.CreateNoWindow = true;
                // Now we create a process, assign its ProcessStartInfo and start it
                System.Diagnostics.Process proc = new System.Diagnostics.Process();
                proc.StartInfo = procStartInfo;
                proc.Start();

                proc.WaitForExit();

                // Get the output into a string
                string result = proc.StandardOutput.ReadToEnd();

                // Display the command output.
                Console.WriteLine("shell execute result : " + result);

                lock (lockObject)
                {
                    --execute_count;
                }
            }
            catch (Exception objException)
            {
                // Log the exception
                Console.WriteLine(objException.Message);
            }
        }

        private void ExecuteCommandAsync(string command)
        {
            try
            {
                //Asynchronously start the Thread to process the Execute command request.
                Thread objThread = new Thread(new ParameterizedThreadStart(ExecuteCommandSync));
                //Make the thread as background thread.
                objThread.IsBackground = true;
                //Set the Priority of the thread.
                objThread.Priority = ThreadPriority.AboveNormal;
                //Start the thread.
                objThread.Start(command);
            }
            catch (ThreadStartException objException)
            {
                Console.WriteLine(objException.Message);
            }
            catch (ThreadAbortException objException)
            {
                Console.WriteLine(objException.Message);
            }
            catch (Exception objException)
            {
                Console.WriteLine(objException.Message);
            }
        }

        private void comboBox_Destination_SelectedIndexChanged(object sender, EventArgs e)
        {
            if ( comboBox_Destination.SelectedIndex >= 0)
            {
                this.destination = comboBox_Destination.SelectedItem as string;

                if (false == dic_server.ContainsKey(destination))
                {
                    MessageBox.Show("invalid destination. " + destination);
                    return;
                }

                string address = dic_server[destination];
                label_address_content.Text = address;
            }
        }
    }

    internal static class NativeMethods
    {
        // http://msdn.microsoft.com/en-us/library/ms681944(VS.85).aspx
        /// <summary>
        /// Allocates a new console for the calling process.
        /// </summary>
        /// <returns>nonzero if the function succeeds; otherwise, zero.</returns>
        /// <remarks>
        /// A process can be associated with only one console,
        /// so the function fails if the calling process already has a console.
        /// </remarks>
        [DllImport("kernel32.dll", SetLastError = true)]
        internal static extern int AllocConsole();

        // http://msdn.microsoft.com/en-us/library/ms683150(VS.85).aspx
        /// <summary>
        /// Detaches the calling process from its console.
        /// </summary>
        /// <returns>nonzero if the function succeeds; otherwise, zero.</returns>
        /// <remarks>
        /// If the calling process is not already attached to a console,
        /// the error code returned is ERROR_INVALID_PARAMETER (87).
        /// </remarks>
        [DllImport("kernel32.dll", SetLastError = true)]
        internal static extern int FreeConsole();
    }

}

