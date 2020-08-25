/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package common;

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

}
