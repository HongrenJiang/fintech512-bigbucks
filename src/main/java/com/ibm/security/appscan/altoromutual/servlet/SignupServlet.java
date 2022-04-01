package com.ibm.security.appscan.altoromutual.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ibm.security.appscan.altoromutual.util.DBUtil;

/**
 * This servlet processes user's signup new account operations
 * Servlet implementation class SignupServlet
 * @author jintingli
 */

public class SignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public SignupServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //signup for new account
        String message = null;
        String firstname = request.getParameter("nfirstname");
        String lastname = request.getParameter("nlastname");
        String username = request.getParameter("nuid");
        String password1 = request.getParameter("npassw1");
        String password2 = request.getParameter("npassw2");

        if (username == null || username.trim().length() == 0
                || password1 == null || password1.trim().length() == 0
                || password2 == null || password2.trim().length() == 0)
            message = "An error has occurred. Please try again later.";

        if (firstname == null){
            firstname = "";
        }

        if (lastname == null){
            lastname = "";
        }

        if (message == null && !password1.equals(password2)){
            message = "Entered passwords did not match.";
        }

        if (message == null){
            String error = DBUtil.addUser(username, password1, firstname, lastname);

            if (error != null)
                message = error;
        }
        if (message != null)
            message = "Error: " + message;
        else
            message = "Requested operation has completed successfully.";

        request.getSession().setAttribute("message", message);
        DBUtil.addAccount(username, "cash");
        response.sendRedirect("login.jsp");
        return ;

    }
}