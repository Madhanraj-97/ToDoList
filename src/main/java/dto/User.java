package dto;

public class User {
	private int UserId;
	private String UserName;
	private String UserEmail;
	private long UserContact;
	private byte[] UserImage;
	private String UserPassword;

	public int getUserId() {
		return UserId;
	}

	public void setUserId(int userId) {
		UserId = userId;
	}

	public String getUserName() {
		return UserName;
	}

	public void setUserName(String userName) {
		UserName = userName;
	}

	public String getUserEmail() {
		return UserEmail;
	}

	public void setUserEmail(String userEmail) {
		UserEmail = userEmail;
	}

	public long getUserContact() {
		return UserContact;
	}

	public void setUserContact(long userContact) {
		UserContact = userContact;
	}

	public byte[] getUserImage() {
		return UserImage;
	}

	public void setUserImage(byte[] userImage) {
		UserImage = userImage;
	}

	public String getUserPasswor() {
		return UserPassword;
	}

	public void setUserPasswor(String userPassword) {
		UserPassword = userPassword;
	}

	public User(int userId, String userName, String userEmail, long userContact, String userPassword, byte[] userImage) {
		this.UserId = userId;
		this.UserName = userName;
		this.UserEmail = userEmail;
		this.UserContact = userContact;
		this.UserImage = userImage;
		this.UserPassword = userPassword;
	}

	public User() {
		// TODO Auto-generated constructor stub
	}

}
