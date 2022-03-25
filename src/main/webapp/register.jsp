<%--
  Created by IntelliJ IDEA.
  User: jintingli
  Date: 2022/3/18
  Time: 2:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="header.jspf"/>

<div id="wrapper" style="width: 99%;">
    <jsp:include page="/toc.jspf"/>
    <td valign="top" colspan="3" class="bb">
        <div class="fl" style="width: 99%;">

            <h1>Register New Account</h1>

            <p><span style="color:#FF0066;font-size:12pt;font-weight:bold;">
		<%
            java.lang.String error = (String)request.getSession(true).getAttribute("Error");

            if (error != null && error.trim().length() > 0){
                out.print(error);
            }
        %>
		</span></p>

            <form action="Register" method="post">
                <table>
                    <tr>
                        <td>
                            First name:
                        </td>
                        <td>
                            <input type="text" id="firstname" name="uid" value="" style="width: 150px;">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Last name:
                        </td>
                        <td>
                            <input type="text" id="lastname" name="uid" value="" style="width: 150px;">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Username:
                        </td>
                        <td>
                            <input type="text" id="uid" name="uid" value="" style="width: 150px;">
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Password:
                        </td>
                        <td>
                            <input type="password" id="passw1" name="passw1" style="width: 150px;">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Re-type password:
                        </td>
                        <td>
                            <input type="password" id="passw2" name="passw2" style="width: 150px;">
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <input type="submit" name="btnSubmit" value="Create">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </td>
</div>

<jsp:include page="footer.jspf"/>