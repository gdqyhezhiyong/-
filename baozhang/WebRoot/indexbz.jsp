<%@page 
	language="java"
	contentType="text/html; charset=gb2312"
	pageEncoding="GB2312"	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>�㶫�Ṥְҵ����ѧԺͳһ�����֤ϵͳ</title>


<meta name="copyright" content="�㶫�Ṥҵ����ѧԺ"/>
<meta name="keywords" content="�㶫�Ṥҵ����ѧ"/>
<meta name="description" content="�㶫�Ṥҵ����ѧԺ"/>


<link href="style/loginbz.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
<!--

#login-table input {
   border:1px solid #bfbfc7;
}
.STYLE21 {font-size: 12px; color: #000433; font-family: "Courier New", Courier, monospace; font-weight: bold; }
.STYLE22 {font-size: 12px; color: #1B517E; font-family: "Courier New", Courier, monospace; font-weight: bold; }
-->

a{text-decoration:none}a:hover{text-decoration:underline}
</style>

</head>

<body >

<%  String goUrl=request.getParameter("goto");
%>
<form name="form1" method="post" action="MyJsp.jsp">
<div class="mainDiv">
	<div class="top">
    	<ul>
        	<li class="login logo"><a width="444px" href="#"></a></li>
        	<li class="setindex"></li>
        </ul>
    </div>
    <div class="login_middle">
    	<ul>
        	<li class="leftpicture"></li>
            <li class="logininfo">
            	<ul>
                	<li class="l"></li>
                	<li class="m">
                    	<ul>
                        	<li class="info"></li>
                        	<li class="txt">�û�����<input type="text" name="username" size="16"   id="username" ></li>
                        	<li class="txt">�ܡ��룺<input type="password" name="password" size="16" id="password"  >  </li><li><input type="hidden" name="goto" value=<%=goUrl%> ><font color="#FF0000"></font></li>
                            <li class="btn">
                                <input type="submit" name="btn"  tabindex="4"  class="login" value="�ǡ�¼" />��
                                <input class="reset" tabindex="5" type="reset" value="�ء���" /></li>
                            <li>
                               
                            </li>
                        </ul>
                    </li>
                	<li class="r"></li>
                </ul>
            </li>
        </ul>
        <ul class="schoolinfo">
        	<li class="idea">
              <p>��ѧ���<br />
              ������Ϊ�����߼���Ϊ��<br />
              �߾�ҵ���򡡴��´ٷ�չ</p>
            </li>
        	<li class="thought">
            	<p>��ѧ˼�룺<br />
                ֲ�������Ļ�������ְ�̾���<br />
                ���켼��Ӣ�ţ�������ְ��У</p>
            </li>
        	<li class="explain">
            	<p><font color="#FF0000">*</font>�û��������������ֻ�У԰��Ϣ�Ż�����ͬ�� <br/>
					<font color="#FF0000">*</font>�̹��û���Ϊ10λ�Ľ̹���ţ�ѧ���û���Ϊѧ�š�<br />
                <font color="#FF0000">*</font>��ʼ����Ϊ15λ���֤�ĺ�6λ��18λ���֤�ĺ�6λ������X��Ϊ��д��<br />
					
                <!--<font color="#FF0000">*</font> ���޷��һ�����,�����Ч֤���޸�ͳһ�����֤���롣--></p>
            </li>
        </ul>
    <div class="login_bottom">��Ȩ���У��㶫�Ṥְҵ����ѧԺ ��ϵ��ַ���������¸���·152�� �ʱࣺ510300</div>
    </div>
</div>
</form>

</body>
</html>



