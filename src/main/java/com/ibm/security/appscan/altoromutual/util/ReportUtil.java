package com.ibm.security.appscan.altoromutual.util;

import com.ibm.security.appscan.Log4AltoroJ;
import com.ibm.security.appscan.altoromutual.model.StockData;
import yahoofinance.YahooFinance;
import yahoofinance.Stock;
import yahoofinance.histquotes.HistoricalQuote;
import yahoofinance.histquotes.Interval;

import java.io.IOException;
import java.lang.reflect.Array;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.Timestamp;
import java.util.*;


public class ReportUtil {


//    public static double[] hisAdjClose(String stockSymbol, int numYears) {
//        // get 1 year historical data for a stock
//        Calendar from = Calendar.getInstance();
//        Calendar to = Calendar.getInstance();
//        from.add(Calendar.YEAR, -numYears);
//
//        double[] hisAdjClose = new double[0];
//        try {
//            Stock stock = YahooFinance.get(stockSymbol);
//            List<HistoricalQuote> quotes = stock.getHistory(from, to, Interval.DAILY);
//            for(int i=0; i < quotes.size(); i++) {
//                hisAdjClose[i] = quotes.get(i).getAdjClose().doubleValue();
//            }
//        } catch (IOException e) {
//            Log4AltoroJ.getInstance().logError("Unable to load stock data("+stockSymbol+"): "+e);
//            return null;
//        }
//        return hisAdjClose;
//    }


}
