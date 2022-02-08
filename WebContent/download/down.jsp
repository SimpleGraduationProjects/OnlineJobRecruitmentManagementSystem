<%@ page language="java" import="java.util.*"
	contentType="application/x-msdownload" pageEncoding="UTF-8"%>

<%@page import="java.net.*"%>
<%@page import="java.io.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">


	</head>

	<body>
		<%
			//使用文件流输出的方式下载 
			response.reset(); //取消文件开始的空白行 
			response.setContentType("application/x-download"); //设置mime类型 
			String pathinfo=request.getParameter("path");
			
			String fileName = (String) request.getSession().getServletContext()
					.getRealPath(pathinfo); //取得下载文件的绝对路径+文件名 
			File file=new File(fileName);
			String fileDisplay = "";
			if(file.exists()){
			 fileDisplay= file.getName();
			}
			
			 //下载名称描述 
			fileDisplay = URLEncoder.encode(fileDisplay, "UTF-8"); //转码 
			response.setHeader("Content-Disposition", "attachment;filename="
					+ fileDisplay);
			OutputStream os = null;
			FileInputStream is = null;

			try {

				os = response.getOutputStream();
				is = new FileInputStream(fileName);

				byte[] bt = new byte[1024];
				int i = 0;
				while ((i = is.read(bt)) > 0) {

					os.write(bt, 0, i);
				}

				os.flush();
				out.clear();
				out = pageContext.pushBody();

			} catch (Exception e) {
				e.printStackTrace();

			} finally {

				if (is != null) {

					is.close();
					is = null;
				}

				if (os != null) {

					os.close();
					os = null;
				}
			}
		%>
	</body>
</html>
