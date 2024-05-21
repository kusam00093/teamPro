package com.catwork.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CompanyVo {
	
	private String id;
	private String pwd;
	private int    type;
	private String email;
	private String name;
	private String logo;
	private int   cnum;
	private String representative;
	private String zip_code;
	private String address;
	private String ctype;
	private String bdate;
	private String created;
	private int com_idx;
	private int user_idx;
	

	
	
}
