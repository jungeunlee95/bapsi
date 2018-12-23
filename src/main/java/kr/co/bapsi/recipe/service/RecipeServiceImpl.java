package kr.co.bapsi.recipe.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bapsi.member.vo.MemberVO;
import kr.co.bapsi.recipe.dao.RecipeDAO;
import kr.co.bapsi.recipe.vo.FindCriteria;
import kr.co.bapsi.recipe.vo.FindTagCriteria;
import kr.co.bapsi.recipe.vo.IngVO;
import kr.co.bapsi.recipe.vo.RecipeVO;
import kr.co.bapsi.recipe.vo.TagVO;
import kr.co.bapsi.upload.vo.UploadVO;

@Service
public class RecipeServiceImpl implements RecipeService {

	@Autowired
	private RecipeDAO recipeDao;

	// ********************************정은부분**********************************************

	/*
	 * @Override public List<RecipeVO> listCriteria(PageCriteria pCria){ return
	 * recipeDao.listCriteria(pCria); }
	 * 
	 * @Override public int listCountData(PageCriteria pCria) { return
	 * recipeDao.countData(pCria); }
	 */
	@Override
	public List<RecipeVO> tagListCriteria(FindTagCriteria pCria) {
		return recipeDao.tagListCriteria(pCria);
	}

	@Override
	public int listCountData(FindTagCriteria pCria) {
		return recipeDao.countData(pCria);
	}

	@Override
	public void updateViewCnt(int no) {
		recipeDao.updateViewCnt(no);
	}

	@Override
	public void delete(int no) {
		recipeDao.delete(no);
	}

	// ----------------검색기능------------------------

	@Override
	public List<RecipeVO> findList(FindCriteria findCri) {
		return recipeDao.listFind(findCri);
	}

	@Override
	public int findCountData(FindCriteria findCri) {
		return recipeDao.findCountData(findCri);
	}

	// ----------------포인트------------------------
	@Override
	public int checkBoard(int userNo, int receipeNo) {
		return recipeDao.checkBoard(userNo, receipeNo);
	}

	@Override
	public int checkBoardO(int userNo, int receipeNo) {
		return recipeDao.checkBoardO(userNo, receipeNo);
	}

	@Override
	public void getRPoint(int receipeNo) {
		recipeDao.getRPoint(receipeNo);
	}

	@Override
	public void getMPoint(int receipeUserNo) {
		recipeDao.getMPoint(receipeUserNo);
	}

	@Override
	public void addLogUp(int userNo, int receipeNo, int receipeUserNo) {
		recipeDao.addLogUp(userNo, receipeNo, receipeUserNo);
	}

	@Override
	public void loseRPoint(int receipeNo) {
		recipeDao.loseRPoint(receipeNo);
	}

	@Override
	public void loseMPoint(int receipeUserNo) {
		recipeDao.loseMPoint(receipeUserNo);
	}

	@Override
	public void addLogDown(int userNo, int receipeNo, int receipeUserNo) {
		recipeDao.addLogDown(userNo, receipeNo, receipeUserNo);
	}

	@Override
	public int checkLike(int receipeNo, int userNo) {
		int checkLike = recipeDao.checkLike(receipeNo, userNo);
		return checkLike;
	}

	@Override
	public int checkDown(int receipeNo, int userNo) {
		int checkDown = recipeDao.checkDown(receipeNo, userNo);
		return checkDown;
	}

	@Override
	public void deleteLog(int userNo, int receipeUserNo, int receipeNo) {
		recipeDao.deleteLog(userNo, receipeUserNo, receipeNo);
	}

	@Override
	public void deleteLogDown(int userNo, int receipeUserNo, int receipeNo) {
		recipeDao.deleteLogDown(userNo, receipeUserNo, receipeNo);
	}
	
	//  랭킹페이지 관련
	@Override
	   public List<RecipeVO> selectBestRecipe() {
	      return recipeDao.selectBestRecipe();
	   }
	@Override
	public List<MemberVO> selectBestMember() {
		return recipeDao.selectBestMember();
	}
	@Override
	public List<MemberVO> selectCommentMember() {
		return recipeDao.selectCommentMember();
	}
	
	@Override
	public List<MemberVO> selectRecipeMember() {
		return recipeDao.selectRecipeMember();
	}
	
	@Override
	public List<MemberVO> selectBestMemberR() {
		return recipeDao.selectBestMemberR();
	}
	
	//	회원상세페이지 관련
	@Override
	public int pointCnt(int no) {
		return recipeDao.pointCnt(no);
	}
	@Override
	public int recipeCnt(int no) {
		return recipeDao.recipeCnt(no);
	}
	@Override
	public List<RecipeVO> userPageRecipe(int no) {
		return recipeDao.userPageRecipe(no);
	}
	@Override
	public List<RecipeVO> likeRecipe(int no){
		return recipeDao.likeRecipe(no);
	}
	@Override
	public int followingCnt(int no) {
		return recipeDao.followingCnt(no);
	}

	@Override
	public List<MemberVO> followMe(int no){
		return recipeDao.followMe(no);
	}

	@Override
	public List<MemberVO> followSome(int no){
		return recipeDao.followSome(no);
	}
	
	// ----------------팔로우------------------------
	@Override
	public void getFollowCnt(int receipeUserNo) {
		recipeDao.getFollowCnt(receipeUserNo);
	}

	@Override
	public void insertFollower(int userNo, int receipeUserNo) {
		recipeDao.insertFollower(userNo, receipeUserNo);
	}

	@Override
	public void loseFollowCnt(int receipeUserNo) {
		recipeDao.loseFollowCnt(receipeUserNo);
	}

	@Override
	public void deleteFollower(int userNo, int receipeUserNo) {
		recipeDao.deleteFollower(userNo, receipeUserNo);
	}


	@Override
	public int followCheck(int userNo, int receipeUserNo) {
		return recipeDao.followCheck(userNo, receipeUserNo);
	}
	
	// ---- 파일삭제 ------
	@Override
	public String deleteRecipePhotoFile (int no ) {
		return recipeDao.deleteRecipePhotoFile(no);
	}
	
	@Override
	 public void deleteRecipePhoto(int no) {
		recipeDao.deleteRecipePhoto(no);
	}

	// ********************************지영부분**********************************************
	@Override
	public void updateRecipe(RecipeVO recipeVO) {
		recipeDao.updateRecipe(recipeVO);
	}
	
	@Override
	public void updateRecipePhoto(UploadVO uploadVO) {
		System.out.println("updateRecipePhoto -> servieceImpl 실행이요");
		recipeDao.updateRecipePhoto(uploadVO);
	}

	@Override
	public List<TagVO> selectAllTag() {
		List<TagVO> tagList = recipeDao.selectAllTag();
		return tagList;
	}

	@Override
	public List<IngVO> selectAllIngre() {
		List<IngVO> ingreList = recipeDao.selectAllIngre();
		return ingreList;
	}

	@Override
	public RecipeVO selectByNo(int no) {
		RecipeVO recipe = recipeDao.selectByNo(no);
		return recipe;
	}

	@Override
	public List<IngVO> selectIngByNo(int no) {
		List<IngVO> rIngList = recipeDao.selectIngByNo(no);
		return rIngList;
	}

	@Override
	public List<TagVO> selectTagByNo(int no) {
		List<TagVO> rTagList = recipeDao.selectTagByNo(no);
		return rTagList;
	}

	@Override
	public void newRecipe(RecipeVO recipeVO, IngVO rIngreVO, TagVO rTagVO, UploadVO uploadVO) {
		recipeDao.newRecipe(recipeVO, rIngreVO, rTagVO);
		int recipeNo = recipeVO.getNo();
		uploadVO.setRecipeNo(recipeNo);
		recipeDao.RecipeMainPhoto(uploadVO);
	}

	@Override
	public RecipeVO selectRecipe(int no) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//뷰카운트 전체조회
	@Override
	public int viewCnt() {
		
		return recipeDao.viewCnt();
	}
//*********************************희승 체크박스 조회 *****************************************
   @Override
   public List<TagVO> getCategoryNames(String type) {
      
      return recipeDao.getCategoryNames(type);
   }
   
// 체크박스 메뉴 가져오기
	@Override
	public Map<String, Object> checkList(int[] chkNati, int[] chkSitu, int[] chkCook, int[] chkIngr, int page) {
		List<Integer> list[] = new ArrayList[4];
		List<Integer> listResult = null;

		if (chkSitu != null && chkSitu.length > 0) {
			list[0] = recipeDao.selectRecipeNoByTagNo(chkSitu);
		}
		if (chkNati != null && chkNati.length > 0) {
			list[1] = recipeDao.selectRecipeNoByTagNo(chkNati);
		}
		if (chkIngr != null && chkIngr.length > 0) {
			list[2] = recipeDao.selectRecipeNoByTagNo(chkIngr);
		}
		if (chkCook != null && chkCook.length > 0) {
			list[3] = recipeDao.selectRecipeNoByTagNo(chkCook);
		}

		for (int i = 0; i < 4; i++) {
			if (list[i] != null) {
				listResult = list[i];
				break;
			}
		}

		for (int i = 0; i < 4; i++) {
			if (list[i] != null) {
				for (int j = i + 1; j < 4; j++) {
					if (list[j] != null && listResult == null) {
						listResult = intersection(list[i], list[j]);
					} else if (list[j] != null && listResult != null) {
						listResult = intersection(listResult, list[j]);
					}
				}
			}
		}

		System.out.println("조회할 레시피 번호들");
		List<Integer> listResult2 = new ArrayList<>();
		for (int n : listResult) {
			if (!listResult2.contains(n)) {
				System.out.print(n + " ");
				listResult2.add(n);
			}
		}
		listResult = listResult2;

//		if(listResult.size()==0) {
//			listResult.add(0);
//		}

		int stRow = (page - 1) * 6 + 1;
		int endRow = stRow + 5;
		System.out.println("\n stRow:" + stRow);
		System.out.println("endRow:" + endRow);
		
		HashMap<String, Object> resultMap = new HashMap<>();
		if (listResult != null && listResult.size() > 0) {
			HashMap<String, Object> map = new HashMap<>();
			map.put("stRow", stRow);
			map.put("endRow", endRow);
			map.put("listResult", listResult);
			resultMap.put("recipeCheckResult", recipeDao.selectRecipeByRecNo(map));
		}
		resultMap.put("totalCount", listResult.size());

		return resultMap;
//      return recipeDao.selectRecipeByRecNo(listResult);
	}

	public List<Integer> intersection(List<Integer> list1, List<Integer> list2) {
		List<Integer> list = new ArrayList<Integer>();

		for (Integer t : list1) {
			if (list2.contains(t)) {
				list.add(t);
			}
		}

		return list;
	}

 //**********************************있는 재료로 추천받기 *****************************************
   @Override
   public Map<String, Object> searchRecipeByIngNo(List<Integer> ingNoList, int page) throws Exception {
 	
         List<Integer> recipeNoList = recipeDao.selectReNoByInNo(ingNoList); // 재료 번호들 집어넣어서 관련 레시피 번호 몽땅 select
         HashMap<Integer, Integer> recipeCnt = new HashMap<>(); // 레시피번호-레시피갯수 저장 맵
         List<Integer> targetRecipeList = new ArrayList<>(); // 입력한 재료 모두와 관련있는 레시피 번호들(결과로 보여져야 하는 레시피 번호들)
         
         HashMap<String, Object> pagingRecipe = new HashMap<>(); // 시작페이지와 끝페이지 그리고 재료로 나온 레시피들을 넣는 Map
         // 시작페이지
         int strRow = (page-1)*6 + 1;
         // 끝페이지
         int endRow = strRow+5;
         
         
         
         
         // 레시피 번호가 몽땅 나오면
         for(int recipeNo: recipeNoList) {
        	 // Map으로 ( 레시피 번호 , 0 ) 을 넣어줌
            recipeCnt.put(recipeNo, 0);
         }
         for(int recipeNo: recipeNoList) {
        	 // 레시피번호, 레시피번호의 value 값 0 + 1
            recipeCnt.put(recipeNo, recipeCnt.get(recipeNo)+1);
         }
         
         // 레시피번호를 Map에 저장되어있는 갯수만큼
         for(int recipeNo: recipeCnt.keySet()) {
        	 // 레시피번호의 value값이 재료 번호들의 갯수랑 같다면
            if(recipeCnt.get(recipeNo) == ingNoList.size() ) {
            	// 레시피 번호를 targetRecipeList에 넣어줌
               targetRecipeList.add(recipeNo);
               // 수정
               pagingRecipe.put("targetRecipeList", targetRecipeList);
               pagingRecipe.put("strRow", strRow);
               pagingRecipe.put("endRow", endRow);
            }
         }
         
         HashMap<String, Object> recommendThis = new HashMap<>();
         
         if(targetRecipeList!=null && targetRecipeList.size() > 0) {
        	 
        	 recommendThis.put("recipeRecommendResult", recipeDao.selectRecipeByReNo(pagingRecipe));
        	 recommendThis.put("totalCount", targetRecipeList.size());
        	 
        	 
         } 
         
         return recommendThis;
      }  
   
   //HomeController 관련
	@Override
	public List<RecipeVO> winterRecipe() {
		return recipeDao.winterRecipe();
	}

	@Override
	public List<RecipeVO> easyRecipe() {
		return recipeDao.easyRecipe();
	}

	//*****************마이페이지 레시피 프로필 추출***************************************************
   @Override
   public List<RecipeVO> myPageRecipeProfile(int no) throws Exception {
      return recipeDao.myPageRecipeProfile(no);
   }
    
   //*******************************************************************************************   	
}