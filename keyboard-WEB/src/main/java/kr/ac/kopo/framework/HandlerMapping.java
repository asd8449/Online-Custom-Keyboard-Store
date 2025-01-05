package kr.ac.kopo.framework;

import java.io.FileInputStream;
import java.io.InputStream;
import java.lang.reflect.Constructor;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import kr.ac.kopo.controller.Controller;

public class HandlerMapping {
	
	private Map<String, Controller> mappings;
	
	public HandlerMapping() {
		this("bean.properties");
	}
	
	public HandlerMapping(String propName) {
		mappings = new HashMap<>();
		Properties prop = new Properties();
		String propLoc = this.getClass().getResource(propName).getPath();
		
		try (
				InputStream is = new FileInputStream(propLoc);
			){
			prop.load(is);
			Set<Object>keys = prop.keySet();
			for(Object key : keys) {
				String className = prop.getProperty(key.toString());
				
				Class<?> clz = Class.forName(className);
				Constructor<?> constructor = clz.getConstructor();
				Controller instance = (Controller)constructor.newInstance();
				mappings.put(key.toString(), instance);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public Controller getController(String uri) {
		return mappings.get(uri);
	}
	
//	try {
//		Controller control = switch (uri) {
//		case "/board/list.do" -> new BoardListController();
//		case "/board/writeForm.do" -> new BoardWriteFormController();
//		//case "/board/write.do" -> System.out.println("새글등록 서비스");
//		default -> null;
//		};
}
