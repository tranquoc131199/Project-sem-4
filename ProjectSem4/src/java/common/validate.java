/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package common;

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

}
