package bbs;

public class Bbs {
		private int bbsID;//�Խ��� ID
		private String bbsTitle;//�Խ��� ����
		private String userID;//�ۼ��� ���̵�
		private String bbsDate;//�ۼ� ��¥
		private String bbsContent;//�ۼ�����
		private int bbsAvailable;//������ ���� Boolean Ű
		
		private String filename;//���� �̸�
		private int filesize;//���� ������ 
		
		
		public String getFilename() {
			return filename;
		}
		public void setFilename(String filename) {
			this.filename = filename;
		}
		public int getFilesize() {
			return filesize;
		}
		public void setFilesize(int filesize) {
			this.filesize = filesize;
		}

		public int getBbsID() {
			return bbsID;
		}
		public void setBbsID(int bbsID) {
			this.bbsID = bbsID;
		}
		public String getBbsTitle() {
			return bbsTitle;
		}
		public void setBbsTitle(String bbsTitle) {
			this.bbsTitle = bbsTitle;
		}
		public String getUserID() {
			return userID;
		}
		public void setUserID(String userID) {
			this.userID = userID;
		}
		public String getBbsDate() {
			return bbsDate;
		}
		public void setBbsDate(String bbsDate) {
			this.bbsDate = bbsDate;
		}
		public String getBbsContent() {
			return bbsContent;
		}
		public void setBbsContent(String bbsContent) {
			this.bbsContent = bbsContent;
		}
		public int getBbsAvailable() {
			return bbsAvailable;
		}
		public void setBbsAvailable(int bbsAvailable) {
			this.bbsAvailable = bbsAvailable;
		}
}
