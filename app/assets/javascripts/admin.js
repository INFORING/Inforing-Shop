$(document).ready(wrapResize);
$(window).resize(wrapResize);

function wrapResize (){
    var back = $('.admin');

    var size = $(window).height();
    back.css('min-height', size + "px");
}
