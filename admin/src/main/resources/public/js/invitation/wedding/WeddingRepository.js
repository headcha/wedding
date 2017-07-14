var WeddingRepository = function () {
}

WeddingRepository.update = function( wedding , fnSuccess) {
    $.ajax({
        type: "POST",
        url: "/api/invitation/wedding/" ,
        data: JSON.stringify(wedding),
        contentType: "application/json; charset=UTF-8",
        success: function (result) {
            if (fnSuccess) {
                fnSuccess(result);
            }
        }
    });
}

WeddingRepository.delete = function( id , fnSuccess) {
    $.ajax({
        type: "DELETE",
        url: "/api/invitation/wedding/" + id ,
        contentType: "application/json; charset=UTF-8",
        success: function (result) {
            if (fnSuccess) {
                fnSuccess(result);
            }
        }
    });
}

WeddingRepository.create = function( wedding , fnSuccess , fnFail) {
    $.ajax({
        type: "PUT",
        url: "/api/invitation/wedding/" ,
        data: JSON.stringify(wedding),
        contentType: "application/json; charset=UTF-8",
        success: function (result) {
            if (fnSuccess) {
                fnSuccess(result);
            }
        },
        error: function(response , error , status) {
            if (fnFail)
                fnFail(response , error , status);
        }
    });
}

WeddingRepository.updateEnable = function( wedding , fnSuccess , fnFail) {
    $.ajax({
        type: "POST",
        url: "/api/invitation/wedding/enable" ,
        data: JSON.stringify(wedding),
        contentType: "application/json; charset=UTF-8",
        success: function (result) {
            if (fnSuccess) {
                fnSuccess(result);
            }
        },
        error: function(response , error , status) {
            if (fnFail)
                fnFail(response , error , status);
        }
    });
}