package com.model2.mvc.service.purchase;

import java.util.EnumSet;
import java.util.HashMap;
import java.util.Map;

public enum TranCode {
    PURCHASEABLE("�Ǹ���", "0"),
    PURCHASE_DONE("���� �Ϸ�", "1"),
    IN_DELIVERY("�����", "2"),
    DELIVERY_DONE("��� �Ϸ�", "3"),
    OUT_OF_STOCK("��� ����", "4");
    
    private String status;
    private String code;
    
    private TranCode(String status, String code) {
        this.status = status;
        this.code = code;
    }
    
    public String getStatus() {
        return this.status;
    }
    
    public String getCode() {
        return this.code;
    }
    
    private boolean containsCode(String code) {
        return status.equals(this.code);
    }
    
    private static final EnumSet<TranCode> tranCodeSet = EnumSet.allOf(TranCode.class);
    
    public static String convertCodeToStatus(String code) {
        for (TranCode t : tranCodeSet) {
            if (t.containsCode(code)) {
                return t.status;
            }
        }
        System.out.println("enum TranCode doesn't contains code: " + code);
        return "";
    }
    
    private static final Map<String, String> codeStatusDict = new HashMap<>();
    
    static {
        for (TranCode t : tranCodeSet) {
            codeStatusDict.put(t.getCode(), t.getStatus());
        }
    }
    
    public static final String getTranStatus(String code) {
        if (codeStatusDict.containsKey(code)) {
            return codeStatusDict.get(code);
        }
        throw new IllegalArgumentException("No such code");
    }
}
