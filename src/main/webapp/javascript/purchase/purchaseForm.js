$(() => {
    const contextPath = $("body").data("context-path");

    $(".btn--submit").on("click", () => {
        $("form[name=purchase]")
            .attr("action", `${contextPath}/purchases/new`)
            .attr("method", "POST")
            .trigger("submit");
    });

    const divyDate = $("#divy-date")
    divyDate.datepicker();
    divyDate.datepicker("option", "dateFormat", "yy-mm-dd");
});