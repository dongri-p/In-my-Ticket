package com.example.demo.member;

import lombok.Data;

@Data
public class MemberDto {
	private int id,state;
	private String name,userid,pwd,email,phone,writeday,oldPwd;
}
