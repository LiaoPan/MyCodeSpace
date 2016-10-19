import java.util.Hashtable;

/**
 * Created by reallocing on 16-10-19.
 *
 * 用java代码计算一个字符串中第一个不重复的字符所在位置
 */
public class CharIndex {
    public static int charIndex(String text) {
        int length = 0;
        if (null == text || (length = text.length()) == 0) {
            return 0;
        }
        char currentChar;//当前字符
        char nextChar;//下一个字符
        //No.1
        //开始写代码，输入一个字符串，计算该字符串中第一个不重复的字符所在的位置，main函数已给出，实现charIndex方法
        Hashtable<Character,Integer> hashtable = new Hashtable<Character,Integer>();
        length = text.length();
        for (int i = 0; i < length; i++) {
            if(hashtable.containsKey(text.charAt(i))){
//                System.out.println("text.charAt(i) = " + text.charAt(i));
                int value = hashtable.get(text.charAt(i));
//                System.out.println("value = " + value);
                value = value + 1;
                hashtable.put(text.charAt(i),value);

            }else{
                hashtable.put(text.charAt(i),1);
            }


        }
//        System.out.println("hashtable = " + hashtable);
//         get string ascii sort
        int index =0;
        for (int i = 0; i < length; i++) {
            if(hashtable.get(text.charAt(i))==1) {
                index = i;
                break;
            }
        }
        return index;
        //end_code
    }

    public static void main(String[] args) {
        String string="16asdf421ifj6iqejfianivroq";
        System.out.println("第一个不重复的字符在字符串中第 " + charIndex(string) + " 位");
    }
}