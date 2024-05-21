<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
      <a href="/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
<!--         <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg> -->
				<img id="headerlogo" src="/img/CaTchWork_logo.png">
      </a>

<!--       <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0"> -->
<!--         <li><a href="#" class="nav-link px-2 link-secondary">Home</a></li> -->
<!--         <li><a href="#" class="nav-link px-2 link-dark">Features</a></li> -->
<!--         <li><a href="#" class="nav-link px-2 link-dark">Pricing</a></li> -->
<!--         <li><a href="#" class="nav-link px-2 link-dark">FAQs</a></li> -->
<!--         <li><a href="#" class="nav-link px-2 link-dark">About</a></li> -->
<!--       </ul> -->

      <div class="col-md-3 text-end">
        <c:choose>
        <c:when test="${usertype.type eq null}">
	        <a type="button" class="btn btn-primary me-2" href="/LoginForm"><img id="loginimg" src="/img/login.png" alt="그림 오류"></a>
	        <a type="button" class="btn btn-secondary" href=""><img id="loginimg" src="/img/join.png" alt="그림 오류"></a>
      		</c:when>
      		<c:otherwise>
      			<a type="button" class="btn btn-secondary" href="/Logout"><img id="loginimg" src="/img/logout.png" alt="그림 오류"></a>
      		</c:otherwise>
      	</c:choose>
      	
      </div>
    </header>
  </div>