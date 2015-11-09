package UbuntuPackage;

public class TestOverride {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Teacher teacher = new Teacher();
		teacher.setName("zhangsan");
		teacher.displayName();
	}

}


class Person{
	private String name;
	public void setName(String n){
		name = n;
	}
	public String getName(){
		return name;
	}
	public void displayName(){
		System.out.println(name);
	}
}
class Teacher extends Person{
	//No.1
	//开始写代码。需求：覆盖父类的displayName()方法，打印“name老师”的字符串
	public void displayName(){
		System.out.println("name老师");
	}
	
	//end_code
}
