<!DOCTYPE HTML><%@page language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>BookingApprovalTest</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="Plugins/Boostrap.css">
<script src="Plugins/jQuery.js"></script>
<link rel="stylesheet" href="Script/Common.css">
<script src="Plugins/bootstrap.js"></script>
</head>
<body>
	<script type="text/javascript">
		function reject(val) {
			//alert(val);
			//alert("*"+document.getElementById("nmReason"+val).value+"**");
			if (document.getElementById("nmReason" + val).value === null
					|| document.getElementById("nmReason" + val).value === ""
					|| document.getElementById("nmReason" + val).value === " ") {
				document.getElementById("messagesList" + val).innerHTML = "Please enter the reason for reject";
				return false;
			} else {
				document.rejectFrm.method = "POST";
				document.rejectFrm.action = "reject?applicationNumber=" + val
						+ "&?nmReason="
						+ document.getElementById("nmReason" + val).value;
				document.rejectFrm.submit();
			}

		}
	</script>
	<form name="rejectFrm">

		<div style="height: 97vh;">
			<div class="Title form-group">Please approve or Reject the
				booking</div>


			<div style="display: inline-block;" id="paginationButtonId"></div>
			<div
				style="width: 90px; height: 60px; background-color: navy; padding: 25px;">
				<a href="HomePage.jsp" style="color: white;"> Back</a>
			</div>
			<table id="tblList" class="display">
				<thead>
					<tr class="ListHeaderRow">
						<th class="ListHeaderCol" style="width: 50px;">Application.NO</th>
						<th class="ListHeaderCol">Name</th>
						<th class="ListHeaderCol">Address</th>
						<th class="ListHeaderCol">Nric</th>
						<th class="ListHeaderCol">Usage Trade</th>
						<th class="ListHeaderCol">Email</th>
						<th class="ListHeaderCol">Hand Phone</th>
						<th class="ListHeaderCol">Office</th>
						<th class="ListHeaderCol">Home</th>
						<th class="ListHeaderCol">Booking Date</th>
						<th class="ListHeaderCol">Booking Slots</th>
						<th class="ListHeaderCol">Reason for rejection</th>
						<th class="ListHeaderCol">Action</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="bookingList" items="${pendingStatusList}"
						varStatus="counter">

						<%-- 
						<c:out value="${bookingList.applicationNumber}" />
						<c:out value="${pendingStatusList[counter.index-1].applicationNumber}" /> --%>
						<c:choose>
							<c:when test="${true}">
								<%-- test="${bookingList.applicationNumber ne pendingStatusList[counter.index-1].applicationNumber}"> --%>
								<tr class="ListBodyRow">
									<td class="ListBodyCol" style="width: 200px"><a
										class="btn btn-error form-group"
										href="detailedView?applicationNumber=<c:out value='${bookingList.applicationNumber}' />"><c:out
												value="${bookingList.applicationNumber}" /></a>&nbsp;&nbsp;&nbsp;&nbsp;







									
									<td class="ListBodyCol"><c:out value="${bookingList.name}" /></td>
									<td class="ListBodyCol"><c:out
											value="${bookingList.address}" /></td>
									<td class="ListBodyCol"><c:out
											value="${bookingList.nricNumber}" /></td>
									<td class="ListBodyCol"><c:out
											value="${bookingList.usageTrade}" /></td>
									<td class="ListBodyCol"><c:out
											value="${bookingList.email}" /></td>
									<td class="ListBodyCol"><c:out
											value="${bookingList.homePhoneNumber}" /></td>
									<td class="ListBodyCol"><c:out
											value="${bookingList.officePhoneNumber}" /></td>
									<td class="ListBodyCol"><c:out
											value="${bookingList.handPhoneNumber}" /></td>
									<td class="ListBodyCol"><c:out
											value="${bookingList.bookingDate}" /></td>
									<td class="ListBodyCol"><c:out
											value="${bookingList.slectedSlots}" /></td>

									<td class="ListBodyCol"><p style="color: red;">*</p>
										<textarea required name="nmReason"
											id="nmReason${bookingList.applicationNumber}"> </textarea>
										<p id="messagesList${bookingList.applicationNumber}"
											style="color: red;"></p></td>

									<td class="ListBodyCol"><a
										class="btn btn-error form-group"
										href="approval?applicationNumber=<c:out value='${bookingList.applicationNumber}' />">Approve</a>&nbsp;&nbsp;&nbsp;&nbsp;

										<button type="button" class="btn btn-error form-group"
											id="newId${bookingList.applicationNumber}"
											onclick="reject('${bookingList.applicationNumber}')">Reject</button>

										<%-- 	<a
									class="btn btn-error form-group" role="button"
									href="reject?applicationNumber=<c:out value='${bookingList.applicationNumber}'  />" >rejectTest</a>&nbsp;&nbsp;&nbsp;&nbsp; --%>
								</tr>
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>





					</c:forEach>

				</tbody>
			</table>

			<c:if test="${currentPage != 1}">
				<td><a href="pendingList?page=${currentPage - 1}">Previous</a></td>
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
									href="pendingList?page=${i}">${i}</a></td>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<%--For displaying Next link --%>
					<c:if test="${currentPage lt noOfPages}">
						<td
							style="width: 50px; height: 50px; text-align: center; background-color: navy;"><a
							href="pendingList?page=${currentPage + 1}" style="color: white;">Next</a></td>
					</c:if>
				</tr>
			</table>

		</div>
	</form>
</body>
</html>
