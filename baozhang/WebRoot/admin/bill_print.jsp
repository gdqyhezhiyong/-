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
			parent.window.location.href="../login.jsp";
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
String weixiu_date="";


//��¼��־
			String user_name=(String)request.getSession().getAttribute("username");
			String name1=(String)request.getSession().getAttribute("name");
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
  pagesetup_default();
  var conn = new Ext.data.Connection();    
           conn.request( 
                  {  
                     url: "servlet/SetPrintedServlet", //�ύ�ĺ�̨��ַ     
                     params:{
                    id:'<%=ids%>',
                    sys:'0'
                     },       
                      method: 'post',  
                      scope: this,     
                      success:function(response){ 
                      
             },         
        failure: function() { }��
�� }
);
      
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
			 weixiu_date=rs.getString("weixiu_date");
			 order_time=rs.getString("order_time");
			 floor=rs.getString("floor");
			 room=rs.getString("room");
			 address=area2+building+floor+room;
			 miaoshu = rs.getString("descriptions");
			 description=rs.getString("project1_name").trim()+"-"+rs.getString("project2_name").trim()+"-"+rs.getString("project3_name").trim();
			 jinji=rs.getString("jinji").equals("0")?"һ��":"����";
			 bz_phone=rs.getString("bz_phone");
			 bz_name=rs.getString("bz_name");
			 reg_time=rs.getString("order_date").substring(0,16);
			 weixiu_name=rs.getString("weixiu_name");
			  %>

			  <div>
			  	<br/>
			  	<br/>
<h3 align="center">ά&nbsp;&nbsp;��&nbsp;&nbsp;��</h3>
<h5 align="center">����:<%=bill_id%> &nbsp;&nbsp;&nbsp; ��ӡʱ��:<script src="admin/myjs/date.js"></script></h5>
<table style="font-size:12px;text-align:center;" width="95%" border="1" align="center" cellpadding="1" cellspacing="0">
  <tr>
    <td width="9%" height="25">����������</td>
    <td colspan="2"><%=bz_name%></td>
    <td width="11%">�����˵�ַ</td>
    <td colspan="2"><%=address%></td>
    <td width="11%">��������ϵ�绰</td>
    <td colspan="1"><%=bz_phone%></td>
  </tr>
  <tr>
   <td width="9%" rowspan="2">������Ŀ</td>
   <td width="16%" rowspan="2"><%=description%></td>
   
   <td width="9%" height="25">ԤԼ����</td>
   <td width="11%" ><%=weixiu_date%></td>
   
    <td width="12%" >ԤԼʱ���</td>
	<td width="12%" ><%=order_time%></td>
	  <td width="11%" >�����̶�</td>
	   <td ><%=jinji%></td>
  </tr>
  
  <tr>
  <td width="9%" height="25">�ӵ�ʱ��</td>
   <td  width="11%">&nbsp;</td>
   
    <td width="12%" >�ӵ�������</td>
	<td  width="12%">&nbsp;</td>
	 <td width="5%" >����ʱ��</td>
	   <td ><%=reg_time%></td>
  </tr>
  
  <tr>
   <td width="9%" rowspan="2">��������</td>
   <td width="16%" rowspan="2"><%=miaoshu%></td>
   
   <td width="9%" height="25">����ʱ��</td>
   <td  colspan="2">&nbsp;</td>
   
    <td width="12%">ά�޹�ʱ</td>
	<td  colspan="2">&nbsp;</td>
	
  </tr>
  <tr>
  <td width="9%" height="25">�깤ʱ��</td>
   <td  colspan="2">&nbsp;</td>
    <td width="12%" >ά��������</td>
	<td  colspan="2">&nbsp;</td>
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
<hr>
<br/>
<br/>
  <div>
<h3 align="center">ά&nbsp;&nbsp;��&nbsp;&nbsp;��</h3>
<h5 align="center">����:<%=bill_id%> &nbsp;&nbsp;&nbsp; ��ӡʱ��:<script src="admin/myjs/date.js"></script></h5>
<table style="font-size:12px;text-align:center;" width="95%" border="1" align="center" cellpadding="1" cellspacing="0">
  <tr>
    <td width="9%" height="25">����������</td>
    <td colspan="2"><%=bz_name%></td>
    <td width="11%">�����˵�ַ</td>
    <td colspan="2"><%=address%></td>
    <td width="11%">��������ϵ�绰</td>
    <td colspan="1"><%=bz_phone%></td>
  </tr>
  <tr>
   <td width="9%" rowspan="2">������Ŀ</td>
   <td width="16%" rowspan="2"><%=description%></td>
   
   <td width="9%" height="25">ԤԼ����</td>
   <td width="11%" ><%=weixiu_date%></td>
   
    <td width="12%" >ԤԼʱ���</td>
	<td width="12%" ><%=order_time%></td>
	  <td width="5%" >�����̶�</td>
	   <td ><%=jinji%></td>
  </tr>
  
  <tr>
  <td width="9%" height="25">�ӵ�ʱ��</td>
   <td  width="11%">&nbsp;</td>
   
    <td width="12%" >�ӵ�������</td>
	<td  width="12%">&nbsp;</td>
	 <td width="5%" >����ʱ��</td>
	   <td ><%=reg_time%></td>
  </tr>
  
  <tr>
   <td width="9%" rowspan="2">��������</td>
   <td width="16%" rowspan="2"><%=miaoshu%></td>
   
   <td width="9%" height="25">����ʱ��</td>
   <td  colspan="2">&nbsp;</td>
   
    <td width="12%">ά�޹�ʱ</td>
	<td  colspan="2">&nbsp;</td>
	
  </tr>
  <tr>
  <td width="9%" height="25">�깤ʱ��</td>
   <td  colspan="2">&nbsp;</td>
    <td width="12%" >ά��������</td>
	<td  colspan="2">&nbsp;</td>
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
