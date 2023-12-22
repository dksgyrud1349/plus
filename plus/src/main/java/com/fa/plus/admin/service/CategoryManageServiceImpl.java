package com.fa.plus.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.admin.domain.CategoryManage;
import com.fa.plus.admin.mapper.CategoryManageMapper;

@Service
public class CategoryManageServiceImpl implements CategoryManageService{
	
	@Autowired
	private CategoryManageMapper mapper;
	
	@Override
	public int dataCount() {
		int result = 0;
		
		try {
			result = mapper.dataCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void insertMainCategory(CategoryManage dto) throws Exception {
		try {
			long mainseq = mapper.mainSeq();
			dto.setMainNum(mainseq);
			
			mapper.insertMainCategory(dto);

			if(dto.getCategorys() != null) {
				CategoryManage vo = new CategoryManage();
				vo.setMainNum(dto.getMainNum());
				
				for(String category : dto.getCategorys()) {
					vo.setSubName(category);
					
					mapper.insertSubCategory(vo);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateMainCategory(CategoryManage dto) throws Exception {
		try {
			mapper.updateMainCategory(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteMainCategory(long mainNum) throws Exception {
		try {
			mapper.deleteSubCategoryAll(mainNum);
			mapper.deleteMainCategory(mainNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void insertSubCategory(CategoryManage dto) throws Exception {
		try {
			mapper.insertSubCategory(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateSubCategory(CategoryManage dto) throws Exception {
		try {
			mapper.updateSubCategory(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteSubCategory(long subNum) throws Exception {
		try {
			mapper.deleteSubCategory(subNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<CategoryManage> listMainCategory() {
		List<CategoryManage> listMainCategory = null;
		
		try {
			listMainCategory = mapper.listMainCategory();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return listMainCategory;
	}

	@Override
	public CategoryManage findByMain(long mainNum) {
		CategoryManage dto = null;
		
		try {
			dto = mapper.findByMain(mainNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int dataCount2() {
		int result = 0;
		
		try {
			result = mapper.dataCount2();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<CategoryManage> listSubCategory(long mainNum) {
		List<CategoryManage> listSubCategory = null;
		
		try {
			listSubCategory = mapper.listSubCategory(mainNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return listSubCategory;
	}

	@Override
	public CategoryManage findBySub(long subNum) {
		CategoryManage dto = null;
		
		try {
			dto = mapper.findBySub(subNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

}
