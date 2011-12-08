<%@ page contentType="text/html; encoding=utf-8"%><%
	Context context = (Context) (new InitialContext())
			.lookup("java:comp/env");
	// datasource.jsp?ds=jdbc/user2
	String dsName = request.getParameter("ds");
%><%
	try {
		BasicDataSource ds = (BasicDataSource)context.lookup(dsName);
%><pre>
Datasource = <%=dsName%>
------------------------
Url: <%=ds.getUrl()%>
Max Active: <%=ds.getMaxActive()%>
Number Active: <%=ds.getNumActive()%>
Number Idle: <%=ds.getNumIdle()%>
Max Wait: <%=ds.getMaxWait() %>ms

Remove Abandoned: <%=ds.getRemoveAbandoned()%>
Remove Abandoned Timeout: <%=ds.getRemoveAbandonedTimeout()%>s
Log Abandoned: <%=ds.getLogAbandoned()%>
</pre>
<%
	} catch (Exception ex) {
%>Datasource = <%=dsName%><br>
<b><font color="red"><%=ex%></font></b><br>
<%
	}
%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="org.apache.tomcat.dbcp.dbcp.BasicDataSource"%>
<!--
Context 4 Tomcat V6.0.x

<Context docBase="TM" path="/TM"  reloadable="true" antiResourceLocking="false" privileged="true" >
		
	<Resource name="jdbc/user2" auth="Container"
		      type="javax.sql.DataSource" driverClassName="oracle.jdbc.OracleDriver"
		      url="jdbc:oracle:thin:@127.0.0.1:1521:mysid"
		      username="scott" password="tiger" maxActive="20" maxIdle="10"
		      maxWait="-1"/> 
</Context>
-->
<!--
Context 4 Tomcat V5.5.x
<Context docBase="TM" path="/TM"  reloadable="true">
	<ResourceLink global="jdbc/user2" name="jdbc/user2"  type="javax.sql.DataSource"/>
</Context>
-->

