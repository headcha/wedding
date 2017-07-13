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
    <title>
        ${weddingPreviewForm.female.name} ${weddingPreviewForm.male.name} | Wedding
    </title>
    <meta name="description" content="The Project a Bootstrap-based, Responsive HTML5 Template">
    <meta name="author" content="htmlcoder.me">

    <!-- Mobile Meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Favicon -->
    <link rel="shortcut icon" href="/resources/lib/bootstrap/html/template/images/favicon.ico">

    <!-- Web Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,300italic,400italic,500,500italic,700,700italic'
          rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:700,400,300' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=PT+Serif' rel='stylesheet' type='text/css'>

    <!-- Bootstrap core CSS -->
    <link href="/${buildTimestamp}/resources/lib/bootstrap/html/template/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Font Awesome CSS -->
    <link href="/${buildTimestamp}/resources/lib/bootstrap/html/template/fonts/font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- Fontello CSS -->
    <link href="/${buildTimestamp}/resources/lib/bootstrap/html/template/fonts/fontello/css/fontello.css" rel="stylesheet">

    <!-- Plugins -->
    <link href="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/magnific-popup/magnific-popup.css" rel="stylesheet">
    <link href="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/rs-plugin/css/settings.css" rel="stylesheet">
    <link href="/${buildTimestamp}/resources/lib/bootstrap/html/template/css/animations.css" rel="stylesheet">
    <link href="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/owl-carousel/owl.carousel.css" rel="stylesheet">
    <link href="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/owl-carousel/owl.transitions.css" rel="stylesheet">
    <link href="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/hover/hover-min.css" rel="stylesheet">
    <link href="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/jquery.countdown/jquery.countdown.css" rel="stylesheet">
    <!-- The Project core CSS file -->
    <link href="/${buildTimestamp}/resources/lib/bootstrap/html/template/css/style.css" rel="stylesheet">
    <!-- Color Scheme (In order to change the color scheme, replace the blue.css with the color scheme that you prefer)-->
    <link href="/${buildTimestamp}/resources/lib/bootstrap/html/template/css/skins/pink.css" rel="stylesheet">

    <link href="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/jquery.style-swicher/style-swicher.css" rel="stylesheet">

    <!-- kakao -->
    <link href="/${buildTimestamp}/resources/css/bootstrap-social/assets/css/font-awesome.css" rel="stylesheet">
    <!-- Custom css -->
    <link href="/${buildTimestamp}/resources/lib/bootstrap/html/template/css/custom.css" rel="stylesheet">
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
                                    <a href="index.html" class="text-muted">
                                        ${weddingPreviewForm.female.name}
                                        <span class="text-default"><i class="pl-10 pr-10 fa fa-heart"></i></span>
                                        ${weddingPreviewForm.male.name}</a>
                                </h2>
                            </div>

                            <!-- name-and-slogan -->
                            <div class="site-slogan text-center">
                                ${weddingPreviewForm.title}
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
    <div class="pv-40 dark-translucent-bg imgix-fluid" data-src="${weddingPreviewForm.imageUrl}?fit=crop"
         style="background-position: 50% 32%;">
        <div class="container pv-40">
            <div class="row">
                <div class="col-md-8 text-center col-md-offset-2 pv-40">
                    <div class="object-non-visible pv-40" data-animation-effect="fadeIn" data-effect-delay="100">
                        <h1 class="page-title text-center">${weddingPreviewForm.title}</h1>
                        <div class="separator"></div>
                        <h3 class="text-center"><em><fmt:formatDate value="${weddingPreviewForm.dateTime}" pattern="yyyy-MM-dd HH:mm" />, ${weddingPreviewForm.city}, ${weddingPreviewForm.country}</em>
                        </h3>
                        <!-- countdown start -->
                        <div class="countdown clearfix"></div>
                        <!-- countdown end -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- banner end -->

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
                    <p class="text-center">${weddingPreviewForm.introduction}</p>
                </div>
            </div>
        </div>
    </section>
    <!-- section end -->

    <!-- section start -->
    <!-- ================ -->
    <section class="full-width-section">
        <div class="default-bg">
            <img class="to-right-block imgix-fluid" data-src="${female.imageUrl}?fit=crop">
        </div>
        <div class="full-text-container default-bg">
            <h2 class="logo-font">${female.name}</h2>
            <div class="separator-2 visible-lg"></div>
            <p>${femail.introduction}</p>
            <div class="separator-3 visible-lg"></div>
        </div>
    </section>
    <!-- section end -->

    <!-- section start -->
    <!-- ================ -->
    <section class="full-width-section">
        <div class="full-text-container left light-gray-bg border-clear text-right">
            <h2 class="logo-font">${male.name}</h2>
            <div class="separator-3 visible-lg"></div>
            <p>${male.introduction}</p>
            <div class="separator-2 visible-lg"></div>
        </div>
        <div class="light-gray-bg border-clear">
            <img class="imgix-fluid" data-src="${male.imageUrl}?fit=crop">
        </div>
    </section>
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
                    <c:forEach var="category" items="${weddingPreviewForm.gallery.categories}">
                        <li><a href="#" data-filter=".${category.name}">${category.name}</a></li>
                    </c:forEach>
                </ul>
            </div>
            <!-- isotope filters end -->
        </div>

        <div class="isotope-container row grid-space-0">
            <c:if test="${not empty weddingPreviewForm.splitGalleryImages}">
                <div class="col-sm-6 col-md-3 isotope-item ${weddingPreviewForm.splitGalleryImagesCategories}">
                    <div id="carousel-portfolio" class="carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators top">
                            <c:forEach items="${weddingPreviewForm.splitGalleryImages}" var="galleryImage" varStatus="status">
                                <li data-target="#carousel-portfolio" data-slide-to="${status.count}" <c:if
                                    test="${status.count eq 1}"> class='active' </c:if></li>
                            </c:forEach>
                        </ol>

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox">
                            <c:forEach items="${weddingPreviewForm.splitGalleryImages}" var="galleryImage" varStatus="status">
                                <div class="item <c:if test="${status.count eq 1}"> active </c:if>">
                                    <div class="image-box text-center">
                                        <div class="overlay-container overlay-visible">
                                            <img src="${galleryImage.url}?fit=crop&w=750&h=750&crop=entropy" alt="${galleryImage.categoryName}">
                                            <a href="${galleryImage.url}?fit=crop&w=750&h=750&crop=entropy" class="popup-img overlay-link"><i class="fa fa-plus"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </c:if>
            <c:forEach items="${weddingPreviewForm.shuffleGalleryImages}" var="galleryImage">
                <div class="col-sm-6 col-md-3 isotope-item ${galleryImage.categoryName}">
                    <div class="image-box text-center">
                        <div class="overlay-container overlay-visible">
                            <img src="${galleryImage.url}?fit=crop&w=750&h=464" alt="${galleryImage.categoryName}">
                            <a href="${galleryImage.url}?fit=crop&w=750&h=464" class="popup-img overlay-link"><i class="fa fa-plus"></i></a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="container">
            <c:if test="${not empty weddingPreviewForm.schedules}">
                <div class="row">

                    <h2 class="text-center space-top text-default logo-font">Schedule</h2>
                    <div class="separator"></div>
                    <c:forEach items="${weddingPreviewForm.schedules}" var="schedule" varStatus="status">
                        <div class="<custom:divCenterClass current="${status.count}" totalCount="${fn:length(weddingPreviewForm.schedules)}" />">
                            <div class="image-box text-center style-2 mb-20">
                                <img src="${schedule.imageUrl}?fit=crop&w=750&h=750&crop=entropy" alt="${schedule.title}"
                                     class="img-circle img-thumbnail">
                                <div class="body padding-horizontal-clear">
                                    <h4 class="logo-font title">${schedule.title}</h4>
                                    <p class="small mb-10">${schedule.introduction}</p>
                                    <p class="lead text-default"><fmt:formatDate value="${schedule.dateTime}" pattern="yyyy-MM-dd HH:mm" /> </p>

                                </div>
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </c:if>
            <h3 class="text-default text-center space-top logo-font"><span class="text-muted">The</span> Place</h3>
            <div class="separator"></div>
            <p class="text-center">${weddingPreviewForm.location}</p>
            <div class="row">
                <div class="col-md-6">
                    <img src="${weddingPreviewForm.hallImageUrl}?fit=crop" class="img-thumbnail mb-20 imgix-fluid"
                         alt="${weddingPreviewForm.location}">
                </div>
                <div class="col-md-6">
                    <div id="map-canvas" class="small"></div>
                </div>
            </div>
        </div>
    </section>

    <section class="pv-40 stats padding-bottom-clear dark-translucent-bg hovered imgix-fluid" data-src="${weddingPreviewForm.imageUrl}?fit=crop" style="background-position: 50% 50%;">
        <div class="clearfix">
            <div class="col-md-3 col-xs-6 text-center">
                <div class="feature-box object-non-visible" data-animation-effect="fadeIn" data-effect-delay="300">
                    <span class="icon default-bg large circle"><i class="fa fa-money"></i></span>
                    <h3><strong>목표액</strong></h3>
                    <span class="counter" data-to="${weddingPreviewForm.funding.goalAmount}" data-speed="5000">0</span>
                </div>
            </div>
            <%--<div class="col-md-3 col-xs-6 text-center">--%>
                <%--<div class="feature-box object-non-visible" data-animation-effect="fadeIn" data-effect-delay="300">--%>
                    <%--<span class="icon default-bg large circle"><i class="fa fa-money"></i></span>--%>
                    <%--<h3><strong>현재액</strong></h3>--%>
                    <%--<span class="counter" id="current_amount_area" data-to="${weddingPreviewForm.funding.currentFundingAmount}" data-speed="5000">0</span>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="col-md-3 col-xs-6 text-center">--%>
                <%--<div class="feature-box object-non-visible" data-animation-effect="fadeIn" data-effect-delay="300">--%>
                    <%--<span class="icon default-bg large circle"><i class="fa fa-users"></i></span>--%>
                    <%--<h3><strong>참여인원</strong></h3>--%>
                    <%--<span class="counter" id="current_guests_area" data-to="${fn:length(wedding.funding.guestList)}" data-speed="5000">0</span>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="col-md-3 col-xs-6 text-center">--%>
                <%--<div class="feature-box object-non-visible" data-animation-effect="fadeIn" data-effect-delay="300">--%>
                    <%--<span class="icon default-bg large circle _shareBtn" style="cursor: pointer;"><i class="fa fa-share"></i></span>--%>
                    <%--<h3><strong>Shares</strong></h3>--%>
                    <%--<span class="counter" id="share_area" data-to="${fn:length(wedding.shares)}" data-speed="5000">0</span>--%>
                <%--</div>--%>
            <%--</div>--%>
        </div>
        <!-- footer top start -->
        <!-- ================ -->
        <div class="footer-top animated-text" style="background-color:rgba(0,0,0,0.3);">
                <div class="row">
                    <div class="col-md-12">
                        <div class="call-to-action">
                            <div class="col-sm-offset-3 col-xs-offset-2 col-xs-10 col-sm-8 text-right">
                                <p class="mt-10">
                                    <button class="_btn_share_kakao btn btn-animated btn-lg btn-gray-transparent">kakao<i class="fa fa-kakao pl-20"></i></button>
                                    <button class="_btn_share_kakaostory btn btn-animated btn-lg btn-gray-transparent">kakao<i class="fa fa-kakao pl-20"></i></button>
                                    <button class="_btn_share_facebook btn btn-animated btn-lg btn-gray-transparent">facebook<i class="fa fa-facebook pl-20"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
        <!-- footer top end -->
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
                        <div class="col-md-6">
                            <div class="footer-content">
                                <h2 class="title text-default">감사의 인사</h2>
                                <div class="mt-10 separator-2"></div>
                                <p>${weddingPreviewForm.funding.greetings}
                                </p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="footer-content">
                                <h2 class="title text-default">참여</h2>
                                <div class="separator-2 mt-10"></div>

                                <div class="progress style-1" style="display: none;">
                                    <span class="text"></span>
                                    <div class="progress-bar progress-bar-default">
                                        <span class="label object-non-visible" style="display: none;"  data-animation-effect="fadeInLeftSmall" data-effect-delay="1000">Success</span>
                                    </div>
                                </div>
                                <div class="contact-form">
                                    <form id="funding_form" method="post" action="/api/funding/guest/" class="margin-clear" role="form">
                                        <input type="hidden" id="fundingId" value="${wedding.funding.id}">
                                        <div class="form-group has-feedback">
                                            <label class="sr-only" for="name">이름*</label>
                                            <input type="text" placeholder="이름" class="form-control" id="name" name="name" required>
                                            <i class="fa fa-user form-control-feedback"></i>
                                        </div>
                                        <div class="form-group has-feedback">
                                            <label class="sr-only" for="phoneNumber">전화번호*</label>
                                            <input type="tel" placeholder="전화번호" class="form-control" id="phoneNumber" name="phone" required>
                                            <i class="fa fa-phone form-control-feedback"></i>
                                        </div>
                                        <div class="form-group has-feedback">
                                            <label class="sr-only" for="price">축의금*</label>
                                            <input type="number" placeholder="축의금" class="form-control" id="price" name="price" required>
                                            <i class="fa fa-money form-control-feedback"></i>
                                        </div>
                                        <div class="form-group has-feedback">
                                            <label class="sr-only" for="message">전하는 말*</label>
                                            <input type="text" placeholder="전하는 말" class="form-control" id="message" name="message">
                                            <i class="fa fa-envelope form-control-feedback"></i>
                                        </div>
                                        <input type="submit" value="참여" class="submit-button btn btn-default">
                                        <input type="button" value="계좌정보" class="btn btn-default" data-toggle="modal" data-target="#myModal">
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title" id="myModalLabel">축의금 계좌 정보</h4>
                    </div>
                    <div class="modal-body">
                        <p>결혼식에 관심 가져주신 모든 여러분께 신랑&신부를 대신하여 깊은 감사 말씀 전합니다.<br>
                            신랑&신부의 결혼식에 사용될 축의금을 입금 하실수 있는 정보는 아래와 같습니다.<br>
                        </p>
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>은행</th>
                                <th>계좌번호</th>
                                <th>예금주</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>신랑</td>
                                <td>${weddingPreviewForm.funding.maleBankName}</td>
                                <td>${weddingPreviewForm.funding.maleAccountNumber}</td>
                                <td>${weddingPreviewForm.funding.maleAccountOwnerName}</td>
                            </tr>
                            <tr>
                                <td>신부</td>
                                <td>${weddingPreviewForm.funding.femaleBankName}</td>
                                <td>${weddingPreviewForm.funding.femaleAccountNumber}</td>
                                <td>${weddingPreviewForm.funding.femaleAccountOwnerName}</td>
                            </tr>
                            </tbody>
                        </table>
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
                            <p class="text-center">
                                Copyright © 2016 The Project by <a target="_blank" href="http://headcha.tistory.com/">headcha</a>.
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

<!-- JavaScript files placed at the end of the document so the pages load faster -->
<!-- ================================================== -->
<!-- Jquery and Bootstap core js files -->
<script type="text/javascript" src="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/jquery.min.js"></script>
<script type="text/javascript" src="/${buildTimestamp}/resources/lib/bootstrap/html/template/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/${buildTimestamp}/resources/lib/bootstrap/vaildate/bootstrap-validator.min.js"></script>

<!-- Modernizr javascript -->
<script type="text/javascript" src="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/modernizr.js"></script>
<!-- jQuery Revolution Slider  -->
<script type="text/javascript" src="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
<script type="text/javascript" src="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
<!-- Isotope javascript -->
<script type="text/javascript"
        src="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/isotope/isotope.pkgd.min.js"></script>
<!-- Magnific Popup javascript -->
<script type="text/javascript" src="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/magnific-popup/jquery.magnific-popup.min.js"></script>
<!-- Appear javascript -->
<script type="text/javascript" src="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/waypoints/jquery.waypoints.min.js"></script>
<!-- Count To javascript -->
<script type="text/javascript" src="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/jquery.countTo.js"></script>
<!-- Parallax javascript -->
<script src="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/jquery.parallax-1.1.3.js"></script>
<!-- Contact form -->
<script src="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/jquery.validate.js"></script>
<!-- Google Maps javascript -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCIxyNQ61rzMo81dldLbkBMU69I6fEiGPo&signed_in=true"></script>
<script src="/${buildTimestamp}/resources/lib/map/GoogleMap.js"></script>
<!-- Background Video -->
<script src="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/vide/jquery.vide.js"></script>
<!-- Owl carousel javascript -->
<script type="text/javascript"
        src="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/owl-carousel/owl.carousel.js"></script>
<!-- SmoothScroll javascript -->
<script type="text/javascript" src="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/jquery.browser.js"></script>
<script type="text/javascript" src="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/SmoothScroll.js"></script>
<!-- Count Down javascript -->
<script type="text/javascript" src="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/jquery.countdown/jquery.plugin.js"></script>
<script type="text/javascript" src="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/jquery.countdown/jquery.countdown.js"></script>
<script type="text/javascript" src="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/pace/pace.min.js"></script>
<!-- Initialization of Plugins -->
<script type="text/javascript" src="/${buildTimestamp}/resources/lib/bootstrap/html/template/js/template.js"></script>

<!-- bootbox -->
<script type="text/javascript" src="/${buildTimestamp}/resources/lib/bootstrap/bootbox/bootbox.js"></script>

<script src="/${buildTimestamp}/resources/lib/imgix/imgix.min.js"></script>
<script type="text/javascript" src="/${buildTimestamp}/resources/lib/cookie/jquery.cookie.1.4.1.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="/${buildTimestamp}/resources/lib/social/kakao.js"></script>
<script type="text/javascript" src="/${buildTimestamp}/resources/lib/social/facebook.js"></script>

<script type="text/javascript" src="/${buildTimestamp}/resources/js/funding/guest/Guest.js"></script>
<script type="text/javascript" src="/${buildTimestamp}/resources/js/funding/guest/GuestRepository.js"></script>
<script type="text/javascript" src="/${buildTimestamp}/resources/js/cookie/SessionUser.js"></script>
<script type="text/javascript" src="/${buildTimestamp}/resources/js/guid/Guid.js"></script>
<%--<script type="text/javascript" src="/${buildTimestamp}/resources/js/visit/Visitor.js"></script>--%>
<%--<script type="text/javascript" src="/${buildTimestamp}/resources/js/visit/VisitorRepository.js"></script>--%>

<script type="text/javascript" src="/${buildTimestamp}/resources/js/share/Share.js"></script>
<script type="text/javascript" src="/${buildTimestamp}/resources/js/share/ShareRepository.js"></script>

<script type="text/javascript">

    SessionUser.createSessionCookie();

    <%--VisitorRepository.add(new Visitor(${wedding.id}));--%>

//    $('#funding_form').validator().on('submit', function (event) {
//        if (event.isDefaultPrevented() == false) {
//            var guest = new Guest($('#funding_form'));
//            GuestRepository.add(guest , $('.progress') , function() {
//                $('#myModal').modal();
//            });
//        }
//        return false;
//    });

    imgix.onready(function () {
        imgix.fluid({
            updateOnResizeDown: true,
            pixelStep: 10,
            autoInsertCSSBestPractices: true,
            fitImgTagToContainerWidth: true
        });
    });

    initMap('map-canvas', ${weddingPreviewForm.latitude}, ${weddingPreviewForm.longitude}, 15);

    var localDate = new Date('<fmt:formatDate value="${weddingPreviewForm.dateTime}" pattern="yyyy-MM-dd'T'HH:mm"/>');
    var utc = localDate.getTime() + (localDate.getTimezoneOffset() * 60000);
    var untilDate = new Date(utc);

    $(".countdown").countdown({
        until: untilDate,
        format: 'dHMS',
        padZeroes: true
    });

    <%--var dummyOG_Title = '김연지 & 차정현 결혼식에 초대합니다.';--%>
    <%--var dummyOG_image = 'http://seolgi.imgix.net/image/5b8a0bc8-54f7-45fb-b232-fba219da1189.jpg?fit=crop&w=750&h=464';--%>
    <%--var dummy_webLinkTitle = location.href;--%>

    <%--if(false == isMobile()) {--%>
        <%--$("._btn_share_kakao").hide();--%>
    <%--} else {--%>
        <%--$("._btn_share_kakaostory").hide();--%>
    <%--}--%>

    <%--var share_area = $('#share_area');--%>

    <%--var kakao = new kakao();--%>
    <%--$("._btn_share_kakao").on('click', function() {--%>
        <%--kakao.sendLink(dummyOG_Title, dummyOG_image, dummy_webLinkTitle);--%>
        <%--ShareRepository.add(new Share(${wedding.id} , "KAKAO_TALK") , function() {--%>
            <%--share_area.text( +(share_area.text()) + 1);--%>
        <%--});--%>
    <%--});--%>

    <%--$("._btn_share_kakaostory").on('click', function() {--%>
        <%--kakao.shareStory(dummyOG_Title);--%>
        <%--ShareRepository.add(new Share(${wedding.id} , "KAKAO_STORY") , function() {--%>
            <%--share_area.text( +(share_area.text()) + 1);--%>
        <%--});--%>
    <%--});--%>

    <%--var facebook = new facebook();--%>
    <%--$("._btn_share_facebook").on('click', function() {--%>
        <%--facebook.share();--%>
        <%--ShareRepository.add(new Share(${wedding.id} , "FACEBOOK") , function() {--%>
            <%--share_area.text( +(share_area.text()) + 1);--%>
        <%--});--%>
    <%--});--%>

    <%--function isMobile() {--%>
        <%--if(navigator.userAgent.match(/Android|Mobile|iP(hone|od|ad)|BlackBerry|IEMobile|Kindle|NetFront|Silk-Accelerated|(hpw|web)OS|Fennec|Minimo|Opera M(obi|ini)|Blazer|Dolfin|Dolphin|Skyfire|Zune/)) {--%>
            <%--return true;--%>
        <%--}--%>

        <%--return false;--%>
    <%--}--%>
</script>
</body>
</html>

