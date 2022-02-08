<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String fname = request.getParameter("fname");
String pt = request.getParameter("pt")==null?"0":request.getParameter("pt");
int ty = Integer.parseInt(pt);
 
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=path %>/theme/base.css" />
    <script language="javascript">
        function check()
        {
            if(document.formAdd.<%=fname%>.value=="")
            {
                alert("请选择文件");
                return false;
            }
            var fname = document.formAdd.<%=fname%>.value;
            var fileend = fname.substring(fname.indexOf("."));  
            <%
               if(ty==1){
                  %>
                    var isnext = false;
                    var filetypes =[".jpg",".png"];   
                    for(var i =0; i<filetypes.length;i++){   
						if(filetypes[i]==fileend){   
						  isnext = true;   
						  break;
						 }   
					}   
                    if(!isnext){
                       alert("只能上传.jpg,.png格式的图片");
                       return false;
                    }
                  <%
               }
            %> 
            
            
            
            
             <%
               if(ty==2){
                  %>
                    var isnext = false;
                    var filetypes =[".mp4",".avi",".rmvb",".wmv"];   
                    for(var i =0; i<filetypes.length;i++){   
						if(filetypes[i]==fileend){   
						  isnext = true;   
						  break;
						 }   
					}   
                    if(!isnext){
                       alert("只能上传.mp4 .avi .rmvb .wmv格式的视频");
                       return false;
                    }
                  <%
               }
            %> 
            
            return true;
        }
    </script>
  </head>
  
  <body>                                                                                                      
       <form action="<%=path %>/upload/upload_re.jsp?tname=<%=fname%>" name="formAdd" method="post"  enctype="multipart/form-data">
       
           <input type="file" name="<%=fname%>" id="<%=fname%>" onKeyDown="javascript:alert('此信息不能手动输入');return false;" />
           <input type="submit" value="提交" onclick="return check()"/>
       </form>
  </body>
</html>
