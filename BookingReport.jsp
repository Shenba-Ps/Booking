<!DOCTYPE HTML><%@page language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>BookingReportTest</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="Plugins/jQuery.js"></script>
<link rel="stylesheet" href="Plugins/jquery.dataTables.css">
<link rel="stylesheet" href="Plugins/Boostrap.css">
<link rel="stylesheet" href="Script/Common.css">
<script src="Plugins/bootstrap.js"></script>
<script src="Script/BookingReport.js"></script>
</head>
<body>
	<div style="height: 97vh; background-color: white;">
		<div class="Title">Report</div>
		<div
			style="width: 90px; height: 40px; background-color: navy; padding: 25px;">
			<a href="HomePage.jsp" style="color: white;"> Back</a>
		</div>
		<table id="tblList">
			<thead>
				<tr class="ListHeaderRow">
					<th class="ListHeaderCol" style="width: 200px;">Application.NO</th>
					<th class="ListHeaderCol">Name of Applicant</th>
					<th class="ListHeaderCol">Trade Description</th>
					<th class="ListHeaderCol">Total Days booked</th>
					<th class="ListHeaderCol">Date of Booking</th>
					<th class="ListHeaderCol">Status</th>
					<th class="ListHeaderCol">Date of Case Submitted</th>
					<th class="ListHeaderCol">Last Date of Follow-up by OIC</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="bookingList" items="${allBookingList}"
					varStatus="counter">

					<tr class="ListBodyRow">

						<td class="ListBodyCol" style="width: 200px"><a
							class="btn btn-error form-group"
							href="detailedView?applicationNumber=<c:out value='${bookingList.applicationNumber}' />"><c:out
									value="${bookingList.applicationNumber}" /></a>&nbsp;&nbsp;&nbsp;&nbsp;
						
						<td class="ListBodyCol"><c:out value="${bookingList.name}" /></td>
						<td class="ListBodyCol"><c:out
								value="${bookingList.usageTrade}" /></td>
						<td class="ListBodyCol"><c:out
								value="${bookingList.noOfDaysBooked}" /></td>
						<td class="ListBodyCol"><c:out
								value="${bookingList.bookingDate}" /></td>
						<td class="ListBodyCol"><c:out
								value="${bookingList.approvalStatus}" /></td>
						<td class="ListBodyCol"><c:out
								value="${bookingList.createdDate}" /></td>
						<td class="ListBodyCol"><c:out
								value="${bookingList.oicFollowUpdateTime}" /></td>



					</tr>

				</c:forEach>



			</tbody>
		</table>

		<%--For displaying Previous link except for the 1st page --%>
		<%--For displaying Previous link except for the 1st page --%>
		<c:if test="${currentPage != 1}">
			<td
				style="width: 50px; height: 50px; text-align: center; background-color: navy;"><a
				href="report?page=${currentPage - 1}">Previous</a></td>
		</c:if>

		<%--For displaying Page numbers. The when condition does not display
              a link for the current page--%>
		<table border="1" cellpadding="5" cellspacing="5">
			<tr>

				<c:forEach begin="1" end="${noOfPages}" var="i">
					<c:choose>
						<c:when test="${currentPage eq i}">
							<td style="width: 50px; height: 50px; text-align: center;">${i}</td>
						</c:when>
						<c:otherwise>
							<td style="width: 50px; height: 50px; text-align: center;"><a
								href="report?page=${i}">${i}</a></td>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<%--For displaying Next link --%>
				<c:if test="${currentPage lt noOfPages}">
					<td
						style="width: 50px; height: 50px; text-align: center; background-color: navy;"><a
						href="report?page=${currentPage + 1}" style="color: white;">Next</a></td>
				</c:if>
			</tr>
		</table>
	</div>
</body>
</html>
