<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="btn-group" role="group" aria-label="Basic example" style="width:100%; background-color: #09AFDF; color: white; height: 36px; line-height: 36px;">
  <p style="margin-left: 20px;"> 상세정보 </p>
</div>

<table class="table table-striped table-bordered table-hover" style="margin-top: 10px;">
  <%--상세정보 설정부분--%>
  <tr>
    <%--<td>결혼일</td>--%>
    <td class="row">
      <div class='input-group date-pick col-sm-12 dateTimePicker'>
        <input type='text' class="form-control dateTime" name="dateTime" placeholder="예식일자 선택" title="예식일자 선택" value="${wedding.weddingDate}" required />
        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
      </div>
    </td>
  </tr>
  <tr>
    <%--<td>국가</td>--%>
    <td class="row">
      <div class="input-group col-sm-12">
        <input class="form-control country" name="country" type="text" value="${wedding.country}" placeholder="예식장 국가" required />
      </div>
    </td>
  </tr>
  <tr>
    <%--<td>도시</td>--%>
    <td class="row">
      <div class="input-group col-sm-12">
        <input class="form-control city" name="city" type="text" value="${wedding.city}" placeholder="예식장 도시" required />
      </div>
    </td>
  </tr>
  <tr>
    <%--<td>예식장 이미지</td>--%>
    <td class="row" data-conditions="element:{was visible}">
      <div class="input-group col-sm-12 slimArea">
        <c:if test="${not empty wedding.hallImageUrl}">
          <img src="${wedding.hallImageUrl}"  class="img-responsive">
        </c:if>
        <input type="file" name="image"/>
      </div>
      <input class="wedding_hall_image_url" type="hidden" name="weddingHallImageUrl" value="${wedding.hallImageUrl}">
    </td>
  </tr>

  <tr>
    <td>
      <div class="input-group col-xs-12">
        <input class="form-control location" name="location" type="text" value="${wedding.location}" placeholder="예식장 주소" required />
                                                        <span class="input-group-addon submit_geocode">
                                                            <span>geocode</span>
                                                        </span>
      </div>
      <input type="hidden" class="latitude" name="latitude" value="${wedding.latitude}" required>
      <input type="hidden" class="longitude" name="longitude"  value="${wedding.longitude}" required>
      <div style="width:655px; height: 200px;" id="map"></div>
    </td>
  </tr>
</table>