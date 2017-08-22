package controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import model.MyRunnable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import utils.HttpUtils;

import java.util.*;

@Controller
@RequestMapping("/home")
public class HomeController {

//    private static final Logger logger = (Logger) LoggerFactory.getLogger(HomeController.class);

    @RequestMapping("/BTC")
    @ResponseBody
    public ModelAndView getBtc() {
//        logger.info("the first jsp pages");
        ModelAndView mv = new ModelAndView("/style-table");
        List<Map<String, Object>> list = Collections.synchronizedList(new ArrayList<Map<String, Object>>());
        List<Map<String, Object>> listNoValue = Collections.synchronizedList(new ArrayList<Map<String, Object>>());

        Thread t1 = new Thread(new MyRunnable(list, listNoValue) {
            @Override
            public void run() {
                HashMap<String, Object> map = get("http://api.huobi.com/staticmarket/ticker_btc_json.js", "火币", "ticker", "last");
                if (map.get("flag") != null) {
                    map.put("price", "暂无数据");
                    map.put("percent", "暂无数据");
                    map.put("difference", "暂无数据");
                    listNoValue.add(map);
                } else {
                    list.add(map);
                }
            }
        });
        t1.start();

        Thread t2 = new Thread(new MyRunnable(list, listNoValue) {
            @Override
            public void run() {
                HashMap<String, Object> map = get("https://www.okcoin.cn/api/v1/ticker.do?symbol=btc_cny", "okcoin", "ticker", "last");
                if (map.get("flag") != null) {
                    map.put("price", "暂无数据");
                    map.put("percent", "暂无数据");
                    map.put("difference", "暂无数据");
                    listNoValue.add(map);
                } else {
                    list.add(map);
                }
            }
        });
        t2.start();

        Thread t3 = new Thread(new MyRunnable(list, listNoValue) {
            @Override
            public void run() {
                HashMap<String, Object> map = get("https://api.bithumb.com/public/ticker/BTC", "bithumb", "data", "buy_price");
                if (map.get("flag") != null) {
                    map.put("price", "暂无数据");
                    map.put("percent", "暂无数据");
                    map.put("difference", "暂无数据");
                    listNoValue.add(map);
                } else {
                    map.put("price", HttpUtils.keepDecimal((Double) map.get("price") * TaskDemo.getKRW_CNY(), 3));
                    list.add(map);
                }
            }
        });
        t3.start();

        Thread t4 = new Thread(new MyRunnable(list, listNoValue) {
            @Override
            public void run() {
                HashMap<String, Object> map = get("https://api.bitflyer.jp/v1/ticker", "bitflyer", "ltp", null);
                if (map.get("flag") != null) {
                    map.put("price", "暂无数据");
                    map.put("percent", "暂无数据");
                    map.put("difference", "暂无数据");
                    listNoValue.add(map);
                } else {
                    map.put("price", HttpUtils.keepDecimal((Double) map.get("price") * TaskDemo.getJPY_CNY(), 3));
                    list.add(map);
                }
            }
        });
        t4.start();

        Thread t5 = new Thread(new MyRunnable(list, listNoValue) {
            @Override
            public void run() {
                HashMap<String, Object> map = get("https://data.btcchina.com/data/ticker?market=btccny", "btcChina", "ticker", "last");
                if (map.get("flag") != null) {
                    map.put("price", "暂无数据");
                    map.put("percent", "暂无数据");
                    map.put("difference", "暂无数据");
                    listNoValue.add(map);
                } else {
                    map.put("price", HttpUtils.keepDecimal((Double) map.get("price"), 3));
                    list.add(map);
                }
            }
        });
        t5.start();

        while (t1.isAlive() || t2.isAlive() || t3.isAlive() || t4.isAlive() || t5.isAlive()) {
            try {
                Thread.sleep(500);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }

        Collections.sort(list, new Comparator<Map<String, Object>>() {
            @Override
            public int compare(Map<String, Object> arg0, Map<String, Object> arg1) {
                Double d1 = Double.parseDouble(arg0.get("price").toString());
                Double d2 = Double.parseDouble(arg1.get("price").toString());
                return d1 > d2 ? 1 : -1;
            }
        });

        if (!list.isEmpty()) {
            Double price = (Double) list.get(0).get("price");
            for (Map map : list) {
                Double difference = (Double)map.get("price") - price;
                map.put("percent", (HttpUtils.keepDecimal((difference/price) * 100, 3) + "%"));
                map.put("difference", HttpUtils.keepDecimal(difference, 3));
            }
        }

        System.out.println(list);
        mv.addObject("list", list);
        mv.addObject("listNoValue", listNoValue);
        mv.addObject("name", "BTC");
        return mv;
    }

    @RequestMapping("/LTC")
    @ResponseBody
    public ModelAndView getLtc() {
//        logger.info("the first jsp pages");
        ModelAndView mv = new ModelAndView("/style-table");
        List<Map<String, Object>> list = Collections.synchronizedList(new ArrayList<Map<String, Object>>());
        List<Map<String, Object>> listNoValue = Collections.synchronizedList(new ArrayList<Map<String, Object>>());

        Thread t1 = new Thread(new MyRunnable(list, listNoValue) {
            @Override
            public void run() {
                Map<String, Object> map = get("http://api.huobi.com/staticmarket/ticker_ltc_json.js", "火币", "ticker", "last");
                if (map.get("flag") != null) {
                    map.put("price", "暂无数据");
                    map.put("percent", "暂无数据");
                    map.put("difference", "暂无数据");
                    listNoValue.add(map);
                } else {
                    map.put("price", HttpUtils.keepDecimal((Double) map.get("price"), 3));
                    list.add(map);
                }
            }
        });
        t1.start();

        Thread t2 = new Thread(new MyRunnable(list, listNoValue) {
            @Override
            public void run() {
                Map<String, Object> map = get("https://www.okcoin.cn/api/v1/ticker.do?symbol=ltc_cny", "okcoin", "ticker", "last");
                if (map.get("flag") != null) {
                    map.put("price", "暂无数据");
                    map.put("percent", "暂无数据");
                    map.put("difference", "暂无数据");
                    listNoValue.add(map);
                } else {
                    list.add(map);
                }
            }
        });
        t2.start();

        Thread t3 = new Thread(new MyRunnable(list, listNoValue) {
            @Override
            public void run() {
                Map<String, Object> map = get("https://api.bithumb.com/public/ticker/LTC", "bithumb", "data", "average_price");
                if (map.get("flag") != null) {
                    map.put("price", "暂无数据");
                    map.put("percent", "暂无数据");
                    map.put("difference", "暂无数据");
                    listNoValue.add(map);
                } else {
                    map.put("price", HttpUtils.keepDecimal((Double) map.get("price") * TaskDemo.getKRW_CNY(), 3));
                    list.add(map);
                }
            }
        });
        t3.start();

        Thread t4 = new Thread(new MyRunnable(list, listNoValue) {
            @Override
            public void run() {
                HashMap<String, Object> map = get("https://data.btcchina.com/data/ticker?market=ltccny", "btcChina", "ticker", "last");
                if (map.get("flag") != null) {
                    map.put("price", "暂无数据");
                    map.put("percent", "暂无数据");
                    map.put("difference", "暂无数据");
                    listNoValue.add(map);
                } else {
                    map.put("price", HttpUtils.keepDecimal((Double) map.get("price"), 3));
                    list.add(map);
                }
            }
        });
        t4.start();

        while (t1.isAlive() || t2.isAlive() || t3.isAlive() || t4.isAlive()) {
            try {
                Thread.sleep(500);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }

        Collections.sort(list, new Comparator<Map<String, Object>>() {
                @Override
                public int compare(Map<String, Object> arg0, Map<String, Object> arg1) {
                    Double d1 = Double.parseDouble(arg0.get("price").toString());
                    Double d2 = Double.parseDouble(arg1.get("price").toString());
                    return d1 > d2 ? 1 : -1;
                }

        });

        if (!list.isEmpty()) {
            Double price = (Double) list.get(0).get("price");
            for (Map map : list) {
                Double difference = (Double)map.get("price") - price;
                map.put("percent", (HttpUtils.keepDecimal(difference/price * 100, 3) + "%"));
                map.put("difference", HttpUtils.keepDecimal(difference, 3));
            }
        }

        System.out.println(list);
        mv.addObject("list", list);
        mv.addObject("listNoValue", listNoValue);
        mv.addObject("name", "LTC");
        return mv;
    }

    @RequestMapping("/ETH")
    @ResponseBody
    public ModelAndView getETH() {
        ModelAndView mv = new ModelAndView("/style-table");
        List<Map<String, Object>> list = Collections.synchronizedList(new ArrayList<Map<String, Object>>());
        List<Map<String, Object>> listNoValue = Collections.synchronizedList(new ArrayList<Map<String, Object>>());

        Thread t1 = new Thread(new MyRunnable(list, listNoValue) {
            @Override
            public void run() {
                Map<String, Object> map = get
                        ("http://be.huobi.com/market/detail/merged?symbol=ethcny", "火币", "tick", "bid");
                if (map.get("flag") != null) {
                    map.put("price", "暂无数据");
                    map.put("percent", "暂无数据");
                    map.put("difference", "暂无数据");
                    listNoValue.add(map);
                } else {
                    map.put("price", HttpUtils.keepDecimal((Double) map.get("price"), 3));
                    list.add(map);
                }
            }
        });
        t1.start();

        Thread t2 = new Thread(new MyRunnable(list, listNoValue) {
            @Override
            public void run() {
                Map<String, Object> map = get
                        ("https://www.okcoin.cn/api/v1/ticker.do?symbol=eth_cny", "okcoin", "ticker", "last");
                if (map.get("flag") != null) {
                    map.put("price", "暂无数据");
                    map.put("percent", "暂无数据");
                    map.put("difference", "暂无数据");
                    listNoValue.add(map);
                } else {
                    map.put("price", HttpUtils.keepDecimal((Double) map.get("price"), 3));
                    list.add(map);
                }
            }
        });
        t2.start();

        Thread t3 = new Thread(new MyRunnable(list, listNoValue) {
            @Override
            public void run() {
                Map<String, Object> map = get(
                                "https://api.bithumb.com/public/ticker/ETH", "bithumb", "data", "average_price");
                    if (map.get("flag") != null) {
                    map.put("price", "暂无数据");
                    map.put("percent", "暂无数据");
                    map.put("difference", "暂无数据");
                    listNoValue.add(map);
                } else {
                    map.put("price", HttpUtils.keepDecimal((Double) map.get("price") *
                            TaskDemo.getKRW_CNY(), 3));
                    list.add(map);
                }
            }
        });
        t3.start();

        Thread t4 = new Thread(new MyRunnable(list, listNoValue) {
            @Override
            public void run() {
                HashMap<String, Object> map = get("https://plus-api.btcchina.com/market/ticker?symbol=ethcny", "btcChina", "ticker", "Last");
                if (map.get("flag") != null) {
                    map.put("price", "暂无数据");
                    map.put("percent", "暂无数据");
                    map.put("difference", "暂无数据");
                    listNoValue.add(map);
                } else {
                    map.put("price", HttpUtils.keepDecimal((Double) map.get("price"), 3));
                    list.add(map);
                }
            }
        });
        t4.start();

        while (t1.isAlive() || t2.isAlive() || t3.isAlive() || t4.isAlive()) {
            try {
                Thread.sleep(500);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }

        Collections.sort(list, new Comparator<Map<String, Object>>() {
            @Override
            public int compare(Map<String, Object> arg0, Map<String, Object> arg1) {
                Double d1 = Double.parseDouble(arg0.get("price").toString());
                Double d2 = Double.parseDouble(arg1.get("price").toString());
                return d1 > d2 ? 1 : -1;
            }

        });

        if (!list.isEmpty()) {
            Double price = (Double) list.get(0).get("price");
            for (Map map : list) {
                Double difference = (Double)map.get("price") - price;
                map.put("percent", (HttpUtils.keepDecimal(difference/price * 100, 3) + "%"));
                map.put("difference", HttpUtils.keepDecimal(difference, 3));
            }
        }

        System.out.println(list);
        mv.addObject("list", list);
        mv.addObject("listNoValue", listNoValue);
        mv.addObject("name", "ETH");
        return mv;
    }

    public HashMap<String, Object> get(String url, String name, String param1, String param2) {
        JSONObject json = HttpUtils.get(url);
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("name", name);
        String str;
        if (json == null) {
            map.put("flag", "1");
            return map;
        }

        if (param2 != null) {
            str = (JSON.parseObject(json.getString(param1)).getString(param2)).split(",")[0].replace("[", "");
        } else {
            str = json.getString(param1);
        }
        map.put("price", HttpUtils.keepDecimal(str, 3));
        return map;
    }
}
