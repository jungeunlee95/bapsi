package kr.co.bapsi.entertain.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.bapsi.entertain.vo.FindCriteria;
import kr.co.bapsi.entertain.vo.MukbangVO;
import kr.co.bapsi.entertain.vo.RandomEatVO;
import kr.co.bapsi.recipe.vo.IngVO;
import kr.co.bapsi.recipe.vo.RecipeVO;

@Repository
public class EntertainDAOImpl implements EntertainDAO{

   @Inject
   private SqlSession sqlSession;
   
   @Override
   public List<MukbangVO> findMukbang(FindCriteria findCri) throws Exception{
      
      return sqlSession.selectList("findMukbang", findCri);
   }
   
   @Override
   public int findCountData(FindCriteria findCri) throws Exception{
      
      return sqlSession.selectOne("findCount",findCri);
   }
   
   @Override
   public RandomEatVO randomEat(int no) throws Exception {
      
      return sqlSession.selectOne("randomEat", no);
   }
   
   @Override
   public List<String> ingredientsTypeList() throws Exception {
      return sqlSession.selectList("ingredientsTypeList");
   }
   
   @Override
   public List<IngVO> ingredientsNameList() throws Exception {
      return sqlSession.selectList("ingredientsNameList");
   }
   
   @Override
   public List<IngVO> selectIngredientsType(String type) throws Exception {
      return sqlSession.selectList("selectIngredientsType", type);
   }
   
   /*
   @Override
   public List<Integer> selectReNoByInNo(List<Integer> list) throws Exception {
      return sqlSession.selectList("selectReByInNo", list);
   }
   
   @Override
   public List<RecipeVO> selectRecipeByReNo(List<Integer> reNoList) throws Exception{
      return sqlSession.selectList("selectRecipeByReNo", reNoList);
   }
   */

}