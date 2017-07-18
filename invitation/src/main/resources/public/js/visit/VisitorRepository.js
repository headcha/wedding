var VisitorRepository = function() {
}

VisitorRepository.add = function(visitor , fnCallback) {
    $.ajax({
        type: "PUT",
        url: "/api/visitor" ,
        data: JSON.stringify(visitor),
        contentType: "application/json; charset=UTF-8",
        success: function (result) {
            if (fnCallback) {
                fnCallback(result);
            }
        }
    });
}