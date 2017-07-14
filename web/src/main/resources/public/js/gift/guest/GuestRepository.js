var GuestRepository = function() {

}

GuestRepository.add = function(guest , $progress , fnCallback) {
    $.ajax({
        xhr: function () {
            if ($progress) {
                var xhr = new window.XMLHttpRequest();

                $progress.show();
                var $progressLabel = $progress.find('.label');
                $progressLabel.show();
                xhr.upload.addEventListener("progress", function (evt) {
                    if (evt.lengthComputable) {
                        var percentComplete = evt.loaded / evt.total;
                        $progress.find('.progress-bar').css({
                            width: percentComplete * 100 + '%'
                        });

                        $progressLabel.text(percentComplete * 100 + '%');
                    }
                }, false);
                xhr.addEventListener("progress", function (evt) {
                    if (evt.lengthComputable) {
                        var percentComplete = evt.loaded / evt.total;
                        $progress.find('.progress-bar').css({
                            width: percentComplete * 100 + '%'
                        });

                        $progressLabel.text(percentComplete * 100 + '%');
                    }
                }, false);
                return xhr;
            }
        },
        type: "PUT",
        url: "/api/gift/guest" ,
        data: JSON.stringify(guest),
        contentType: "application/json; charset=UTF-8",
        success: function (result) {

            if (fnCallback) {
                fnCallback(result);
            }
        },
        complete: function() {
            $progress.find('.label').text('success');
        }
    });
}