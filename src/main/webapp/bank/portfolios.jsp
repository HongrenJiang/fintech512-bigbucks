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
        <%@ page import="com.ibm.security.appscan.altoromutual.model.Holding" %>
        <%@ page import="com.ibm.security.appscan.altoromutual.util.DBUtil" %>
        <%@ page import="static com.sun.org.apache.xalan.internal.xsltc.compiler.sym.error" %>
        <%@ page import="java.util.ArrayList" %>
        <%
			com.ibm.security.appscan.altoromutual.model.User user = (com.ibm.security.appscan.altoromutual.model.User)request.getSession().getAttribute("user");
            String error = "";
            ArrayList<Double> portfolioValue = DBUtil.getPortfolioValue(user.getAccounts());
            double sharpeRatio = DBUtil.getSharpeRatio(portfolioValue);
            String sharpeRatioStr = "Your Sharpe Ratio is " + String.format("%.2f", sharpeRatio);

            Holding[] holdings = DBUtil.getPortfolio(user.getAccounts());
		%>

            <font style="bold" color="red"><%=error%></font>
            <form id="Form1" name="Form1" method="post" action="showHoldings">
                <h2><%=sharpeRatioStr%></h2>
                <h2>Portfolios</h2>
                <table cellspacing="0" cellpadding="3" rules="all" border="1" id="_ctl0__ctl0_Content_Main_MyTransactions" style="width:100%;border-collapse:collapse;">
                    <tr style="color:White;background-color:#BFD7DA;font-weight:bold;">
                        <td>Account ID</td>
                        <td>Stock Symbol</td>
                        <td>Stock Name</td>
                        <td>Shares Held</td>
                    </tr>
                    <% for (int i=0; i<holdings.length; i++){
                        double dblPrice = holdings[i].getAverageCost();
                        String format = (dblPrice<1)?"$0.00":"$.00";
                        String price = new DecimalFormat(format).format(dblPrice);
                    %>

                    <tr>
                        <td><%=holdings[i].getAccountId()%></td>
                        <td><%=holdings[i].getStockSymbol()%></td>
                        <td align="right"><%=holdings[i].getStockAmount()%></td>
                        <td align="right"><%=price%></td>
                    </tr>
                    <% } %>
                    <tr>
                        <!-- TODO PAGES: <td colspan="4"><span>1</span>&nbsp;<a href="javascript:__doPostBack('_ctl0$_ctl0$Content$Main$MyTransactions$_ctl54$_ctl1','')">2</a></td> -->
                    </tr>
                </table>
            </form>

    </td>
</div>

<jsp:include page="/footer.jspf"/>


