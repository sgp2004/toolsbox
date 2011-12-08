<%@ page contentType="text/html; encoding=gb2312"%><%@ page import="java.lang.management.*"%>
<%
java.util.List<GarbageCollectorMXBean> gcs = ManagementFactory.getGarbageCollectorMXBeans();
for(int i = 0; i < gcs.size(); ++i)
{
	GarbageCollectorMXBean gc = gcs.get(i);
%>
<b>GC<%= (i + 1) %> Name: </b><%=gc.getName()%><br>
<b>GC<%= (i + 1) %> Memory Pool Names: </b>
<%
String[] names = gc.getMemoryPoolNames();
for(int j=0; j<names.length; j++)
{%>
<%=names[j]+" |"%>
<%}
%>
<br>
<b>GC<%= (i + 1) %> Is Valid: </b><%=gc.isValid()%><br>
<b>GC<%= (i + 1) %> Times: </b><%=gc.getCollectionCount()%> times<br>
<b>GC<%= (i + 1) %> Time: </b><%=gc.getCollectionTime()/1000%> sec<br><hr align=left width="40%">
<%
}
%>
