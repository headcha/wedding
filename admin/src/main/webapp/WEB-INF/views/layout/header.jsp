<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- header-container start -->
<div class="header-container">

    <!-- header-top start -->
<!-- classes:  -->
    <!-- "dark": dark version of header top e.g. class="header-top dark" -->
    <!-- "colored": colored version of header top e.g. class="header-top colored" -->
    <!-- ================ -->
    <div class="header-top  colored">
        <div class="container">
            <div class="row">
                <div class="col-xs-3 col-sm-6 col-md-9">
                    <!-- header-top-first start -->
                    <!-- ================ -->
                    <div class="header-top-first clearfix">
                        <ul class="social-links circle small clearfix hidden-xs">
                            <li class="twitter"><a target="_blank" href="http://www.twitter.com"><i class="fa fa-twitter"></i></a></li>
                            <li class="skype"><a target="_blank" href="http://www.skype.com"><i class="fa fa-skype"></i></a></li>
                            <li class="linkedin"><a target="_blank" href="http://www.linkedin.com"><i class="fa fa-linkedin"></i></a></li>
                            <li class="googleplus"><a target="_blank" href="http://plus.google.com"><i class="fa fa-google-plus"></i></a></li>
                            <li class="youtube"><a target="_blank" href="http://www.youtube.com"><i class="fa fa-youtube-play"></i></a></li>
                            <li class="flickr"><a target="_blank" href="http://www.flickr.com"><i class="fa fa-flickr"></i></a></li>
                            <li class="facebook"><a target="_blank" href="http://www.facebook.com"><i class="fa fa-facebook"></i></a></li>
                            <li class="pinterest"><a target="_blank" href="http://www.pinterest.com"><i class="fa fa-pinterest"></i></a></li>
                        </ul>
                        <div class="social-links hidden-lg hidden-md hidden-sm circle small">
                            <div class="btn-group dropdown">
                                <button type="button" class="btn dropdown-toggle" data-toggle="dropdown"><i class="fa fa-share-alt"></i></button>
                                <ul class="dropdown-menu dropdown-animation">
                                    <li class="twitter"><a target="_blank" href="http://www.twitter.com"><i class="fa fa-twitter"></i></a></li>
                                    <li class="skype"><a target="_blank" href="http://www.skype.com"><i class="fa fa-skype"></i></a></li>
                                    <li class="linkedin"><a target="_blank" href="http://www.linkedin.com"><i class="fa fa-linkedin"></i></a></li>
                                    <li class="googleplus"><a target="_blank" href="http://plus.google.com"><i class="fa fa-google-plus"></i></a></li>
                                    <li class="youtube"><a target="_blank" href="http://www.youtube.com"><i class="fa fa-youtube-play"></i></a></li>
                                    <li class="flickr"><a target="_blank" href="http://www.flickr.com"><i class="fa fa-flickr"></i></a></li>
                                    <li class="facebook"><a target="_blank" href="http://www.facebook.com"><i class="fa fa-facebook"></i></a></li>
                                    <li class="pinterest"><a target="_blank" href="http://www.pinterest.com"><i class="fa fa-pinterest"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <ul class="list-inline hidden-sm hidden-xs">
                            <li><i class="fa fa-map-marker pr-5 pl-10"></i>회사 주소</li>
                            <li><i class="fa fa-phone pr-5 pl-10"></i>+81 010 6702 1755</li>
                            <li><i class="fa fa-envelope-o pr-5 pl-10"></i> headcha@naver.com</li>
                        </ul>
                    </div>
                    <!-- header-top-first end -->
                </div>
                <div class="col-xs-9 col-sm-6 col-md-3">

                    <!-- header-top-second start -->
                    <!-- ================ -->
                    <div id="header-top-second"  class="clearfix">

                        <!-- header top dropdowns start -->
                        <!-- ================ -->
                        <div class="header-top-dropdown text-right">
                            <c:choose>
                                <c:when test="${empty loggedUser}">
                                    <div class="btn-group">
                                        <a href="/account/signup" class="btn btn-default btn-sm"><i class="fa fa-user pr-10"></i> 회원 가입</a>
                                    </div>

                                    <div class="btn-group dropdown <c:if test="${param.login eq 'form' || param.login eq 'error'}">open</c:if>">
                                        <button type="button" class="btn dropdown-toggle btn-default btn-sm" data-toggle="dropdown"><i class="fa fa-lock pr-10"></i> 로그인</button>
                                        <ul class="dropdown-menu dropdown-menu-right dropdown-animation">
                                            <li>
                                                <form class="login-form margin-clear" action="/auth/process" method="post">
                                                    <div class="form-group has-feedback">
                                                        <label class="control-label">아이디</label>
                                                        <input type="text" name="id" class="form-control" placeholder="id">
                                                        <i class="fa fa-user form-control-feedback"></i>
                                                    </div>
                                                    <div class="form-group has-feedback">
                                                        <label class="control-label">비밀번호</label>
                                                        <input type="password" name="password" class="form-control" placeholder="password">
                                                        <i class="fa fa-lock form-control-feedback"></i>
                                                    </div>
                                                    <c:if test="${param.login eq 'error'}">
                                                    <div class="form-group"><label class="text-danger">id 또는 password를 확인해주세요.</label></div>
                                                    </c:if>
                                                    <button type="submit" class="btn btn-gray btn-sm">로그인</button>
                                                    <span class="pl-5 pr-5">또는</span>
                                                    <button type="submit" class="btn btn-default btn-sm">회원 가입</button>
                                                    <ul>
                                                        <li><a href="#">비밀번호를 잊어버렸나요?</a></li>
                                                    </ul>
                                                    <span class="text-center">SNS 로그인</span>
                                                    <ul class="social-links circle small colored clearfix">
                                                        <li class="facebook"><a target="_blank" href="http://www.facebook.com"><i class="fa fa-facebook"></i></a></li>
                                                        <li class="twitter"><a target="_blank" href="http://www.twitter.com"><i class="fa fa-twitter"></i></a></li>
                                                        <li class="googleplus"><a target="_blank" href="http://plus.google.com"><i class="fa fa-google-plus"></i></a></li>
                                                    </ul>
                                                </form>
                                            </li>
                                        </ul>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <span>${loggedUser.id} 님 </span>
                                    <div class="btn-group">
                                        <a href="/auth/logout" class="btn btn-default btn-sm"><i class="fa fa-unlock pr-10"></i> 로그아웃</a>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <!--  header top dropdowns end -->
                    </div>
                    <!-- header-top-second end -->
                </div>
            </div>
        </div>
    </div>
    <!-- header-top end -->

    <!-- header start -->
    <!-- classes:  -->
    <!-- "fixed": enables fixed navigation mode (sticky menu) e.g. class="header fixed clearfix" -->
    <!-- "dark": dark version of header e.g. class="header dark clearfix" -->
    <!-- "full-width": mandatory class for the full-width menu layout -->
    <!-- "centered": mandatory class for the centered logo layout -->
    <!-- ================ -->
    <header class="header  fixed    clearfix">

        <div class="container">
            <div class="row">
                <div class="col-md-3 ">
                    <!-- header-left start -->
                    <!-- ================ -->
                    <div class="header-left clearfix">

                        <!-- logo -->
                        <div id="logo" class="logo-font" style="font-size: 25px;">
                            <a href="/">Seolgi</a>
                        </div>

                        <!-- name-and-slogan -->
                        <div class="site-slogan" style="padding-top: 5px;">
                            당신의 기념일과 함께 합니다.
                        </div>

                    </div>
                    <!-- header-left end -->

                </div>
                <div class="col-md-9">

                    <!-- header-right start -->
                    <!-- ================ -->
                    <div class="header-right clearfix">

                        <!-- main-navigation start -->
                        <!-- classes: -->
                        <!-- "onclick": Makes the dropdowns open on click, this the default bootstrap behavior e.g. class="main-navigation onclick" -->
                        <!-- "animated": Enables animations on dropdowns opening e.g. class="main-navigation animated" -->
                        <!-- "with-dropdown-buttons": Mandatory class that adds extra space, to the main navigation, for the search and cart dropdowns -->
                        <!-- ================ -->
                        <div class="main-navigation  animated with-dropdown-buttons">

                            <!-- navbar start -->
                            <!-- ================ -->
                            <nav class="navbar navbar-default" role="navigation">
                                <div class="container-fluid">

                                    <!-- Toggle get grouped for better mobile display -->
                                    <div class="navbar-header">
                                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-1">
                                            <span class="sr-only">Toggle navigation</span>
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                        </button>

                                    </div>

                                    <!-- Collect the nav links, forms, and other content for toggling -->
                                    <div class="collapse navbar-collapse" style="padding-right: 0" id="navbar-collapse-1">
                                        <!-- main-menu -->
                                        <ul class="nav navbar-nav navbar-right">

                                            <!-- mega-menu start -->
                                            <li class="mega-menu <c:if test="${pageContext.request.requestURI == '/'}">active</c:if>">
                                                <a href="/">소개</a>
                                            </li>
                                            <!-- mega-menu end -->
                                            <!-- mega-menu start -->
                                            <li class="mega-menu <c:if test="${fn:startsWith(pageContext.request.requestURI , '/invitation')}">active</c:if>">
                                                <a href="/invitation">초대장 관리</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </nav>
                            <!-- navbar end -->

                        </div>
                        <!-- main-navigation end -->
                    </div>
                    <!-- header-right end -->

                </div>
            </div>
        </div>

    </header>
    <!-- header end -->
</div>
<!-- header-container end -->