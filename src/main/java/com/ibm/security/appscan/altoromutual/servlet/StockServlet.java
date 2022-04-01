package com.ibm.security.appscan.altoromutual.servlet;
import java.io.IOException;
import java.math.BigDecimal;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ibm.security.appscan.altoromutual.util.OperationsUtil;
import com.ibm.security.appscan.altoromutual.util.ServletUtil;
import yahoofinance.*;

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
        String direction = String.valueOf(request.getParameter("action"));
        String tick = request.getParameter("stockName");
        int shareNum = Integer.valueOf(request.getParameter("tradeAmount"));
        long creditActId = Long.parseLong(request.getParameter("Account"));

        Stock stock = YahooFinance.get(tick);
        BigDecimal price = stock.getQuote().getPrice();
        double amount = price.doubleValue() * shareNum;

        if(direction.equals("buy"))
        {
            amount = -amount;
        }

        String message = OperationsUtil.doServletTradeStock(request,creditActId,amount);

        RequestDispatcher dispatcher = request.getRequestDispatcher("stocks.jsp");
        request.setAttribute("message", message);
        dispatcher.forward(request, response);
    }
}

