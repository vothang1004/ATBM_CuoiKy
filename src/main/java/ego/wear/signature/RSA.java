package ego.wear.signature;

import java.io.IOException;
import java.math.BigInteger;
import java.util.Random;

public class RSA {
    public static final int VERSION = 1024;
    public static final BigInteger E = new BigInteger("65537");

    private BigInteger p;
    private BigInteger q;
    private BigInteger n;
    private BigInteger phiN;
    private BigInteger d;

    public BigInteger getN() {
        return n;
    }
    public BigInteger getD() {
    	return d;
    }

    public void inintialize() {
        this.p = BigInteger.probablePrime(VERSION / 2, new Random());
        this.q = BigInteger.probablePrime(VERSION / 2, new Random());

        this.n = p.multiply(q);
        this.phiN = p.subtract(BigInteger.ONE).multiply(q.subtract(BigInteger.ONE));
        this.d = E.modInverse(phiN);
    }

//    public BigInteger encrypt(BigInteger message, BigInteger partnerN) {
//        return message.modPow(E, partnerN);
//    }
//
//    public BigInteger decrypt(BigInteger cipher) {
//        return cipher.modPow(d, n);
//    }
    public static BigInteger encryptByPrivateKey(BigInteger message, BigInteger privateKey, BigInteger publicKey) {
    	return message.modPow(privateKey, publicKey);
    }
    public static BigInteger decryptByPulicKey(BigInteger cipher, BigInteger publicKey) {
    	return cipher.modPow(E, publicKey);
    }

    public static void main(String[] args) throws IOException {
      String password = "123456";
      BigInteger passwordEncrypt = RSA.encryptByPrivateKey(new BigInteger(password.getBytes()),
    		  new BigInteger("66515010153352897661154225900078641302085003370376175414836988778830367413129708419595899616597300471830627649474394306480506878637313948885981846028762538154414374291049631231441201297184612651431491273681996540048312288491555408749298987916663950057028745860409483341069832715805993123373334284712362119761"),
    		  new BigInteger("84108864328553848383481216771117039341953092264496862857184759851782931796601869659162160862331891661309790928911078561083062809779533153278934017195087817904462462724784621859261288162956436390416365246317363690527303004545558075566046251016941257291188446329212830354218639815744452725201827234350012903001")
    		  );
      System.out.println(passwordEncrypt);
    }
}
