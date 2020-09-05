package e_jquery_study.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import e_jquery_study.dto.Employee;
import e_jquery_study.service.JoinService;

@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
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
        String passwd = request.getParameter("passwd");
        
        System.out.println("email : " + email + " passwd : " + passwd);
        
        Employee emp = new Employee(email);
        emp.setPasswd(passwd);;
        int res = service.loginEmployee(emp);
        System.out.println("res : " + res);
        if (res == 1) {
            HttpSession session = request.getSession();
            session.setAttribute("email", email);
        }
        response.setContentType("text/plain");
        
        PrintWriter pw = response.getWriter();
        pw.print(res);
        pw.flush();
    }
	
}
