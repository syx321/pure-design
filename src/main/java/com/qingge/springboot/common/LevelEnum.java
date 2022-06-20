package com.qingge.springboot.common;

public enum LevelEnum {//存储商家等级对应费率
    LEVEL_1("0.001"),
    LEVEL_2("0.002"),
    LEVEL_3("0.005"),
    LEVEL_4("0.0075"),
    LEVEL_5("0.01");
    private final String rate;
    LevelEnum(String rate)
    {
        this.rate=rate;
    }
    public String getRate()
    {
        return rate;
    }

}
