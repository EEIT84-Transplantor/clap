<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="sideMenu">
  <div class="list-group panel">      
      <a href="${pageContext.request.contextPath}/product/preDisplayAction.action" class="list-group-item sub_list">Manage Product</a>
      <a href="${pageContext.request.contextPath}/product/showInventory.action" class="list-group-item sub_list">Manage Inventory</a>
      <a href="${pageContext.request.contextPath}/product/showInOutLog.action" class="list-group-item sub_list">Manage In Out Log</a>
      <a href="${pageContext.request.contextPath}/product/inventory.action" class="list-group-item sub_list">Import/Export</a>
      <a href="${pageContext.request.contextPath}/paymentmanage/prePromoteAction.action" class="list-group-item sub_list">Manage Promotion</a>
  	  <a href="${pageContext.request.contextPath}/chat/chatpage.jsp" class="list-group-item sub_list">Manage Chat</a>
  </div>
</div>




