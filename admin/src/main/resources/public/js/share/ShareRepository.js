var ShareRepository = function() {
}

ShareRepository.add = function(share , fnCallback) {
    $.ajax({
        type: "PUT",
        url: "/api/share" ,
        data: JSON.stringify(share),
        contentType: "application/json; charset=UTF-8",
        success: function (result) {
            if (fnCallback) {
                fnCallback(result);
            }
        }
    });
}