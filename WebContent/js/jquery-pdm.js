/**
  www.panduoma.com
  QQ:3160744314
**/
$(function () {
    var headerheight = 90;
    var siderbarwidth = 220;

    var siderbar=$("#siderbar");
    var content=$("#content");
    siderbar.height($(window).height()-headerheight);
    content.height($(window).height()-headerheight);
    content.width($(window).width()-siderbarwidth);
    $(window).resize(function(){
        siderbar.height($(window).height()-headerheight);
        content.height($(window).height()-headerheight);
        content.width($(window).width()-siderbarwidth);
    });
});
