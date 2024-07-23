// var map = new kakao.maps.Map(document.getElementById("selectlocation"), {
//   center: new kakao.maps.LatLng(37.54699, 127.09598),
//   level: 5,
// });

// var addressInput = document.getElementById("address-input");
// var geocoder = new kakao.maps.services.Geocoder();

// // 주소 검색 폼 제출 시
// document
// .getElementById("search-form")
// .addEventListener("submit", function (event) {
//   event.preventDefault();

// // 주소로 좌표를 검색합니다
// geocoder.addressSearch(addressInput.value, function (result, status) {
// if (status === kakao.maps.services.Status.OK) {
//   // 검색된 좌표를 변수에 저장합니다
//   var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
  
//   // 검색된 좌표를 clipboard에 복사합니다
//   let dummy = document.createElement("textarea");
//   document.body.appendChild(dummy);
//   dummy.value = coords
//     .toString()
//     .replace(/[()]/g, "")
//     .replace(", ", ",");
//   dummy.select();
//   document.execCommand("copy");
//   document.body.removeChild(dummy);
//   alert("좌표가 클립보드에 복사되었습니다.");

//   // 검색된 좌표로 지도 중심을 이동시킵니다
//   map.setCenter(coords);
// } else {
//   // 검색 실패 시 예시 좌표로 이동합니다
//   var exampleCoords = new kakao.maps.LatLng(37.54699, 127.09598);
//   alert(
//     "검색 실패! 예시 좌표 " +
//           exampleCoords.toString() +
//           " 로 이동합니다."
//       );
//       map.setCenter(exampleCoords);
//     }
//   });
// });



// --------------------------------------------------------------------------------

document.addEventListener('DOMContentLoaded', function() {
  const maxSelections = 7; // 최대 선택 항목 수
  const stackDivs = document.querySelectorAll('#tag-stack .stuckDiv');

  stackDivs.forEach(div => {
      div.addEventListener('click', function() {
          const selectedDivs = document.querySelectorAll('#tag-stack .stuckDiv.selected');
          
          if (div.classList.contains('selected')) {
              // 선택 해제
              div.classList.remove('selected');
          } else {
              // 선택된 항목 수가 최대치를 초과하지 않도록 확인
              if (selectedDivs.length < maxSelections) {
                  div.classList.add('selected');
              } else {
                  alert(`최대 ${maxSelections}개 항목까지 선택할 수 있습니다.`);
              }
          }
      });
  });
});
