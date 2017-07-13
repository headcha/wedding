<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="btn-group" role="group" aria-label="Basic example" style="width:100%; background-color: #09AFDF; color: white; height: 36px; line-height: 36px;">
  <p style="margin-left: 20px;"> 이미지 갤러리 </p>
</div>

<div class="breadcrumbs" style="margin-top: 10px;">
  <div class="clearfix align-right">
    <button type="button" id="btn_add_category" class="btn btn-info btn-sm" onclick="addCategory(this);">카테고리 추가</button>
  </div>
</div>

<input class="gallery_id" name="galleryId" type="hidden" value="${wedding.gallery.id}">
<c:forEach var="category" items="${wedding.gallery.categories}">
  <table class="table">
  <tr class="category_area">
    <td>
      <input class="category_id" name="categoryId" type="hidden" value="${category.id}">
      <input type="text" name="galleryCategoryName" value="${category.name}"
             class="form-control gallery_category_name" required style="display: inline; width: 150px;"/>
      <button type="button" class="btn btn-default-transparent btn_delete_category">삭제</button>

      <ul class="gallery_area ace-thumbnails clearfix" style="list-style: none;">
        <c:forEach var="image" items="${category.galleryImages}">
          <li class="col-xs-2 gallery_image" style="border: none; width: 200px; margin-top: 10px;">
            <div class="slimArea">
              <c:if test="${not empty image.url}">
                <img src="${image.url}" >
              </c:if>
              <input type="file" name="image" />
            </div>

            <input class="gallery_image_id" name="galleryImageId" type="hidden" value="${image.id}">
            <input class="gallery_image_url" name="galleryImageUrl" type="hidden" value="${image.url}">
          </li>
        </c:forEach>
        <li class="col-xs-2">
          <a href="javascript:void(0);" onclick="addSlim(this);" class="btn radius-50 btn-default-transparent _btn-add-slim" style="margin-top: 40px;"> + </a>
        </li>
      </ul>
    </td>
  </tr>
</table>
</c:forEach>
<c:if test="${empty wedding.gallery.categories}">
  <table class="table">
    <tr class="category_area">
      <td>
        <input class="category_id" name="categoryId" type="hidden">
        <input type="text" name="galleryCategoryName"
               class="form-control gallery_category_name" required style="display: inline; width: 150px;"/>
        <button type="button" class="btn btn-default-transparent btn_delete_category">삭제</button>

        <ul class="gallery_area ace-thumbnails clearfix" style="list-style: none;">
          <li class="col-xs-2 gallery_image" style="border: none; width: 200px; margin-top: 10px;">
            <div class="slimArea">
              <input type="file" name="image" />
            </div>
            <input class="gallery_image_id" name="galleryImageId" type="hidden" />
            <input class="gallery_image_url" name="galleryImageUrl" type="hidden" />
          </li>
          <li class="col-xs-2">
            <a href="javascript:void(0);" onclick="addSlim(this);" class="btn radius-50 btn-default-transparent _btn-add-slim" style="margin-top: 40px;"> + </a>
          </li>
        </ul>
      </td>
    </tr>
  </table>
</c:if>

<script>
  function addCategory(target) {
    var source = $("#new_gallery_category_item_template").html();
    $(source).insertBefore($(target).parents(".data-gallery-div").find('table:last'));
  }

  function addSlim(target) {
    var source = $("#new_gallery_image_item_template").html();
    $(source).insertBefore($(target).parent());
    var newSlim = document.getElementById("newSlim");

    var options = {
      "ratio": "16:9",
      "size": {"width":1920, "height":1080},
      "service": "/api/file/image",
      "didRemove": function() {
        $(newSlim).parent().remove();
      },
      "didUpload": function(error , data , response) {
        $(newSlim).parent().find('.gallery_image_url').val(response.path);
      }
    };

    Slim.create(newSlim, options);
    $('#newSlim').removeAttr('id');
  }
</script>

<script id="new_gallery_image_item_template" type="text/x-handlebars-template">
<li class="col-xs-2 gallery_image" style="border: none; width: 200px; margin-top: 10px;">
  <div id="newSlim">
    <input type="file" name="image" />
  </div>
  <input class="gallery_image_id" name="galleryImageId" type="hidden" />
  <input class="gallery_image_url" name="galleryImageUrl" type="hidden" />
</li>
</script>

<script id="new_gallery_category_item_template" type="text/x-handlebars-template">
<table class="table">
  <tr class="category_area">
    <td>
      <input type="text" name="galleryCategoryName" class="form-control gallery_category_name" required style="display: inline; width: 150px;"/>
      <button type="button" class="btn btn-default-transparent btn_delete_category">삭제</button>
      <ul class="gallery_area ace-thumbnails clearfix" style="list-style: none;">
        <li class="col-xs-2">
          <a href="javascript:void(0);" onclick="addSlim(this);" class="btn radius-50 btn-default-transparent _btn-add-slim" style="margin-top: 40px;"> + </a>
        </li>
      </ul>
    </td>
  </tr>
</table>
</script>