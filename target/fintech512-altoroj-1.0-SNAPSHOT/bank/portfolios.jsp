<%--<%@page import="com.ibm.security.appscan.altoromutual.model.Trade"%>--%>
<%--<%@page import="com.ibm.security.appscan.altoromutual.model.Holding"%>--%>
<%--<%@page import="com.ibm.security.appscan.altoromutual.util.DBUtil"%>--%>
<%--<%@ page language="java" contentType="text/html; charset=ISO-8859-1"--%>
<%--         pageEncoding="ISO-8859-1"%>--%>



<%--<jsp:include page="/header.jspf"/>--%>

<%--<div id="wrapper" style="width: 99%;">--%>
<%--  <jsp:include page="/bank/membertoc.jspf"/>--%>
<%--  <td valign="top" colspan="3" class="bb">--%>
<%--    <%@ page import="com.ibm.security.appscan.altoromutual.model.Account" %>--%>
<%--    <%@ page import="java.text.DecimalFormat" %>--%>
<%--    <%@ page import="java.sql.SQLException" %>--%>
<%--    <%@ page import="java.sql.Timestamp" %>--%>
<%--    <%@ page import="java.text.SimpleDateFormat" %>--%>

<%--    //connect portfolio table in database--%>

<%--      <div class="fl" style="width: 99%;">--%>
<%--        <h1>Portfolios Info</h1>--%>
<%--        <table width="700" border="0" style="padding-bottom:10px;">--%>
<%--          <tr><td>--%>
<%--            <br><h2>Users' Sharpe Ratio</h2>--%>
<%--            <table border=1 cellpadding=2 cellspacing=0 width='300'>--%>
<%--              <tr style="color:Black;background-color:#BFD7DA;font-weight:bold;">--%>
<%--                <th width=150>Account ID</th>--%>
<%--                <th width=150>Sharpe Ratio</th>--%>
<%--              </tr>--%>
<%--            </table>--%>
<%--            <DIV ID='userSharpeRatio' STYLE='width:590px; padding:0px; margin: 0px' ><table border=1 cellpadding=2 cellspacing=0 width='300'>--%>
<%--<%--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<jsp:include page="/header.jspf"/>

<div id="wrapper" style="width: 99%;">
    <jsp:include page="membertoc.jspf"/>
    <td valign="top" colspan="3" class="bb">

        <%@page import="java.util.Date"%>
        <%@page import="com.ibm.security.appscan.altoromutual.model.Transaction"%>
        <%@ page import="com.ibm.security.appscan.altoromutual.model.Account" %>
        <%
			com.ibm.security.appscan.altoromutual.model.User user = (com.ibm.security.appscan.altoromutual.model.User)request.getSession().getAttribute("user");
		%>

        <div class="fl" style="width: 99%;">
                <div style="display:inline;">
                    <script type="text/javascript" src="../util/swfobject.js"></script>
                    <script type="text/javascript">
                        swfobject.registerObject("myId", "9.0.0", "../util/expressInstall.swf");
                    </script>

                    <object id="myId" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="550" height="750">
                        <param name="movie" value="../util/EasyStock.swf" />
                        <!--[if !IE]>-->
                        <object type="application/x-shockwave-flash" data="../util/EasyStock.swf" width="550" height="750">
                            <!--<![endif]-->
                </div>
                <div class="fl" style="width: 99%;">
                        <h1>View Portfolio</h1>

                        <table cellSpacing="0" cellPadding="1" width="100%" border="0">
                            <tr>
                                <td><strong>Choose Account</strong></td>
                                <td>
                                    <select size="1" id="chooseAccount" name="chooseAccount">
                                        <%
                                            for (Account account: user.getAccounts()){
                                                out.println("<option value=\""+account.getAccountId()+"\" >" + account.getAccountId() + " " + account.getAccountName() + "</option>");
                                            }
                                        %>
                                    </select>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
    </td>
</div>

<jsp:include page="/footer.jspf"/>


