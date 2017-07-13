<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div class="banner light-translucent-bg" style="background-image:url('/resources/lib/bootstrap/html/template/images/page-contact-banner.jpg'); background-position: 50% 30%;">
    <!-- breadcrumb end -->
    <div class="container">
        <div class="row">
            <div class="col-md-8 text-center col-md-offset-2 pv-20">
                <h2 class="title"> 초대장 관리 </h2>
                <div class="separator mt-10"></div>
            </div>
        </div>
    </div>
</div>



<!-- section start -->
<!-- ================ -->
<section class="section pv-40 stats">
    <div class="container">
        <h3 class="text-center title">${loggedUser.name}님의 <strong>초대장</strong></h3>
        <button class="btn btn-lg btn-default btn-animated " data-toggle="modal" data-target="#myModal">생성<i class="fa fa-plus pl-20"></i></button>
        <div class="separator"></div>

        <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title" id="myModalLabel">초대장 생성</h4>
                    </div>
                    <div class="modal-body">
                        <p>Seolgi의 모든 초대장은 무료 입니다.<br>
                            반응형 웹으로 모든 브라우저를 지원하는 Seolgi와 함께 소중한 기념일을 만들어 보세요.<br>
                        </p>
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>항목</th>
                                <th>입력</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>초대장 URL</td>
                                <td><input type="text" id="invitationUrl" name="invitationUrl">
                                    <label id="errorMessage" class="text-danger" style="display: none;"></label>
                                </td>
                            </tr>
                            </tbody>
                        </table>

                        <button id="btn_create_invitation">생성</button>
                    </div>
                </div>
            </div>
        </div>

        <c:forEach items="${invitation.weddings}" var="wedding">
        <div class="image-box team-member style-3-b invitationItem">
            <div class="row">
                <div class="col-sm-6 col-md-4 col-lg-3">
                    <a href="/invitation/wedding/${wedding.url}"><img src="${wedding.imageUrl}" ></a>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-6 col-lg-offset-1">
                    <div class="body">
                        <a href="/invitation/wedding/${wedding.id}"><h3 class="title margin-clear"><fmt:formatDate value="${wedding.createDate}" pattern="yyyy년 MM월 dd일"/> 에 생성한 초대장</h3></a>
                        <div class="separator-2 mt-10"></div>
                        <a href="/statistics/visitor/${wedding.id}">
                        <div class="progress style-1 dark">
                            <span class="text"></span>
                            <div class="progress-bar progress-bar-striped" role="progressbar" data-animate-width="${invitation.visitorCountRate(wedding.allVisitorCount)}%">
                                <span class="label object-non-visible" data-animation-effect="fadeInLeftSmall" data-effect-delay="1000">방문자 -${wedding.allVisitorCount}</span>
                            </div>
                        </div>

                        <div class="progress style-1 dark">
                            <span class="text"></span>
                            <div class="progress-bar progress-bar-info" role="progressbar" data-animate-width="${wedding.DDayRate}%">
                                <span class="label object-non-visible" data-animation-effect="fadeInLeftSmall" data-effect-delay="1000">d day - ${wedding.DDate}일</span>
                            </div>
                        </div>

                        <div class="progress style-1 dark">
                            <span class="text"></span>
                            <div class="progress-bar progress-bar-danger" data-animate-width="${invitation.shareCountRate(wedding.allShareCount)}%">
                                <span class="label object-non-visible" data-animation-effect="fadeInLeftSmall" data-effect-delay="1000">공유횟수 - ${wedding.allShareCount}</span>
                            </div>
                        </div>
                        </a>
                    </div>
                </div>
                <div class="col-sm-12 col-md-4 col-lg-2">

                    <ul class="nav nav-pills nav-stacked list-style-icons">
                        <li><input type="checkbox" class="switcherCheckbox chk_enableInvitation" data-invitation-id="${wedding.id}" <c:if test="${wedding.enable}">checked</c:if> data-label-text="공유" ></li>
                        <li><button type="button"  class="btn btn-animated btn-info btn_copyUrl" data-invitation-url="${wedding.url}" > URL복사 <i class="fa fa-link"></i></button></li>
                        <li><button type="button"  class="btn btn-animated btn-danger btn_deleteInvitation" data-invitation-id="${wedding.id}" > 삭제  <i class="fa fa-remove"></i></button></li>
                    </ul>
                </div>
            </div>
            <div class="separator-2 mb-20"></div>
        </div>
        </c:forEach>
        <h3 class="text-center">많은 기념일이 <span class="logo-font"> <span class="text-default">Seolgi</span></span> 와 함께 진행되고 있습니다. </h3>
        <div class="separator-2 mb-20"></div>
        <div class="row">
            <div class="col-md-3 col-xs-6 text-center">
                <div class="feature-box shadow-narrow bordered pv-20 light-gray-bg object-non-visible" data-animation-effect="fadeIn" data-effect-delay="300">
                    <span class="icon without-bg text-center"><i class="text-default fa fa-diamond"></i></span>
                    <h3>생성된 초대장</h3>
                    <span class="counter" data-to="${invitation.allInvitationCount}" data-speed="5000">0</span>
                </div>
            </div>
            <div class="col-md-3 col-xs-6 text-center">
                <div class="feature-box shadow-narrow bordered pv-20 light-gray-bg object-non-visible" data-animation-effect="fadeIn" data-effect-delay="300">
                    <span class="icon without-bg text-center"><i class="text-default fa fa-users"></i></span>
                    <h3>전체 참여인원</h3>
                    <span class="counter" data-to="${invitation.allGuestCount}" data-speed="5000">0</span>
                </div>
            </div>

            <div class="col-md-3 col-xs-6 text-center">
                <div class="feature-box shadow-narrow bordered pv-20 light-gray-bg object-non-visible" data-animation-effect="fadeIn" data-effect-delay="300">
                    <span class="icon without-bg text-center"><i class="text-default fa fa-share"></i></span>
                    <h3>전체 방문자</h3>
                    <span class="counter" data-to="${invitation.allVisitorCount}" data-speed="5000">0</span>
                </div>
            </div>
        </div>

        <div class="separator-3"></div>
    </div>
</section>
<!-- section end -->
<content tag="local_script">
<script src="/${buildTimestamp}/resources/js/gallery/Gallery.js"></script>
<script src="/${buildTimestamp}/resources/js/funding/Funding.js"></script>
<script src="/${buildTimestamp}/resources/js/invitation/wedding/Wedding.js"></script>
<script src="/${buildTimestamp}/resources/js/invitation/wedding/WeddingRepository.js"></script>
<script type="text/javascript">
    $('#btn_create_invitation').on('click' , function() {
       var wedding = Wedding.createByUrl($('#invitationUrl').val());
        WeddingRepository.create(wedding
        , function(result) {
            location.href="/invitation/wedding/" + result.url;
        }
        , function(response , error , status ) {
            $('#errorMessage').text(response.responseJSON.message).show();
        });
    });

    $('.chk_enableInvitation').on('switchChange.bootstrapSwitch' , function(event, state) {
        var id = $(this).attr('data-invitation-id');
        var wedding = Wedding.createByEnable(id , state);
        WeddingRepository.updateEnable(wedding, function(result) {
            bootbox.alert('변경 되었습니다.');
        });
    });

    $('.btn_deleteInvitation').on('click' , function(event) {
        var id = $(this).attr('data-invitation-id');
        var $invitationItem = $(this).parents('.invitationItem');
        bootbox.confirm("삭제 하시겠습니까?", function(result) {
            if (result) {
                WeddingRepository.delete(id, function(data) {
                    $invitationItem.animateCss('bounceOutLeft' , function() {
                        $invitationItem.remove();
                    });
                });
            }
        });
    });

    $('.btn_copyUrl').on('click' , function(event) {
        var url = $(this).attr('data-invitation-url');

        //TODO clipboard 에 url 복사
    });
</script>
</content>