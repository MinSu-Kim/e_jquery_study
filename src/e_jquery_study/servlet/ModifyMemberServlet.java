package e_jquery_study.servlet;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import e_jquery_study.dto.Employee;
import e_jquery_study.service.JoinService;

@WebServlet("/modifyMember.do")
public class ModifyMemberServlet extends HttpServlet {
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
        
	    Gson gson = new Gson();

        Employee emp = gson.fromJson(new InputStreamReader(request.getInputStream()), Employee.class);
        System.out.println(emp);
        int res = service.modifyEmployee(emp);
        
        response.setContentType("text/plain");
       
        PrintWriter pw = response.getWriter();
        pw.print(res);
        pw.flush();
    }
}
