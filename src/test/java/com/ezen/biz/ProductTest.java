package com.ezen.biz;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.chainsaw.Main;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ezen.biz.dao.ProductDAO;

import com.ezen.biz.dto.MainCateVO;
import com.ezen.biz.dto.ProductVO;
import com.ezen.biz.dto.SubCateVO;


import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class ProductTest {
		@Autowired
		private ProductDAO dao;
		
		@Test
		public void insertProductTest() {
			ProductVO vo=new ProductVO();
			vo.setCa_no(1);
			vo.setSca_no(1);
			vo.setCompany("삼성전자");
			vo.setU_id("whdgus1234");
			vo.setPname("종현 상품");
			vo.setPrice(1113);
			vo.setQty(10);
			dao.insertProduct(vo);
		}
		
		@Test
		public void updateProductTest() {
			ProductVO vo=new ProductVO();
			vo.setPno(251);
			vo.setCa_no(1);
			vo.setSca_no(1);
			vo.setCompany("삼성전자");
			vo.setU_id("whdgus1234");
			vo.setPname("종현 상품");
			vo.setPrice(2222);
			vo.setQty(5);
			dao.updateProduct(vo);
		}
		
		@Test
		public void selectProductList() {
			dao.selectProductList();	
		}
		
		@Test
		public void selectProductListAll() {
			List<ProductVO> list=dao.selectProductListPno(1);	
			log.info(list);
		}
		
		@Test
		public void selectProductTest() {
			ProductVO vo=new ProductVO();
			vo.setCompany("삼성전자");
			vo.setPname("삼성전자 그랑데 드럼 세탁기 WF19T6000KW 19kg 방문설치");
			vo.setPrice(648000);
			dao.SelectProduct(vo);
			log.info(vo);
		}

		@Test
		public void deleteProductTest() {
			ProductVO vo=new ProductVO();
			vo.setPno(251);
			dao.deleteProduct(vo);
		}
		
		@Test
		public void cateTest(){
			List<MainCateVO> list=dao.getCategory();
			log.info(list);
		}	

		@Test
		public void newCateTest() {
			//뷰로 보낼 전체 내용이 삽입된
			List<Map<String, Object>> catelist=new ArrayList<Map<String,Object>>();
			List<Map<String, Object>> subcatelist=null;
			//DB 에서 CATE 목록 가져오기
			List<MainCateVO> cates=dao.getCategory();
			List<SubCateVO> subcates=null;
			for(MainCateVO cvo:cates) {			
				Map<String, Object> map=new HashMap<String, Object>();
				map.put("no", cvo.getCa_no());
				map.put("name", cvo.getCate_name());
				subcates=dao.getSubCategory(cvo.getCa_no());
				subcatelist= new ArrayList<Map<String,Object>>();
				Map<String, Object> submap=null;
				for(SubCateVO svo:subcates) {
					submap=new HashMap<String, Object>();
					submap.put("sno", svo.getSca_no());				
					submap.put("sname", svo.getSubcate_name());	
					subcatelist.add(submap);
				}
				map.put("subcates",subcatelist);
				catelist.add(map);	
			}
			log.info(catelist);
			
			for(Map<String, Object> list:catelist) {
				log.info(list);
			}
		}
		
		@Test
		public void subCateTest(){
			List<SubCateVO> list=dao.getSubCategory(1);
			log.info(list);
		}
		
		
}
