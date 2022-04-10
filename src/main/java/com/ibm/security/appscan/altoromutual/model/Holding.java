package com.ibm.security.appscan.altoromutual.model;

public class Holding {
    private long accountId;
    private String stockSymbol;
    private int stockAmount = 0;
    private double averageCost;

    public Holding(long accountId, String stockSymbol, int stockAmount, double averageCost) {
        this.accountId = accountId;
        this.stockSymbol = stockSymbol;
        this.stockAmount = stockAmount;
        this.averageCost = averageCost;
    }

    public String getStockSymbol() {
        return stockSymbol;
    }

    public int getStockAmount() {
        return stockAmount;
    }

    public long getAccountId() {
        return accountId;
    }

    public double getAverageCost() {
        return averageCost;
    }
}



