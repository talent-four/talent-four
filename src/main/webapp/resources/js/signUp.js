// simple캡차

$(function(){
	$("#reLoad").click(function() {
		changeCaptcha();
	});
});

var rand;
function changeCaptcha(){
	rand = Math.random();
	$("#captchaImg").attr("src", "/captcha/getImg.do?width=100&height=30&size=30&id="+rand);
}

function isCaptCha(){
	var url = "/captcha/isCorrect.do";
	var answer = $("#captcha").val();
	var d = {"answer":answer};
	var r = getAjax(url,d);
	if(r != null && r.result){
		return true;
	}else{
		return false;
	}
}

if($("#captcha").val() == ''){
		alert("자동 등록 방지 문자를 입력해주세요.");
		return false;
	}
	
if(!isCaptCha()){
	alert("자동등록방지문자가 일치하지 않습니다.", function(){
	$("#captcha").focus();
  });
return false;
}
