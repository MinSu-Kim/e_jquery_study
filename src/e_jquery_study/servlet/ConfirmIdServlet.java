package e_jquery_study.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import e_jquery_study.dto.Employee;
import e_jquery_study.service.JoinService;

@WebServlet("/confirmId.do")
public class ConfirmIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private JoinService service;
	
	@Override
    public void init() throws ServletException {
        service = new JoinService();
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    process(request, response);	    
	}

   private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String email = request.getParameter("email");
        System.out.println("email : " + email);
        
        int res = service.checkConfirmByEmail(new Employee(email));
        System.out.println("res : " + res);
        
        response.setContentType("text/plain");
       
        PrintWriter pw = response.getWriter();
        pw.print(res);
        pw.flush();
    }
}
