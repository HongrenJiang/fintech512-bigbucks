package com.ibm.security.appscan.altoromutual.model;

public class Stock {
    private long accountId;
    private String stockCode;
    private int stockAmount = 0;

    public Stock(long accountId, String stockCode, int stockAmount) {
        this.accountId = accountId;
        this.stockCode = stockCode;
        this.stockAmount = stockAmount;
    }

    public String getStockCode() {
        return stockCode;
    }

    public int getStockAmount() {
        return stockAmount;
    }

    public void changeStockAmount(int changeAmount) {
        this.stockAmount += changeAmount;
    }
}



