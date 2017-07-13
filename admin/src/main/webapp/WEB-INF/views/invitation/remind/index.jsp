<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <link rel="stylesheet" href="/resources/lib/bootstrap/datetime/bootstrap-datetimepicker.css"/>
    <!-- inline styles related to this page -->
    <link href="/resources/lib/image/slim/slim.min.css" rel="stylesheet">
</head>


<!-- /section:basics/navbar.layout -->
<div class="main-container ace-save-state" id="main-container">

    <!-- /section:basics/sidebar -->
    <div class="main-content">
        <div class="main-content-inner">

            <!-- /section:basics/content.breadcrumbs -->
            <div class="page-content">

                <div class="row">
                    <div class="col-xs-12">
                        <div class="page-header">
                            <h1>
                                결혼 정보 관리
                            </h1>
                        </div>

                        <form id="weddingForm" data-toggle="validator" role="form" method="post" action="/api/wedding">
                            <h4>
                                기본 정보
                            </h4>
                            <input type="hidden" class="wedding_id" name="weddingId" value="${wedding.id}"/>
                            <input type="hidden" class="wedding_url" name="weddingUrl" value="${wedding.url}"/>
                            <table class="table table-striped table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th class="center" width="5%">항목</th>
                                    <th class="center">내용</th>
                                </tr>
                                </thead>

                                <tbody>

                                <tr>
                                    <td>대표이미지</td>
                                    <td class="row">
                                        <div class="slim input-group col-sm-6"
                                             data-service="/api/file/image"
                                             data-did-upload="attachWeddingImage"
                                             data-did-remove="removeWeddingImage"
                                             data-size="1920,1080"
                                        >
                                            <c:if test="${not empty wedding.imageUrl}">
                                                <img src="${wedding.imageUrl}">
                                            </c:if>
                                            <input type="file" name="image" />
                                        </div>
                                        <input class="wedding_image_url" type="hidden" name="weddingImageUrl" value="${wedding.imageUrl}">
                                    </td>
                                </tr>

                                <script>
                                    function attachWeddingImage(error , data , response) {
                                        if (error == null)
                                            $(this._originalElement).parent().find('.wedding_image_url').val(response.path);
                                    }

                                    function removeWeddingImage(data) {
                                        $(this._originalElement).parent().find('.wedding_image_url').val('');
                                    }
                                </script>

                                <tr>
                                    <td>결혼일</td>
                                    <td class="row">
                                        <div class='input-group date-pick col-sm-6 dateTimePicker'>
                                            <input type='text' class="form-control dateTime" name="dateTime" placeholder="YYYY-MM-DD HH:MM" value="${wedding.weddingDate}" required/>
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>국가</td>
                                    <td class="row">
                                        <div class="input-group col-sm-6">
                                            <input class="form-control country" name="country" type="text"
                                                   value="${wedding.country}" required>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>도시</td>
                                    <td class="row">
                                        <div class="input-group col-sm-6">
                                            <input class="form-control city" name="city" type="text"
                                                   value="${wedding.city}" required>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>예식장 주소</td>
                                    <td>
                                        <div class="input-group col-xs-8">
                                            <input class="form-control location" name="location" type="text" value="${wedding.location}" required>
                                            <span class="input-group-addon submit_geocode">
                                                <span>geocode</span>
                                            </span>
                                        </div>
                                        <input type="hidden" class="latitude" name="latitude" value="${wedding.latitude}" required>
                                        <input type="hidden" class="longitude" name="longitude"  value="${wedding.longitude}" required>
                                        <div style="height: 400px;" id="map"></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>예식장 이미지</td>
                                    <td class="row">
                                        <div class="input-group col-sm-6 slim"
                                             data-service="/api/file/image"
                                             data-did-upload="attachWeddingHallImage"
                                             data-did-remove="removeWeddingHallImage"
                                             data-size="1920,1080"
                                        >
                                            <c:if test="${not empty wedding.hallImageUrl}">
                                                <img src="${wedding.hallImageUrl}"  class="img-responsive">
                                            </c:if>
                                            <input type="file" name="image"/>
                                        </div>
                                        <input class="wedding_hall_image_url" type="hidden" name="weddingHallImageUrl" value="${wedding.hallImageUrl}">
                                    </td>
                                </tr>

                                <script>
                                    function attachWeddingHallImage(error , data , response) {
                                        if (error == null)
                                            $(this._originalElement).parent().find('.wedding_hall_image_url').val(response.path);
                                    }

                                    function removeWeddingHallImage(data) {
                                        $(this._originalElement).parent().find('.wedding_hall_image_url').val('');
                                    }
                                </script>

                                <tr>
                                    <td>제목</td>
                                    <td>
                                        <input class="form-control title" name="title" type="text" value="${wedding.title}" required>
                                    </td>
                                </tr>
                                <tr>
                                    <td>소개글</td>
                                    <td>
                                        <textarea class="form-control introduction" name="introduction">${wedding.introduction}</textarea>
                                    </td>
                                </tr>

                                <tr>
                                    <td>감사의 인사</td>
                                    <td>
                                        <textarea class="form-control" id="greetings" rows="5" name="greetings">${wedding.greetings}</textarea>
                                    </td>
                                </tr>

                                <tr>
                                    <td>감사의 인사 ( Gift ) </td>
                                    <td>
                                        <textarea class="form-control" id="giftSmsGreetings" rows="5" name="giftSmsGreetings">${wedding.giftSmsGreetings}</textarea>
                                    </td>
                                </tr>

                                </tbody>
                            </table>

                            <h4>
                                신랑&신부
                            </h4>

                            <table class="table table-striped table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th class="center" width="5%">항목</th>
                                    <th class="center" width="47%">신랑</th>
                                    <th class="center">신부</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr>
                                    <td>사진</td>
                                    <td class="row">
                                        <input type="hidden" class="maleId" name="maleId" value="${wedding.male.id}"/>
                                        <input class="male_image_url" type="hidden" name="maleImageUrl" value="${wedding.male.imageUrl}">

                                        <div class="slim"
                                             data-service="/api/file/image"
                                             data-did-upload="attachMaleImage"
                                             data-did-remove="removeMaleImage"
                                             data-size="1920,1080"
                                        >
                                            <c:if test="${not empty wedding.male.imageUrl}">
                                                <img src="${wedding.male.imageUrl}" >
                                            </c:if>
                                            <input type="file" name="image" />
                                        </div>
                                    </td>

                                    <script>
                                        function attachMaleImage(error , data , response) {
                                            if (error == null)
                                                $(this._originalElement).parent().find('.male_image_url').val(response.path);
                                        }

                                        function removeMaleImage(data) {
                                            $(this._originalElement).parent().find('.male_image_url').val('');
                                        }
                                    </script>

                                    <td class="row">

                                        <input type="hidden" class="femaleId" name="femaleId" value="${wedding.female.id}"/>
                                        <input class="female_image_url" type="hidden" name="femaleImageUrl" value="${wedding.female.imageUrl}">

                                        <div class="slim"
                                             data-service="/api/file/image"
                                             data-did-upload="attachFemaleImage"
                                             data-did-remove="removeFemaleImage"
                                             data-size="1920,1080"
                                        >
                                            <c:if test="${not empty wedding.female.imageUrl}">
                                                <img src="${wedding.female.imageUrl}" >
                                            </c:if>
                                            <input type="file" name="image" />
                                        </div>
                                    </td>

                                    <script>
                                        function attachFemaleImage(error , data , response) {
                                            if (error == null)
                                                $(this._originalElement).parent().find('.female_image_url').val(response.path);
                                        }

                                        function removeFemaleImage(data) {
                                            $(this._originalElement).parent().find('.female_image_url').val('');
                                        }
                                    </script>
                                </tr>
                                <tr>
                                    <td>이름</td>
                                    <td>
                                        <input class="form-control maleName" name="maleName" type="text" value="${wedding.male.name}" required>
                                    </td>
                                    <td>
                                        <input class="form-control femaleName" name="femaleName" type="text" value="${wedding.female.name}" required>
                                    </td>
                                </tr>
                                <tr>
                                    <td>소개글</td>
                                    <td>
                                        <textarea class="form-control maleIntroduction" name="maleIntroduction" rows="5" >${wedding.male.introduction}</textarea>
                                    </td>
                                    <td>
                                        <textarea class="form-control femaleIntroduction" name="femaleIntroduction" >${wedding.female.introduction}</textarea>
                                    </td>
                                </tr>
                                </tbody>
                            </table>

                            <h4>
                                스토리
                            </h4>
                            <div class="breadcrumbs">
                                <div class="clearfix align-right">
                                    <button type="button" id="btn_add_story" class="btn btn-info btn-sm">스토리 추가</button>
                                </div>
                            </div>
                            <table class="table table-striped table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th class="center" width="3%">No.</th>
                                    <th class="center" width="10%">순서</th>
                                    <th class="center" width="10%">제목</th>
                                    <th class="center" >설명</th>
                                    <th class="center" width="15%">사진</th>
                                    <th class="center" width="15%">날짜</th>

                                    <th class="center" width="5%"></th>
                                </tr>
                                </thead>

                                <tbody id="story_item_area">

                                <c:forEach var="story" items="${wedding.stories}">
                                    <tr class="story_item">
                                        <td>
                                                ${story.id}
                                            <input class="form-control story_id" name="storyId" type="hidden" value="${story.id}" >
                                        </td>
                                        <td>
                                            <input class="form-control story_order_index" name="storyOrderIndex" type="number" value="${story.orderIndex}">
                                        </td>
                                        <td>
                                            <input class="form-control story_title" name="storyTitle" type="text" value="${story.title}" required>
                                        </td>
                                        <td>
                                            <textarea class="form-control story_description" name="storyDescription" rows="7">${story.description}</textarea>
                                        </td>
                                        <td class="row story_image_area">
                                            <div class="slim"
                                                 data-service="/api/file/image"
                                                 data-did-upload="attachStoryImage"
                                                 data-did-remove="removeStoryImage"
                                            >
                                                <c:if test="${not empty story.imageUrl}">
                                                    <img src="${story.imageUrl}" >
                                                </c:if>
                                                <input type="file" name="image" />
                                            </div>
                                            <input class="story_image_url" type="hidden" name="storyImageUrl" value="${story.imageUrl}">
                                        </td>


                                        <td>
                                            <div class='input-group date-pick dateTimePicker'>
                                                <input type='text' class="form-control story_storyDate" name="storyDate" placeholder="YYYY-MM-DD HH:MM" value="${story.storyDate}" />
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                            </div>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn_delete_story btn-sm">삭제</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>


                            <h4>
                                이미지 갤러리
                            </h4>
                            <div class="breadcrumbs">
                                <div class="clearfix align-right">
                                    <button type="button" id="btn_add_category" class="btn btn-info btn-sm">카테고리 추가</button>
                                </div>
                            </div>
                            <table class="table table-striped table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th class="center" width="10%">카테고리</th>
                                    <th class="center">사진</th>
                                    <th class="center" width="5%"></th>
                                </tr>
                                </thead>

                                <tbody id="gallery_item_area">
                                <input class="gallery_id" name="galleryId" type="hidden" value="${wedding.gallery.id}">
                                <c:forEach var="category" items="${wedding.gallery.categories}">
                                    <tr class="category_area">
                                        <td>
                                            <input class="category_id" name="categoryId" type="hidden" value="${category.id}">
                                            <input type="text" name="galleryCategoryName" value="${category.name}" class="form-control gallery_category_name" required>
                                        </td>
                                        <td>
                                            <div class="row">
                                                <div class="col-xs-12 wrap_gallery_area">
                                                    <!-- PAGE CONTENT BEGINS -->
                                                    <ul class="gallery_area ace-thumbnails clearfix" style="list-style: none;">
                                                        <c:forEach var="image" items="${category.galleryImages}">
                                                            <li class="col-xs-2 gallery_image" style="border: none;">


                                                                <div class="slim"
                                                                     data-service="/api/file/image"
                                                                     data-did-upload="attachGalleryImage"
                                                                     data-did-remove="removeGalleryImage"
                                                                     data-ratio="16:9"
                                                                     data-size="1920,1080"
                                                                >
                                                                    <c:if test="${not empty image.url}">
                                                                        <img src="${image.url}" >
                                                                    </c:if>
                                                                    <input type="file" name="image" />
                                                                </div>

                                                                <input class="gallery_image_id" name="galleryImageId" type="hidden" value="${image.id}">
                                                                <input class="gallery_image_url" name="galleryImageUrl" type="hidden" value="${image.url}">
                                                            </li>
                                                        </c:forEach>
                                                    </ul>
                                                    <button type="button" class="btn radius-50 btn-default-transparent _btn_add_gallery_image">+</button>
                                                </div>
                                            </div>

                                        </td>
                                        <td>
                                            <button type="button" class="btn btn_delete_category btn-sm">삭제</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <h4>
                                일정
                            </h4>
                            <div class="breadcrumbs">
                                <div class="clearfix align-right">
                                    <button type="button" id="btn_add_schedule" class="btn btn-info btn-sm">일정 추가</button>
                                </div>
                            </div>
                            <table class="table table-striped table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th class="center" width="5%">No.</th>
                                    <th class="center" width="10%">제목</th>
                                    <th class="center" >설명</th>
                                    <th class="center" width="15%">사진</th>
                                    <th class="center" width="15%">날짜</th>
                                    <th class="center" width="5%"></th>
                                </tr>
                                </thead>

                                <tbody id="schedule_item_area">

                                <c:forEach var="schedule" items="${wedding.schedules}">
                                    <tr class="schedule_item">
                                        <td>
                                                ${schedule.id}
                                            <input class="form-control schedule_id" name="scheduleId" type="hidden" value="${schedule.id}" required>
                                        </td>
                                        <td>
                                            <input class="form-control schedule_title" name="scheduleTitle" type="text" value="${schedule.title}" required>
                                        </td>
                                        <td>
                                            <input class="form-control schedule_introduction" name="scheduleIntroduction" type="text" value="${schedule.introduction}">
                                        </td>
                                        <td class="row schedule_image_area">
                                            <div class="slim"
                                                 data-service="/api/file/image"
                                                 data-did-upload="attachScheduleImage"
                                                 data-did-remove="removeScheduleImage"
                                                 data-ratio="16:9"
                                                 data-size="1920,1080"
                                            >
                                                <c:if test="${not empty schedule.imageUrl}">
                                                    <img src="${schedule.imageUrl}" >
                                                </c:if>
                                                <input type="file" name="image" />
                                            </div>
                                            <input class="schedule_image_url" type="hidden" name="scheduleImageUrl" value="${schedule.imageUrl}">
                                        </td>


                                        <td>
                                            <div class='input-group date-pick dateTimePicker'>
                                                <input type='text' class="form-control schedule_dateTime" name="scheduleDateTime" placeholder="YYYY-MM-DD HH:MM" value="${schedule.localDateTime}" required/>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                            </div>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn_delete_schedule btn-sm">삭제</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <h4>
                                가족
                            </h4>


                            <div class="breadcrumbs">
                                <div class="clearfix align-right">
                                    <button type="button" id="btn_add_family" class="btn btn-info btn-sm">가족 추가</button>
                                </div>
                            </div>
                            <table class="table table-striped table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th class="center" width="5%">No.</th>
                                    <th class="center" width="10%">이름</th>
                                    <th class="center" width="10%">관계</th>
                                    <th class="center" width="15%">이미지</th>
                                    <th class="center" >편지</th>
                                    <th class="center" width="10%"></th>
                                </tr>
                                </thead>

                                <tbody id="family_item_area">
                                <c:forEach var="family" items="${wedding.familyList}">
                                    <tr class="family_item">
                                        <td>
                                            ${family.id}
                                            <input class="form-control family_id" name="familyId" type="hidden" value="${family.id}" >
                                        </td>
                                        <td>
                                            <input class="form-control family_name" name="familyName" type="text" value="${family.name}" >
                                        </td>
                                        <td>
                                            <input class="form-control family_type" name="familyType" type="text" value="${family.type}" >
                                        </td>

                                        <td class="row family_image_area">
                                            <div class="slim"
                                                 data-service="/api/file/image"
                                                 data-did-upload="attachFamilyImage"
                                                 data-did-remove="removeFamilyImage"
                                                 data-size="1920,1080"
                                            >
                                                <c:if test="${not empty family.imageUrl}">
                                                    <img src="${family.imageUrl}" >
                                                </c:if>
                                                <input type="file" name="image" />
                                            </div>
                                            <input class="family_image_url" type="hidden" name="familyImageUrl" value="${family.imageUrl}">
                                        </td>


                                        <td>
                                            <textarea class="form-control family_letter" name="familyLetter">${family.letter}</textarea>

                                        </td>
                                        <td>
                                            <button type="button" class="btn btn_delete_family btn-sm">삭제</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <div class="clearfix form-actions align-right">
                                <button class="btn btn-info" type="submit">
                                    <i class="ace-icon fa fa-pencil align-top bigger-125"></i>
                                    전송
                                </button>
                            </div>
                        </form>
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
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCIxyNQ61rzMo81dldLbkBMU69I6fEiGPo&signed_in=true"></script>
    <script src="/${buildTimestamp}/resources/lib/file/TempImageUpload.js"></script>
    <script src="/${buildTimestamp}/resources/lib/map/GoogleMap.js"></script>
    <script src="/${buildTimestamp}/resources/js/gallery/GalleryImage.js"></script>
    <script src="/${buildTimestamp}/resources/js/gallery/Category.js"></script>
    <script src="/${buildTimestamp}/resources/js/gallery/Gallery.js"></script>
    <script src="/${buildTimestamp}/resources/js/couple/Couple.js"></script>
    <script src="/${buildTimestamp}/resources/js/schedule/Schedule.js"></script>
    <script src="/${buildTimestamp}/resources/js/story/Story.js"></script>
    <script src="/${buildTimestamp}/resources/js/family/Family.js"></script>
    <script src="/${buildTimestamp}/resources/js/invitation/wedding/Wedding.js"></script>
    <script src="/${buildTimestamp}/resources/js/invitation/wedding/WeddingRepository.js"></script>
    <script type="text/javascript">

        function attachScheduleImage(error , data , response) {
            if (error == null)
                $(this._originalElement).parent().find('.schedule_image_url').val(response.path);
        }

        function removeScheduleImage(data) {
            $(this._originalElement).parent().find('.schedule_image_url').val('');
        }

        function attachFamilyImage(error , data , response) {
            if (error == null)
                $(this._originalElement).parent().find('.family_image_url').val(response.path);
        }

        function removeFamilyImage(data) {
            $(this._originalElement).parent().find('.family_image_url').val('');
        }

        function attachStoryImage(error , data , response) {
            if (error == null)
                $(this._originalElement).parent().find('.story_image_url').val(response.path);
        }

        function removeStoryImage(data) {
            $(this._originalElement).parent().find('.story_image_url').val('');
        }

        function attachGalleryImage(error , data , response) {
            if (error == null)
                $(this._originalElement).parent().find('.gallery_image_url').val(response.path);
        }


        function removeGalleryImage(data) {
            $(this._originalElement).parent().remove();
        }

        $(document).on('click', '.btn_delete_category', function () {
            $(this).parents('tr').remove();
        });


        $(document).on('click' , '.btn_delete_schedule' , function() {
            $(this).parents('tr').remove();
        });

        $(document).on('click' , '.btn_delete_family' , function() {
            $(this).parents('tr').remove();
        });

        $(document).on('click' , '.btn_delete_story' , function() {
            $(this).parents('tr').remove();
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

        $('#btn_add_category').on('click', function () {
            var source = $('#category_item_template').html();
            var template = Handlebars.compile(source);
            var $html = $(template(null));
            Slim.parse($html[0]);
            $('#gallery_item_area').prepend($html);
        });

        $(document).on('click' , '._btn_add_gallery_image' , function() {
            var source = $('#gallery_image_item_template').html();
            var template = Handlebars.compile(source);
            var $html = $(template(null));
            Slim.parse($html[0]);

            $(this).parents('.wrap_gallery_area').find('ul').append($html);
        });


        $('#btn_add_schedule').on('click', function () {
            if ($('.schedule_item').length >= 3) {
                bootbox.alert('일정은 3개까지만 등록 가능합니다.');
                return;
            }

            var source = $('#schedule_item_template').html();
            var template = Handlebars.compile(source);
            var $html = $(template(null));
            Slim.parse($html[0]);
            $('#schedule_item_area').prepend($html);



            $html.find('.dateTimePicker').datetimepicker({
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
        });


        $('#btn_add_family').on('click', function () {

            var source = $('#family_item_template').html();
            var template = Handlebars.compile(source);
            var $html = $(template(null));
            Slim.parse($html[0]);
            $('#family_item_area').prepend($html);

        });

        $('#btn_add_story').on('click', function () {

            var source = $('#story_item_template').html();
            var template = Handlebars.compile(source);
            var $html = $(template(null));
            Slim.parse($html[0]);
            $('#story_item_area').prepend($html);



            $html.find('.dateTimePicker').datetimepicker({
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
</content>

<script id="category_item_template" type="text/x-handlebars-template">
    <tr class="category_area">
        <td>
            <input class="category_id" name="categoryId" type="hidden" value="0">
            <input type="text" name="galleryCategoryName" class="form-control gallery_category_name" required>
        </td>
        <td>
            <div class="row">
                <div class="col-xs-12 wrap_gallery_area">
                    <!-- PAGE CONTENT BEGINS -->
                    <ul class="gallery_area ace-thumbnails clearfix"style="list-style: none;">
                        <li class="col-xs-2 gallery_image" style="border: none;">


                            <div class="slim"
                                 data-service="/api/file/image"
                                 data-did-upload="attachGalleryImage"
                                 data-did-remove="removeGalleryImage"
                                 data-size="1920,1080"
                            >

                                <input type="file" name="image" />
                            </div>

                            <input class="gallery_image_id" name="galleryImageId" type="hidden" >
                            <input class="gallery_image_url" name="galleryImageUrl" type="hidden">
                        </li>
                    </ul>
                    <button type="button" class="btn radius-50 btn-default-transparent _btn_add_gallery_image">+</button>
                </div>
            </div>

        </td>
        <td>
            <button type="button" class="btn btn_delete_category btn-sm">삭제</button>
        </td>
    </tr>
</script>



<script id="gallery_image_item_template" type="text/x-handlebars-template">
    <li class="col-xs-2 gallery_image" style="border: none;">
        <div class="slim"
             data-service="/api/file/image"
             data-did-upload="attachGalleryImage"
             data-did-remove="removeGalleryImage"
             data-ratio="16:9"
             data-size="1920,1080"
        >

            <input type="file" name="image" />
        </div>

        <input class="gallery_image_id" name="galleryImageId" type="hidden" >
        <input class="gallery_image_url" name="galleryImageUrl" type="hidden">
    </li>
</script>



<script id="schedule_item_template" type="text/x-handlebars-template">
    <tr class="schedule_item">
        <td>
            <input class="form-control schedule_id" name="scheduleId" type="hidden" value="0" required>
        </td>
        <td>
            <input class="form-control schedule_title" name="scheduleTitle" type="text" value="" required>
        </td>
        <td>
            <input class="form-control schedule_introduction" name="scheduleIntroduction" type="text" value="">
        </td>
        <td class="row schedule_image_area">
            <div class="slim"
                 data-service="/api/file/image"
                 data-did-upload="attachScheduleImage"
                 data-did-remove="removeScheduleImage"
                 data-ratio="16:9"
                 data-size="1920,1080"
            >
                <input type="file" name="image" />
            </div>
            <input class="schedule_image_url" type="hidden" name="scheduleImageUrl" value="">
        </td>
        <td>
            <div class='input-group date-pick dateTimePicker'>
                <input type='text' class="form-control schedule_dateTime" name="scheduleDateTime" placeholder="YYYY-MM-DD HH:MM" required/>
                <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
            </div>
        </td>
        <td>
            <button type="button" class="btn btn_delete_schedule btn-sm">삭제</button>
        </td>
    </tr>
</script>


<script id="story_item_template" type="text/x-handlebars-template">
    <tr class="story_item">
        <td>
            <input class="form-control story_id" name="storyId" type="hidden" value="0">
        </td>
        <td>
            <input class="form-control story_order_index" name="storyOrderIndex" type="number">
        </td>
        <td>
            <input class="form-control story_title" name="storyTitle" type="text" value="" required>
        </td>
        <td>
            <textarea class="form-control story_description" rows="7" name="storyDescription"></textarea>
        </td>
        <td class="row story_image_area">
            <div class="slim"
                 data-service="/api/file/image"
                 data-did-upload="attachStoryImage"
                 data-did-remove="removeStoryImage"
            >
                <input type="file" name="image" />
            </div>
            <input class="story_image_url" type="hidden" name="storyImageUrl" value="">
        </td>
        <td>
            <div class='input-group date-pick dateTimePicker'>
                <input type='text' class="form-control story_storyDate" name="storyDate" placeholder="YYYY-MM-DD HH:MM" />
                <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
            </div>
        </td>
        <td>
            <button type="button" class="btn btn_delete_story btn-sm">삭제</button>
        </td>
    </tr>
</script>



<script id="family_item_template" type="text/x-handlebars-template">
    <tr class="family_item">
        <td>
            <input class="form-control family_id" name="familyId" type="hidden" value="0" >
        </td>
        <td>
            <input class="form-control family_name" name="familyName" type="text" value="" >
        </td>
        <td>
            <input class="form-control family_type" name="familyType" type="text" value="" >
        </td>
        <td class="row family_image_area">
            <div class="slim"
                 data-service="/api/file/image"
                 data-did-upload="attachFamilyImage"
                 data-did-remove="removeFamilyImage"
                 data-size="1920,1080"
            >

                <input type="file" name="image" />
            </div>
            <input class="family_image_url" type="hidden" name="familyImageUrl">
        </td>


        <td>
            <textarea class="form-control family_letter" name="familyLetter"></textarea>
        </td>
        <td>
            <button type="button" class="btn btn_delete_family btn-sm">삭제</button>
        </td>
    </tr>
</script>