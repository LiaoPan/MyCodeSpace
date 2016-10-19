import java.util.Scanner;

/**
 * Created by reallocing on 16-10-19.
 *
 *描述
 求两个整数A+B的和

 输入
 输入包含多组数据。
 每组数据包含两个整数A(1 ≤ A ≤ 100)和B(1 ≤ B ≤ 100)。

 输出
 对于每组数据输出A+B的和。
 *
 */
public class AplusB {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        while(in.hasNext()){
            int a = in.nextInt();
            int b = in.nextInt();
            System.out.println(a+b);
        }
    }
}
