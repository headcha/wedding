function tempImageUpload ($selector, fnUploadCallback) {
    $selector.ace_file_input({
        no_file: 'No File ...',
        btn_choose: 'Choose',
        btn_change: 'Change',
        droppable: false,
        maxSize: 10000000,
        thumbnail: false, //| true | large
        allowExt: ['jpg', 'jpeg', 'png', 'gif', 'tif', 'tiff', 'bmp'],
        allowMime: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif', 'image/tif', 'image/tiff', 'image/bmp'], //html5 browsers only

        //blacklist:'exe|php'
        before_change: function (files) {
            if (!files || files.length == 0) return false;//no files selected

            var filterFiles = filterOverSizeFile(files);

            for (var indexI = 0; indexI < filterFiles.length; indexI++) {

                _ajaxUpload($(this), files[indexI], fnUploadCallback);
            }

            return true;
        }
    }).on('file.error.ace' , function(event , info) {
        bootbox.alert('파일 용량을 확인 해 주세요. 파일은 이미지만 등록 가능합니다');
    });
}

function filterOverSizeFile(files) {
    var filterFiles = new Array();
    for (var indexI = 0; indexI < files.length; indexI++ ) {
        var file = files[indexI];
        if (file.size < 10000000) {
            filterFiles.push(file);
        }
    }
    return filterFiles;
}

function _ajaxUpload ($this, file, fnCallback) {
    var fileForm = new FormData();
    fileForm.append('image',file);
    $this.ace_file_input('loading', true);

    $.ajax({
        url: 'http://admin.seolgi.com/api/file/image',
        type: 'POST',
        xhrFields: {
            withCredentials: true
        },
        processData: false,
        contentType: false,
        dataType: 'json',
        data: fileForm,
        success: function (result) {
            $this.ace_file_input('loading', false);
            if (fnCallback)
            fnCallback(result , $this);
        }
    }).promise();
}

