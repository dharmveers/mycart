
<%
Object message=session.getAttribute("message");
if(message!=null){
%>
	<div class="alert alert-success alert-dismissible fade show text-center"
		role="alert">
		<strong><%=message.toString()%></strong>
		<button type="button" 
				class="btn-close" 
				data-bs-dismiss="alert"
				aria-label="Close">
		</button>
	</div>

<%
}
session.removeAttribute("message");
%>
