package kr.co.bapsi.entertain.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.bapsi.entertain.dao.EntertainDAO;
import kr.co.bapsi.entertain.vo.FindCriteria;
import kr.co.bapsi.entertain.vo.MukbangVO;
import kr.co.bapsi.entertain.vo.RandomEatVO;
import kr.co.bapsi.recipe.vo.IngVO;
import kr.co.bapsi.recipe.vo.RecipeVO;

@Service
public class EntertainServiceImpl implements EntertainService{

   @Inject
   private EntertainDAO entertainDAO;
   
   @Override
   public List<MukbangVO> findMukbang(FindCriteria findCri) throws Exception {
      
      return entertainDAO.findMukbang(findCri);
   }
   
   @Override
   public int findCountData(FindCriteria findCri) throws Exception {
      
      return entertainDAO.findCountData(findCri);
   }
   
   @Override
   public RandomEatVO randomEat(int no) throws Exception {
      
      return entertainDAO.randomEat(no);
   }
   
   @Override
   public List<String> ingredientTypeList() throws Exception {
      return entertainDAO.ingredientsTypeList();
   }
   
   @Override
   public List<IngVO> ingredientsNameList() throws Exception {
      return entertainDAO.ingredientsNameList();
   }
   
   @Override
   public List<IngVO> selectIngredientsType(String type) throws Exception {

      return entertainDAO.selectIngredientsType(type);
   }
   
   /*
   public List<RecipeVO> searchRecipeByIngNo(List<Integer> ingNoList) throws Exception {
      List<Integer> recipeNoList = entertainDAO.selectReNoByInNo(ingNoList); // 재료 번호들 집어넣어서 관련 레시피 번호 몽땅 select
      HashMap<Integer, Integer> recipeCnt = new HashMap<>(); // 레시피번호-레시피갯수 저장 맵
      List<Integer> targetRecipeList = new ArrayList<>(); // 입력한 재료 모두와 관련있는 레시피 번호들(결과로 보여져야 하는 레시피 번호들)
      
      for(int recipeNo: recipeNoList) {
         recipeCnt.put(recipeNo, 0);
      }
      
      for(int recipeNo: recipeNoList) {
         recipeCnt.put(recipeNo, recipeCnt.get(recipeNo)+1);
      }
      
      for(int recipeNo: recipeCnt.keySet()) {
         if(recipeCnt.get(recipeNo) == ingNoList.size() ) {
            targetRecipeList.add(recipeNo);
         }
      }
      
      return entertainDAO.selectRecipeByReNo(targetRecipeList);
   }
   */
}