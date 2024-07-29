// function iamport(){

//     var flag = $("#flag").val();
//     var principalId = $("#principalId").val();
//     var name = $("#name").val();
//     var phone = $("#phone").val();
//     var email = $("#email").val();
//     var postcode = $("#postcode").val();
//     var address = $("#address").val() + " " + $("#detailAddress").val();

//     var productName;
//     var productId = $("#productId").val();
//     var detailName = $("#productName").val();
//     var cartName = $("#cartName").val();
//     var amount = $("#amount").val();
//     var price = $("#total-price").text();

//     //가맹점 식별코드
//     IMP.init("imp52158546");
//     IMP.request_pay({
//         pg : 'kcp',
//         pay_method : 'card',
//         merchant_uid : 'merchant_' + new Date().getTime(),
//         name : productName,
//         amount : price,
//         buyer_email : email,
//         buyer_name : name,
//         buyer_tel : phone,
//         buyer_addr : address,
//         buyer_postcode : postcode
//     }, function(res) {

//         // 결제검증
//         $.ajax({
//             type : "POST",
//             url : "/verifyIamport/" + res.imp_uid
//         }).done(function(data) {

//             if(res.paid_amount == data.response.amount){
//                 alert("결제 및 결제검증완료");

//                 //결제 성공 시 비즈니스 로직

//             } else {
//                 alert("결제 실패");
//             }
//         });
//     });
// }

// function requestPay() {
//      IMP.init('imp52158546'); //iamport 대신 자신의 "가맹점 식별코드"를 사용
//   IMP.request_pay({
//     pg: "html5_inicis",
//     pay_method: "trans",
//     merchant_uid : 'merchant_'+new Date().getTime(),
//     name : '결제테스트',
//     amount : 12000,
//     buyer_email : 'iamport@siot.do',
//     buyer_name : '구매자',
//     buyer_tel : '010-1234-5678',
//     buyer_addr : '서울특별시 강남구 삼성동',
//     buyer_postcode : '123-456'
//   }, function (rsp) { // callback
//     console.log(rsp);
//       if (rsp.success) {
//         console.log(rsp.success);
//         // 결제 성공 시 로직,

//       } else {
//           // 결제 실패 시 로직,
//         alert("결제 실패");
//       }
//   });
// }

console.log("test");

function getSelectedValue() {
  const selectedOption = document.querySelector('input[name="creditSelect"]:checked');
  if (selectedOption) {
    alert("선택된 결제 방식: " + selectedOption.value);
  } else {
    alert("결제 방식을 선택해주세요.");
  }
}

function requestPay() {
  // 로그 출력
  console.log("memberName:", memberName);
  console.log("price:", price);
  console.log("memberEmail:", memberEmail);

  http: IMP.init("imp52158546"); //iamport 대신 자신의 "가맹점 식별코드"를 사용

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
      // callback
      console.log("rsp : " + rsp);
      console.log("rsp.success : " + rsp.success);
      if (rsp.success) {
        alert("결제 성공");
        window.location.href = `${contextPath}/detailedPage/class?classNo=${classNo}`;
      } else {
        // 결제 실패 시 로직,
        alert("결제 실패");
      }
    }
  );
}
