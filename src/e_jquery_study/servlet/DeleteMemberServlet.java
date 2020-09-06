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

@WebServlet("/deleteMember.do")
public class DeleteMemberServlet extends HttpServlet {
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
	    HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        
        
        Employee emp = new Employee(email);
        int res = service.removeEmployee(emp);
        
        if (res == 1) session.invalidate();
        
        System.out.println("res : " + res );

        PrintWriter pw = response.getWriter();
        pw.print(res);
        pw.flush();
    }

}
