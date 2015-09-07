package ex001;

import java.lang.reflect.Array;

public class directSelectSort {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//create a array with randomly order.
		int arr[] ={63,12,34,5,123,3,1,15};
		directSelectSort sorter = new directSelectSort();
		sorter.sort(arr);
		sorter.show(arr);
	}
	
	/*
	 * faster than bubble sort.
	 * Find the maximum or minimum.
	 */
	//from max to min.
	public void sort(int[] arr){
		int index;
		for(int i = 1;i<= arr.length;i++){
			 index = 0;  //maximum index.
			for(int j = 1;j <= arr.length-i;j++){
				if(arr[j]>arr[index]){
					index = j;
				}
			}
			int temp = arr[arr.length-i];
			arr[arr.length-i] = arr[index];
			arr[index] = temp;
		}
	}
	
	/*
	 * display
	 */
	public void show(int[] arr){
		for(int i:arr){
			System.out.println("the array:"+i);
		}
	}

}
