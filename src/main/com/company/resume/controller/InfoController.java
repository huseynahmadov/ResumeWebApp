package main.com.company.resume.controller;


import com.company.dao.inter.UserDaoInter;
import com.company.main.Context;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "InfoController", urlPatterns = {"/info"})
public class InfoController extends HttpServlet {

    private UserDaoInter userDao = Context.instanceUserDao();



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("info.jsp").forward(request, response);

    }
}
