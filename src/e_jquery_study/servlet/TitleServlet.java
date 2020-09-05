package e_jquery_study.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import e_jquery_study.dto.Title;
import e_jquery_study.service.TitleService;

@WebServlet("/TitleServlet")
public class TitleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private TitleService service;

    public void init() throws ServletException {
        service = new TitleService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        process(request, response);
    }

    private void process(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Title> list = service.getTitleList();
        Gson gson = new Gson();
        String result = gson.toJson(list, new TypeToken<List<Title>>() {
        }.getType());
        System.out.println(result);

        response.setContentType("application/json");
//	        response.setCharacterEncoding("UTF-8");

        PrintWriter pw = response.getWriter();
        pw.print(result);
        pw.flush();

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        process(request, response);
    }
}