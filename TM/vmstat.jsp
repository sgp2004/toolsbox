<%@ page import="java.io.*"%><%
{
Runtime rtime = Runtime.getRuntime();
Process pro = rtime.exec("vmstat");
InputStream is = pro.getInputStream();
BufferedReader reader = new BufferedReader(new InputStreamReader(is));
String line = reader.readLine();
out.println("<pre>");
while(line!=null)
{
  out.println(line);
  line = reader.readLine();
}
out.println("</pre>");
}
%>
