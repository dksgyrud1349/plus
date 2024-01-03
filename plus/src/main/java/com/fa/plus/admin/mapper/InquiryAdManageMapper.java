package com.fa.plus.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.admin.domain.InquiryAdManage;

@Mapper
public interface InquiryAdManageMapper {
	public void sendReContentAd(InquiryAdManage dto) throws SQLException;
	public void deleteReContentAd(long inquiryNum) throws SQLException;
	public void deleteInquiryAd(long inquiryNum) throws SQLException;
	
	public int dataCount(Map<String, Object> map);
	public List<InquiryAdManage> listInquiryAd(Map<String, Object> map);
	
	public InquiryAdManage findById(long inquiryNum);

}
