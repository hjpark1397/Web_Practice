package notice;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import bbs.Bbs;

public class NoticeDAO {
	//bbs�� ���������� �۵��Ѵ�.
	
	private Connection conn;
	private ResultSet rs;
	
	public NoticeDAO() {
		
		//mysql ������ �����ϴ� �κ�
		try {
			
			String dbURL = "jdbc:mysql://localhost:3306/BBS?serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "test1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			
		}	catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// �ð��� �������� �Լ�
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "";//
	}
	
	//noticeID �Խñ� ��ȣ �������� �Լ�
	
	public int getNext() {
		String SQL = "SELECT noticeID FROM BBS ORDER BY noticeID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1;//ù ��° �Խù��� ���
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return -1; //DB ����
		
	}
	
	//������ ���� �ۼ��ϴ� �Լ�
	public int write(String noticeTitle, String userID, String noticeContent) {
		
		String SQL = "INSERT INTO BBS VALUES(?,?,?,?,?,?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, noticeTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, noticeContent);
			pstmt.setInt(6, 1);
			
			return pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return -1;
	}
	
	//���� ����� �������� �κ�
	//noticeDAO.java�� ����Ʈ�� ��� ��ȯ���ִ� ArrayList<notice>�Լ� ����
	
	public ArrayList<Notice> getList(int pageNumber){
		
		String SQL = "SELECT * FROM BBS WHERE noticeID <? noticeAvailavle = 1 ORDER BY noticeID DESC LIMIT 10";
		ArrayList<Notice> list = new ArrayList<Notice>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext()-(pageNumber-1)*10);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Notice notice = new Notice();
				notice.setNoticeID(rs.getInt(1));
				notice.setNoticeTitle(rs.getString(2));
				notice.setUserID(rs.getString(3));
				notice.setNoticeDate(rs.getString(4));
				notice.setNoticeContent(rs.getString(5));
				notice.setNoticeAvailable(rs.getInt(6));
				list.add(notice);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	//10 ���� ����¡ ó���� ���� �Լ�
		public boolean nextPage (int pageNumber) {
			String SQL = "SELECT * FROM BBS WHERE bbsID < ? noticeAvailable = 1 ORDER BY noticeID DESC LIMIT 10";
			ArrayList<Notice> list = new ArrayList<Notice>();
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					return true;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return false; 		
		}
		
		//�� ���� �ҷ����� �Լ� �߰�
		public Notice getNotice(int noticeID) {
			String SQL = "SELECT * FROM BBS WHERE noticeID = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, noticeID);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					Notice notice = new Notice();
					notice.setNoticeID(rs.getInt(1));
					notice.setNoticeTitle(rs.getString(2));
					notice.setUserID(rs.getString(3));
					notice.setNoticeDate(rs.getString(4));
					notice.setNoticeContent(rs.getString(5));
					notice.setNoticeAvailable(rs.getInt(6));

					return notice;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;

		}
		
		//������ ���� ������Ʈ �ϴ� �Լ�
		public int update(int bbsID, String bbsTitle, String bbsContent) {
				String SQL = "UPDATE BBS SET bbsTitle = ?, bbsContent = ? WHERE bbsID = ?";
				try {
					PreparedStatement pstmt = conn.prepareStatement(SQL);
					pstmt.setString(1, bbsTitle);
					pstmt.setString(2, bbsContent);
					pstmt.setInt(3, bbsID);
					return pstmt.executeUpdate();
				} catch (Exception e) {
					e.printStackTrace();
				}
				return -1; // �����ͺ��̽� ����
			}
		
		//���� �Լ�
		public int delete(int bbsID) {
			String SQL = "UPDATE BBS SET bbsAvailable = 0 WHERE bbsID = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);   
				pstmt.setInt(1, bbsID);
				return pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			}
			return -1; // �����ͺ��̽� ����
		}

	
	

}
