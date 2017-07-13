<%@ tag body-content="scriptless" pageEncoding="utf-8" description="Center Class 생성 태그" %>
<%@ attribute name="current" %>
<%@ attribute name="totalCount"%>
col-md-4 <%
    if (Integer.parseInt(current) == 1) {

        if (Integer.parseInt(totalCount) == 1)
            out.print("col-md-offset-4");
        else if (Integer.parseInt(totalCount) ==2 )
            out.print("col-md-offset-2");
        else
            out.print("");
    }
%>
