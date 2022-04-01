<%--
  Created by IntelliJ IDEA.
  User: jintingli
  Date: 2022/3/29
  Time: 6:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="header.jspf"/>

<div id="wrapper" style="width: 99%;">
    <jsp:include page="/toc.jspf"/>
    <td valign="top" colspan="3" class="bb">
        <div class="fl" style="width: 99%;">

            <p><span id="_ctl0__ctl0_Content_Main_message" style="color:#FF0066;font-size:12pt;font-weight:bold;">
		<%
            java.lang.String error = (String)request.getSession(true).getAttribute("loginError");

            if (error != null && error.trim().length() > 0){
                request.getSession().removeAttribute("loginError");
                out.print(error);
            }
        %>
		</span></p>

            <h1>Signup for a New Account</h1>

            <form action="doSignup" method="post" name="signup" id="signup" onsubmit="return (confirminput(signup));">
                <table>
                    <tr>
                        <td>
                            Firstname:
                        </td>
                        <td>
                            <input type="text" id="nfirstname" name="nfirstname" style="width: 150px;">
                        </td>
                    </tr>

                    <tr>
                        <td>
                            Lastname:
                        </td>
                        <td>
                            <input type="text" id="nlastname" name="nlastname" style="width: 150px;">
                        </td>
                    </tr>

                    <tr>
                        <td>
                            Username:
                        </td>
                        <td>
                            <input type="text" id="nuid" name="nuid" style="width: 150px;">
                        </td>
                        <td>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            Password:
                        </td>
                        <td>
                            <input type="password" id="npassw1" name="npassw1" style="width: 150px;">
                        </td>
                    </tr>

                    <tr>
                        <td>
                            Confirm password:
                        </td>
                        <td>
                            <input type="password" id="npassw2" name="npassw2" style="width: 150px;">
                        </td>
                    </tr>

                    <tr>
                        <td></td>
                        <td>
                            <input type="submit" name="btnsignup" value="Signup">
                        </td>
                    </tr>

                </table>
            </form>
        </div>

        <script type="text/javascript">
            function confirminput(myform) {
                if (myform.nfirstname.value == null || myform.nfirstname.value == "") {
                    myform.reset();
                    myform.nfirstname.focus();
                    alert("Error! You must enter a valid firstname.");
                    return (false);
                } else if (myform.nlastname.value == null || myform.nlastname.value == "") {
                    myform.reset();
                    myform.nlastname.focus();
                    alert("Error! You must enter a valid lastname.");
                    return (false);
                } else if (myform.nuid.value == null || myform.nuid.value == "") {
                    myform.reset();
                    myform.nuid.focus();
                    alert("Error! You must enter a valid username.");
                    return (false);
                } else if (myform.npassw1.value == null || myform.npassw1.value == "") {
                    myform.npassw1.focus();
                    alert("Error! You must enter a valid password.");
                    return (false);
                } else if (myform.npassw2.value == null || myform.npassw2.value != myform.npassw1.value) {
                    myform.npassw1.focus();
                    alert("Error! You must enter the same length password.");
                    return (false);
                } else {
                    return (true);
                }
            }
        </script>
    </td>
</div>

<jsp:include page="footer.jspf"/>