package model;

import java.util.List;
import java.util.Map;

public class MyRunnable implements Runnable {

    public List<Map<String, Object>> list;

    public List<Map<String, Object>> listNoValue;

    public MyRunnable(List<Map<String, Object>> list, List<Map<String, Object>> listNoValue) {
        this.list = list;
        this.listNoValue = listNoValue;
    }

    public List<Map<String, Object>> getList() {
        return list;
    }

    public void setList(List<Map<String, Object>> list) {
        this.list = list;
    }

    @Override
    public void run() {

    }
}
