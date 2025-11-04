package com.example.demo.login;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.member.MemberDto;

@Mapper
public interface LoginMapper {
	public MemberDto loginOk(MemberDto mdto);
	public String getUserid(MemberDto mdto);
	public String getPwd(MemberDto mdto);
	public void chgPwd(String userid, String pwd, String oldPwd);
}
