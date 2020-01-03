<%@tag body-content="scriptless"%>
<%@attribute name="size" type="java.lang.Integer"%>
<%@attribute name="color"%>
<%@attribute name="name"%>
<%@attribute name="style" %>
<jsp:doBody var="explain" scope="page"/>
<font color=${color } size=${size } face=${name }>
		${explain }
</font>
<BR>
