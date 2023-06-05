package com.ezen.member.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ezen.member.dao.MemberDao;
import com.ezen.member.dto.MemberDto;
import departDAO.Depart_memberDAO;
import departDTO.Depart_memberDTO;

import departDAO.Depart_memberDAO;

public class departAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Depart_memberDAO deaprt_memberD = Depart_memberDAO.getInstance();
		Depart_memberDTO deaprt_memberT = new Depart_memberDTO();
		deaprt_memberT.setD_code(request.getParameter("u_code"));
		deaprt_memberT.setUserid(request.getParameter("userid"));
		deaprt_memberT.setD_name(request.getParameter("d_name"));
		deaprt_memberT.setD_task(request.getParameter("d_task"));
		deaprt_memberT.setD_date(request.getParameter("d_date"));

		
		int result = deaprt_memberD.insertDepart_Member(deaprt_memberT);
		if(result==1) request.setAttribute("message", "회원가입 완료. 로그인하세요.");
		else request.setAttribute("message", "회원가입 실패. 관리자에게 문의하세요.");
		
		//RequestDispatcher dp = request.getRequestDispatcher("member/loginForm.jsp");
		//dp.forward(request, response);
		
		//리퀘스트 포워딩으로 insert하고 이동한 경우, 새로고침(f5)를 누르면 request에 담겨있는 같은 값으로
		//insert하는 동작이 다시 동작합니다. 그래서 기본키 또는 unique 값 제약조건에 위배되는 경우가 많습니다.
		//따라서 insert명령에 한해서만 response.sendRedirect로 이동합니다.
		response.sendRedirect("member.do?command=loginForm");
	}
}
