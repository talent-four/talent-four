// 카테고리 바
$("#chosenCategoryButton").on("click", function(){
  if ($("#chosenCategoryMenu").css("display") == "none"){
    $("#chosenCategoryMenu").slideDown(200);
  } else {
    $("#chosenCategoryMenu").slideUp(200);
  }
})

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

// 카테고리 메뉴 대분류 선택하기
// 입력 li
function changeSelected(item) {
  console.log(item);
  item.find('input[type=radio]').prop('checked', true);
  var selected = item.find('input[type=radio]').val();
  $("#categoryName").text(selected);
  console.log(selected);
  selectedColorChange(item);
  showCategory(selected);
}

// 카테고리 메뉴 대분류 선택하기
$("#scrollChosenCategoryMenu li").on("click", function(){
  changeSelected($(this));
})

// 카테고리 메뉴 소분류 선택하기
function changeDetailSelected(item) {
  item.find('input[type=radio]').prop('checked', true);
  console.log(item);
  var selectedDetail = item.find('input[type=radio]').val();
  $(".categoryNameDetail").text(selectedDetail);
}

// 카테고리 메뉴 소분류 선택하기
$(".category li").on("click", function(){
  changeDetailSelected($(this));
})

// 맨 처음 화면
$(document).ready(function() {
  // 페이지 로드 시 초기 선택 항목 설정
changeSelected($("#scrollChosenCategoryMenu li:first-child"));
changeDetailSelected($(".category > ul:first-child > li:nth-child(2)"));
})

// 필터 초기화 버튼
$("#filterResetBtn").on("click", function(){
  first = $("#scrollChosenCategoryMenu li:first-child");
  changeSelected(first);
})