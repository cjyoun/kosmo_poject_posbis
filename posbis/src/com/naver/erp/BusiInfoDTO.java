package com.naver.erp;

public class BusiInfoDTO {
	
		//대표자 정보
		private int u_no;
		private String user_id;
		private String user_pwd;
		
		//사업장 정보
		private String business_no;
		private String business_name;

		private String store_tel_num;
		
		//주소정보
		private String addr_no;
		private String addr_gu;
		private String addr_dong;
		private String addr_detail;
		
		//업종정보
		private String business_type_code;
		private String business_type_name1;
		private String business_type_name2;

		//매장 운영시간
		private String business_open;
		private String business_close;
		
		
		public int getU_no() {
			return u_no;
		}
		public void setU_no(int u_no) {
			this.u_no = u_no;
		}
		public String getUser_id() {
			return user_id;
		}
		public void setUser_id(String user_id) {
			this.user_id = user_id;
		}
		public String getUser_pwd() {
			return user_pwd;
		}
		public void setUser_pwd(String user_pwd) {
			this.user_pwd = user_pwd;
		}
		public String getBusiness_no() {
			return business_no;
		}
		public void setBusiness_no(String business_no) {
			this.business_no = business_no;
		}
		public String getBusiness_name() {
			return business_name;
		}
		public void setBusiness_name(String business_name) {
			this.business_name = business_name;
		}
		public String getStore_tel_num() {
			return store_tel_num;
		}
		public void setStore_tel_num(String store_tel_num) {
			this.store_tel_num = store_tel_num;
		}
		public String getAddr_no() {
			return addr_no;
		}
		public void setAddr_no(String addr_no) {
			this.addr_no = addr_no;
		}
		public String getAddr_gu() {
			return addr_gu;
		}
		public void setAddr_gu(String addr_gu) {
			this.addr_gu = addr_gu;
		}
		public String getAddr_dong() {
			return addr_dong;
		}
		public void setAddr_dong(String addr_dong) {
			this.addr_dong = addr_dong;
		}
		public String getAddr_detail() {
			return addr_detail;
		}
		public void setAddr_detail(String addr_detail) {
			this.addr_detail = addr_detail;
		}
		public String getBusiness_type_code() {
			return business_type_code;
		}
		public void setBusiness_type_code(String business_type_code) {
			this.business_type_code = business_type_code;
		}
		public String getBusiness_type_name1() {
			return business_type_name1;
		}
		public void setBusiness_type_name1(String business_type_name1) {
			this.business_type_name1 = business_type_name1;
		}
		public String getBusiness_type_name2() {
			return business_type_name2;
		}
		public void setBusiness_type_name2(String business_type_name2) {
			this.business_type_name2 = business_type_name2;
		}
		public String getBusiness_open() {
			return business_open;
		}
		public void setBusiness_open(String business_open) {
			this.business_open = business_open;
		}
		public String getBusiness_close() {
			return business_close;
		}
		public void setBusiness_close(String business_close) {
			this.business_close = business_close;
		}

}
