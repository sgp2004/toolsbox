<%@ page contentType="text/html; encoding=gb2312"%><%@ page import="java.lang.management.*"%>
<%
CompilationMXBean cl = ManagementFactory.getCompilationMXBean();
%>
<b> compiler name: </b><%=cl.getName()%><br>
<b> Total Compilation Time: </b><%=(float)cl.getTotalCompilationTime()/1000000%> secs<br>
