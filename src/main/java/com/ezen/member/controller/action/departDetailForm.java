package com.ezen.member.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import departDAO.Depart_memberDAO;
import departDTO.Depart_memberDTO;

public class departDetailForm implements Action {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userid = request.getParameter("userid");

        Depart_memberDAO memberDAO = Depart_memberDAO.getInstance();
        Depart_memberDTO member = memberDAO.getDepartMemberById(userid);

        // JSP로 데이터 전달
        request.setAttribute("depart_member", member);

        String url = "/depart/departDetail.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}