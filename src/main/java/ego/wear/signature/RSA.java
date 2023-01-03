package ego.wear.signature;

import java.security.InvalidKeyException;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

public class RSA {
	private PublicKey publicKey;
	private PrivateKey privateKey;

	public void initialize() throws NoSuchAlgorithmException {
		// Generate a 1024-bit RSA key pair
		KeyPairGenerator keyGen = KeyPairGenerator.getInstance("RSA");
		keyGen.initialize(1024);
		KeyPair keyPair = keyGen.generateKeyPair();
		this.publicKey = keyPair.getPublic();
		this.privateKey = keyPair.getPrivate();
	}

	public static String encryptByPrivateKey(String plainText, PrivateKey privateKey) throws NoSuchAlgorithmException,
			NoSuchPaddingException, InvalidKeyException, IllegalBlockSizeException, BadPaddingException {
		Cipher cipher = Cipher.getInstance("RSA");
		cipher.init(Cipher.ENCRYPT_MODE, privateKey);
		byte[] encryptedBytes = cipher.doFinal(plainText.getBytes());
		String encryptedString = Base64.getEncoder().encodeToString(encryptedBytes);
		return encryptedString;
	}
	public static String decryptByPublicKey(String cipherText, PublicKey publicKey) throws NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, IllegalBlockSizeException, BadPaddingException {
		byte[] cipherBytes = Base64.getDecoder().decode(cipherText);
		Cipher cipher = Cipher.getInstance("RSA");
		cipher.init(Cipher.DECRYPT_MODE, publicKey);
		 byte[] plainBytes = cipher.doFinal(cipherBytes);
		 String plainText = new String(plainBytes);
		return plainText;
	}
	public String getPrivateKey() {
		String privateKeyString = Base64.getEncoder().encodeToString(this.privateKey.getEncoded());
		return privateKeyString;
	}
	public String getPublicKey() {
		String publicKeyString = Base64.getEncoder().encodeToString(this.publicKey.getEncoded());
		return publicKeyString;
	}
	public static PublicKey getAsPublicKey(String publicKeyString) throws NoSuchAlgorithmException, InvalidKeySpecException {
		byte[] keyBytes = Base64.getDecoder().decode(publicKeyString);
		X509EncodedKeySpec keySpec = new X509EncodedKeySpec(keyBytes);
		KeyFactory keyFactory = KeyFactory.getInstance("RSA");
		PublicKey publicKey = keyFactory.generatePublic(keySpec);
		return publicKey;
	}
	public static PrivateKey getAsPrivateKey(String privateKeyString) throws NoSuchAlgorithmException, InvalidKeySpecException {
		byte[] privateKeyBytes = Base64.getDecoder().decode(privateKeyString);
		PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(privateKeyBytes);
		KeyFactory keyFactory = KeyFactory.getInstance("RSA");
		PrivateKey privateKey = keyFactory.generatePrivate(keySpec);
		return privateKey;
	}

	public static void main(String[] args) throws NoSuchAlgorithmException, InvalidKeyException, NoSuchPaddingException, IllegalBlockSizeException, BadPaddingException, InvalidKeySpecException {
		String plainText = "123";
		RSA rsa = new RSA();
		rsa.initialize();
		
		String encryptedString = rsa.encryptByPrivateKey(plainText, rsa.getAsPrivateKey(rsa.getPrivateKey()));
		System.out.println("encrypted => " + encryptedString);
		String decryptedString = rsa.decryptByPublicKey(encryptedString, rsa.getAsPublicKey(rsa.getPublicKey()));
		System.out.println("decrypted => " + decryptedString);
		
	}
}
