package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.ImagesVO;

public interface ImagesService {

	void insertImages(ImagesVO ivo);

	void sellerDeleteImages(int pno);

	 List<ImagesVO> getThumbnailImage(int pno);

	 List<ImagesVO> pullIno(int pno);
}