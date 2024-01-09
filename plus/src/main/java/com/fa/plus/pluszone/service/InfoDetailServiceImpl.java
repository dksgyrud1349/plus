package com.fa.plus.pluszone.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.common.FileManager;
import com.fa.plus.pluszone.domain.InfoDetail;
import com.fa.plus.pluszone.mapper.InfoDetailMapper;

@Service
public class InfoDetailServiceImpl implements InfoDetailService{

	@Autowired
	private InfoDetailMapper mapper;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public InfoDetail findByNull(String userId) {
		InfoDetail dto = null;
		try {
			dto = mapper.findByNull(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void insertInfoDetail(InfoDetail dto, String pathname) throws Exception{
		try {
			String saveFilename = fileManager.doFileUpload(dto.getPhotoFile(), pathname);
			if (saveFilename != null) {
				dto.setPhoto(saveFilename);

				mapper.insertInfoDetail(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateInfoDetail(InfoDetail dto, String pathname) throws SQLException {
		try {
			// 업로드한 파일이 존재한 경우
			String saveFilename = fileManager.doFileUpload(dto.getPhotoFile(), pathname);

			if (saveFilename != null) {
				// 이전 파일 지우기
				if (dto.getPhoto().length() != 0) {
					fileManager.doFileDelete(dto.getPhoto(), pathname);
				}

				dto.setPhoto(saveFilename);
				// 새로 업로드할 파일을 집어넣음
			}
			
			mapper.updateInfoDetail(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
