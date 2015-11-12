import java.math.BigDecimal;
public class TestPre {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println(0.05+0.01);
		System.out.println((0.05*100+0.01*100)/100);
		//No.1
		//开始写代码。需求：精确计算0.05+0.01的值
		BigDecimal bd1 = new BigDecimal(0.05);
		BigDecimal bd2 = new BigDecimal(0.01);
		System.out.println(bd1.add(bd2));
		//end_code
	}

}
