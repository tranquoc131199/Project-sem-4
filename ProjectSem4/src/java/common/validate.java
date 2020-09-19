/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package common;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author Acer Nitro 5
 */
public class validate {

    // Kiểm tra chuỗi là null hoặc rỗng
    public static boolean isEmpty(String data) {
        boolean check = false;

        if (data == null || data.isEmpty()) {
            check = true;
        }

        return check;
    }

    // Kiểm tra độ dài ký tự tối đa khi nhập chuỗi có thoả mãn
    public static boolean checkMaxLenght(String data, int valueMax) {
        boolean check = false;

        if (data != null) {
            if (data.length() <= valueMax) {
                check = true;
            }
        } else {
            check = true;
        }

        return check;
    }

    // Kiểm tra có phải là email hay không ?
    public static boolean isMail(String email) {
        boolean check = false;

        if (email != null) {
            String emailPattern = "^[a-zA-Z][a-zA-Z0-9_\\.]{2,32}@[a-z0-9]{2,}(\\.[a-z0-9]{2,4}){1,2}$";
            Pattern p = Pattern.compile(emailPattern);
            Matcher m = p.matcher(email);
            check = m.matches();
        }

        return check;
    }

    // Kiểm tra có phải là số điện thoại
    public static boolean isPhoneNumber(String phone) {
        boolean check = false;

        if (phone != null) {
            String emailPattern = "^[0][1-9][0-9]{8}$";
            Pattern p = Pattern.compile(emailPattern);
            Matcher m = p.matcher(phone);
            check = m.matches();
        }

        return check;
    }

    //convert String sang int
    public static int convertStringToInt(String data, int defaultValue) {
        defaultValue = Integer.parseInt(data);

        return defaultValue;
    }

    /**
     * Sinh ra 1 chuỗi sử dụng cho việc đặt tên file ảnh hoặc các trường String
     * mà có giá trị unique trong hệ thống Cách làm: nối tên của bảng cần đặt
     * tên với ngày giờ hiện tại kiểu long
     *
     * @param tableName
     * @return
     */
    public static String generateNameTypeB(String tableName) {
        long millis = System.currentTimeMillis();
        return tableName + String.valueOf(millis);
    }

    /**
     * Kiểm tra đuôi mở rộng của file có nằm trong danh sách cho phép hay không
     *
     * @param extension
     * @return
     */
    public static Boolean isValidImage(String extension) {
        String[] valid = {"jpg", "jpeg", "png","JPG","JPEG","PNG"};

        return Arrays.asList(valid).contains(extension);
    }

    // Chuyển đổi dữ liệu từ giá trị String sang kiểu Int
    public static double convertStringToDouble(String data, double defaultValue) {
        try {
            defaultValue = Double.parseDouble(data);
            return defaultValue;
        } catch (NumberFormatException ex) {

            ex.getMessage();
            return defaultValue;
        }
    }
    
    public static String encryptPassword(String password) {
        String result = "";
        MessageDigest digest;

        try {
            digest = MessageDigest.getInstance("MD5");
            digest.update(password.getBytes());
            BigInteger bigInteger = new BigInteger(1, digest.digest());
            result = bigInteger.toString(16);
        } catch (NoSuchAlgorithmException e) {
            System.out.println("common.Common.md5Password()");
            e.getMessage();
        }

        return result;
    }

    public static Date convertStringToDate(String dateConvert, String format) {
        SimpleDateFormat fm = new SimpleDateFormat(format);
        Date date = new Date();

        try {
            date = fm.parse(dateConvert);
        } catch (ParseException ex) {
            System.out.println("common.Common.convertStringToDate()");
            ex.getMessage();
        }

        return date;
    }

   
}
