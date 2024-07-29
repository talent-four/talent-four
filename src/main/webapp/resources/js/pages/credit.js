function approvalValidate(event){
    // 체크박스 요소 가져오기
    const privacyPolicyCheckbox = document.getElementById("privacyPolicy");
    const refundPolicyCheckbox = document.getElementById("refundPolicy");
	const paymentMethods = document.getElementsByName("creditSelect");
	
	let isSelected = false;
	
	// 라디오 버튼 중 하나라도 선택되어 있는지 확인
	for (let i = 0; i < paymentMethods.length; i++) {
	    if (paymentMethods[i].checked) {
	        isSelected = true;
	        break;
	    }
	}

	// 하나도 선택되지 않았다면 경고 메시지 표시
	if (!isSelected) {
	    alert("결제 수단을 선택해주세요.");
	    return false; // 폼 제출 막기
	}
	
    // 에러 메시지 초기화
    let errorMessage = "";
    // 체크박스 체크 여부 확인
    if (!privacyPolicyCheckbox.checked) {
        errorMessage += "개인정보 수집 이용 및 제 3자 제공 동의는 필수입니다.\n";
    }


    if (!refundPolicyCheckbox.checked) {
        errorMessage += "환불 규정 동의는 필수입니다.\n";
    }
    // 에러 메시지가 있으면 폼 제출 막고 에러 메시지 표시
    if (errorMessage) {
        alert(errorMessage);    // 에러 메시지 표시
		return false;
    }
	
	return true;
}

function handleSubmit(event) {
    // 폼 제출 막기
    event.preventDefault();
    // 검증 통과 시 결제 함수 호출
    if (approvalValidate()) {
	    requestPay(); // 결제 함수 호출
	    return false; // 폼 제출 막기
	} else {
	    return false; // 검증 실패 시 폼 제출 막기
	}
}

function requestPay() {
    IMP.init('imp52158546'); //iamport 대신 자신의 "가맹점 식별코드"를 사용
 IMP.request_pay({
   pg: "kakaopay",
   pay_method: "trans",
   merchant_uid : 'merchant_'+new Date().getTime(),
   name : '결제테스트',
   amount : 12000,
   buyer_email : 'iamport@siot.do',
   buyer_name : '구매자',
   buyer_tel : '010-1234-5678',
   buyer_addr : '서울특별시 강남구 삼성동',
   buyer_postcode : '123-456'
 }, function (rsp) { // callback
   console.log(rsp);
     if (rsp.success) {
       console.log(rsp.success);
       // 결제 성공 시 로직,

  IMP.request_pay(
    {
      pg: "kakaopay",
      merchant_uid: "merchant_" + new Date().getTime(),
      name: memberName,
      amount: price,
      buyer_email: memberEmail,
      buyer_name: memberName,
    },
    function (rsp) {
	  if (rsp.success) {
	      alert("결제 성공");
		  document.getElementById("paymentForm").submit();
	    } else {
        // 결제 실패 시 로직,
        alert("결제 실패");
      }
    }
  );
}

