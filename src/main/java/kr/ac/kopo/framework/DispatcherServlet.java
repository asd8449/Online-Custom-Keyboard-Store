package kr.ac.kopo.framework;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.controller.BoardListController;
import kr.ac.kopo.controller.BoardWriteFormController;
import kr.ac.kopo.controller.Controller;

@MultipartConfig(maxFileSize = 1024 * 1024 * 3, maxRequestSize = 1024 * 1024 * 5, fileSizeThreshold = 1024 * 1024
		* 5, location = "C:\\_Lecture\\script-workspace\\keyboard-WEB\\src\\main\\webapp\\resources\\images")
public class DispatcherServlet extends HttpServlet {

	HandlerMapping mappings;

	@Override
	public void init(ServletConfig config) throws ServletException {
		String propName = config.getInitParameter("propName");
		mappings = new HandlerMapping(propName);
	}

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String contextPath = request.getContextPath();
		String uri = request.getRequestURI();
		uri = uri.substring(contextPath.length());
		System.out.println("요청uri : " + uri);
		try {
			Controller control = mappings.getController(uri);
			String callPage = control.handleRequest(request, response);
			if (callPage.startsWith("redirect:")) {
				callPage = callPage.substring("redirect:".length());
				response.sendRedirect(request.getContextPath() + callPage);
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(callPage);
				dispatcher.forward(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException();
		}
	}
}