<%long start = System.currentTimeMillis();%><html>
<head>
<title>JDK1.5 management feature</title>
</head>
<body>
<h1>Datasource Info</h1>
<jsp:include page="datasource.jsp?ds=jdbc/user2" />
<h1>Memory Info</h1>
<pre><%=getMemoryInfo()%></pre>

<h1>Thread Info</h1>
<pre><%=getThreadInfo()%></pre>

<h1>ManagementFactory</h1>
<%=dir(ManagementFactory.getThreadMXBean())%>

<h1> Execute Total Cost Time <%=System.currentTimeMillis()-start%> ms </h1>
</body>
<%@ page import="java.lang.management.*, java.lang.reflect.*, java.lang.reflect.*"%><%!

/**
 * list Class Instance's fields and method, like python dir()
 * @param obj
 * @return
 */
String dir(Object obj) {
	StringBuffer sb = new StringBuffer(1000);
	Class<?> clazz = obj.getClass();
	sb.append("<pre>");
	sb.append(clazz.getName());
	sb.append("\n================\n");
	sb.append("------------ Fields ------------\n");
	Field[] fields = clazz.getDeclaredFields();
	for(Field field: fields) {
		sb.append(field+"\n");
	}
	sb.append("------------ Methods ------------\n");
	Method[] methods = clazz.getMethods();
	for(Method method: methods) {
		sb.append(method+"\n");
	}
	sb.append("</pre>");
	return sb.toString();
}

/**
 * get Memory Info
 */
String getMemoryInfo() {
	return 
		"Init Memory: " + 
		ManagementFactory.getMemoryMXBean().getHeapMemoryUsage().getInit()/1000000 + 
		"M \nMax Memory: " + ManagementFactory.getMemoryMXBean().getHeapMemoryUsage().getMax()/1000000 + 
		"M \nUsed Memory: " + ManagementFactory.getMemoryMXBean().getHeapMemoryUsage().getUsed()/1000000 + 
		"M";
}

/**
 * 
 * @return
 */
String getThreadInfo() {
	StringBuffer sb = new StringBuffer(1000);
	ThreadMXBean xmBean = ManagementFactory.getThreadMXBean();
	
	sb.append("Total Started Thread Count: ");
	sb.append(xmBean.getTotalStartedThreadCount());
	
	sb.append("\n");
	
	return sb.toString();
}
%><%@ page import="java.io.*"%><%!
/**
 * get Memory Info
 */
String getMemoryInfo() {
	return 
		"Init Memory: " + 
		ManagementFactory.getMemoryMXBean().getHeapMemoryUsage().getInit()/1000000 + 
		"M \nMax Memory: " + ManagementFactory.getMemoryMXBean().getHeapMemoryUsage().getMax()/1000000 + 
		"M \nUsed Memory: " + ManagementFactory.getMemoryMXBean().getHeapMemoryUsage().getUsed()/1000000 + 
		"M";
}
%>
