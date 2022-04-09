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

    public void buyStock(int buyAmount, double stockPrice) {
        this.averageCost = (this.averageCost * this.stockAmount + buyAmount * stockPrice)/(this.stockAmount + buyAmount);
        this.stockAmount += buyAmount;
    }

    // When you sell, the price you sell at does not matter for the determination of your average cost.
    public void sellStock(int sellAmount) {
        this.stockAmount -= sellAmount;
    }
}



