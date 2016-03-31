package member.model.email;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import member.model.MemberService;

public class EmailconfirmCode {
	private String inputCode = "99999989";

	public String getInputCode() {
		return inputCode;
	}

	public void setInputCode(String inputCode) {
		this.inputCode = inputCode;
	}

	public static void main(String[] args) {

		EmailconfirmCode ee = new EmailconfirmCode();
		System.out.println(ee.generateEmailCfmCode("abc@yahoo.com.tw"));

		
	}
	public String generateCheckingCode(String email, String randomString) {
		System.out.println("Start checking Confirm code");
		String confirmCode = email + inputCode + randomString;
		try {
			byte[] confirmCodeByte = MessageDigest.getInstance("SHA-512").digest(confirmCode.getBytes());
			confirmCode = String.format("%0128x", new BigInteger(1, confirmCodeByte));
			confirmCodeByte = MessageDigest.getInstance("MD5").digest(confirmCode.getBytes());
			confirmCode = String.format("%02x", new BigInteger(1, confirmCodeByte));
		} catch (NoSuchAlgorithmException e) {
			return null;
		}
		System.out.println(randomString+"/"+confirmCode);
		System.out.println("generated confirmcode: " + confirmCode + " (" + confirmCode.length() + ")");
		return randomString+confirmCode;
		
	}
	
	public String generateEmailCfmCode(String email) {
		System.out.println("Start generating Confirm code");
		String randomString = getRandomString(15);
		String confirmCode = email + inputCode + randomString;
		try {
			byte[] confirmCodeByte = MessageDigest.getInstance("SHA-512").digest(confirmCode.getBytes());
			confirmCode = String.format("%0128x", new BigInteger(1, confirmCodeByte));
			confirmCodeByte = MessageDigest.getInstance("MD5").digest(confirmCode.getBytes());
			confirmCode = String.format("%02x", new BigInteger(1, confirmCodeByte));
		} catch (NoSuchAlgorithmException e) {
			return null;
		}
		System.out.println(randomString+"/"+confirmCode);
		System.out.println("generated confirmcode: " + confirmCode + " (" + confirmCode.length() + ")");
		return randomString+confirmCode;
	}

	private String getRandomString(int textLength) {
		String randomString = "";
		for (int index = 0; index < textLength; index++) {
			int temp = (int) (Math.random() * 16 + 48);
			char c = (char) ((temp > 57) ? temp + 39 : temp);
			randomString += c;
			
		}

		return randomString;
	}

	private String generatePrimeNumber(long gettingNumberUpperInput) {
		System.out.println("Start generating PN");
		long gettingNumber = 2L;
		final long gettingNumberUpper = gettingNumberUpperInput;

		gettingNumber = gettingNumberUpper;

		boolean flag = true;

		while (true) {
			flag = true;
			for (long index = gettingNumber - 1; index > 2; index--) {

				if (gettingNumber % index == 0) {
					flag = false;
				}
			}
			if (flag) {
				break;
			}
			gettingNumber--;
		}
		System.out.println(gettingNumber);

		return Long.toString(gettingNumber);
	}

}
