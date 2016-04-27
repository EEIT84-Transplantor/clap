<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="sideMenu">
  <div class="list-group panel">
    <a href="#side_Purchase" class="list-group-item list-group-item" data-toggle="collapse" data-parent="#sideMenu">Purchase</a>
   <div class="collapse" id="side_Purchase">
      
      <c:forEach items="${categoriesList}" var="cList">
      <a href="${pageContext.request.contextPath}/shopping/categories.action?organ=${cList.name}" class="list-group-item sub_list">${cList.name}</a>
      </c:forEach>
    </div>
    <a href="#side_About" class="list-group-item list-group-item" data-toggle="collapse" data-parent="#sideMenu">About us</a>
    <div class="collapse" id="side_About">
      <a href="" class="list-group-item sub_list">Concept</a>
      <a href="" class="list-group-item sub_list">Team members</a>
    </div>
     <a href="#side_Simulator" class="list-group-item list-group-item" data-toggle="collapse" data-parent="#sideMenu">Simulator</a>
    <div class="collapse" id="side_Simulator">
      <a href="${pageContext.request.contextPath}/simulator/simulatorAction.action" class="list-group-item sub_list">Simulator</a>
    </div>
     <a href="#side_Appointment" class="list-group-item list-group-item" data-toggle="collapse" data-parent="#sideMenu">Appointment</a>
    <div class="collapse" id="side_Appointment">
      <a href="" class="list-group-item sub_list">Hospital</a>
    </div>
     <a href="#side_Contact" class="list-group-item list-group-item" data-toggle="collapse" data-parent="#sideMenu">Contact us</a>
    <div class="collapse" id="side_Contact">
      <a href="${pageContext.request.contextPath}/chat/chatpage.jsp" class="list-group-item sub_list">Contact us</a>
    </div>
     <a href="#side_Account" class="list-group-item list-group-item" data-toggle="collapse" data-parent="#sideMenu">Account</a>
    <div class="collapse" id="side_Account">
      <a href="${pageContext.request.contextPath}/member/account.jsp" class="list-group-item sub_list">Setting</a>
      <a href="${pageContext.request.contextPath}/payment/paymentmanage.action" class="list-group-item sub_list">Payment</a>
    </div>
  </div>
</div>




