<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--[if IE 9]> <html lang="ko" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="ko">
<!--<![endif]-->

<head>
    <meta charset="utf-8">
    <title><decorator:title default="Seolgi Wedding"/></title>
    <meta name="description" content="The Project a Seolgi">
    <meta name="author" content="headcha">

    <!-- Mobile Meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Favicon -->
    <link rel="shortcut icon" href="/${buildTimestamp}/resources/lib/bootstrap/html/template/images/favicon.ico">

    <!-- Web Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,300italic,400italic,500,500italic,700,700italic' rel='stylesheet' type='text/css'>
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
    <link href="/${buildTimestamp}/resources/lib/bootstrap/html/template/plugins/morphext/morphext.css" rel="stylesheet">

    <!-- The Project core CSS file -->
    <link href="/${buildTimestamp}/resources/lib/bootstrap/html/template/css/style.css" rel="stylesheet" >
    <!-- Color Scheme (In order to change the color scheme, replace the blue.css with the color scheme that you prefer)-->
    <link href="/${buildTimestamp}/resources/lib/bootstrap/html/template/css/skins/light_blue.css" rel="stylesheet">

    <!-- swicher -->
    <link href="/${buildTimestamp}/resources/lib/swicher/bootstrap-switch.min.css" rel="stylesheet">

    <!-- Custom css -->
    <link href="/${buildTimestamp}/resources/lib/bootstrap/html/template/css/custom.css" rel="stylesheet">
    <decorator:head/>
</head>
<!-- body classes:  -->
<!-- "boxed": boxed layout mode e.g. <body class="boxed"> -->
<!-- "pattern-1 ... pattern-9": background patterns for boxed layout mode e.g. <body class="boxed pattern-1"> -->
<!-- "transparent-header": makes the header transparent and pulls the banner to top -->
<!-- "gradient-background-header": applies gradient background to header -->
<!-- "page-loader-1 ... page-loader-6": add a page loader to the page (more info @components-page-loaders.html) -->
<body class="no-trans front-page transparent-header">

<!-- scrollToTop -->
<!-- ================ -->
<div class="scrollToTop circle"><i class="icon-up-open-big"></i></div>

<!-- page wrapper start -->
<!-- ================ -->
<div class="page-wrapper">

    <!-- header-container start -->
    <%@include file="header.jsp"%>
    <!-- header-container end -->

    <decorator:body/>
    <%@include file="footer.jsp"%>

</div>
<%@include file="script.jsp"%>


<decorator:getProperty property="page.local_script"></decorator:getProperty>
</body>
</html>
