const searchConditionFormMap = new Map();

$(() => {
    const contextPath = $("body").data("context-path");
    const menu = $("body").data("menu");

    const searchForm = $("form[name=search]");
    const searchCondition = searchForm.data("search-condition");
    const searchKeyword = searchForm.data("search-keyword");
    console.log(searchCondition);
    console.log(typeof(searchCondition))
    console.log(searchKeyword);
    console.log(typeof(searchKeyword));

    const textSearchInput =
        $(`<input type="text"
                name="searchKeyword"
                value="${searchKeyword}"
                placeholder="검색어 입력"
                id="search-keyword-box">`);

    let lowerBound = 0;
    let upperBound = 0;
    if (searchKeyword !== "") {
        const rangeValues = searchKeyword.split('-');
        if (rangeValues.length === 2) {
            lowerBound = parseInt(rangeValues[0]);
            upperBound = parseInt(rangeValues[1]);
        } else if (searchKeyword.startsWith("-")) {
            upperBound = parseInt(rangeValues[0]);
        } else {
            lowerBound = parseInt(rangeValues[0]);
            upperBound = "";
        }
    }
    const intRangeSearchInput =
        $(`<div id="search-keyword-box"><input type="number"
                name="searchKeyword"
                value="${lowerBound}">
         ~
         <input type="number"
                name="searchKeyword"
                value="${upperBound}"></div>`);

    searchConditionFormMap["-1"] = textSearchInput;
    searchConditionFormMap["0"] = textSearchInput;
    searchConditionFormMap["1"] = textSearchInput;
    searchConditionFormMap["2"] = intRangeSearchInput;

    const conditionSelect = $("form[name=search] select");
    conditionSelect.after(searchConditionFormMap[searchCondition]);

    conditionSelect.on("change", (e) => {
        $("#search-keyword-box").remove();
        $(e.target).after(searchConditionFormMap[$("select[name=searchCondition] option:selected").val()]);
    });

    $(".search-form button[type=submit]").on("click", (e) => {
        $("form[name=search]")
            .attr("method", "GET")
            .attr("action", `${contextPath}/products`)
            .trigger("submit");
    });

    $(".list .item").each((idx, elem) => {
        const prodNo = $(elem).data("prodNo");
        const stock = $(elem).data("stock");
        if (parseInt(stock) > 0) {
            $(elem).children("td").children(".prod-no").attr("href", `${contextPath}/products/${prodNo}?menu=${menu}`);
        }
    })
});