<%@ page language="java" import="java.util.*,java.sql.*,gdqy.edu.cn.DBhelper.*,gdqy.edu.cn.util.*" pageEncoding="gbk"%>
<%@page import="gdqy.edu.cn.serviceImp.AdminService;"%>
<%
response.setCharacterEncoding("UTF-8");
request.setCharacterEncoding("UTF-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String username = (String) request.getSession().getAttribute("username");
if(username==null){
		%>
		<script language="javascript">
			parent.window.location.href="../net.jsp";
			</script>
		<%
			return;
			}	

String bill_id="";
String area1="";
String area2="";
String building="";
String floor="";
String room="";
String description="";
String jinji="";
String bz_phone="";
String bz_name="";
String order_time="";
String weixiu_name="";
String address="";
String reg_time="";
String miaoshu="";


//��¼��־
			String user_name=(String)request.getSession().getAttribute("username");
			String name1=(String)request.getSession().getAttribute("name");
			 (new AdminService()).log(user_name,name1,"���޵���ӡ",(new getRemortIP()).getRemoteAddress(request),(String)request.getSession().getAttribute("sys"));



String ids =request.getParameter("ids");
String []id=ids.split(",");
String sql ="select * from t_bill where";
for(int i=0;i<id.length;i++){
sql=sql+" id="+id[i]+"   or ";
}
sql=sql.substring(0,sql.length()-5);
sql=sql+" order by weixiu_id,id";
//System.out.println(sql);
ResultSet rs = DBHelper.getConnection().createStatement().executeQuery(sql);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>"> 
    
    
    <title>���޵���ӡ</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	
	-->
	<script type="text/javascript" src="js/adapter/ext/ext-base.js"></script>
		<!-- ENDLIBS -->

		<script type="text/javascript" src="js/ext-all.js"></script>
		<script type="text/javascript" src="js/src/locale/ext-lang-zh_CN.js"></script>
	<style type="text/css">
 table tr td{
font-size:12px;
text-align:center;

}
	</style>
<script type="text/javascript" language="javascript">  
var hkey_root,hkey_path,hkey_key
hkey_root="HKEY_CURRENT_USER"
hkey_path="\\Software\\Microsoft\\Internet Explorer\\PageSetup\\"
//������ҳ��ӡ��ҳüҳ��Ϊ��
function pagesetup_null()
{
  try{
    var RegWsh = new ActiveXObject("WScript.Shell")
    hkey_key="header"    
    RegWsh.RegWrite(hkey_root+hkey_path+hkey_key,"")
    hkey_key="footer"
    RegWsh.RegWrite(hkey_root+hkey_path+hkey_key,"")
  }catch(e){}
}
//������ҳ��ӡ��ҳüҳ��ΪĬ��ֵ
function pagesetup_default()
{
  try{
    var RegWsh = new ActiveXObject("WScript.Shell")
    hkey_key="header"    
    RegWsh.RegWrite(hkey_root+hkey_path+hkey_key,"&w&bҳ�룬&p/&P")
    hkey_key="footer"
    RegWsh.RegWrite(hkey_root+hkey_path+hkey_key,"&u&b&d")
  }catch(e){}
}

function  printPage(){ 
pagesetup_null()
 
  var newWin=window.open('about:blank', '', '');    
  var titleHTML=document.getElementById("printid").innerHTML;    
  newWin.document.write(titleHTML);    
  newWin.document.location.reload();  
  //newWin.document.getElementById('printid').style.fontSize='10px';  
  newWin.print();   
  pagesetup_default() 
}   
</script>   

  </head>
  
  <body>
  

 <div id="printid" algin="center"> 
			 <%
			 int point=0;
			 while(rs.next()){
			 bill_id=rs.getString("id");
			 area1=rs.getString("area1_name");
			 area2=rs.getString("area2_name");
			 building=rs.getString("building_name");
			 order_time=rs.getString("order_time");
			 floor=rs.getString("floor");
			 room=rs.getString("room");
			 address=area2+building+floor+room;
			 miaoshu = rs.getString("descriptions");
			 description=rs.getString("project1_name").trim();
			 jinji=rs.getString("jinji").equals("0")?"һ��":"����";
			 bz_phone=rs.getString("bz_phone");
			 bz_name=rs.getString("bz_name");
			 reg_time=rs.getString("order_date").substring(5,16);
			 weixiu_name=rs.getString("weixiu_name");
			  %>
	
			  <div>
<h3 align="center">ά&nbsp;&nbsp;��&nbsp;&nbsp;��</h3>
<h5 align="center">����:<%=bill_id%> &nbsp;&nbsp;&nbsp; ��ӡʱ��:<script src="admin/myjs/date.js"></script></h5>
<table style="font-size:12px;text-align:center;" width="95%" border="1" align="center" cellpadding="1" cellspacing="0">
  <tr>
    <td width="9%" height="25">�û�����</td>
    <td colspan="2"><%=bz_name%></td>
    <td width="11%">�û���ַ</td>
    <td colspan="2"><%=address%></td>
    <td width="11%">��ϵ�绰</td>
    <td colspan="1"><%=bz_phone%></td>
  </tr>
  <tr>
   <td width="9%" rowspan="3">������Ŀ</td>
   <td width="16%" rowspan="3"><%=description%></td>
   
   <td width="9%" height="25">ԤԼʱ��</td>
   <td width="11%" ><%=order_time%></td>
   
    <td width="12%" >����ʱ��</td>
	<td width="12%" >&nbsp;</td>
	  <td width="11%" >ȷ����</td>
	   <td >&nbsp;</td>
  </tr>
  <tr>
  <td width="9%" height="25">��¼ʱ��</td>
   <td  colspan="2">&nbsp;</td>
   
    <td width="12%" >��¼��</td>
	<td  colspan="2">&nbsp;</td>
	 
  </tr>
  <tr>
  <td width="9%" height="25">�ӵ�ʱ��</td>
   <td  colspan="2">&nbsp;</td>
   
    <td width="12%" >�ӵ���</td>
	<td  colspan="2">&nbsp;</td>
  </tr>
  
  <tr>
   <td width="9%" rowspan="2">ά����Ŀ</td>
   <td width="16%" rowspan="2">&nbsp;</td>
   
   <td width="9%" height="25">����ʱ��</td>
   <td  colspan="2">&nbsp;</td>
   
    <td width="12%">ά�޹�ʱ</td>
	<td  colspan="2">&nbsp;</td>
	
  </tr>
  <tr>
  <td width="9%" height="25">�깤ʱ��</td>
   <td  colspan="2">&nbsp;</td>
    <td width="12%" >ά����</td>
	<td  colspan="2"><%=weixiu_name%></td>
  </tr>
  <tr>
  <td height="25">��������</td>
  <td>�����ṩ��</td>
  <td>���</td>
  <td>����</td>
  <td>����(Ԫ)</td>
  <td>�Ƽ�(Ԫ)</td>
  <td colspan="2">��ע</td>
  </tr>
  
  <tr>
  <td height="25">&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
  <td height="25">&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
  <td height="25">&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
  <td height="25">&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
  <td height="25">&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
  <td height="25">&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
  <td height="25">��������</td>
  <td colspan="7">&nbsp;</td>
  </tr>
  <tr>
  <td height="25">�û����</td>
  <td colspan="2">&nbsp;</td>
  <td>�ط�ʱ��</td>
  <td>&nbsp;</td>
  <td>�û�ǩ��</td>
  <td colspan="2">&nbsp;</td>
  </tr>
</table>
</div>
<h5 align="center">��&nbsp;&nbsp;һ&nbsp;&nbsp;��</h5>
<br/>
<br/>
<hr>
  <div>
<h3 align="center">ά&nbsp;&nbsp;��&nbsp;&nbsp;��</h3>
<h5 align="center">����:<%=bill_id%> &nbsp;&nbsp;&nbsp; ��ӡʱ��:<script src="admin/myjs/date.js"></script></h5>
<table style="font-size:12px;text-align:center;" width="95%" border="1" align="center" cellpadding="1" cellspacing="0">
  <tr>
    <td width="9%" height="25">�û�����</td>
    <td colspan="2"><%=bz_name%></td>
    <td width="11%">�û���ַ</td>
    <td colspan="2"><%=address%></td>
    <td width="11%">��ϵ�绰</td>
    <td colspan="1"><%=bz_phone%></td>
  </tr>
  <tr>
   <td width="9%" rowspan="3">������Ŀ</td>
   <td width="16%" rowspan="3"><%=description%></td>
   
   <td width="9%" height="25">ԤԼʱ��</td>
   <td width="11%" ><%=order_time%></td>
   
    <td width="12%" >����ʱ��</td>
	<td width="12%" >&nbsp;</td>
	  <td width="11%" >ȷ����</td>
	   <td >&nbsp;</td>
  </tr>
  <tr>
  <td width="9%" height="25">��¼ʱ��</td>
   <td  colspan="2">&nbsp;</td>
   
    <td width="12%" >��¼��</td>
	<td  colspan="2">&nbsp;</td>
	 
  </tr>
  <tr>
  <td width="9%" height="25">�ӵ�ʱ��</td>
   <td  colspan="2">&nbsp;</td>
   
    <td width="12%" >�ӵ���</td>
	<td  colspan="2">&nbsp;</td>
  </tr>
  
  <tr>
   <td width="9%" rowspan="2">ά����Ŀ</td>
   <td width="16%" rowspan="2">&nbsp;</td>
   
   <td width="9%" height="25">����ʱ��</td>
   <td  colspan="2">&nbsp;</td>
   
    <td width="12%">ά�޹�ʱ</td>
	<td  colspan="2">&nbsp;</td>
	
  </tr>
  <tr>
  <td width="9%" height="25">�깤ʱ��</td>
   <td  colspan="2">&nbsp;</td>
    <td width="12%" >ά����</td>
	<td  colspan="2"><%=weixiu_name%></td>
  </tr>
  <tr>
  <td height="25">��������</td>
  <td>�����ṩ��</td>
  <td>���</td>
  <td>����</td>
  <td>����(Ԫ)</td>
  <td>�Ƽ�(Ԫ)</td>
  <td colspan="2">��ע</td>
  </tr>
  
  <tr>
  <td height="25">&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
  <td height="25">&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
  <td height="25">&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
  <td height="25">&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
  <td height="25">&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
  <td height="25">&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
  <td height="25">��������</td>
  <td colspan="7">&nbsp;</td>
  </tr>
  <tr>
  <td height="25">�û����</td>
  <td colspan="2">&nbsp;</td>
  <td>�ط�ʱ��</td>
  <td>&nbsp;</td>
  <td>�û�ǩ��</td>
  <td colspan="2">&nbsp;</td>
  </tr>
</table>
</div>
<h5 align="center">��&nbsp;&nbsp;��&nbsp;&nbsp;��</h5>
<%
if(point++<(id.length-1)){
 %>
	<div  style="page-break-before:always;"><br/></div>	 
			 <% 
			}
			 }
			 
			 %>
 

  </div>
  <hr>
  <div algin="center"  style="text-align:center">
  
  <input type="button" value="��ӡ"  onclick= "printPage()"/>
  </div>
  </body>
</html>
