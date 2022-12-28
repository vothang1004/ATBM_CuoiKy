package ego.wear.signature;

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

    public void inintialize() {
        this.p = BigInteger.probablePrime(VERSION / 2, new Random());
        this.q = BigInteger.probablePrime(VERSION / 2, new Random());

        this.n = p.multiply(q);
        this.phiN = p.subtract(BigInteger.ONE).multiply(q.subtract(BigInteger.ONE));
        this.d = E.modInverse(phiN);
    }

    public BigInteger encrypt(BigInteger message, BigInteger partnerN) {
        return message.modPow(E, partnerN);
    }

    public BigInteger decrypt(BigInteger cipher) {
        return cipher.modPow(d, n);
    }

    public static void main(String[] args) {
        RSA person1 = new RSA();
        RSA person2 = new RSA();

        person1.inintialize();
        person2.inintialize();

        String message = "Tối mai hẹn ở bãi đất trống lúc 23h";
        BigInteger cipherText = person1.encrypt(new BigInteger(message.getBytes()), person2.getN());
        BigInteger plainText = person2.decrypt(cipherText);
        String messageDecrypt = new String(plainText.toByteArray());

        System.out.println("message => " + messageDecrypt);
    }
}
