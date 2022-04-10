<%--
  Created by IntelliJ IDEA.
  User: jintingli
  Date: 2022/4/9
  Time: 5:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<jsp:include page="/header.jspf"/>

<div id="wrapper" style="width: 99%;">
    <jsp:include page="membertoc.jspf"/>
    <td valign="top" colspan="3" class="bb">
        <%@page import="com.ibm.security.appscan.altoromutual.model.Account"%>

            <%
            com.ibm.security.appscan.altoromutual.model.User user = (com.ibm.security.appscan.altoromutual.model.User)request.getSession().getAttribute("user");
        %>

        <script type="text/javascript">



        </script>

        <div class="fl" style="width: 99%;">

            <form id="tForm" name="tForm" method="post" action="showCharts" onsubmit="return (confirming(tForm));">

                <h1>Analyze Stocks</h1>
                
    </td>
</div>

<jsp:include page="footer.jspf"/>