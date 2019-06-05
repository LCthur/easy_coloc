const popup = () => {
    $(".open").on("click", function () {
        $(".popup, .popup-content").addClass("active");
    });
    $(".close, .popup").on("click", function () {
        $(".popup, .popup-content").removeClass("active");
    });
};

export { popup };