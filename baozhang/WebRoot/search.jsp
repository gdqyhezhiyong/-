<%@page 
	language="java"
	contentType="text/html; charset=GB2312"
	pageEncoding="GB2312"
	import="com.wiscom.is.*, java.net.*,java.util.*"
%>

<%
        String user_name="";
        String group="";
        String  gId="";
        String  attr="";
        List gList=null;
	String is_config = request.getRealPath("/client.properties");
    Cookie all_cookies[] = request.getCookies();
    Cookie myCookie;
    String decodedCookieValue = null;
    if (all_cookies != null) {
        for(int i=0; i< all_cookies.length; i++) {
            myCookie = all_cookies[i];

            if( myCookie.getName().equals("iPlanetDirectoryPro") ) {
                decodedCookieValue = URLDecoder.decode(myCookie.getValue(),"GB2312");
            }
        }
    }
	IdentityFactory factory = IdentityFactory.createFactory( is_config );
	IdentityManager im = factory.getIdentityManager();
	String curUser = "";
	if (decodedCookieValue != null ) {
    	curUser = im.getCurrentUser( decodedCookieValue );
        user_name = im.getUserNameByID(curUser);
        group = im.getUserGroup(curUser ).toString();
        gId = im.getGroupByID(curUser).toString();
        gList = im.getGroups();
for(int i=0;i<gList .size();i++){
String g1=gList.get(i).toString();
%>
<p> �û���:<%= g1%></p>

<%
}
attr = im.getUserAttribute(curUser , null).toString();
%>

<p> �û�����:<%= attr %></p>
<%


    }
	
	if ( curUser.length()==0 ){
%>
	<jsp:forward page="index.jsp"/>		
<%	
		return;
	}


%>
<html>
<body>
<div align="center">
<p> �ʺ�:<%= curUser %></p>
<p> ����:<%=user_name %></p>
<p> �û�����:<%=group%></p>
<p> �û���id:<%=gId%></p>


</div>
</body>
</html>