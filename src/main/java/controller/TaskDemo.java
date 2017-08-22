package controller;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import utils.HttpUtils;

@Component
public class TaskDemo {
    public static Double KRW_CNY;
    public static Double JPY_CNY;

    @Scheduled(fixedDelay = 3600000)
    void doSomething() {
        KRW_CNY = HttpUtils.currencyExchange("KRW", "CNY");
        JPY_CNY = HttpUtils.currencyExchange("JPY", "CNY");
    }

    public static Double getKRW_CNY() {
        if (KRW_CNY == null) {
            KRW_CNY = HttpUtils.currencyExchange("KRW", "CNY");
        }
        return KRW_CNY;
    }

    public static Double getJPY_CNY() {
        if (JPY_CNY == null) {
            JPY_CNY = HttpUtils.currencyExchange("JPY", "CNY");
        }
        return JPY_CNY;
    }

}
