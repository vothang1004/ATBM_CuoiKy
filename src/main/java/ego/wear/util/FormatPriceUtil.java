package ego.wear.util;

public class FormatPriceUtil {
	public static String formatPrice(int price) {
		StringBuilder sb = new StringBuilder();
		int count = 0;
		String priceString = price + "";
		char[] arrChar = priceString.trim().toCharArray();
		for(int i = arrChar.length - 1; i >= 0; i--) {
			if(count == 2 && i > 0) {
				sb.append(arrChar[i] + ".");
				count = -1;
			}else {
				sb.append(arrChar[i]);
			}
			count++;
		}
		arrChar = sb.toString().toCharArray();
		String result = "";
		for(int i = arrChar.length - 1; i >= 0; i--) {
			result += arrChar[i];
		}
		return result;
	}
	public static void main(String[] args) {
		int price = 108800;
		String result = FormatPriceUtil.formatPrice(price);
		System.out.println(result);
	}
}
