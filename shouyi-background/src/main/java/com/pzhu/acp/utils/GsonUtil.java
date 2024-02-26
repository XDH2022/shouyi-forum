package com.pzhu.acp.utils;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.apache.poi.ss.formula.functions.T;

import java.util.Arrays;
import java.util.List;

/**
 * @Auther: gali
 * @Date: 2022-11-21 22:47
 * @Description:
 */
public class GsonUtil {
    private static final Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();;
    /**
     * 转为json对象
     *
     * @param param
     * @return
     */
    public static String toJson(Object param) {
        if (param == null) {
            return "";
        }
        return gson.toJson(param);
    }

    /**
     * json转为普通对象
     *
     * @param param
     * @param tClass
     * @return
     */
    public static <T> T fromJson(String param, Class<T> tClass) {
        return gson.fromJson(param, tClass);
    }
    public static <T> List<T> fromJsonList(String param, Class<T[]> tClass) {
        T[] array = gson.fromJson(param, tClass);
        return Arrays.asList(array);
    }
}
