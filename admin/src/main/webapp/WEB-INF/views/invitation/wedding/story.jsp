<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="btn-group" role="group" aria-label="Basic example"
     style="width:100%; background-color: #09AFDF; color: white; height: 36px; line-height: 36px;">
    <p style="margin-left: 20px;"> 스토리 </p>
</div>

<div class="breadcrumbs" style="margin-top: 10px;">
    <div class="clearfix align-right">
        <button type="button" id="btn_add_story" class="btn btn-info btn-sm" onclick="addStory(this);">스토리 추가</button>
    </div>
</div>
<div class="row story_area">
    <c:forEach var="story" items="${wedding.stories}">

    </c:forEach>
</div>


<script>
    function addStory() {
        var source = $("#new_story_item_template").html();
        $('.story_area').append(source);
    }

</script>


<script id="new_story_item_template" type="text/x-handlebars-template">
    <table class="table">
        <tr>
            <td>
            <div class='input-group date-pick col-sm-12 dateTimePicker'>
                <input type='text' class="form-control dateTime" name="dateTime" placeholder="날짜" title="날짜" required />
                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
            </div>
            </td>
        </tr>
        <tr>
            <td>
            <input type="text" placeholder="제목" name="storyTitle" class="form-control story_title" required style="display: inline; width: 200px;"/>
            <button type="button" class="btn btn-default-transparent btn_delete_story">삭제</button>
            </td>
        </tr>
        <tr>
            <td>
            <textarea class="form-control story_description" name="storyDescription" placeholder="소개글" rows="5"></textarea>
            </td>
        </tr>
        <tr>
            <td>
            <input type="text" name="storyTitle" class="form-control story_title" required style="display: inline; width: 150px;"/>
            </td>
        </tr>
    </table>
</script>