<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<!--[if IE 9]>
<html lang="ko" class="ie9"> <![endif]-->
<!--[if !IE]>
<!-->
<html lang="ko">
<!--<![endif]-->

<head>
    <meta charset="utf-8">
    <title>${wedding.male.name} ${wedding.female.name} | Wedding</title>
    <meta name="description" content="새로운 결혼문화를 만들어가는 Seolgi 입니다.">
    <meta name="author" content="headcha">

    <!-- Mobile Meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>

    <!-- facebook -->
    <meta property="og:title" content="${wedding.male.name}&${wedding.female.name} 결혼식에 초대합니다.">
    <meta property="og:description" content="${wedding.title}">
    <meta property="og:image" content="${wedding.imageUrl}">
    <!-- Favicon -->
    <link rel="shortcut icon" href="/resources/lib/bootstrap/html/template/images/favicon.ico">

    <!-- Web Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,300italic,400italic,500,500italic,700,700italic'
          rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:700,400,300' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=PT+Serif' rel='stylesheet' type='text/css'>
    <link href="http://fonts.googleapis.com/earlyaccess/nanumgothic.css" rel="stylesheet" type="text/css">

    <!-- Bootstrap core CSS -->
    <link href="/${buildTimestamp}/resources/lib/bootstrap/html/template/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Font Awesome CSS -->
    <link href="/${buildTimestamp}/resources/lib/bootstrap/html/template/fonts/font-awesome/css/font-awesome.css"
          rel="stylesheet">

    <!-- Fontello CSS -->
    <link href="/${buildTimestamp}/resources/lib/bootstrap/html/template/fonts/fontello/css/fontello.css"
          rel="stylesheet">

    <!-- Plugins -->
    <link href="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/magnific-popup/magnific-popup.css"
          rel="stylesheet">
    <link href="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/rs-plugin/css/settings.css"
          rel="stylesheet">
    <link href="/${buildTimestamp}/resources/lib/bootstrap/html/template/css/animations.css" rel="stylesheet">
    <link href="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/owl-carousel/owl.carousel.css"
          rel="stylesheet">
    <link href="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/owl-carousel/owl.transitions.css"
          rel="stylesheet">
    <link href="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/hover/hover-min.css" rel="stylesheet">
    <link href="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/jquery.countdown/jquery.countdown.css"
          rel="stylesheet">
    <!-- The Project core CSS file -->
    <link href="/${buildTimestamp}/resources/lib/bootstrap/html/template/css/style.css" rel="stylesheet">
    <!-- Color Scheme (In order to change the color scheme, replace the blue.css with the color scheme that you prefer)-->
    <link href="/${buildTimestamp}/resources/lib/bootstrap/html/template/css/skins/pink.css" rel="stylesheet">

    <link href="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/jquery.style-swicher/style-swicher.css"
          rel="stylesheet">

    <!-- kakao -->
    <link href="/${buildTimestamp}/resources/css/bootstrap-social/assets/css/font-awesome.css" rel="stylesheet">


    <!-- Custom css -->
    <link href="/${buildTimestamp}/resources/lib/bootstrap/html/template/css/custom.css" rel="stylesheet">

    <style>

        /* END required styles */
        body.modal-open {
            position: fixed;
            overflow: hidden;
            left: 0;
            right: 0;
        }

        .modal {
            overflow: auto;
        }

    </style>

    <script>

        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r;
            i[r] = i[r] || function () {
                        (i[r].q = i[r].q || []).push(arguments)
                    }, i[r].l = 1 * new Date();
            a = s.createElement(o),
                    m = s.getElementsByTagName(o)[0];
            a.async = 1;
            a.src = g;
            m.parentNode.insertBefore(a, m)
        })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-85290341-1', 'auto');
        ga('send', 'pageview');
        ga('set', 'userId', getCookie('seolgi-wedding-unique-id')); // 로그인한 User-ID를 사용하여 User-ID를 설정합니다.

        /**
         * 쿠키값 추출
         * @param cookieName 쿠키명
         */
        function getCookie(name){
            name = new RegExp(name + '=([^;]*)');
            return name.test(document.cookie) ? unescape(RegExp.$1) : '';
        }
    </script>
</head>

<!-- body classes:  -->
<!-- "boxed": boxed layout mode e.g. <body class="boxed"> -->
<!-- "pattern-1 ... pattern-9": background patterns for boxed layout mode e.g. <body class="boxed pattern-1"> -->
<!-- "transparent-header": makes the header transparent and pulls the banner to top -->
<!-- "gradient-background-header": applies gradient background to header -->
<!-- "page-loader-1 ... page-loader-6": add a page loader to the page (more info @components-page-loaders.html) -->
<body class="front-page page-loader-1">
<!-- scrollToTop -->
<!-- ================ -->
<div class="scrollToTop circle"><i class="icon-up-open-big"></i></div>

<!-- page wrapper start -->
<!-- ================ -->
<div class="page-wrapper">

    <!-- header-container start -->
    <div class="header-container">

        <!-- header start -->
        <!-- classes:  -->
        <!-- "fixed": enables fixed navigation mode (sticky menu) e.g. class="header fixed clearfix" -->
        <!-- "dark": dark version of header e.g. class="header dark clearfix" -->
        <!-- "full-width": mandatory class for the full-width menu layout -->
        <!-- "centered": mandatory class for the centered logo layout -->
        <!-- ================ -->
        <header class="header centered fixed    clearfix">

            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <!-- header-left start -->
                        <!-- ================ -->
                        <div class="header-left clearfix">

                            <!-- logo -->
                            <div id="logo" class="logo">
                                <h2 class="text-center logo-font margin-clear">
                                    <a href="#" class="text-muted">
                                        ${wedding.male.name}
                                        <span class="text-default"><i class="pl-10 pr-10 fa fa-heart"></i></span>
                                        ${wedding.female.name}</a>
                                </h2>
                            </div>

                            <!-- name-and-slogan -->
                            <div class="site-slogan text-center">
                                ${wedding.title}
                            </div>

                        </div>
                        <!-- header-left end -->

                    </div>
                </div>
            </div>

        </header>
        <!-- header end -->
    </div>
    <!-- header-container end -->

    <!-- banner start -->
    <!-- ================ -->
    <div class="pv-40 dark-translucent-bg imgix-fluid" data-src="${wedding.imageUrl}?fit=crop"
         style="background-position: 50% 32%;">
        <div class="container pv-40">
            <div class="row">
                <div class="col-md-8 text-center col-md-offset-2 pv-40">
                    <div class="object-non-visible pv-40" data-animation-effect="fadeIn" data-effect-delay="100">
                        <h1 class="page-title text-center">${wedding.title}</h1>
                        <div class="separator"></div>
                        <h3 class="text-center"><em><fmt:formatDate value="${wedding.weddingDate}"
                                                                    pattern="yyyy-MM-dd HH:mm"/>, ${wedding.city}, ${wedding.country}</em>
                        </h3>
                        <!-- countdown start -->
                        <div class="countdown clearfix"></div>
                        <!-- countdown end -->

                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="page-start"></div>

    <!-- section start -->
    <!-- ================ -->
    <section class="light-gray-bg pv-30 clearfix">
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <h2 class="text-center logo-font text-muted">Groom &amp; <span class="text-default">Bride</span>
                    </h2>
                    <div class="separator"></div>
                    <p class="text-center">${wedding.introduction}</p>
                </div>
            </div>
        </div>
    </section>
    <!-- section end -->

    <!-- section start -->
    <!-- ================ -->
    <section class="full-width-section">
        <div class="light-gray-bg border-clear">
            <img class="imgix-fluid" data-src="${wedding.male.imageUrl}?fit=crop">
        </div>
        <div class="full-text-container left light-gray-bg border-clear text-right">
            <h2 class="logo-font">${wedding.male.name}</h2>
            <div class="separator-3 visible-lg"></div>
            <p>${wedding.male.introduction}</p>
            <div class="separator-2 visible-lg"></div>
        </div>

    </section>
    <!-- section end -->

    <!-- section start -->
    <!-- ================ -->
    <section class="full-width-section">

        <div class="full-text-container default-bg">
            <h2 class="logo-font">${wedding.female.name}</h2>
            <div class="separator-2 visible-lg"></div>
            <p>${wedding.female.introduction}</p>
            <div class="separator-3 visible-lg"></div>
        </div>
        <div class="default-bg">
            <img class="to-right-block imgix-fluid" data-src="${wedding.female.imageUrl}?fit=crop">
        </div>
    </section>
    <!-- section end -->

    <!-- section start -->
    <c:if test="${not empty wedding.stories}">
        <section class="light-gray-bg pv-30 clearfix">
            <div class="container">
                <div class="row">
                    <h2 class="text-center text-muted logo-font">The <span class="text-default">Story</span></h2>
                    <div class="separator"></div>
                </div>

                <div class="owl-carousel content-slider-with-controls-autoplay">
                    <c:forEach items="${wedding.stories}" var="story" varStatus="status">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                    <div class="white-bg shadow p-20 text-center">
                                        <div class="timeline-date-label  clearfix" style="margin-bottom: 20px;">
                                            <fmt:formatDate value="${story.storyDate}" pattern="yyyy-MM-dd"/></div>
                                        <h3>${story.title}</h3>
                                        <div class="separator"></div>
                                        <img class="imgix-fluid" data-src="${story.imageUrl}?fit=crop">
                                        <p>${story.description}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>
    </c:if>
    <!-- section end -->
    <!-- section start -->
    <!-- ================ -->
    <section class="pv-30 clearfix">
        <div class="container">
            <div class="row">
                <h2 class="text-center text-muted logo-font">Photo <span class="text-default">Gallery</span></h2>
                <div class="separator"></div>
            </div>
            <!-- isotope filters start -->
            <div class="filters text-center">
                <ul class="nav nav-pills">
                    <li class="active"><a href="#" data-filter="*">ALL</a></li>
                    <c:forEach var="category" items="${wedding.gallery.categories}">
                        <li><a href="#" data-filter=".${category.name}">${category.name}</a></li>
                    </c:forEach>
                </ul>
            </div>
            <!-- isotope filters end -->
        </div>

        <div class="isotope-container row grid-space-0">
            <c:if test="${not empty wedding.splitGalleryImages}">
                <div class="col-sm-6 col-md-3 isotope-item ${wedding.splitGalleryImagesCategories}">
                    <div id="carousel-portfolio" class="carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators top">
                            <c:forEach items="${wedding.splitGalleryImages}" var="galleryImage" varStatus="status">
                                <li data-target="#carousel-portfolio" data-slide-to="${status.count}" <c:if
                                    test="${status.count eq 1}"> class='active' </c:if></li>
                            </c:forEach>
                        </ol>

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox">
                            <c:forEach items="${wedding.splitGalleryImages}" var="galleryImage" varStatus="status">
                                <div class="item <c:if test="${status.count eq 1}"> active </c:if>">
                                    <div class="image-box text-center">
                                        <div class="overlay-container overlay-visible">
                                            <img src="${galleryImage.url}?fit=crop&w=480&h=300&crop=entropy"
                                                 alt="${galleryImage.category.name}">
                                            <a href="${galleryImage.url}?fit=crop&w=750&h=464&crop=entropy"
                                               class="popup-img overlay-link"><i class="fa fa-plus"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </c:if>
            <c:forEach items="${wedding.shuffleGalleryImages}" var="galleryImage">
                <div class="col-sm-6 col-md-3 isotope-item ${galleryImage.category.name}">
                    <div class="image-box text-center">
                        <div class="overlay-container overlay-visible">
                            <img src="${galleryImage.url}?fit=crop&w=480&h=300&crop=entropy"
                                 alt="${galleryImage.category.name}">
                            <a href="${galleryImage.url}?fit=crop&w=750&h=464&crop=entropy"
                               class="popup-img overlay-link"><i class="fa fa-plus"></i></a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>


        <div class="container">
            <c:if test="${not empty wedding.schedules}">
                <div class="row">

                    <h2 class="text-center space-top text-default logo-font">Schedule</h2>
                    <div class="separator"></div>
                    <c:forEach items="${wedding.schedules}" var="schedule" varStatus="status">
                        <div class="<custom:divCenterClass current="${status.count}" totalCount="${fn:length(wedding.schedules)}" />">
                            <div class="image-box text-center style-2 mb-20">
                                <img src="${schedule.imageUrl}?fit=crop&w=400&h=400" alt="${schedule.title}"
                                     class="img-circle img-thumbnail">
                                <div class="body padding-horizontal-clear">
                                    <h4 class="logo-font title">${schedule.title}</h4>
                                    <p class="small mb-10">${schedule.introduction}</p>
                                    <p class="lead text-default"><fmt:formatDate value="${schedule.localDateTime}"
                                                                                 pattern="yyyy-MM-dd HH:mm"/></p>

                                </div>
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </c:if>
            <h3 class="text-default text-center space-top logo-font"><span class="text-muted">The</span> Place</h3>
            <div class="separator"></div>
            <p class="text-center">${wedding.location}</p>
            <div class="row">
                <div class="col-md-6">
                    <img src="${wedding.hallImageUrl}?fit=crop" class="img-thumbnail mb-20 imgix-fluid"
                         alt="${wedding.location}">
                </div>
                <div class="col-md-6">
                    <div id="map-canvas" class="small"></div>
                </div>
            </div>

        </div>

    </section>

    <!-- section end -->
    <!-- footer start (Add "dark" class to #footer in order to enable dark footer) -->
    <!-- ================ -->
    <footer id="footer" class="clearfix ">
        <!-- .footer start -->
        <!-- ================ -->
        <div class="footer" id="funding_area">
            <div class="container">
                <div class="footer-inner">
                    <div class="row">
                        <c:if test="${not empty wedding.gifts}">
                            <div class="col-md-6 gift-contents">
                                <div class="footer-content">
                                    <h2 class="title text-default">결혼 축하선물</h2>

                                    <div class="mt-10 separator-2"></div>

                                    <div class="pv-30 ph-20 feature-box bordered shadow text-center object-non-visible animated object-visible fadeInDownSmall"
                                         data-animation-effect="fadeInDownSmall" data-effect-delay="100">
                                        <span class="icon default-bg circle"><i class="fa fa-gift"></i></span>
                                        <h3> ${wedding.male.name}
                                            <span class="text-default"><i class="pl-10 pr-10 fa fa-heart"></i></span>
                                                ${wedding.female.name} <br> Wish List</h3>
                                        <div class="separator clearfix"></div>
                                        <p>신랑&신부를 위한선물<br>
                                            어떤 것들이 있을까요?<br><br>
                                            신랑&신부가 직접 고른 <br>
                                            선물목록을 준비했습니다.<br><br>
                                            지금 확인해 보세요.
                                        </p>
                                        <input type="button" value="목록보기" data-target="#giftModal" data-toggle="modal"
                                               class="submit-button btn btn-default btn_show_gift_form">
                                    </div>

                                </div>
                            </div>
                        </c:if>

                        <div class="col-md-6">
                            <div class="footer-content">
                                <h2 class="title text-default">감사의 인사</h2>
                                <div class="mt-10 separator-2"></div>
                                <p>${wedding.greetings}
                                </p>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>


        <!-- .footer end -->
        <!-- .subfooter start -->
        <!-- ================ -->
        <div class="subfooter">
            <div class="container">
                <div class="subfooter-inner">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="call-to-action text-center">
                                <button class="_btn_share_kakao btn btn-animated btn-lg btn-gray-transparent">kakao<i
                                        class="fa fa-kakao pl-20"></i></button>
                                <button class="_btn_share_kakaostory btn btn-animated btn-lg btn-gray-transparent">kakao<i
                                        class="fa fa-kakao pl-20"></i></button>
                                <button class="_btn_share_facebook btn btn-animated btn-lg btn-gray-transparent">
                                    facebook<i class="fa fa-facebook pl-20"></i></button>
                            </div>
                            <p class="text-center">
                                The Project by <a target="_blank"
                                                  href="http://www.seolgi.com/">http://www.seolgi.com/</a>.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- .subfooter end -->
    </footer>
</div>

<!-- page-wrapper end -->

<div class="modal fade" id="giftModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" id="giftModalArea">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">GIFT</h4>
            </div>
            <div class="modal-body text-center">
                <p>새로운 결혼문화를 만들어 갑니다.
                </p>
                <div class="owl-carousel content-slider-with-controls-autoplay">
                    <c:forEach items="${wedding.gifts}" var="gift" varStatus="status">

                        <div class="image-box text-center gift_item style-2 mb-20">
                            <div class="p-20 text-center">
                                <input type="hidden" class="hidden_giftId" value="${gift.id}">
                                <img src="${gift.imageUrl}?fit=crop&w=300&h=300"
                                     class="img-circle img-thumbnail btn_gift_image">

                                <div class="separator"></div>
                                <div class="progress style-1 dark">

                                    <div class="progress-bar progress-bar-success" role="progressbar"
                                         data-animate-width="${gift.amountGuestPriceRate}%">

                                    </div>
                                    <span class="label" data-animation-effect="fadeInLeftSmall"><strong
                                            class="text-danger">${gift.formatAmountGuestPrice}원 </strong> 모임</span>
                                </div>

                                <c:choose>
                                    <c:when test="${not gift.complete}"><h5>${gift.name}</h5></c:when>
                                    <c:otherwise>
                                        <del><h5>${gift.name}</h5></del>
                                    </c:otherwise>
                                </c:choose>


                                <strong class="text-success">총 ${gift.guestsSize}명</strong> 참여<c:if
                                    test="${not gift.complete}">중</c:if>
                                <c:if test="${gift.complete}">
                                    <h4 class="text-danger">참여완료된 선물입니다.</h4>
                                </c:if>
                            </div>
                        </div>

                    </c:forEach>
                </div>
                <div class="contact-form text-center" id="guest_form_area">
                    <form id="guest_form" data-toggle="validator" class=" margin-clear" action="/api/gift/guest"
                          method="post" role="form">
                        <input type="hidden" id="input_giftId" class="gift_id" value="">
                        <input type="hidden" class="weddingId" value="${wedding.id}">
                        <input type="hidden" class="weddingUrl" value="${wedding.url}">
                        <div class="form-group has-feedback">
                            <input type="text" placeholder="이름을 입력해주세요." data-error="2자이상 입력해 주세요."
                                   pattern="^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$" class="form-control guest_name"
                                   name="guest_name" required>
                            <i class="fa fa-user form-control-feedback"></i>
                            <div class="help-block with-errors"></div>
                        </div>
                        <div class="form-group has-feedback">
                            <input type="text" placeholder="전화번호를 입력해주세요." data-error="전화번호를 확인해주세요."
                                   pattern="^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$"
                                   class="form-control phoneNumber" name="phoneNumber" required>
                            <i class="fa fa-phone form-control-feedback"></i>
                            <div class="help-block with-errors"></div>
                        </div>
                        <div class="form-group has-feedback">
                            <textarea placeholder="전하는말" class="form-control message" rows="4"
                                      name="message"></textarea>
                            <i class="fa fa-envelope form-control-feedback"></i>
                        </div>
                        <div class="form-group has-feedback">
                            <input type="number" placeholder="선물할 금액" class="form-control price"
                                   data-error="금액을 입력해주세요." data-minlength="5" name="price" required>
                            <i class="fa fa-money form-control-feedback"></i>
                            <div class="help-block with-errors"></div>
                        </div>
                        <div class="progress style-1" style="display: none;">
                            <span class="text"></span>
                            <div class="progress-bar progress-bar-success">
                        <span class="label object-non-visible" style="display: none;"
                              data-animation-effect="fadeInLeftSmall" data-effect-delay="1000">Success</span>
                            </div>
                        </div>
                        <input type="submit" value="참여" class="submit-button btn btn-default submit_gift">
                        <input type="button" value="닫기" data-dismiss="modal" class=" submit-button btn">
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="modal-dialog" id="giftGreetingsArea" style="display: none;">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="test">참여해 주셔서 감사합니다.</h4>
            </div>
            <div class="modal-body ">

                <div class="pv-30 ph-20 feature-box bordered shadow text-center object-non-visible animated object-visible fadeInDownSmall"
                     data-animation-effect="fadeInDownSmall" data-effect-delay="100">
                    <span class="icon default-bg circle"><i class="fa fa-envelope"></i></span>
                    <h3>Thank You</h3>
                    <div class="separator clearfix"></div>
                    <p class="text-center">
                        sms로 신랑&신부의 대표 계좌정보를<br>
                        전송하였습니다.<br><br>

                        감사합니다.<br>
                    </p>

                </div>
                <div class="text-center">
                    <input type="button" value="닫기" data-dismiss="modal" class=" submit-button btn">
                </div>
            </div>
        </div>
    </div>
</div>

<!-- JavaScript files placed at the end of the document so the pages load faster -->
<!-- ================================================== -->
<!-- Jquery and Bootstap core js files -->
<script type="text/javascript"
        src="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/jquery.min.js"></script>
<script type="text/javascript"
        src="/${buildTimestamp}/resources/lib/bootstrap/html/template/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
        src="/${buildTimestamp}/resources/lib/bootstrap/vaildate/bootstrap-validator.min.js"></script>

<!-- Modernizr javascript -->
<script type="text/javascript"
        src="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/modernizr.js"></script>
<!-- jQuery Revolution Slider  -->
<script type="text/javascript"
        src="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
<script type="text/javascript"
        src="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
<!-- Isotope javascript -->
<script type="text/javascript"
        src="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/isotope/isotope.pkgd.min.js"></script>
<!-- Magnific Popup javascript -->
<script type="text/javascript"
        src="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/magnific-popup/jquery.magnific-popup.min.js"></script>
<!-- Appear javascript -->
<script type="text/javascript"
        src="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/waypoints/jquery.waypoints.min.js"></script>
<!-- Count To javascript -->
<script type="text/javascript"
        src="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/jquery.countTo.js"></script>
<!-- Parallax javascript -->
<script src="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/jquery.parallax-1.1.3.js"></script>
<!-- Contact form -->
<script src="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/jquery.validate.js"></script>
<!-- Google Maps javascript -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCIxyNQ61rzMo81dldLbkBMU69I6fEiGPo&signed_in=true"></script>
<script src="/${buildTimestamp}/resources/lib/map/googleMap.js"></script>
<!-- Background Video -->
<script src="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/vide/jquery.vide.js"></script>
<!-- Owl carousel javascript -->
<script type="text/javascript"
        src="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/owl-carousel/owl.carousel.js"></script>
<!-- SmoothScroll javascript -->
<script type="text/javascript"
        src="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/jquery.browser.js"></script>
<script type="text/javascript"
        src="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/SmoothScroll.js"></script>
<!-- Count Down javascript -->
<script type="text/javascript"
        src="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/jquery.countdown/jquery.plugin.js"></script>
<script type="text/javascript"
        src="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/jquery.countdown/jquery.countdown.js"></script>
<script type="text/javascript"
        src="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/pace/pace.min.js"></script>

<!-- bootbox -->
<script type="text/javascript" src="/${buildTimestamp}/resources/lib/bootstrap/bootbox/bootbox.js"></script>

<script src="/${buildTimestamp}/resources/lib/imgix/imgix.min.js"></script>
<script type="text/javascript" src="/${buildTimestamp}/resources/lib/cookie/jquery.cookie.1.4.1.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="/${buildTimestamp}/resources/lib/social/kakao.js"></script>
<script type="text/javascript" src="/${buildTimestamp}/resources/lib/social/facebook.js"></script>

<script type="text/javascript" src="/${buildTimestamp}/resources/js/gift/guest/Guest.js"></script>
<script type="text/javascript" src="/${buildTimestamp}/resources/js/gift/guest/GuestRepository.js"></script>
<script type="text/javascript" src="/${buildTimestamp}/resources/js/cookie/SessionUser.js"></script>
<script type="text/javascript" src="/${buildTimestamp}/resources/js/guid/Guid.js"></script>
<script type="text/javascript" src="/${buildTimestamp}/resources/js/visit/Visitor.js"></script>
<script type="text/javascript" src="/${buildTimestamp}/resources/js/visit/VisitorRepository.js"></script>

<script type="text/javascript" src="/${buildTimestamp}/resources/js/share/Share.js"></script>
<script type="text/javascript" src="/${buildTimestamp}/resources/js/share/ShareRepository.js"></script>
<!-- Initialization of Plugins -->
<script type="text/javascript" src="/${buildTimestamp}/resources/lib/bootstrap/html/template/js/template.js"></script>

<script type="text/javascript">

    SessionUser.createSessionCookie();


    VisitorRepository.add(new Visitor(${wedding.id}));

    imgix.onready(function () {
        imgix.fluid({
            updateOnResizeDown: true,
            pixelStep: 10,
            autoInsertCSSBestPractices: true,
            fitImgTagToContainerWidth: true
        });
    });

    initMap('map-canvas', ${wedding.latitude}, ${wedding.longitude}, 15);

    var localDate = new Date('<fmt:formatDate value="${wedding.weddingDate}" pattern="yyyy-MM-dd'T'HH:mm"/>');
    var utc = localDate.getTime() + (localDate.getTimezoneOffset() * 60000);
    var untilDate = new Date(utc);

    $(".countdown").countdown({
        until: untilDate,
        format: 'dHMS',
        padZeroes: true
    });

    var dummyOG_Title = '${wedding.male.name} & ${wedding.female.name} 결혼식에 초대합니다.';
    var dummyOG_image = '${wedding.imageUrl}';
    var dummy_webLinkTitle = location.href;

    if (false == isMobile()) {
        $("._btn_share_kakao").hide();
    } else {
        $("._btn_share_kakaostory").hide();
    }


    var kakao = new kakao();

    $("._btn_share_kakao").on('click', function () {
        kakao.sendLink(dummyOG_Title, dummyOG_image, dummy_webLinkTitle);
        ShareRepository.add(new Share(${wedding.id}, "KAKAO_TALK"));
    });

    $("._btn_share_kakaostory").on('click', function () {
        kakao.shareStory(dummyOG_Title);
        ShareRepository.add(new Share(${wedding.id}, "KAKAO_STORY"));
    });
    var facebook = new facebook();
    $("._btn_share_facebook").on('click', function () {
        window.open("https://www.facebook.com/sharer/sharer.php?u=" + location.href);
        ShareRepository.add(new Share(${wedding.id}, "FACEBOOK"));
    });

    function isMobile() {
        if (navigator.userAgent.match(/Android|Mobile|iP(hone|od|ad)|BlackBerry|IEMobile|Kindle|NetFront|Silk-Accelerated|(hpw|web)OS|Fennec|Minimo|Opera M(obi|ini)|Blazer|Dolfin|Dolphin|Skyfire|Zune/)) {
            return true;
        }

        return false;
    }

    $('#giftModal').on('hidden.bs.modal', function () {
        $('html,body').animate({scrollTop: $('.gift-contents').offset().top}, 0);
    });

    $('#guest_form').validator().on('submit', function (event) {

        if (event.isDefaultPrevented() == false) {
            $(this).find('.submit_gift').attr('disabled', true);
            var guest = new Guest($(this));
            GuestRepository.add(guest, $(this).find('.progress'), function () {
                $('#guestName').text(guest.name);
                $('#giftModalArea').hide();
                $('#giftGreetingsArea').fadeIn(500);
            });
        }
        return false;
    });

</script>
</body>
</html>

