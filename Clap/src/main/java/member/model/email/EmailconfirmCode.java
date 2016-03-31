package member.model.email;

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
		ee.generateEmailCfmCode("XXX@yahoo.com.tw");

	}

	public String generateEmailCfmCode(String email) {
		System.out.println("Start generating Confirm code");
		String confirmCode = email + inputCode;
		System.out.println("generated confirmcode: " + confirmCode);
		return confirmCode;
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
