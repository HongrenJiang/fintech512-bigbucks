<%@page import="com.ibm.security.appscan.altoromutual.model.Trade"%>
<%@page import="com.ibm.security.appscan.altoromutual.model.Holding"%>
<%@page import="com.ibm.security.appscan.altoromutual.util.DBUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>



<jsp:include page="/header.jspf"/>

<div id="wrapper" style="width: 99%;">
  <jsp:include page="/bank/membertoc.jspf"/>
  <td valign="top" colspan="3" class="bb">
    <%@ page import="com.ibm.security.appscan.altoromutual.model.Account" %>
    <%@ page import="java.text.DecimalFormat" %>
    <%@ page import="java.sql.SQLException" %>
    <%@ page import="java.sql.Timestamp" %>
    <%@ page import="java.text.SimpleDateFormat" %>

    //connect portfolio table in database

      <div class="fl" style="width: 99%;">
        <h1>Portfolios Info</h1>
        <table width="700" border="0" style="padding-bottom:10px;">
          <tr><td>
            <br><h2>Users' Sharpe Ratio</h2>
            <table border=1 cellpadding=2 cellspacing=0 width='300'>
              <tr style="color:Black;background-color:#BFD7DA;font-weight:bold;">
                <th width=150>Account ID</th>
                <th width=150>Sharpe Ratio</th>
              </tr>
            </table>
            <DIV ID='userSharpeRatio' STYLE='width:590px; padding:0px; margin: 0px' ><table border=1 cellpadding=2 cellspacing=0 width='300'>
<%



