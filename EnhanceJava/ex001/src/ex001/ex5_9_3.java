package ex001;

public class ex5_9_3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String number1 = "13071128212";
		String number2 = "13111133311111";
		String regex = "1[35]\\d{9}";
		if(number1.matches(regex)){
			System.out.printf("%s is a phone number.",number1);
		}else{
			System.out.printf("%s is not a phone number.",number1);
		}
		System.out.println();
		if(number2.matches(regex)){
			System.out.printf("%s is a phone number.",number2);
		}else{
			System.out.printf("%s is not a phone number.",number2);
		}
	}

}
