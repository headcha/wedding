<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<input type="hidden" class="enable" name="enable" value="${wedding.enable}"/>

<div class="btn-group" role="group" aria-label="Basic example" style="width:100%; background-color: #09AFDF; color: white; height: 36px; line-height: 36px;">
  <p style="margin-left: 20px;"> 대표정보 </p>
</div>

<%--// 대표정보 설정부분--%>
<table class="table table-striped table-bordered table-hover" style="margin-top: 10px;">
  <tr>
    <td>
      <input type="hidden" value="${wedding.url}" name="wedding_url" class="wedding_url">
      <a target="_blank" href="http://wedding.seolgi.com/${wedding.url}">http://wedding.seolgi.com/${wedding.url}</a>
    </td>
  </tr>
  <tr>
    <%--<td>제목</td>--%>
    <td>
      <input class="form-control title" name="title" type="text" value="${wedding.title}" placeholder="초대장 제목" required>
    </td>
  </tr>

  <tr>
    <%--<td>소개글</td>--%>
    <td>
      <textarea class="form-control introduction" name="introduction" placeholder="소개글" rows="5">${wedding.introduction}</textarea>
    </td>
  </tr>

  <tr>
    <%--<td>대표이미지</td>--%>
    <td class="row">
      <div class="slim input-group col-sm-6"
           data-service="/api/file/image"
           data-did-upload="attachWeddingImage"
           data-did-remove="removeWeddingImage"
           data-size="1920,1080"
           data-ratio="16:9"
           data-label="청접장의 대표 이미지를 설정하세요."
           data-jpeg-compression="90"
           style="width: 655px;">
        <c:if test="${not empty wedding.imageUrl}">
          <img src="${wedding.imageUrl}" />
        </c:if>
        <input type="file" name="image" />
      </div>
      <input class="wedding_image_url" type="hidden" name="weddingImageUrl" value="${wedding.imageUrl}" />
    </td>
  </tr> <%--// 대표정보 설정부분--%>
</table>

<script>
    function attachWeddingImage(error , data , response) {
        if (error == null)
            $(this._originalElement).parent().find('.wedding_image_url').val(response.path);
    }

    function removeWeddingImage(data) {
        $(this._originalElement).parent().find('.wedding_image_url').val('');
    }
</script>