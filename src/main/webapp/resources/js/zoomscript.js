$(document).ready(function () {
 	   
	var nativeWidth = 0;
	var nativeHeight = 0;
  $("#img-container").mousemove(function (e) {
    if (!nativeWidth && !nativeHeight) {
      var imgObject = new Image();
      imgObject.src = $("#mainimg").attr("src");
      nativeWidth = imgObject.width;
      nativeHeight = imgObject.height;
    } else
    {
      var magnifyOffset = $(this).offset();
      var mouseX = e.pageX - magnifyOffset.left;
      var mouseY = e.pageY - magnifyOffset.top;

      if (mouseX < $(this).width() && mouseY < $(this).height() && mouseX > 0 && mouseY > 0) {
        $(".magnifier").fadeIn(100);
      } else
      {
        $(".magnifier").fadeOut(100);
      }
      if ($(".magnifier").is(":visible")) {
        var smallImgX = Math.round(mouseX / $("#mainimg").width() * nativeWidth - $(".magnifier").width() / 2) * -1;
        var smallImgY = Math.round(mouseY / $("#mainimg").height() * nativeHeight - $(".magnifier").height() / 2)  * -1;
        var bgp = smallImgX + "px " + smallImgY + "px";

        var largeImgX = mouseX - $(".magnifier").width() / 2;
        var largeImgY = mouseY - $(".magnifier").height() / 2;

        $(".magnifier").css({ left: largeImgX, top: largeImgY, backgroundPosition: bgp });
      }
    }
  });
});