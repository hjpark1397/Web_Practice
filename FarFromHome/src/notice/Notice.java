package notice;

public class Notice { //�Խ��ǿ� DB
	private int noticeID;//�Խ��� ID
	private String noticeTitle;//�Խ��� ����
	private String userID;//�ۼ��� ���̵�
	private String noticeDate;//�ۼ� ��¥
	private String noticeContent;//�ۼ�����
	private int noticeAvailable;//������ ���� Boolean Ű
	
	public int getNoticeID() {
		return noticeID;
	}
	public void setNoticeID(int noticeID) {
		this.noticeID = noticeID;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(String noticeDate) {
		this.noticeDate = noticeDate;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public int getNoticeAvailable() {
		return noticeAvailable;
	}
	public void setNoticeAvailable(int noticeAvailable) {
		this.noticeAvailable = noticeAvailable;
	}

}
