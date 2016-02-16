package epmLogin;

public class UserMasterBean {

	private String username;
	private String password;
	private String userid;
	public boolean valid;

	public String getUserId() {
		return userid;
	}

	public void setUserId(String newUserId) {
		userid = newUserId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String newPassword) {
		password = newPassword;
	}

	public String getUsername() {
		return username;
	}

	public void setUserName(String newUsername) {
		username = newUsername;
	}

	public boolean isValid() {
		return valid;
	}

	public void setValid(boolean newValid) {
		valid = newValid;
	}
}
