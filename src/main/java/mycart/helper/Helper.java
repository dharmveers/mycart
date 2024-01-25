package mycart.helper;

public class Helper {
	public static String get10Words(String desc) {
		String[] strs=desc.split(" ");
		if(strs.length<10) {
			return desc;
		}else {
			String ans="";
			for(int i=0; i<10; i++) {
				ans+=strs[i]+" ";
			}
			return ans+"...";
		}
	}
}
