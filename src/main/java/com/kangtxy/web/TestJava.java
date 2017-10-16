package com.kangtxy.web;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.kangtxy.entity.User;

public class TestJava {

	public static void main(String args[]) {
		try {
			XSSFWorkbook book = new XSSFWorkbook(new FileInputStream("E:\\test.xlsx"));
	        XSSFSheet sheet =  book.getSheetAt(0);  
	        XSSFRow row = sheet.createRow(1);
	        XSSFCell cell = row.createCell(0);
	        cell.setCellValue("11");
	        XSSFCell cel2 = row.createCell(1);
	        cel2.setCellValue("22");
	        
	        FileOutputStream out = new FileOutputStream("E:\\export.xlsx");  
	        book.write(out);  
	        out.close(); 
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}  
	}

	public void export_excel(HttpServletRequest request, HttpServletResponse response) {
		try {
			User user = new User();
			user.setId("1");
			user.setUsername("2");
			user.setPassword("3");

			// 待导出数据
			List<User> list = new ArrayList<User>();
			list.add(user);

			// 模板名称
			String templatePath = "e:\\test.xlsx";
			// 设置文件ContentType类型，这样设置，会自动判断下载文件类型
			response.setContentType("multipart/form-data");
			// 设置文件头：最后一个参数是设置下载文件名
			response.setHeader("Content-Disposition", "attachment;fileName=" + java.net.URLEncoder.encode("export.xlsx", "UTF-8"));
			ServletOutputStream outStream = response.getOutputStream();
			XSSFWorkbook workbook = getWorkbook(list, templatePath);
			workbook.write(outStream);
			outStream.flush();
			outStream.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public XSSFWorkbook getWorkbook(List<User> list, String templatePath) {
		XSSFWorkbook hss = null;
		InputStream is = null;
		try{
			is = new FileInputStream(templatePath);
			hss = new XSSFWorkbook(is);
			XSSFSheet hssfSheet = hss.getSheetAt(0); // 获得该工作区的第一个sheet
			for(int rowNum = 0; rowNum < list.size(); rowNum++) {
				XSSFRow row = hssfSheet.createRow(rowNum + 1);// 跳过模板表头
				User vo = list.get(rowNum);
				int maxRowNum = 3;//列数
				for (int colNum = 0; colNum < maxRowNum; colNum++) {
					XSSFCell cell = row.createCell(colNum);
					XSSFCellStyle cellStyle = hss.createCellStyle(); 
					cellStyle.setBorderBottom(XSSFCellStyle.BORDER_THIN);
					cellStyle.setBorderLeft(XSSFCellStyle.BORDER_THIN);
					cellStyle.setBorderRight(XSSFCellStyle.BORDER_THIN);
					cell.setCellStyle(cellStyle);
					setExcelValue(colNum, rowNum + 1, cell, vo);
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(is != null){
				try {
					is.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return hss;
	}
	private void setExcelValue(int column, int rownum, XSSFCell cell, User vo) {
		switch (column) {
		case 0:
			cell.setCellValue(rownum);
			break;
		case 1:
			cell.setCellValue(vo.getId());
			break;
		case 2:
			cell.setCellValue(vo.getUsername());
			break;
		case 3:
			cell.setCellValue(vo.getPassword());
			break;
		default:
			break;
		}
	}
}
