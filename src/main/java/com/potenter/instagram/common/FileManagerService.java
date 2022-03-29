package com.potenter.instagram.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class FileManagerService {

	// final을 붙임으로써 최종 수정 불가능
		public final static String FILE_UPLOAD_PATH = "D:\\WonJunBackEnd\\Spring\\spring_potenter\\instagram\\upload\\images/";
		
		private static Logger logger = LoggerFactory.getLogger(FileManagerService.class);
		
		// 파일 저장 후 접근 경로 리턴
		public static String saveFile(int userId, MultipartFile imagePath) {
			
			if(imagePath == null) {
				
				logger.error("FileManagerService-saveFile : 파일 없음");
				
				return null;
			}
			
			// 1. 파일 경로
			// 파일 이름이 겹치는 것을 방지하기 위해 사용자 별로 폴더를 구분한다.
			// 같은 사용자가 같은 파일 이름 겹치는것을 방지하기 위해서 현재 시간을 폴더이름에 포함시킨다.
			// UNIX time : 1970년 1월 1일 0시 0분 0초 기준으로 현재 몇 millisecond(1/1000)초가 지났는지
			// images/6_12912099/asdf.jpg
			
			String directoryName = userId + "_" + System.currentTimeMillis() + "/";
			
			// D:\\WonJunBackEnd\\Spring\\spring_potenter\\memo\\upload\\images/6_12912099/
			String filePath = FILE_UPLOAD_PATH + directoryName;
			
			
			// 디렉토리 생성
			File directory = new File(filePath);
			if(directory.mkdir() == false) {
				// 디렉토리 생성 에러
				logger.error("FileManagerService-saveFile : 디렉토리 생성 에러");
				return null;
			}
			// 파일 저장
			try {
				byte[] bytes = imagePath.getBytes();
				Path path = Paths.get(filePath + imagePath.getOriginalFilename());
				Files.write(path, bytes);
			
			} catch (IOException e) {
				
				e.printStackTrace();
				logger.error("FileManagerService-saveFile : 파일 저장 에러");
				return null;
			}
			
			// <img src="/images/6_12912099/test.jpg">
			// /images/6_12912099/test.jpg
			return "/images/" + directoryName + imagePath.getOriginalFilename();
					
		}
}
