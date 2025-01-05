package kr.ac.kopo.framework;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.controller.Controller;

@MultipartConfig(
        maxFileSize = 1024 * 1024 * 3,
        maxRequestSize = 1024 * 1024 * 5,
        fileSizeThreshold = 1024 * 1024 * 5,
        location = "C:\\_Lecture\\keyboard-WEB\\src\\main\\webapp\\resources\\images"
)
public class DispatcherServlet extends HttpServlet {

    private HandlerMapping mappings;

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
            if (control == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "No matching controller for " + uri);
                return;
            }

            String callPage = control.handleRequest(request, response);
            
            // Null 처리 추가
            if (callPage == null) {
                System.out.println("Controller returned null for callPage. Assuming AJAX response or no view.");
                return; // 추가 작업 없이 종료
            }
            // 리다이렉트 처리
            if (callPage.startsWith("redirect:")) {
                String redirectUrl = callPage.substring("redirect:".length());
                // 컨텍스트 경로를 자동으로 추가
                if (!redirectUrl.startsWith("/")) {
                    redirectUrl = "/" + redirectUrl;
                }
                response.sendRedirect(contextPath + redirectUrl);
            } else {
                // 포워드 처리
                RequestDispatcher dispatcher = request.getRequestDispatcher(callPage);
                dispatcher.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
    }

}
