package Lab4;
//201704013 ������

import java.sql.Timestamp;
//�ð�ǥ�ø� ���� �߰��Ѵ�!

public class Lab4 {
	private String order_num = "2019_0001";//�ֹ���ȣ �����س���
	private String coffee;//Ŀ���̸�
	private String option;//����
	private String size;//������
	private Timestamp date;//��¥
	
	public String getOrder_num() {
		return order_num;
	}
	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}
	public String getCoffee() {
		return coffee;
	}
	public void setCoffee(String coffee) {
		this.coffee = coffee;
	}
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}

}
