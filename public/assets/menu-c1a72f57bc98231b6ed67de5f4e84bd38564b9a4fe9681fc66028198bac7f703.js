function showFront(){
  //alert("Front");
  $("#frontB").addClass("current-menu-item");
  $("#propB").removeClass("current-menu-item");
  $("#commentB").removeClass("current-menu-item");
  $("#front").css("display", "block");
  $("#proper").css("display", "none");
  $("#commet").css("display", "none");
}
function showProper(){
  //alert("Proper");
  $("#frontB").removeClass("current-menu-item");
  $("#propB").addClass("current-menu-item");
  $("#commentB").removeClass("current-menu-item");
  $("#front").css("display", "none");
  $("#proper").css("display", "block");
  $("#commet").css("display", "none");
}
function showComments(){
  //alert("Proper");
  $("#frontB").removeClass("current-menu-item");
  $("#propB").removeClass("current-menu-item");
  $("#commentB").addClass("current-menu-item");
  $("#front").css("display", "none");
  $("#proper").css("display", "none");
  $("#commet").css("display", "block");
}
;
