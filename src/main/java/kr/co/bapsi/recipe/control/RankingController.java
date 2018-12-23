package kr.co.bapsi.recipe.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bapsi.member.service.MemberService;
import kr.co.bapsi.member.vo.MemberVO;
import kr.co.bapsi.recipe.service.RecipeService;
import kr.co.bapsi.recipe.vo.RecipeVO;
import kr.co.bapsi.upload.vo.UploadVO;

@Controller
@RequestMapping("/ranking/*")
public class RankingController {

	ModelAndView mav = new ModelAndView(); // 삭제

	@Autowired
	private RecipeService recipeService;
	@Autowired
	private MemberService memberService;

	// 랭킹
	@RequestMapping(value = "/ranking/rankingMain", method = RequestMethod.GET)
	public String newRecipe(Model model) {

		// 최고 레시피
		List<RecipeVO> recipeList = recipeService.selectBestRecipe();
		model.addAttribute("recipeList", recipeList);

		// 최고 회원
		List<MemberVO> memberList = recipeService.selectBestMember();
		model.addAttribute("memberList", memberList);

		//댓글왕
		List<MemberVO> memberListComment = recipeService.selectCommentMember();
		model.addAttribute("memberListComment", memberListComment);

		//게시글 많이
		List<MemberVO> memberListRecipe = recipeService.selectRecipeMember();
		model.addAttribute("memberListRecipe", memberListRecipe);
		
		
		return "jsp/ranking/rankingMain"; // jsp/recipe/writeRecipe
	}
	
	// 유저 상세 페이지
	@RequestMapping(value = "/ranking/userPage", method = RequestMethod.GET)
	public String userPage(@RequestParam("no") int no, @ModelAttribute("userNo") int userNo, Model model) throws Exception {

		// 상세 회원 정보
		MemberVO member = memberService.detailMember(no);
		// 좋아요 받은 수
		int pointCnt = recipeService.pointCnt(no);
		// 작성 레시피 수
		int recipeCnt = recipeService.recipeCnt(no);
		// 회원 사진 가져오기
		UploadVO writerPhoto = memberService.myPagefile(no);
		// 팔로워 수
		int followingCnt = recipeService.followingCnt(no);
        // 팔로우 여부
        int followCheck = recipeService.followCheck(userNo, no);
        model.addAttribute("followCheck", followCheck);
	      
        // 사진 없으면 기본이미지
		model.addAttribute("recipeList", recipeService.userPageRecipe(no));
		if(writerPhoto != null) {
			model.addAttribute("writerPhoto", writerPhoto.getFile_fakename());
		}
		
		// 현재 회원이 작성한 게시글 리스트
		List<RecipeVO> revo = recipeService.likeRecipe(no);
		
		// 현재 회원을 팔로우 하는 사람 리스트
		List<MemberVO> followMeList = recipeService.followMe(no);
		// 현재 회원이 팔로우 하는 사람 리스트
		List<MemberVO> followSomeList = recipeService.followSome(no);
		
		
		model.addAttribute("followMeList", followMeList);
		model.addAttribute("followSomeList", followSomeList);
		model.addAttribute("likeRecipe", recipeService.likeRecipe(no));
		model.addAttribute("followingCnt",followingCnt);
		model.addAttribute("member", member);
		model.addAttribute("pointCnt", pointCnt);
		model.addAttribute("recipeCnt", recipeCnt);

		return "jsp/member/userPage"; // jsp/recipe/writeRecipe
	}

}