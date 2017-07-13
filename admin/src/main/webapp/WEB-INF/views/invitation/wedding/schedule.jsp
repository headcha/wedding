<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="btn-group" role="group" aria-label="Basic example" style="width:100%; background-color: #09AFDF; color: white; height: 36px; line-height: 36px;">
  <p style="margin-left: 20px;"> 일정 </p>
</div>

<div class="breadcrumbs" style="margin-top: 10px;">
  <div class="clearfix align-right">
    <button type="button" id="btn_add_schedule" class="btn btn-info btn-sm">일정 추가</button>
  </div>
</div>

<c:forEach var="schedule" items="${wedding.schedules}">
  <table class="table schedule_item" style="width:100%;">
    <tbody>
    <input class="form-control schedule_id" name="scheduleId" type="hidden" value="${schedule.id}" required />
      <tr>
        <td>
          <input class="form-control schedule_title" name="scheduleTitle" type="text" value="${schedule.title}" required>
        </td>
      </tr>
      <tr>
        <td>
          <input class="form-control schedule_introduction" name="scheduleIntroduction" type="text" value="${schedule.introduction}">
        </td>
      </tr>
      <tr>
        <td class="row schedule_image_area">
          <div class="slimArea">
            <c:if test="${not empty schedule.imageUrl}">
              <img src="${schedule.imageUrl}" >
            </c:if>
            <input type="file" name="image" />
          </div>
          <input class="schedule_image_url" type="hidden" name="scheduleImageUrl" value="${schedule.imageUrl}">
        </td>
      </tr>
      <tr>
        <td>
          <div class='input-group date-pick dateTimePicker'>
            <input type='text' class="form-control schedule_dateTime" name="scheduleDateTime" placeholder="YYYY-MM-DD HH:MM" value="${schedule.localDateTime}" required/>
                                                      <span class="input-group-addon">
                                                          <span class="glyphicon glyphicon-calendar"></span>
                                                      </span>
          </div>
        </td>
      </tr>
      <tr>
        <td>
          <button type="button" class="btn btn_delete_schedule btn-sm">삭제</button>
        </td>
      </tr>
    </tbody>
  </table>
</c:forEach>
<c:if test="${empty wedding.schedules}">
  <table class="table schedule_item" style="width:100%;">
    <tbody>
    <input class="form-control schedule_id" name="scheduleId" type="hidden" value="0" required />
    <tr>
      <td>
        <input class="form-control schedule_title" name="scheduleTitle" type="text" placeholder="일정 제목" required />
      </td>
    </tr>
    <tr>
      <td>
        <input class="form-control schedule_introduction" name="scheduleIntroduction" type="text" placeholder="일정 설명" />
      </td>
    </tr>
    <tr>
      <td class="row schedule_image_area">
        <div class="slimArea"
             data-service="/api/file/image"
             data-did-upload="attachScheduleImage"
             data-did-remove="removeScheduleImage"
             data-size="1920,1080"
             data-ratio="16:9">
          <input type="file" name="image" />
        </div>
        <input class="schedule_image_url" type="hidden" name="scheduleImageUrl" />
      </td>
    </tr>
    <tr>
      <td>
        <div class='input-group date-pick dateTimePicker'>
          <input type='text' class="form-control schedule_dateTime" name="scheduleDateTime" placeholder="예정일" required/>
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
        </div>
      </td>
    </tr>
    <tr>
      <td>
        <button type="button" class="btn btn_delete_schedule btn-sm">삭제</button>
      </td>
    </tr>
    </tbody>
  </table>
</c:if>