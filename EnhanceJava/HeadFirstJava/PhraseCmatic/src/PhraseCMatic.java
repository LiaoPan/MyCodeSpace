/**
 * Created by reallocing on 16-10-16.
 */
public class PhraseCMatic {
    public static void main(String[] args) {
        String[] wordListOne = {"smart","sixsigma"};
        String[] wordListTwo = {"empowered","cnetric"};
        String[] wordListThree = {"process","solution"};

//        count length
        int oneLength = wordListOne.length;
        int twoLength = wordListTwo.length;
        int threeLength = wordListThree.length;

//        generate random num
        int rand1 = (int) (Math.random()*oneLength);
        int rand2 = (int) (Math.random()*twoLength);
        int rand3 = (int) (Math.random()*threeLength);

        System.out.println("Random "+rand1);
        System.out.println("Random "+rand2);
        System.out.println("Random "+rand3);
        System.out.println("Math.random() = " + Math.random());

//      generate phrase
        String phrase = wordListOne[rand1]+" "+wordListTwo[rand2]+" "+wordListThree[rand3];

        System.out.println("args = [" + phrase + "]");



    }
}
