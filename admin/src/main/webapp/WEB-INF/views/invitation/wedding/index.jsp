<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <link rel="stylesheet" href="/resources/lib/bootstrap/datetime/bootstrap-datetimepicker.css"/>
    <!-- inline styles related to this page -->
    <link href="/resources/lib/image/slim/slim.min.css" rel="stylesheet">
    <style type="text/css">
        .left-menu{width: 56px;height: 57px; padding: 0;margin: 0; line-height: 57px;border-bottom: 1px solid white}
    </style>
</head>

<!-- /section:basics/navbar.layout -->
<div class="main-container ace-save-state" id="main-container">

    <!-- /section:basics/sidebar -->
    <div class="main-content">
        <div class="main-content-inner">

            <!-- /section:basics/content.breadcrumbs -->
            <div class="page-content">

                <div class="row" style="background-color: #f8f8f8;">
                    <div class="col-xs-5 col-sm-7" style="text-align:center;">
                        <div style="background-image: url('/resources/image/phone.png');width: 400px; height: 850px; display: inline-block; margin-top: 20px;">
                            <iframe id="preview" name="preview" style="width: 342px; height: 602px; border: none; margin-top: 120px; margin-left: 3px;"></iframe>
                            <form id="previewForm" action="/invitation/wedding/preview/home" target="preview" method="post">
                                <input type="hidden" name="previewJsonValue" />
                            </form>
                        </div>
                    </div>

                    <div class="col-xs-5 col-sm-5">
                        <%--<div class="row" style="background-color: #f8f8f8;">--%>
                            <div class="col-xs-5 col-sm-2" style="background-color: #0c9ec7; width: 56px; border-right: 1px solid #0c9ec7;
                            position: absolute;
                            top:0;
                            bottom:0;
                            left: 0;">
                                <ul style="padding: 0;margin: 0;list-style: none;width: 56px;position: absolute;left: 0; text-align: center;">
                                    <li>
                                        <a href="javascript:showArea('data-representative-div');" class="btn square btn-default left-menu">
                                            <p style="line-height: 20px;height: 57px;padding-top: 7px;">대표<br>정보</p>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:showArea('data-detail-div');" class="btn square btn-default left-menu">
                                            <p style="line-height: 20px;height: 57px;padding-top: 7px;">상세<br>정보</p>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:showArea('data-story-div');" class="btn square btn-default left-menu">
                                            스토리
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:showArea('data-couple-div');" class="btn square btn-default left-menu">
                                            <p style="line-height: 20px;height: 57px;padding-top: 7px;">신랑<br>신부</p>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:showArea('data-gallery-div');" class="btn square btn-default left-menu">갤러리</a>
                                    </li>
                                    <li>
                                        <a href="javascript:showArea('data-schedule-div');" class="btn square btn-default left-menu">일정</a>
                                    </li>
                                    <li>
                                        <a href="javascript:showArea('data-funding-div');" class="btn square btn-default left-menu">펀딩</a>
                                    </li>
                                </ul>
                            </div>

                            <div class="col-xs-6 col-sm-11" style="position: relative;left: 41px; height: 890px;">
                                <form id="weddingForm" data-toggle="validator" role="form" method="post" action="/api/wedding" style="margin-top: 0px;">
                                    <input type="hidden" class="wedding_id" name="weddingId" value="${wedding.id}"/>
                                    <input type="hidden" class="wedding_url" name="weddingUrl" value="${wedding.url}"/>

                                    <div class="data-representative-div">
                                        <jsp:include page="representative.jsp" />
                                    </div>

                                    <div class="data-detail-div" style="display: none;">
                                        <jsp:include page="detail.jsp" />
                                    </div>

                                    <div class="data-story-div" style="display: none;">
                                        <jsp:include page="story.jsp" />
                                    </div>

                                    <div class="data-couple-div" style="display: none;">
                                        <jsp:include page="couple.jsp" />
                                    </div>

                                    <div class="data-gallery-div" style="display: none; height: 890px; overflow-y: auto;">
                                        <jsp:include page="gallery.jsp"/>
                                    </div>

                                    <div class="data-schedule-div" style="display: none; height: 890px; overflow-y: auto;">
                                        <jsp:include page="schedule.jsp"/>
                                    </div>

                                    <div class="data-funding-div" style="display: none;">
                                        <jsp:include page="funding.jsp" flush="true"/>
                                    </div>
                                    <div class="clearfix form-actions align-right" style="position: absolute;bottom: -10px; right: 0;z-index: 10;">
                                        <button class="btn btn-warning _btn_preview" type="button">미리보기</button>
                                        <button class="btn btn-info" type="submit"><i class="ace-icon fa fa-pencil align-top bigger-125"></i>저장</button>
                                    </div>
                                </form>
                            </div>
                        <%--</div>--%>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.page-content -->
        </div>
    </div>
    <!-- /.main-content -->
</div>

<content tag="local_script">
<!-- image -->
<script src="/${buildTimestamp}/resources/lib/image/slim/slim.jquery.js"></script>
<script src="/${buildTimestamp}/resources/lib/image/slim/slim.kickstart.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCIxyNQ61rzMo81dldLbkBMU69I6fEiGPo&signed_in=true"></script>
<script src="/${buildTimestamp}/resources/lib/file/TempImageUpload.js"></script>
<script src="/${buildTimestamp}/resources/lib/map/GoogleMap.js"></script>
<script src="/${buildTimestamp}/resources/js/gallery/GalleryImage.js"></script>
<script src="/${buildTimestamp}/resources/js/gallery/Category.js"></script>
<script src="/${buildTimestamp}/resources/js/gallery/Gallery.js"></script>
<script src="/${buildTimestamp}/resources/js/couple/Couple.js"></script>
<script src="/${buildTimestamp}/resources/js/schedule/Schedule.js"></script>
<script src="/${buildTimestamp}/resources/js/funding/Funding.js"></script>
<script src="/${buildTimestamp}/resources/js/invitation/wedding/Wedding.js"></script>
<script src="/${buildTimestamp}/resources/js/invitation/wedding/WeddingRepository.js"></script>

<script type="text/javascript">
    (function ($) {
        var modal;
        $.ajaxSetup({
            beforeSend: function (request) {
                modal = bootbox.dialog({
                    message: "잠시만 기다려주세요...",
                    title: "처리중"
                });
                request.setRequestHeader("AJAX", true);
            },
            error: function (request, status, error) {
                console.log(request, status, error);
                modal.modal("hide");
                if (request.status == 401) {
                    location.href = "/";
                } else if (request.status == 403) {
                    bootbox.alert("권한 없는 계정입니다. 운영자에게 문의 하세요.");
                } else {
                    console.log(request, status, error);
                    if (typeof(request.responseJSON) != "undefined") {
                        bootbox.alert(request.responseJSON.message);
                    } else {
                        bootbox.alert("처리 할 수 없는 요청입니다.");
                    }

                }
            },
            complete: function () {
                modal.modal("hide");
            }
        });

        var wedding = Wedding.createByForm($('#weddingForm'));
        $("[name='previewJsonValue']", "#previewForm").val(JSON.stringify(wedding));
        $("#previewForm").submit();

    })(jQuery);

    $('.dateTimePicker').datetimepicker({
        format : "YYYY-MM-DD HH:mm",
        icons: {
            time: 'fa fa-clock-o',
            date: 'fa fa-calendar',
            up: 'fa fa-chevron-up',
            down: 'fa fa-chevron-down',
            previous: 'fa fa-chevron-left',
            next: 'fa fa-chevron-right',
            today: 'fa fa-arrows ',
            clear: 'fa fa-trash',
            close: 'fa fa-times'
        },
        sideBySide : true
    }).next().on('click', function(){
        $(this).prev().focus();
    });

    $(document).on('click', '._btn_preview', function () {
        var wedding = Wedding.createByForm($('#weddingForm'));
        $("[name='previewJsonValue']", "#previewForm").val(JSON.stringify(wedding));
        $("#previewForm").submit();
    });

    $(document).on('click', '.btn_delete_category', function () {
        $(this).parents('tr').remove();
    });


    $(document).on('click' , '.btn_delete_schedule' , function() {
        $(this).parents('table').remove();
    });

    $('#weddingForm').validator().on('submit', function (event) {
        if (event.isDefaultPrevented() == false) {
            var wedding = Wedding.createByForm($('#weddingForm'));
            WeddingRepository.update(wedding , function () {
                bootbox.alert("처리 되었습니다.");
            });
        }
        return false;
    });

    $(document).on('click' , '.delete_gallery_image' , function () {
        $(this).parents('li').remove();
    });

    function showArea(areaName) {
        $('.data-representative-div, .data-detail-div, .data-couple-div, .data-gallery-div, .data-schedule-div, .data-funding-div').hide();

        var slimTargets = $("." + areaName).find($(".slimArea"));

        var options = {
            "ratio": "16:9",
            "size": {"width":1920, "height":1080},
            "service": "/api/file/image"
        };

        if(areaName == 'data-gallery-div') {
            slimTargets.each(function () {
                var target = $(this)[0];
                options["didRemove"] = function () {
                    $(target).parent().remove();
                };

                options["didUpload"] = function (error , data , response) {
                    $(target).parent().find('.gallery_image_url').val(response.path);
                };

                Slim.create(target, options);
                $(target).removeClass("slimArea");
            });
        }

        if(areaName == 'data-detail-div') {
            slimTargets.each(function () {
                var target = $(this)[0];

                options["didRemove"] = function () {
                    $(target).parent().find('.wedding_hall_image_url').val('');
                };

                options["didUpload"] = function (error , data , response) {
                    $(target).parent().find('.wedding_hall_image_url').val(response.path);
                };

                Slim.create(target, options);
                $(target).removeClass("slimArea");
            });
        }

        if(areaName == 'data-couple-div') {
            slimTargets.each(function () {
                var target = $(this)[0];

                if($(target).hasClass("male")) {
                    options["didRemove"] = function () {
                        $(target).parent().find('.male_image_url').val('');
                    };

                    options["didUpload"] = function (error , data , response) {
                        $(target).parent().find('.male_image_url').val(response.path);
                    };
                }

                if($(target).hasClass("female")) {
                    options["didRemove"] = function () {
                        $(target).parent().find('.female_image_url').val('');
                    };

                    options["didUpload"] = function (error , data , response) {
                        $(target).parent().find('.female_image_url').val(response.path);
                    };
                }

                Slim.create(target, options);
                $(target).removeClass("slimArea");
            });
        }

        if(areaName == 'data-schedule-div') {
            slimTargets.each(function () {
                var target = $(this)[0];

                options["didRemove"] = function () {
                    $(target).parent().find('.schedule_image_url').val('');
                };

                options["didUpload"] = function (error , data , response) {
                    $(target).parent().find('.schedule_image_url').val(response.path);
                };

                Slim.create(target, options);
                $(target).removeClass("slimArea");
            });
        }

        $("." + areaName).show();
    }

    $('#btn_add_schedule').on('click', function () {
        if ($('.schedule_item').length >= 3) {
            bootbox.alert('일정은 3개까지만 등록 가능합니다.');
            return;
        }

        var source = $('#schedule_item_template').html();
        var template = Handlebars.compile(source);
        var $html = $(template(null));
        Slim.parse($html[0]);
        $html.insertBefore($('.data-schedule-div').find('table:last'));

        $('.dateTimePicker').datetimepicker({
            format : "YYYY-MM-DD HH:mm",
            icons: {
                time: 'fa fa-clock-o',
                date: 'fa fa-calendar',
                up: 'fa fa-chevron-up',
                down: 'fa fa-chevron-down',
                previous: 'fa fa-chevron-left',
                next: 'fa fa-chevron-right',
                today: 'fa fa-arrows',
                clear: 'fa fa-trash',
                close: 'fa fa-times'
            },
            sideBySide : true
        }).next().on('click', function(){
            $(this).prev().focus();
        });
    });

    var googleMap = new GoogleMap('map' , ${wedding.latitude} , ${wedding.longitude} ,  15);

    googleMap.addEventListenerMarkerDrag(function(markerPosition) {
        $('.latitude').val(markerPosition.lat());
        $('.longitude').val(markerPosition.lng());
    });

    googleMap.addEventListenerMapClick(function(mapPosition) {
        $('.latitude').val(mapPosition.lat());
        $('.longitude').val(mapPosition.lng());
    });

    $('.submit_geocode').on('click' , function() {

        googleMap.geocodeAddress($('.location').val(),

                function (geoLocation, marker) {
                    $('.latitude').val(geoLocation.lat());
                    $('.longitude').val(geoLocation.lng());
                },
                function (status) {
                    $('.latitude').val('');
                    $('.longitude').val('');
                    bootbox.alert('위치를 찾을 수 없습니다. 주소를 다시 입력해 주세요.')
                });
    });
</script>

<script id="schedule_item_template" type="text/x-handlebars-template">
    <table class="table schedule_item" style="width:100%;">
        <tbody id="schedule_item_area">
        <input class="form-control schedule_id" name="scheduleId" type="hidden" value="0" required />
        <tr>
            <td>
                <input class="form-control schedule_title" name="scheduleTitle" type="text" required />
            </td>
        </tr>
        <tr>
            <td>
                <input class="form-control schedule_introduction" name="scheduleIntroduction" type="text" />
            </td>
        </tr>
        <tr>
            <td class="row schedule_image_area">
                <div class="slim"
                     data-service="/api/file/image"
                     data-did-upload="attachScheduleImage"
                     data-did-remove="removeScheduleImage"
                     data-size="1920,1080"
                     data-ratio="16:9">
                    <input type="file" name="image" />
                </div>
                <input class="schedule_image_url" type="hidden" name="scheduleImageUrl" />
            </td>
        </tr>
        <tr>
            <td>
                <div class='input-group date-pick dateTimePicker'>
                    <input type='text' class="form-control schedule_dateTime" name="scheduleDateTime" placeholder="예정일" required/>
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <button type="button" class="btn btn_delete_schedule btn-sm">삭제</button>
            </td>
        </tr>
        </tbody>
    </table>
</script>

</content>