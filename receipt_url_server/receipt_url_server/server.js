var http = require('http');
var url = require("url");

var port = process.env.port || 1337;

var server = require("./server");
var router = require("./router");
var requestHandlers = require("./request_handlers");

var handle = {}
handle["/"] = requestHandlers.start;
handle["/receipt_url"] = requestHandlers.receipt_url;

function start(route, handle) {
    function onRequest(request, response) {
        var postData = "";
        var pathname = url.parse(request.url).pathname;
        var query = url.parse(request.url, true).query;
        console.log("Request for " + pathname + " received. " + "query :" + query);
        console.log("Request for " + pathname + " received. " + "payment_seq :" + query.payment_seq);
        
        request.setEncoding("utf8");
        
        request.addListener("data", function (postDataChunk) {
            postData += postDataChunk;
            console.log("Received POST data chunk '" + postDataChunk + "'.");
        });
        
        request.addListener("end", function () {
            route(handle, pathname, response, postData, query);
        });

    }
    
    http.createServer(onRequest).listen(8888);
    console.log("Server has started.");
}

exports.start = start;

server.start(router.route, handle);
