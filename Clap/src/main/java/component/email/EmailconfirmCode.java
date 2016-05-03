package component.email;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import member.model.MemberService;

public class EmailconfirmCode {
	private String inputCode = "99999989"; // fixed prime number

	public String getInputCode() {
		return inputCode;
	}

	public void setInputCode(String inputCode) {
		this.inputCode = inputCode;
	}

	public static void main(String[] args) {
		// EmailconfirmCode ee = new EmailconfirmCode();
		// 
	}

	public String generateCheckingCode(String email, String randomString) {
		
		String confirmCode = email + inputCode + randomString; // combine a string for digester
		try {
			// apply SHA-512 than to String (128 chars)
			byte[] confirmCodeByte = MessageDigest.getInstance("SHA-512").digest(confirmCode.getBytes());
			confirmCode = String.format("%0128x", new BigInteger(1, confirmCodeByte));
			// apply MD5 than to String (32 chars)
			confirmCodeByte = MessageDigest.getInstance("MD5").digest(confirmCode.getBytes());
			confirmCode = String.format("%02x", new BigInteger(1, confirmCodeByte));
		} catch (NoSuchAlgorithmException e) {
			return null;
		}
		
		
		return randomString + confirmCode; //return 15 random chars and 32 chars from MD5

	}

	public String generateEmailCfmCode(String email) {
		
		String randomString = getRandomString(15);
		String confirmCode = email + inputCode + randomString;
		try {
			// apply SHA-512 than to String (128 chars)
			byte[] confirmCodeByte = MessageDigest.getInstance("SHA-512").digest(confirmCode.getBytes());
			confirmCode = String.format("%0128x", new BigInteger(1, confirmCodeByte));
			// apply MD5 than to String (32 chars)
			confirmCodeByte = MessageDigest.getInstance("MD5").digest(confirmCode.getBytes());
			confirmCode = String.format("%02x", new BigInteger(1, confirmCodeByte));
		} catch (NoSuchAlgorithmException e) {
			return null;
		}
		
		
		return randomString + confirmCode; //return 15 random chars and 32 chars from MD5
	}

	private String getRandomString(int textLength) {
		
		// generate hex string
		String randomString = "";
		for (int index = 0; index < textLength; index++) {
			int temp = (int) (Math.random() * 16 + 48);
			char c = (char) ((temp > 57) ? temp + 39 : temp);
			randomString += c;

		}

		return randomString;
	}

	private String generatePrimeNumber(long gettingNumberUpperInput) {
		
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
		

		return Long.toString(gettingNumber);
	}

}
