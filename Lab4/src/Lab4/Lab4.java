package Lab4;
//201704013 박현주

import java.sql.Timestamp;
//시간표시를 위해 추가한다!

public class Lab4 {
	private String order_num = "2019_0001";//주문번호 저장해놓음
	private String coffee;//커피이름
	private String option;//선택
	private String size;//사이즈
	private Timestamp date;//날짜
	
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
