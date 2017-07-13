<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="btn-group" role="group" aria-label="Basic example" style="width:100%; background-color: #09AFDF; color: white; height: 36px; line-height: 36px;">
  <a href="javascript:showCoupleArea('data-couple-male-area');" class="btn square btn-default" style="margin: 0 0 0 20px;">신랑</a>
  <a href="javascript:showCoupleArea('data-couple-female-area');" class="btn square btn-default" style="margin: 0 0 0 1px;">신부</a>
  <span style="font-size: 6px; margin-left: 20px;"> 우리를 소개해봐요. </span>
</div>

<table class="table table-striped table-bordered table-hover data-couple-male-area" style="margin-top: 10px;">
  <tr>
    <%--<td>사진</td>--%>
    <td class="row">
      <input type="hidden" class="maleId" name="maleId" value="${wedding.male.id}"/>
      <input class="male_image_url" type="hidden" name="maleImageUrl" value="${wedding.male.imageUrl}">

      <div class="slimArea male">
        <c:if test="${not empty wedding.male.imageUrl}">
          <img src="${wedding.male.imageUrl}" >
        </c:if>
        <input type="file" name="image" />
      </div>
    </td>
  </tr>
  <tr>
    <td>
      <input class="form-control maleName" name="maleName" type="text" value="${wedding.male.name}" placeholder="이름" required />
    </td>
  </tr>
  <tr>
    <td>
      <input class="form-control maleIntroduction" name="maleIntroduction" type="text"
             value="${wedding.male.introduction}" placeholder="소개글" required />
    </td>
  </tr>
</table>

<table class="table table-striped table-bordered table-hover data-couple-female-area" style="margin-top: 10px; display: none;">
  <tr>
    <td class="row">

      <input type="hidden" class="femaleId" name="femaleId" value="${wedding.female.id}"/>
      <input class="female_image_url" type="hidden" name="femaleImageUrl" value="${wedding.female.imageUrl}">

      <div class="slimArea female">
        <c:if test="${not empty wedding.female.imageUrl}">
          <img src="${wedding.female.imageUrl}" >
        </c:if>
        <input type="file" name="image" />
      </div>
    </td>
  </tr>
  <tr>
    <%--<td>이름</td>--%>
    <td>
      <input class="form-control femaleName" name="femaleName" type="text" value="${wedding.female.name}" placeholder="이름" required>
    </td>
  </tr>
  <tr>
    <%--<td>소개글</td>--%>
    <td>
      <input class="form-control femaleIntroduction" name="femaleIntroduction" type="text"
             value="${wedding.female.introduction}" placeholder="소개" required />
    </td>
  </tr>
</table>
<%--신랑 신부 소개--%>

<script>
  function showCoupleArea(areaName) {
    $('.data-couple-male-area, .data-couple-female-area').hide();
    $("." + areaName).show();
  }
</script>