<%@ page import="java.io.*"%><%
Runtime rtime = Runtime.getRuntime();
Process pro = rtime.exec("ls -a");
InputStream is = pro.getInputStream();
BufferedReader reader = new BufferedReader(new InputStreamReader(is));
String line = reader.readLine();
while(line!=null)
{
  out.println(line+"<br>");
  line = reader.readLine();
}
%>
