package kr.co.bapsi.member.service;

import java.util.List;

import javax.validation.Valid;

import kr.co.bapsi.member.vo.FindCriteria;
import kr.co.bapsi.member.vo.MemberVO;
import kr.co.bapsi.member.vo.PageCriteria;
import kr.co.bapsi.upload.vo.UploadVO;

public interface MemberService {

//*******************회원가입 **************************

   // 회원가입
   public void join(MemberVO member) throws Exception;

   // 이메일 중복 체크
   public int checkEmail(String email) throws Exception;

   // 닉네임 중복 체크
   public int checkNickname(String nickname) throws Exception;

//****************************************************

//*******************마이페이지*******************************

   // 마이페이지
   public MemberVO myPage(int no) throws Exception;
   
   //로그인 마이페이지(로그인 api 마이페이지+ 기존 회원 마이페이지)
   public MemberVO loginMyPage(String email) throws Exception;

   // 마이페이지 파일(로그인 api 파일+ 기존 회원 파일)
   public UploadVO myPagefile(int userNo) throws Exception;

   // 회원정보 수정
   public void update(MemberVO member) throws Exception;

   // 회원탈퇴
   public void selfDelete(int no) throws Exception;
   
   // 회원탈퇴때 프로필 삭제
   public void profileDelete(int userNo) throws Exception;

//********************************************************

//*****************회원목록(관리자) 관련 메소드****************

   // 관리자: 회원정보 상세보기
   public MemberVO detailMember(int no);
   
   // 관리자: 회원프로필 보기
   public UploadVO detailProfile(int no);
   
   // 관리자 : 회원 수정
   public void memberUpdate(MemberVO member) throws Exception;

   // 관리자: 회원삭제
   public void deleteMember(int no);
   
   // 관리자 : 회원탈퇴할때 사진도 같이 삭제
   public void deleteMemberProfile(int no);
   
   // 관리자: 검색 구현
   public List<MemberVO> listFind(FindCriteria findCri) throws Exception;

   // 관리자: 검색구현
   public int findCountData(FindCriteria findCri) throws Exception;

//******************************************************   

//*****************관리자 페이징 ****************************

   // 관리자: 페이징
   public List<MemberVO> pagingCriteria(PageCriteria pCri) throws Exception;

   // 관리자: 페이징 전체 수 가져오는 service
   public int pagingCountData(PageCriteria pcri) throws Exception;

//**************************************************   

 //*************************로그인 서비스********************
   // 로그인
   public MemberVO loginCheck(MemberVO member) throws Exception;
   //네이버 API 로그인 멤버 정보 조회
   public MemberVO apiMemSelect(String email) throws Exception;
   // 네이버 회원정보 Insert
   public void naverInsert(MemberVO mvo);
   
   //카카오 API 로그인 멤버정보 조회
   public MemberVO kakaoSelect(String email) throws Exception;
   //카카오 API 회원정보 Insert
   public void kakaoInsert(MemberVO mvo) throws Exception;

//******************************************************      
   // ************************체크박스******************************
   // public void checkUp(MemberVO memberVO)throws Exception;
   public void checkUp(@Valid MemberVO memberVO) throws Exception;

   public void checkDown(@Valid MemberVO memberVO) throws Exception;

   public void checkDelete(@Valid MemberVO memberVO) throws Exception;

   // ******************************************************
   // *****************비밀번호 찾기*************************************
   public void newPassword(MemberVO memberVO) throws Exception;
   public MemberVO comparePassword(MemberVO memberVO) throws Exception;
   // *****************구글 로그인************************************
   public int  checkGoogleLogin(MemberVO memberVO) throws Exception;
   public void joinGoogle(MemberVO memberVO) throws Exception;
   public MemberVO googleSelect(String email) throws Exception;
	// ***************** 비밀번호 변경***********************************
	public void changePassword(MemberVO memberVO) throws Exception;
	// ***************** 비밀번호 변경***********************************

	//*****************마이페이지 레시피 프로필 ****************************
	public List<MemberVO> recipeProfile(int no) throws Exception;
	
	//***************************************************************
	
	
}