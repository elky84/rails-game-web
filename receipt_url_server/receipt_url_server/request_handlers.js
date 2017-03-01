var hmac = require('apigw-hmac');

var naver_api_url = "http://apis.naver.com/AD_1014490/appStore/receiptV2.json?";

function receipt_url(response, postData, query) {
    var request_url = naver_api_url;
    
    var nonce = "20160108";          // 임의의 랜덤값
    request_url += "nonce=" + nonce;
    request_url += "&paymentSeq=" + query.payment_seq;

    // encrypt URL 생성(NHNAPIGatewayKey.properties 파일이 없을 경우 Error 발생)
    var encryptedUrl = hmac.getEncryptUrl(request_url);

    response.writeHead(200, { "Content-Type": "text/plain" });       
    response.write(encryptedUrl);
    response.end();    
}

exports.receipt_url = receipt_url;