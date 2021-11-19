package bean;

import java.io.Serializable;

public class CreditBean implements Serializable {
	private int user_id;
	private String credit_number;
	private String card_holder;

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getCredit_number() {
		return credit_number;
	}

	public void setCredit_number(String credit_number) {
		this.credit_number = credit_number;
	}

	public String getCard_holder() {
		return card_holder;
	}

	public void setCard_holder(String card_holder) {
		this.card_holder = card_holder;
	}

	public String getSecurity_code() {
		return security_code;
	}

	public void setSecurity_code(String security_code) {
		this.security_code = security_code;
	}

	public String getExpiration_date() {
		return expiration_date;
	}

	public void setExpiration_date(String expiration_date) {
		this.expiration_date = expiration_date;
	}

	private String security_code;
	private String expiration_date;
}
