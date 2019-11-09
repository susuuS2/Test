package DTO;

import java.sql.Timestamp;

public class JoinTableDTO {

	Integer joinNum;
	String joinName ;
	String joinSubject;
	String joinTitle;
	String joinContent;
	Integer joinReRef;
	Integer joinReLev;
	Integer joinReSeq;
	Integer joinReadcount;
	Timestamp joinDate;
	
	public Integer getJoinNum() {
		return joinNum;
	}
	public void setJoinNum(Integer joinNum) {
		this.joinNum = joinNum;
	}
	public String getJoinName() {
		return joinName;
	}
	public void setJoinName(String joinName) {
		this.joinName = joinName;
	}
	public String getJoinSubject() {
		return joinSubject;
	}
	public void setJoinSubject(String joinSubject) {
		this.joinSubject = joinSubject;
	}
	public String getJoinTitle() {
		return joinTitle;
	}
	public void setJoinTitle(String joinTitle) {
		this.joinTitle = joinTitle;
	}
	public String getJoinContent() {
		return joinContent;
	}
	public void setJoinContent(String joinContent) {
		this.joinContent = joinContent;
	}
	public Integer getJoinReRef() {
		return joinReRef;
	}
	public void setJoinReRef(Integer joinReRef) {
		this.joinReRef = joinReRef;
	}
	public Integer getJoinReLev() {
		return joinReLev;
	}
	public void setJoinReLev(Integer joinReLev) {
		this.joinReLev = joinReLev;
	}
	public Integer getJoinReSeq() {
		return joinReSeq;
	}
	public void setJoinReSeq(Integer joinReSeq) {
		this.joinReSeq = joinReSeq;
	}
	public Integer getJoinReadcount() {
		return joinReadcount;
	}
	public void setJoinReadcount(Integer joinReadcount) {
		this.joinReadcount = joinReadcount;
	}
	public Timestamp getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Timestamp joinDate) {
		this.joinDate = joinDate;
	}
	
	
}
