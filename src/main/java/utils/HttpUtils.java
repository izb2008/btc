package utils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

public class HttpUtils {
    private final static OkHttpClient client = new OkHttpClient();

    /**
     * okhttp post方法
     * @param url
     * @param body
     * @return
     */
    public static JSONObject post(String url, RequestBody body) {
        Request request = new Request.Builder()
                                .url(url)
                                .post(body)
                                .build();
        try {
            Response response = client.newCall(request).execute();
            if (response.isSuccessful()) {
                return JSON.parseObject(response.body().string());
            } else {
                throw new IOException("Unexpected code " + response);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * okhttp get方法
     * @param url
     * @return
     */
    public static JSONObject get(String url) {
        Request request = new Request.Builder().url(url).build();
        try {
            Response response = client.newCall(request).execute();
            if (response.isSuccessful()) {
                return JSON.parseObject(response.body().string());
            } else {
                throw new IOException("Unexpected code " + response);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 汇率转换
     * @param from
     * @param to
     * @return
     */
    public static Double currencyExchange(String from, String to) {
        String host = "http://jisuhuilv.market.alicloudapi.com";
        String path = "/exchange/convert";
        String method = "GET";
        String appcode = "65bb661a6cfd4fd684d97ae9b11fa67f";
        Map<String, String> headers = new HashMap<String, String>();
        //最后在header中的格式(中间是英文空格)为Authorization:APPCODE 83359fd73fe94948385f570e3c139105
        headers.put("Authorization", "APPCODE " + appcode);
        Map<String, String> querys = new HashMap<String, String>();
        querys.put("amount", "10");
        querys.put("from", from);
        querys.put("to", to);


        try {
            /**
             * 重要提示如下:
             * HttpUtils请从
             * https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/src/main/java/com/aliyun/api/gateway/demo/util/HttpUtils.java
             * 下载
             *
             * 相应的依赖请参照
             * https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/pom.xml
             */
            HttpResponse response = HttpUtilsAli.doGet(host, path, method, headers, querys);
            JSONObject json = JSON.parseObject(JSON.parseObject(EntityUtils.toString(response.getEntity())).getString("result").toString());
            return json.getDouble("rate");
            //获取response的body
            //System.out.println(EntityUtils.toString(response.getEntity()));
        } catch (Exception e) {
            e.printStackTrace();
            return 0d;
        }
    }

    /**
     * 保留double后指定位数
     * @param d
     * @param i
     * @return
     */
    public static double keepDecimal(double d, int i){
        return new BigDecimal(d).setScale(i,BigDecimal.ROUND_HALF_UP).doubleValue();
    }

    public static double keepDecimal(String str, int i){
        return keepDecimal(Double.parseDouble(str), i);
    }
}
