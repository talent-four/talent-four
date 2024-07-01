// 카테고리 바
$("#chosenCategoryButton").on("click", function(){
  if ($("#chosenCategoryMenu").css("display") == "none"){
    $("#chosenCategoryMenu").slideDown(200);
  } else {
    $("#chosenCategoryMenu").slideUp(200);
  }
})

$("#scorollChosenCatergoryMenu li").on("click", function(){
  $(this).css("backgroundColor", "gray");
  $(this).siblings().css("backgroundColor", "");
  // $(this).addClass('selected');
  $(this).find('input[type=radio]').prop('checked', true);
})