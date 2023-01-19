var $hamburger = $(".hamburger");
var $collapse = $("header div nav");

$hamburger.on("click", function (e) {
    $hamburger.toggleClass("is-active");
    $collapse.toggleClass("nav--collapsed");
});