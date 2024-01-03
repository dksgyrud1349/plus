package com.fa.plus.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.domain.InquiryAd;


@Mapper
public interface InquiryAdMapper {
	public void insertInquiryAd(InquiryAd dto) throws SQLException;
	public void updateInquiryAd(InquiryAd dto) throws SQLException;
	public void deleteInquiryAd(long inquiryNum) throws SQLException;
	
	public int dataCount(Map<String, Object> map);
	public List<InquiryAd> listInquiryAd(Map<String, Object> map);
	
	public InquiryAd findById(long inquiryNum);

}
