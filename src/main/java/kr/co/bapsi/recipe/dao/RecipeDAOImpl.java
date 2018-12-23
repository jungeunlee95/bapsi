package kr.co.bapsi.recipe.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.bapsi.member.vo.MemberVO;
import kr.co.bapsi.recipe.vo.FindCriteria;
import kr.co.bapsi.recipe.vo.FindTagCriteria;
import kr.co.bapsi.recipe.vo.IngVO;
import kr.co.bapsi.recipe.vo.RecipeVO;
import kr.co.bapsi.recipe.vo.TagVO;
import kr.co.bapsi.upload.vo.UploadVO;

/**
 * ORACLE DB에서 구현하는 게시글 관련 클래스
 * 
 * @author Administrator
 *
 */
@Repository
public class RecipeDAOImpl implements RecipeDAO {

	@Autowired // 자동주입
	private SqlSessionTemplate sqlSessionTemplate;

	// **************************************지영부분****************************************
	Map<String, Object> map = new HashMap<String, Object>();
	
	@Override
	public void newRecipe(RecipeVO recipeVO, IngVO rIngreVO, TagVO rTagVO) {
		
		sqlSessionTemplate.insert("kr.co.bapsi.recipe.dao.RecipeDAO.insertRecipe", recipeVO);

		List rIngList = recipeVO.getrIngList();
		List amountList = recipeVO.getAmountList();
		List rTagList = recipeVO.getrTagList();
		

		if(rIngList != null) {
			for (int i = 0; i < rIngList.size(); i++) {
					if(rIngList.get(i) != null) {
						map.put("ing", rIngList.get(i));
						map.put("amount", amountList.get(i));
		//			System.out.println( map );
						sqlSessionTemplate.insert("kr.co.bapsi.recipe.dao.RecipeDAO.insertRIngre", map);
					} // insert는 하나씩! -> 에러날경우 롤백가능
			}
		}
		
		if(rTagList != null) {
			for (int i = 0; i < rTagList.size(); i++) {
				map.put("tag", rTagList.get(i));
				sqlSessionTemplate.insert("kr.co.bapsi.recipe.dao.RecipeDAO.insertRTag", map);
			}
		}

	}
	//게시글 등록할때 사진 등록
	@Override
	public void RecipeMainPhoto(UploadVO uploadVO) {
		Map<String, Object> updatePhoto= new HashMap<>();
		updatePhoto.put("file_fakename", uploadVO.getFile_fakename());
		updatePhoto.put("recipeNo", uploadVO.getRecipeNo());
		sqlSessionTemplate.insert("kr.co.bapsi.recipe.dao.RecipeDAO.RecipeMainPhoto", uploadVO);
		sqlSessionTemplate.update("kr.co.bapsi.recipe.dao.RecipeDAO.updateMainPhoto", updatePhoto);
	}
	
//	수정할때 사진 수정하는거
	@Override
	public void updateRecipePhoto(UploadVO uploadVO) {
		Map<String, Object> updatePhoto= new HashMap<>();
		updatePhoto.put("file_fakename", uploadVO.getFile_fakename());
		updatePhoto.put("recipeNo", uploadVO.getRecipeNo());
		updatePhoto.put("file_oriname", uploadVO.getFile_oriname());
		
		sqlSessionTemplate.update("kr.co.bapsi.recipe.dao.RecipeDAO.reRecipeMainPhoto", updatePhoto);
		
		sqlSessionTemplate.update("kr.co.bapsi.recipe.dao.RecipeDAO.reupdateMainPhoto", updatePhoto);
	}

	@Override
	public List<TagVO> selectAllTag() {
		List<TagVO> tagList = sqlSessionTemplate.selectList("kr.co.bapsi.recipe.dao.RecipeDAO.selectAllTag");
		return tagList;
	}

	@Override
	public List<IngVO> selectAllIngre() {
		List<IngVO> ingreList = sqlSessionTemplate.selectList("kr.co.bapsi.recipe.dao.RecipeDAO.selectAllIngre");
		return ingreList;
	}

	@Override
	public RecipeVO selectByNo(int no) {
		RecipeVO recipe = sqlSessionTemplate.selectOne("kr.co.bapsi.recipe.dao.RecipeDAO.selectByNo", no);
		return recipe;
	}

	@Override
	public List<IngVO> selectIngByNo(int no) {
		List<IngVO> rIngList = sqlSessionTemplate.selectList("kr.co.bapsi.recipe.dao.RecipeDAO.selectIngByNo", no);
		return rIngList;
	}

	@Override
	public List<TagVO> selectTagByNo(int no) {
		List<TagVO> rTagList = sqlSessionTemplate.selectList("kr.co.bapsi.recipe.dao.RecipeDAO.selectTagByNo", no);
		return rTagList;
	}

	@Override
	public void updateRecipe(RecipeVO recipeVO) {
		sqlSessionTemplate.update("kr.co.bapsi.recipe.dao.RecipeDAO.updateRecipe", recipeVO);
		
		int no = recipeVO.getNo();
		List rIngList = recipeVO.getrIngList();
		List amountList = recipeVO.getAmountList();
		List rTagList = recipeVO.getrTagList();
		
		sqlSessionTemplate.delete("kr.co.bapsi.recipe.dao.RecipeDAO.deleteRIng", no);
		if(rIngList != null) {
			for (int i = 0; i < rIngList.size(); i++) {
				if(rIngList.get(i) != null) {
					map.put("no", no);
					map.put("ing", rIngList.get(i));
					map.put("amount", amountList.get(i));
					sqlSessionTemplate.insert("kr.co.bapsi.recipe.dao.RecipeDAO.updateRIng", map);
				}
			}
		}
		
		sqlSessionTemplate.delete("kr.co.bapsi.recipe.dao.RecipeDAO.deleteRTag", no);
		if(rTagList != null) {
			for (int i = 0; i < rTagList.size(); i++) {
				map.put("no", no);
				map.put("tag", rTagList.get(i));
				System.out.println(map);
				sqlSessionTemplate.insert("kr.co.bapsi.recipe.dao.RecipeDAO.updateRTag", map);
			}
		}
	}

	
	//***********************************정은********************************************
	
	@Override
	public void deleteRecipePhoto(int no) {
		sqlSessionTemplate.delete("kr.co.bapsi.recipe.dao.RecipeDAO.deleteRecipePhoto", no);
		
	}
	//파일삭제
	@Override
	public String deleteRecipePhotoFile(int no) {
		return sqlSessionTemplate.selectOne("kr.co.bapsi.recipe.dao.RecipeDAO.deleteRecipePhotoFile", no);
	}

	@Override
	public List<RecipeVO> listPage(int page) {
		// 기본 페이지는 1페이지로 설정
		if (page <= 0) {
			page = 1;
		}
		return sqlSessionTemplate.selectList("kr.co.bapsi.recipe.dao.RecipeDAO.listPage", page);
	}

	/*@Override
	public List<RecipeVO> listCriteria(PageCriteria cria) {
		// System.out.println("cria:"+cria.toString());
		return sqlSessionTemplate.selectList("kr.co.bapsi.recipe.dao.RecipeDAO.listCriteria", cria);
	}
	@Override
	public int countData(PageCriteria pCria) {
		return sqlSessionTemplate.selectOne("kr.co.bapsi.recipe.dao.RecipeDAO.countData", pCria);
	}*/

	@Override
	public List<RecipeVO> tagListCriteria(FindTagCriteria cria) {
		// System.out.println("cria:"+cria.toString());
		return sqlSessionTemplate.selectList("kr.co.bapsi.recipe.dao.RecipeDAO.tagListCriteria", cria);
	}


	@Override
	public int countData(FindTagCriteria pageCria) {
		return sqlSessionTemplate.selectOne("kr.co.bapsi.recipe.dao.RecipeDAO.tcountData", pageCria);
	}

	@Override
	public void updateViewCnt(int no) {
		sqlSessionTemplate.update("kr.co.bapsi.recipe.dao.RecipeDAO.updateView", no);
	}

	@Override // 여기 주소는 sqlmap의 <mapper namespace="kr.co.mlec.board.dao.BoardDAO">
	public RecipeVO detail(int no) {
		RecipeVO board = sqlSessionTemplate.selectOne("kr.co.bapsi.recipe.dao.RecipeDAO.selectByNo", no);

		return board;
	}

	@Override
	public void delete(int no) {
		sqlSessionTemplate.delete("kr.co.bapsi.recipe.dao.RecipeDAO.delete", no);
		sqlSessionTemplate.delete("kr.co.bapsi.recipe.dao.RecipeDAO.deleteRecipeTag", no);
		sqlSessionTemplate.delete("kr.co.bapsi.recipe.dao.RecipeDAO.deleteRecipeIng", no);
	}

	@Override
	public List<TagVO> tagList(int no) {
		return sqlSessionTemplate.selectList("kr.co.bapsi.recipe.dao.RecipeDAO.selectTagByNo", no);

	}

	@Override
	public List<IngVO> ingList(int no) {
		return sqlSessionTemplate.selectList("kr.co.bapsi.recipe.dao.RecipeDAO.selectIngByNo", no);

	}
	
	// 검색기능 리스트!!!!!!!!!!!!!!
	@Override
	public List<RecipeVO> listFind(FindCriteria findCri){
		return sqlSessionTemplate.selectList("kr.co.bapsi.recipe.dao.RecipeDAO.listFind", findCri);
	}

	@Override
	public int findCountData(FindCriteria findCri){
		return sqlSessionTemplate.selectOne("kr.co.bapsi.recipe.dao.RecipeDAO.findCountDataR", findCri);
	}
	
	//포인트!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@Override
	public int checkBoard(int userNo, int receipeNo) {
	      Map<Object, Object> reMap = new HashMap<>();	      
	      reMap.put("userNo", userNo);
	      reMap.put("receipeNo", receipeNo);      
		return sqlSessionTemplate.selectOne("kr.co.bapsi.recipe.dao.RecipeDAO.checkBoard", reMap);
	}
	
	@Override
	public int checkBoardO(int userNo, int receipeNo) {
	      Map<Object, Object> reMap = new HashMap<>();	      
	      reMap.put("userNo", userNo);
	      reMap.put("receipeNo", receipeNo);      
		return sqlSessionTemplate.selectOne("kr.co.bapsi.recipe.dao.RecipeDAO.checkBoardO", reMap);
	}
	
	@Override
	public void getRPoint(int receipeNo) {
		 sqlSessionTemplate.update("kr.co.bapsi.recipe.dao.RecipeDAO.getRPoint", receipeNo);
	}
	@Override
	public void getMPoint(int receipeUserNo) {
		sqlSessionTemplate.update("kr.co.bapsi.recipe.dao.RecipeDAO.getMPoint", receipeUserNo);
	}
	@Override
	public void addLogUp(int userNo, int receipeNo, int receipeUserNo) {
		
		Map<Object, Object> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("receipeNo", receipeNo);
		map.put("receipeUserNo", receipeUserNo);
		
		sqlSessionTemplate.insert("kr.co.bapsi.recipe.dao.RecipeDAO.addLogUp", map);
	}
	
	@Override
	public void loseRPoint(int receipeNo) {
		sqlSessionTemplate.update("kr.co.bapsi.recipe.dao.RecipeDAO.loseRPoint", receipeNo);
	}
	@Override
	public void loseMPoint(int receipeUserNo) {
		sqlSessionTemplate.update("kr.co.bapsi.recipe.dao.RecipeDAO.loseMPoint", receipeUserNo);
	}
	
	@Override
	public void addLogDown(int userNo, int receipeNo, int receipeUserNo) {
		
		Map<Object, Object> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("receipeNo", receipeNo);
		map.put("receipeUserNo", receipeUserNo);
		
		sqlSessionTemplate.insert("kr.co.bapsi.recipe.dao.RecipeDAO.addLogDownP", map);
	}
	
	@Override
	public int checkLike(int receipeNo, int userNo) {
		Map<Object, Object> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("receipeNo", receipeNo);
		
		return sqlSessionTemplate.selectOne("kr.co.bapsi.recipe.dao.RecipeDAO.checkLike", map);
	}
	
	@Override
	public int checkDown(int receipeNo, int userNo) {
		Map<Object, Object> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("receipeNo", receipeNo);
		
		return sqlSessionTemplate.selectOne("kr.co.bapsi.recipe.dao.RecipeDAO.checkDown", map);
	}

	@Override
	public void deleteLog(int userNo,int receipeUserNo, int receipeNo) {
		Map<Object, Object> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("receipeUserNo", receipeUserNo);
		map.put("receipeNo", receipeNo);
		
		sqlSessionTemplate.delete("kr.co.bapsi.recipe.dao.RecipeDAO.deleteLog", map);
	}
	
	@Override
	public void deleteLogDown(int userNo,int receipeUserNo, int receipeNo) {
		Map<Object, Object> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("receipeUserNo", receipeUserNo);
		map.put("receipeNo", receipeNo);
		
		sqlSessionTemplate.delete("kr.co.bapsi.recipe.dao.RecipeDAO.deleteLogDown", map);
	}
	
	//팔로우!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@Override
	public void getFollowCnt(int receipeUserNo) {
		sqlSessionTemplate.update("kr.co.bapsi.recipe.dao.RecipeDAO.getFollowCnt", receipeUserNo);
	}

	@Override
	public void loseFollowCnt(int receipeUserNo) {
		sqlSessionTemplate.update("kr.co.bapsi.recipe.dao.RecipeDAO.loseFollowCnt", receipeUserNo);
	}

	@Override
	public void insertFollower(int userNo, int receipeUserNo) {
		
		Map<Object, Integer> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("receipeUserNo", receipeUserNo);
		
		sqlSessionTemplate.insert("kr.co.bapsi.recipe.dao.RecipeDAO.insertFollower", map);
	}
	
	@Override
	public void deleteFollower(int userNo, int receipeUserNo) {
		
		Map<Object, Object> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("receipeUserNo", receipeUserNo);
		
		sqlSessionTemplate.insert("kr.co.bapsi.recipe.dao.RecipeDAO.deleteFollower", map);
	}
	
	@Override
	public int followCheck(int userNo, int receipeUserNo) {
		Map<Object, Object> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("receipeUserNo", receipeUserNo);
		
		return sqlSessionTemplate.selectOne("kr.co.bapsi.recipe.dao.RecipeDAO.followCheck", map);
	}	
	
	// *******************************************랭킹 페이지**************************************************
	@Override
	   public List<RecipeVO> selectBestRecipe(){
	      return sqlSessionTemplate.selectList("kr.co.bapsi.recipe.dao.RecipeDAO.selectBestRecipe");
	   }
	@Override
	public List<MemberVO> selectBestMember(){
		return sqlSessionTemplate.selectList("kr.co.bapsi.recipe.dao.RecipeDAO.selectBestMember");
	}
	@Override
	public List<MemberVO> selectBestMemberR(){
		return sqlSessionTemplate.selectList("kr.co.bapsi.recipe.dao.RecipeDAO.selectBestMemberR");
	}
	@Override
	public List<MemberVO> selectCommentMember(){
		return sqlSessionTemplate.selectList("kr.co.bapsi.recipe.dao.RecipeDAO.selectCommentMember");
	}
	@Override
	public List<MemberVO> selectRecipeMember(){
		return sqlSessionTemplate.selectList("kr.co.bapsi.recipe.dao.RecipeDAO.selectRecipeMember");
	}
	
	// ****************************************************************************************************
	
	// *************************************회원상세 페이지**************************************************
	@Override
	public int pointCnt(int no) {
		return sqlSessionTemplate.selectOne("kr.co.bapsi.recipe.dao.RecipeDAO.pointCnt", no);
	}
	@Override
	public int recipeCnt(int no) {
		return sqlSessionTemplate.selectOne("kr.co.bapsi.recipe.dao.RecipeDAO.recipeCnt", no);
	}
	@Override
	public List<RecipeVO> userPageRecipe(int no){
		return sqlSessionTemplate.selectList("kr.co.bapsi.recipe.dao.RecipeDAO.userPageRecipe", no);
	}

	@Override
	public List<RecipeVO> likeRecipe(int no){
		return sqlSessionTemplate.selectList("kr.co.bapsi.recipe.dao.RecipeDAO.likeRecipe", no);
	}

	@Override
	public int followingCnt(int no) {
		return sqlSessionTemplate.selectOne("kr.co.bapsi.recipe.dao.RecipeDAO.followingCnt", no);
	}
	
	@Override

	public List<MemberVO> followMe(int no){
		return sqlSessionTemplate.selectList("kr.co.bapsi.recipe.dao.RecipeDAO.followMe", no);
	}
	
	@Override
	public List<MemberVO> followSome(int no){
		return sqlSessionTemplate.selectList("kr.co.bapsi.recipe.dao.RecipeDAO.followSome", no);
	}
	// ****************************************************************************************************

	@Override
	public int viewCnt() {
		
		return sqlSessionTemplate.selectOne("kr.co.bapsi.recipe.dao.RecipeDAO.viewCnt");
	}
	
	//*********************************희승 체크박스 조회 *****************************************
	@Override
   public List<TagVO> getCategoryNames(String type) {
      
      return sqlSessionTemplate.selectList("kr.co.bapsi.recipe.dao.RecipeDAO.getCategoryNames", type);
   }
	
	//체크박스 메뉴 가져오기
	@Override
	public List<Integer> selectRecipeNoByTagNo(int[] tagList) {
		return sqlSessionTemplate.selectList("kr.co.bapsi.recipe.dao.RecipeDAO.selectRecipeNoByTagNo", tagList);
	}

	@Override
	public List<RecipeVO> selectRecipeByRecNo(HashMap<String, Object> map) {
		return sqlSessionTemplate.selectList("kr.co.bapsi.recipe.dao.RecipeDAO.selectRecipeByRecNo", map);
	}

	//*********************************있는 재료로 추천받기*****************************************
		@Override
	    public List<Integer> selectReNoByInNo(List<Integer> list) throws Exception {
	       return sqlSessionTemplate.selectList("selectReByInNo", list);
	    }
		
		public List<RecipeVO> selectRecipeByReNo(HashMap<String, Object> recommendThis) throws Exception{
		       return sqlSessionTemplate.selectList("selectRecipeByReNo", recommendThis);
		}	
	    
	//******************************************************************************************
   // *******************************************HomeController**************************************************
   @Override
   public List<RecipeVO> winterRecipe(){
      return sqlSessionTemplate.selectList("kr.co.bapsi.recipe.dao.RecipeDAO.winterRecipe");
   }
   @Override
   public List<RecipeVO> easyRecipe(){
      return sqlSessionTemplate.selectList("kr.co.bapsi.recipe.dao.RecipeDAO.easyRecipe");
   }
   // *****************************************************************************************************
   //*****************마이페이지 레시피 프로필 추출**************************
    @Override
  public List<RecipeVO> myPageRecipeProfile(int no) throws Exception {
     return sqlSessionTemplate.selectList("kr.co.bapsi.recipe.dao.RecipeDAO.myPageRecipeProfile",no);
      } 
   //******************************************************************   
}
