
public class TestThis {
	private int number;
	//No.1
		//开始写代码。需求：定义一个create()方法，让number加1且返回当前对象
		public TestThis create(){
			number++;
			return this;
		} 
		//end_code
	public void setNumber(int number){
		this.number = number;
	}
	public int getNumber(){
		return this.number;
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		TestThis tt = new TestThis();
		tt.thisTest();
		System.out.println(tt.create().create().create().create().getNumber());
		tt.thisTest();
	}
	//No.2
		//开始写代码。需求：定义一个thisTest()方法，没有返回值，在方法里创建一个Test对象，并且调用test()方法，传入当前对象作为参数
	public void thisTest(){
		Test t = new Test();
		t.test(this);  //notice this code"this",display tt;
	}
		//end_code

}
class Test{
	public void test(TestThis tt){
		System.out.println(tt.getNumber());
	}
}
