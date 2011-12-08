<%@ page contentType="text/html; encoding=gb2312"%><%@ page import="java.lang.management.*"%>
<%
ClassLoadingMXBean cl = ManagementFactory.getClassLoadingMXBean();
%>
<b> current class count: </b><%=cl.getLoadedClassCount()%><br>
<b> loaded class count: </b><%=cl.getTotalLoadedClassCount()%><br>
<b> unloaded class count: </b><%=cl.getUnloadedClassCount()%><br>
<b> is verbose: </b><%=cl.isVerbose()%><br>

