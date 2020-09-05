package e_jquery_study.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import e_jquery_study.dto.Title;
import e_jquery_study.service.TitleService;

@WebServlet("/TitleAddServlet")
public class TitleAddServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private TitleService service;

    @Override
    public void init() throws ServletException {
        service = new TitleService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int nextNo = service.getNextTitleNo();
        
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        PrintWriter pw = response.getWriter();
        pw.print(nextNo);
        pw.flush();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("doPost()");
        
        Title newTitle = getTitle(request);
        int res = service.addTitle(newTitle);
        
        Gson gson = new Gson();
        JsonObject object = new JsonObject();
        object.addProperty("res", res);
        String json = gson.toJson(object);
        System.out.println(json);
        
        response.setContentType("application/json");
        response.setHeader("Cache-Control", "no-cache");
        PrintWriter pw = response.getWriter();
        pw.print(json);
        pw.flush();
        
    }

    private Title getTitle(HttpServletRequest request) throws UnsupportedEncodingException, IOException {
        Title newTitle;
        try {
            int titleNo = Integer.parseInt(request.getParameter("titleNo"));
            String titleName = request.getParameter("titleName");
            newTitle = new Title(titleNo, titleName);
        }catch(Exception e) {
            BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream(), "UTF-8"));
            String line = null;
            StringBuilder sb = new StringBuilder();
            while ((line = br.readLine()) != null) {
                sb.append(line);
            }

            Gson gson = new Gson();
            newTitle = gson.fromJson(sb.toString(), Title.class);
        }
        
        return newTitle;
    }

}
