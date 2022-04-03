package com.ibm.security.appscan.altoromutual.model;

public class Holding {
    private long accountId;
    private String stockSymbol;
    private int stockAmount = 0;

    public Holding(long accountId, String stockSymbol, int stockAmount, double costPrice) {
        this.accountId = accountId;
        this.stockSymbol = stockSymbol;
        this.stockAmount = stockAmount;
    }

    public String getStockSymbol() {
        return stockSymbol;
    }

    public int getStockAmount() {
        return stockAmount;
    }

    public void changeStockAmount(int changeAmount) {
        this.stockAmount += changeAmount;
    }
}



