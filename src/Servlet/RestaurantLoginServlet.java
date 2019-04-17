package Servlet;

import Entity.Restaurant;
import Service.LoginService;
import ServiceImpl.LoginServiceImpl;
import com.google.gson.Gson;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Service.LoginService;

@WebServlet("/RestaurantLoginServlet")
public class RestaurantLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RestaurantLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
/*		ServletContext Context= getServletContext();
		int webCounter= Integer.parseInt((String) Context.getAttribute("webCounter"));
		if (null == request.getParameter("Logout")) {
			System.out.println("pageCounter++\n");
			webCounter++;
			Context.setAttribute("webCounter", Integer.toString(webCounter));
		}*/

        String login = "";
        HttpSession session = request.getSession(false);
        Cookie cookie = null;
        Cookie[] cookies = request.getCookies();

        Integer ival = new Integer(1);

        if (null != cookies) {
            // Look through all the cookies and see if the
            // cookie with the login info is there.
            for (int i = 0; i < cookies.length; i++) {
                cookie = cookies[i];
                if (cookie.getName().equals("LoginCookie")) {
                    login = cookie.getValue();
                    break;
                }
            }
        }

        // Logout action removes session, but the cookie remains
        if (null != request.getParameter("Logout")) {
            if (null != session) {
                session.invalidate();
                session = null;
            }
        }

        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.println("<html><body>");

        out.println(
                "<form method='POST' action='"
                        + response.encodeURL(request.getContextPath() + "/ShowMyStockServlet")
                        + "'>");
        out.println(
                "login: <input type='text' name='login' value='" + login + "'>");
        out.println(
                "password: <input type='password' name='password' value=''>");
        out.println("<input type='submit' name='Submit' value='Submit'>");

        out.println("<p>Servlet is version @version@</p>");
//    out.println("</p>You are visitor number " + webCounter);


        out.println("</form></body></html>");

    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("UTF-8");
        String name;
        String chaptcha;
        String restaurant;
        LoginService loginService = new LoginServiceImpl();
        name = request.getParameter("name");
        chaptcha = request.getParameter("chaptcha");
        //System.out.println(name);
        //System.out.println(password);
        try {
            restaurant = loginService.RestaurantLogin(name, chaptcha);
            System.out.println(restaurant);
            PrintWriter write = response.getWriter();
            Gson gson=new Gson();
            String str=gson.toJson(restaurant);
            //System.out.println(str);
            write.write(str); // 将结果返回到前端页
            write.close();


        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}