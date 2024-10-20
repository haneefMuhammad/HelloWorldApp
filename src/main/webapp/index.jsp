<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<html>
    <body>
        <h2>
            <%
                Calendar calendar = Calendar.getInstance();
                int hour = calendar.get(Calendar.HOUR_OF_DAY);
                String greeting = (hour < 12) ? "Good morning" : "Good afternoon";
                out.println(greeting + ", Haneef Muhammad, Welcome to COMP367!");
            %>
        </h2>
    </body>
</html>
