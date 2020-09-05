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

@WebServlet("/registerEmp.do")
public class RegisterEmpServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private JoinService service;

    @Override
    public void init() throws ServletException {
        service = new JoinService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        process(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        process(request, response);
    }

    private void process(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Gson gson = new Gson();
        Employee newEmp = gson.fromJson(new InputStreamReader(request.getInputStream()), Employee.class);
        System.out.println(newEmp);
        int res = service.joinEmployee(newEmp);
        
        response.setContentType("text/plain");
       
        PrintWriter pw = response.getWriter();
        pw.print(res);
        pw.flush();
    }
}
