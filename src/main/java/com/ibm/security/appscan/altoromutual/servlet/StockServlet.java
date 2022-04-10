package com.ibm.security.appscan.altoromutual.servlet;

import java.io.IOException;
import java.math.BigDecimal;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ibm.security.appscan.altoromutual.util.DBUtil;
import com.ibm.security.appscan.altoromutual.util.OperationsUtil;
import com.ibm.security.appscan.altoromutual.util.ServletUtil;

import yahoofinance.*;

import java.sql.SQLException;
import java.sql.Timestamp;

@WebServlet("/StockServlet")

public class StockServlet extends HttpServlet {
    public StockServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if(!ServletUtil.isLoggedin(request)){
            response.sendRedirect("login.jsp");
            return ;
        }

        String message = null;
        String accountIdString = request.getParameter("chooseAccount");
        String tradeTypeString = request.getParameter("tradeType");
        String stockSymbol = request.getParameter("stockSymbol");
        int tradeAmount = Integer.parseInt(request.getParameter("tradeAmount"));

        Timestamp date = new Timestamp(new java.util.Date().getTime());
        if (!DBUtil.checkOpen(date)) {
            message = "Market is not open at this time. Trade Failed!!!!!!";
            RequestDispatcher dispatcher = request.getRequestDispatcher("stocks.jsp");
            request.setAttribute("message", message);
            dispatcher.forward(request, response);
            return;
        }

        double tradePrice;
        try {
            Stock stock = YahooFinance.get(stockSymbol);
            tradePrice = stock.getQuote(true).getPrice().doubleValue();
        } catch (Exception e1) {
            message = "Invalid Stock Symbol! Please enter again.";
            RequestDispatcher dispatcher = request.getRequestDispatcher("stocks.jsp");
            request.setAttribute("message", message);
            dispatcher.forward(request, response);
            return;
        }

        if (message == null) {
            try {
                message = DBUtil.tradeStock(accountIdString, tradeTypeString, tradeAmount, tradePrice, stockSymbol, date);
                RequestDispatcher dispatcher = request.getRequestDispatcher("stocks.jsp");
                request.setAttribute("message", message);
                dispatcher.forward(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        if (message == null) {
            message = "Trade Successfully";
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("stocks.jsp");
        request.setAttribute("message", message);
        dispatcher.forward(request, response);
    }
}

