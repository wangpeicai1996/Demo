package math;


/**
 * ѡ������
 * @author Administrator
 *
 */
public class ChoiceSort {

	/**
	 * ����ָ����С�����1-10������
	 * @param k
	 * @return
	 */
	public int[] createArray(int k) {
		int[] sortArray=new int[k];
		for(int i=1;i<=sortArray.length;i++) {
			sortArray[i-1]=(int) (Math.random()*10);
			System.out.print("sortArray["+(i-1)+"]="+sortArray[i-1]+" ");
			}
		
		return sortArray;
	}
	
	
	
	public int findMin(int number) {
		int [] array=this.createArray(number);
		int min=array[0];
		int min_index=0;
		for(int i=0;i<array.length;i++) {
			if(array[i]<min) {
				min=array[i];
				min_index=i;
			}
		}
		System.out.println("��С����="+min+"����Ϊ="+min_index);
		return min;
	}
	
	
	public int[] selectSort() {
		/**
		 * ѡ���������˼�룺 ��Ҫ�����һ�����У�Ѱ����С��һ�������һ��λ�õ���������Ȼ����ʣ�µ�����������С����ڶ���λ��(ÿһ�ֱȽϵ�Ϊֹ�ǹ̶���)����������
		 * ���ѭ���������ڶ����������һ�����Ƚ�Ϊֹ��
		 * 
		 * @param args
		 */
		
			int[] a = { 3, 26, 2, 14, 1996 };
			for (int i = 1; i < a.length; i++) {
				for (int j = i; j < a.length; j++) {
					if (a[i - 1] > a[j]) {
						int temp = a[i - 1];
						a[i - 1] = a[j];
						a[j] = temp;
					}
				}
			}
			System.out.println("����������:");
			for (int i = 0; i < a.length; i++) {
				System.out.print(a[i] + " ");
			}
			return a;
	}
	
	
}
