package math;

/**
 * ���ַ�������������
 * @author Administrator
 *
 */
public class ErFenQeury {

	/**
	 * ����ָ����С������
	 * @param k
	 * @return
	 */
	public int[] createArray(int k) {
		int[] sortArray=new int[k];
		for(int i=1;i<=sortArray.length;i++) {
			sortArray[i-1]=i;
		}
		return sortArray;
	}
	
	/**
	 * ���ַ�����ָ�����֣�����С����
	 * @param guessNumber
	 * @return
	 */
	public double QeuryNumber(int length,double guessNumber) {
		int[] array=this.createArray(length);
		double head=0;
		double end=array.length;
		double mid=0;
		int i=0;
		while(head<=end) {
			mid=(head+end)/2;
			if(mid>guessNumber) {
				end=mid;
				System.out.println("end="+end);
			}else if(mid<guessNumber) {
				head=mid;
				System.out.println("head="+head);
			}else if(mid==guessNumber) {
				System.out.println("��Ҫ�ҵ������ǣ�"+mid+",����"+i+"��");
			}
			i++;
			if(mid==guessNumber) {
				break;
			}
		}
		
		return mid;

	}
	
	/**
	 * �����������
	 * @param geuss
	 * @return
	 */
	public int getIntNumber(int length,int geuss) {
		int []  array=this.createArray(length);
		int head=0;//�������еĵ�һ������
		int end=array.length;//�������еĽ�β����
		int mid=0;//�м���
		/**
		 * ����µ�������7
		 * ��1�� head=0  end=10 mid=5
		 * ��2�� 7>5 head=5+1=6 end=10 mid=8
		 * ��3�� 7<8 head=6 end=10-1=9 mid=15/2=7
		 */
		int i=0;//������	
		while(head<end) {
			
			mid=(head+end)/2;
			int item=array[mid];
			System.out.println("��"+(i+1)+"�Σ�"+"mid="+mid);
			if(geuss<mid) {
				end=mid-1;
				i++;
				System.out.println(geuss+"<"+mid+",head="+head+",end="+end);
			}
			if(geuss>mid) {
				head=mid+1;
				i++;
				System.out.println(geuss+">"+mid+",head="+head+",end="+end);
			}
			if(item==geuss) {
				System.out.println(geuss+">"+mid+",head="+head+",end="+end+",item="+item);
				System.out.println("��Ҫ�ҵ�������:"+array[mid]+",����������λ���ǣ�"+mid);
				return item;
			}
			
		}
		
		return mid;
	}
	
	
	
	
}
