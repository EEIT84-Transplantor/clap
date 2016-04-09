package test.unittest;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionSupport;

public class AccountAction extends ActionSupport {

	private static final long serialVersionUID = 1L;

	private static final Logger logger = Logger.getLogger(AccountAction.class.getName());

	private Account accountBean;

	public String execute() {
		return SUCCESS;

	}

	public void validate() {

		logger.debug("In method validate. accountBean's state is " + accountBean);

		if (accountBean.getUserName().length() == 0) {

			addFieldError("accountBean.userName", "User name is required.");

		}

		if (accountBean.getUserName().length() < 5) {

			addFieldError("accountBean.userName", "User name must be at least 5 characters long.");

		}

		if (accountBean.getUserName().length() > 10) {

			addFieldError("accountBean.userName", "User name cannot be at more than 10 characters long.");

		}

	}

	public Account getAccountBean() {
		return accountBean;
	}

	public void setAccountBean(Account accountBean) {
		this.accountBean = accountBean;
	}

}