var AccountRepository = function () {
}

AccountRepository.save = function(account , fnSuccess , fnError) {
    $.ajax({
        type: "PUT",
        url: "/api/account" ,
        data: JSON.stringify(account),
        contentType: "application/json; charset=UTF-8",
        success: function (result) {
            if (fnSuccess) {
                fnSuccess(result);
            }
        },
        error : function(request , status , error) {
            if (fnError) {
                fnError(request , status , error);
            }
        }

    });
}