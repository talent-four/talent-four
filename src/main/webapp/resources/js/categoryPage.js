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

// 선택하기
// 입력 li
function changeSelected(item) {
  item.find('input[type=radio]').prop('checked', true);
  selected = $("input[name='category']:checked").val();
  $("#categoryName").text(selected);

  selectedColorChange(item);
  showCategory(selected);
}

// 카테고리 메뉴 대분류 소분류 선택하기
$("#scrollChosenCategoryMenu li").on("click", function(){
  console.log("클릭")
  changeSelected($(this));
})

// 맨 처음 화면
changeSelected($("#scrollChosenCategoryMenu li:first-child"));

// 필터 초기화 버튼
$("#filterResetBtn").on("click", function(){
  first = $("#scrollChosenCategoryMenu li:first-child");
  changeSelected(first);
})