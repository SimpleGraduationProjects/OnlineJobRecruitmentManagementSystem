<%@ page contentType="text/html;charset=utf-8" language="java" import="com.jspsmart.upload.*"%>
<%@ page import="com.jspsmart.upload.*"%>
<%@ page import="java.util.*"%>
<%
String path = request.getContextPath();
%>
<%
    
    String newFile1Name=null;
    String file_name=null;
    String fname = request.getParameter("tname");
    //System.out.print("fname==" + fname);
	SmartUpload mySmartUpload = new SmartUpload();
    int file_size = 0;
	//初始化上传
	mySmartUpload.initialize(pageContext);

	//只允许上载此类文件
	try 
	{
		//mySmartUpload.setAllowedFilesList("jpg,Jpg,JPG,GIF,gif,Gif,png");
		mySmartUpload.upload();
	} 
	catch (Exception e)
    {
         e.printStackTrace();
		 //out.println("<script language=javascript>alert('上传格式错误！');   history.back(-1);</script>");
		// return;
	}
	
	try 
	{
		   com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(0);
		   if (myFile.isMissing())
		   {
			  out.println("<script language=javascript>alert('必须选择文件！');   history.back(-1);</script>");
			  return;

		   } 
		   else 
		   {
			   file_size = myFile.getSize(); //取得文件的大小 (单位是b) 
			   file_name=myFile.getFileName();
			   //System.out.println("文件大小："+file_size+"文件名称："+file_name);
			   if (file_size > 10*1024*1024*100)
			   {
				  out.println("<script language=javascript>alert('上传文件大小应控制在100M之内！');   history.back(-1);</script>");
				  return;
			   }
               else
               {
                   newFile1Name=new Date().getTime()+file_name.substring(file_name.indexOf("."));
	               //System.out.println("新文件名称："+newFile1Name);
				
				   String saveurl = request.getSession().getServletContext().getRealPath("upload");
				
				   saveurl = saveurl+"/"+newFile1Name;
				   myFile.saveAs(saveurl, mySmartUpload.SAVE_PHYSICAL);
	
               }
			} 
	  } 
	  catch (Exception e)
	  {
	    e.printStackTrace();
	    e.toString();
	  }
%>

<script language="javascript">
    document.write("上传成功");
    var tname = '<%=fname%>';
	window.parent.document.getElementById(tname).value="/upload/<%=newFile1Name%>";
	window.parent.popupClose();
	if(window.parent.document.getElementById("fsize")!=null){
	    window.parent.document.getElementById("fsize").value="<%=file_size%>";
	    
	}

</script>
