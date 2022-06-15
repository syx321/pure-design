package com.qingge.springboot.utils;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;


public class MultiToBase64 {
    public String getBase64String(MultipartFile multiPartFile) throws IOException {
        String baseStr = null;
        Base64 encoder = new Base64();
        baseStr= encoder.encodeToString(multiPartFile.getBytes());
        baseStr = baseStr.replaceAll("\r\n", "");
        return baseStr;
    }
//    public MultipartFile getMultiPartFile(String baseStr) throws IOException {
//        Base64 decoder = new Base64();
//        byte[] bytes = Base64.decodeBase64(baseStr);
//        for (int i = 0; i < bytes.length; ++i) {
//            if (bytes[i] < 0) {
//                bytes[i] += 256;
//            }
//        }
//
//        return null;
//    }

}
