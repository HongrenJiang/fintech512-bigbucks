package com.ibm.security.appscan.altoromutual.model;

import java.sql.Timestamp;

public class Stock {
    String stockSymbol;
    Timestamp date;
    double open;
    double close;
    double high;
    double low;
    double adjClose;
    double volume;

    public Stock(String stockSymbol, Timestamp date, double open, double close, double high,
                 double low, double adjClose, double volume) {
        this.stockSymbol = stockSymbol;
        this.date = date;
        this.open = open;
        this.close = close;
        this.high = high;
        this.low = low;
        this.adjClose = adjClose;
        this.volume = volume;
    }

    public String getStockSymbol(){
        return stockSymbol;
    }
    public void setSymbol(String stockSymbol){
        this.stockSymbol = stockSymbol;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }
    public double getOpen(){
        return open;
    }

    public void setOpen(double open){
        this.open = open;
    }

    public double getClose(){
        return close;
    }

    public void setClose(double close){
        this.close = close;
    }

    public double getHigh(){
        return high;
    }

    public void setHigh(double high){
        this.high = high;
    }

    public double getLow(){
        return low;
    }

    public void setLow(double low){
        this.low = low;
    }
    public double getAdj_close(){
        return adjClose;
    }
    public void setAdj_close(double adj_close){
        this.adjClose = adj_close;
    }
    public double getVolume(){
        return volume;
    }
    public void setVolume(double volume){
        this.volume = volume;
    }
}


