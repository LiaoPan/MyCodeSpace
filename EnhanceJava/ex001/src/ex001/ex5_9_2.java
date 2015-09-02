package ex001;

public class ex5_9_2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String str1 = new String("Hello,L!");
		String str2 = new String("Hello it go!");
		String substr1 = str1.substring(0,3);
		String substr2 = str2.substring(0,3);
		if(substr1.equals(substr2)){
			System.out.println("It is identical between str1 and str2.");
		}else{
			System.out.println("It is different between str1 and str2.");
		}
			
	}

}
