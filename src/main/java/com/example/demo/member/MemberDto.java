package com.example.demo.member;

import lombok.Data;

@Data
public class MemberDto {
	private int id,state;
	private String name,memberId,pwd,email,phone,writeday,oldPwd;
}
