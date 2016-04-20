<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="sideMenu">
  <div class="list-group panel">
    <a href="#side_Purchase" class="list-group-item list-group-item" data-toggle="collapse" data-parent="#sideMenu">Purchase</a>
   <div class="collapse" id="side_Purchase">
      
      <c:forEach items="${categoriesList}" var="cList">
      <a href="${pageContext.request.contextPath}/shopping/categories.action?organ=${cList.name}" class="list-group-item sub_list">${cList.name}</a>
      </c:forEach>
    </div>
    <a href="#side_About" class="list-group-item list-group-item" data-toggle="collapse" data-parent="#sideMenu">Inventory</a>
    <div class="collapse" id="side_About">
      <a href="${pageContext.request.contextPath}/product/showInventory.action" class="list-group-item sub_list">Inventory</a>
      <a href="${pageContext.request.contextPath}/product/preDisplayAction.action" class="list-group-item sub_list">Product</a>
      <a href="${pageContext.request.contextPath}/product/showInOutLog.action" class="list-group-item sub_list">In Out Log</a>
    </div>
     <a href="#side_Simulator" class="list-group-item list-group-item" data-toggle="collapse" data-parent="#sideMenu">Promotion</a>
    <div class="collapse" id="side_Simulator">
      <a href="${pageContext.request.contextPath}/paymentmanage/prePromoteAction.action" class="list-group-item sub_list">Promotion</a>
     
    </div>
     <a href="#side_Appointment" class="list-group-item list-group-item" data-toggle="collapse" data-parent="#sideMenu">Appointment</a>
    <div class="collapse" id="side_Appointment">
      <a href="" class="list-group-item sub_list">Hospital</a>
    </div>
     <a href="#side_Contact" class="list-group-item list-group-item" data-toggle="collapse" data-parent="#sideMenu">Contact us</a>
    <div class="collapse" id="side_Contact">
      <a href="" class="list-group-item sub_list">Contact us</a>
    </div>
     <a href="#side_Account" class="list-group-item list-group-item" data-toggle="collapse" data-parent="#sideMenu">Account</a>
    <div class="collapse" id="side_Account">
      <a href="${pageContext.request.contextPath}/member/account.jsp" class="list-group-item sub_list">Setting</a>
      <a href="${pageContext.request.contextPath}/payment/paymentmanage.action" class="list-group-item sub_list">Payment</a>
    </div>
  </div>
</div>




