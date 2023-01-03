package ego.wear.signature;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Formatter;


public class Sha256 {
	public static String byteArrayToHex(byte[] a) {
		StringBuilder sb = new StringBuilder(a.length * 2);
		Formatter formatter = new Formatter(sb);
		for (byte b : a) {
			formatter.format("%02x", b);
		}
		return sb.toString();
	}
	public static String hasingSHA256(byte[] byteArray) {
		MessageDigest md;
		try {
			md = MessageDigest.getInstance("SHA-256");
			md.update(byteArray);
			byte[] hash = md.digest();

			// Convert the hash to a hex string
			String hex = Sha256.byteArrayToHex(hash);
			return hex;
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
