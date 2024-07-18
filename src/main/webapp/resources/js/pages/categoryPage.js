// 페이지 로드시
$("#CategoryBoxUp").css("display", "none");
// 페이지 로드 시, 대분류 소분류 선택하기
// 페이지 로드 시 초기 선택 항목 설정
changeSelected($("#scrollChosenCategoryMenu li:first-child")); // 잘 작동함
// changeDetailSelected($(".category > ul:first-child > li:nth-child(2)")); // 맨 처음 로드가 안됨


// 카테고리 바
$("#chosenCategoryButton").on("click", function(){
  if ($("#chosenCategoryMenu").css("display") == "none"){
    $("#chosenCategoryMenu").slideDown(200);
    $("#CategoryBoxdown").css("display", "")
    $("#CategoryBoxUp").css("display", "none");
  } else {
    $("#chosenCategoryMenu").slideUp(200);
    $("#CategoryBoxUp").css("display", "")
    $("#CategoryBoxdown").css("display", "none");
  }
})

// 카테고리 대분류 선택하기
$("#scrollChosenCategoryMenu li").on("click", function(){
  changeSelected($(this));
})

// 카테고리 메뉴 소분류 선택하기
$(".category li").on("click", function(){
  changeDetailSelected($(this));
})

// 카테고리 메뉴 대분류 선택하기
// 입력 li
function changeSelected(item) {
  // 선택한 항목 check하기
  item.find('input[type=radio]').prop('checked', true);
  // check된 항목 value 가져오기
  var selected = item.find('input[type=radio]').val();
  // 카테고리 이름 표시하기
  $("#categoryName").text(selected);

  // 변경된 대분류의 소분류 미리 선택하기
  changeDetailSelected($("#"+selected+">ul:first-child > li:nth-child(2)"));

  // 선택한 대분류 색상 변경
  selectedColorChange(item);
  // 선택한 대분류의 소분류 보여주기
  showCategory(selected);
}

// 선택한 아이템 색상 변경
// 파라미터 대분류 카테고리명
function showCategory(item) {
  $(".category").css("display", "none");
  $("#" + item).css("display", "flex");
}

// 선택한 아이템 색상 변경
// 파라미터 li 
function selectedColorChange(item) {
  item.css("backgroundColor", "#F5F5F5");
  item.css("color", "#FD4179");
  item.siblings().css("backgroundColor", "");
  item.siblings().css("color", "");
}

// 카테고리 메뉴 소분류 선택하기
function changeDetailSelected(item) {
  // 선택한 항목 check 하기
  item.find('input[type=radio]').prop('checked', true);
  // check한 항목의 value 가져오기
  var selectedDetail = item.find('input[type=radio]').val();
  // 카테고리에 value값 표시하기
  $(".categoryNameDetail").text(selectedDetail);
}

// 필터 초기화 버튼 / 대분류 첫번째는 선택되나, 소분류 첫번째 선택하게 해야 함
$("#filterResetBtn").on("click", function(){
  first = $("#scrollChosenCategoryMenu li:first-child");
  changeSelected(first);
})