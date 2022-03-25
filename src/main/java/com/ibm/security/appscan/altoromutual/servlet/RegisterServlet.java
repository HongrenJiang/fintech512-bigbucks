package com.ibm.security.appscan.altoromutual.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ibm.security.appscan.Log4AltoroJ;
import com.ibm.security.appscan.altoromutual.util.DBUtil;
import com.ibm.security.appscan.altoromutual.util.ServletUtil;

import static java.lang.System.err;
import static java.lang.System.out;

/**
 * This servlet processes user's registering new account operations
 * Servlet implementation class RegisterServlet
 * @author jintingli
 */
public class RegisterServlet extends HttpServlet {
    public RegisterServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //register new account

        String username = null;
        String output = null;

        try {
            username = request.getParameter("uid");
            if (username != null)
                username = username.trim().toLowerCase();

            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            String passw1 = request.getParameter("passw1");
            String passw2 = request.getParameter("passw2");

            if (firstname == null) {
                firstname = "";
            }

            if (lastname == null) {
                lastname = "";
            }

            if (output == null) {
                String error = DBUtil.addUser(username, passw1, firstname, lastname);

                if (error != null) {
                    output = error;
                }
            }

            if (output != null) {
                output = "Warning! " + output;
            } else {
                output = "Success!";
            }

            if ((output == null) & (!passw1.equals(passw2))){
                output = "Passwords do not match!";
            }

            if (!DBUtil.isExistingUser(username)) {
                output = "Register Failed: We're sorry, but this username was found in our system. Please try a different username.";
            }

        } catch (Exception ex) {
            request.getSession(true).setAttribute("registerError", ex.getLocalizedMessage());
            response.sendRedirect("register.jsp");
            return;
        }
        response.sendRedirect("register.jsp");
        return;
    }
}