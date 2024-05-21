<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 마이페이지</title>

<link rel="stylesheet" href="/css/common.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<style>

.bookmark-icons {
    width: 20px;
    height: 10px;
}

.img-thumbnail {
    width: 100px;
    height: 100px;
}

#goUpdate {
    float: right;
}

#goWrite {
    float: right;
}

.wrap {
  height: 100vh;
  min-height: 400px;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  gap: 32px;
}

h1 {
  font-size: 40px;
  font-weight: 600;
}

.rating {
  float: none;
  width: 200px;
  display: flex;
}
.rating__input {
  display: none;
}
.rating__label {
  width: 20px;
  overflow: hidden;
  cursor: pointer;
}
.rating__label .star-icon {
  width: 20px;
  height: 40px;
  display: block;
  position: relative;
  left: 0;
  background-image: url("/img/star.svg");
  background-repeat: no-repeat;
  background-size: 40px;
}
.rating__label .star-icon.filled {
  background-image: url("/img/star_fill.svg");
}
.rating__label--full .star-icon {
  background-position: right;
}
.rating__label--half .star-icon {
  background-position: left;
}
.rating.readonly .star-icon {
  opacity: 0.7;
  cursor: default;
}

</style>

<style>
	


</style>



</head>
	<%@include file="/WEB-INF/include/header.jsp" %>
	<%@include file="/WEB-INF/include/nav.jsp" %>
    <%@include file="/WEB-INF/include/person_mypage_nav.jsp" %>
    
<body>
	<div class="tab-content" id="userinfo">
		<div class="container">
		<div>&nbsp;</div>
			<h2>회원 정보</h2>
			<div>&nbsp;</div>
			<div id="total">
				<div id="profile">
					<img src="/img/defaultProfile.png" class="img-thumbnail" alt="프로필없음">
				</div>
				<div>&nbsp;</div>
				<div id="info">
					<div class="input-group mb-3">
					  <span class="input-group-text" id="inputGroup-sizing-default">아이디</span>
					  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${pvo.id}" readonly>
					</div>
					<div class="input-group mb-3">
					  <span class="input-group-text" id="inputGroup-sizing-default">이름</span>
					  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${pvo.name}" readonly>
					</div>
					<div class="input-group mb-3">
					  <span class="input-group-text" id="inputGroup-sizing-default">주민등록번호</span>
					  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${pvo.social_num}" readonly>
					</div>
					<div class="input-group mb-3">
					  <span class="input-group-text" id="inputGroup-sizing-default">연락처</span>
					  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${pvo.phone}" readonly>
					</div>
					<div class="input-group mb-3">
					  <span class="input-group-text" id="inputGroup-sizing-default">우편번호</span>
					  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${pvo.zip_code}" readonly>
					</div>
					<div class="input-group mb-3">
					  <span class="input-group-text" id="inputGroup-sizing-default">주소</span>
					  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${pvo.address}" readonly>
					</div>

					<div class="input-group mb-3">
					  <span class="input-group-text" id="inputGroup-sizing-default">가입날짜</span>
					  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${pvo.created}" readonly>
					</div>
				</div>
			</div>
			
			<div>&nbsp;</div>
		<button type="button" id="goUpdate" class="btn btn-primary">수정하기</button>
			<div>&nbsp;</div>
			<div>&nbsp;</div>
		
		
		</div>

			
	</div>
	
<!-- <div>=====================================================================================================================</div> -->

	<div class="tab-content" id="resume" style="display: none;">
	   <div class="container">
	   <section>
      <div>&nbsp;</div>
      <h2>구직자 이력서</h2>
      <div>&nbsp;</div>
      <div>&nbsp;</div>
      <div>&nbsp;</div>
      
      <div name="resume" class="linkDiv">
         <table class="table">
           <thead>
             <tr>
               <th scope="col">번호</th>
               <th scope="col">이력서 제목</th>
               <th scope="col">이름</th>
               <th scope="col">추천공고 보러가기</th>
             </tr>
           </thead>
           <tbody class="table-group-divider">
              <c:forEach var="ro" items="${response.list}" varStatus="status" >
                <tr>
                  <th scope="row">${status.count}</th>
                  <td class ="td2"><a href="/Resume/View?resume_idx=${ro.resume_idx}">${ro.title}</a></td>
                  <td>${ro.created}</td>
                  <td>
						<button name="recommendList" class="btn btn-primary">추천 공고 보러가기</button>
                  </td>
                </tr>
             </c:forEach>
           </tbody>
         </table>
      </div>
      <div>&nbsp;</div>
	<button type="button" id="goWrite" class="btn btn-primary">이력서 작성하기</button>
      <div>&nbsp;</div>
      <div>&nbsp;</div>
	   </section>
	   <div class="d-flex justify-content-center paging-bottom-container">
	         <c:set var="startnum" value="${pagingVo.pagination.startPage}" />
<c:set var="endnum" value="${pagingVo.pagination.endPage}" />
<c:set var="totalpagecount" value="${pagingVo.pagination.totalPageCount}" />

<div id="pagination">
<nav aria-label="Page navigation" id="paging">
    <ul class="pagination">
        <c:if test="${personNowpage > 1}">
            <li class="page-item"><a class="page-link" href="/MyPage?tab=person&personNowpage=1" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
            </a></li>
            <li class="page-item"><a class="page-link" href="/MyPage?tab=person&personNowpage=${personNowpage - 1}" aria-label="Previous">
                <span aria-hidden="true">&lt;</span>
            </a></li>
        </c:if>
        <c:forEach var="pagenum" begin="${startnum}" end="${endnum}" step="1">
            <li class="page-item"><a class="page-link" href="/MyPage?tab=person&personNowpage=${pagenum}">${pagenum}</a></li>
        </c:forEach>
        <c:if test="${pagingVo.pagination.existNextPage}">
            <li class="page-item"><a class="page-link" href="/MyPage?tab=person&personNowpage=${personNowpage + 1}" aria-label="Next">
                <span aria-hidden="true">&gt;</span>
            </a></li>
            <li class="page-item"><a class="page-link" href="/MyPage?tab=person&personNowpage=${totalpagecount}" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
            </a></li>
        </c:if>
    </ul>
</nav>
</div>
	         </div>
      </div>
	
		
	</div>
<!-- <div>=====================================================================================================================</div> -->
	<div class="tab-content" id="apply" style="display: none;">
	<div class="container">
	<div>&nbsp;</div>
	<h2>내가 지원한 공고</h2>
	<div>&nbsp;</div>
	<div>&nbsp;</div>
	<div>&nbsp;</div>
	<div class="apply">
		      <table class="table" class="linkDiv">
	           <thead>
	             <tr>
	               <th scope="col">번호</th>
	               <th scope="col">공고 제목</th>
	               <th scope="col">연봉</th>
	               <th scope="col">요구 경력</th>
	               <th scope="col">담당자연락처</th>
	               <th scope="col">더보기</th>
	             </tr>
	           </thead>
	           <tbody class="table-group-divider">
					<c:forEach var="po" items="${response1.list}" varStatus="status">
					    <tr>
					        <th scope="row">${status.count}</th>
					        <td class="td2"><a href="/Post?post_idx=${po.post_idx}">${po.title}</a></td>
					        <td>${po.salary}</td>
					        <td>${po.career}</td>
					        <td>${po.mphone}</td>
					        <td class="td8">
					            <button name="apply" class="btn btn-primary">지원 현황</button>
					        </td>
					    </tr>
					    <tr>
					        <td colspan="6"> <!-- 한 행에 있는 모든 셀을 병합 -->
					            <div class="output"></div>
					        </td>
					    </tr>
					</c:forEach>
	           </tbody>
	         </table>
         	</div>
         		   <div class="d-flex justify-content-center paging-bottom-container">
	         <%@include file="/WEB-INF/pagination/personApplyPaging.jsp" %>
	         </div>
         		</div>
         </div>
         

<!-- <div>=====================================================================================================================</div> -->
	<div id="bookmark" class="tab-content" style="display: none;"> 
		
	<div class="container">
	<div>&nbsp;</div>
		<h2>내가 북마크한 공고</h2>
		<div>&nbsp;</div>
		<div>&nbsp;</div>
		<div>&nbsp;</div>
	<div class="bookmark">
		      <table class="table" class="linkDiv">
	           <thead>
	             <tr>
	               <th scope="col">번호</th>
	               <th scope="col">공고 제목</th>
	               <th scope="col">연봉</th>
	               <th scope="col">요구 경력</th>
	               <th scope="col">담당자연락처</th>
	               <th scope="col">비고</th>
	             </tr>
	           </thead>
	           <tbody class="table-group-divider">
					<c:forEach var="bo" items="${response2.list}" varStatus="status">
					   <tr data-row-num="${bo.row_num}" data-deleted="false">
					        <th scope="row">${status.count}</th>
					        <td class="td2"><a href="/Post?post_idx=${po.post_idx}">${bo.title}</a></td>
					        <td>${bo.salary}</td>
					        <td>${bo.career}</td>
					        <td>${bo.mphone}</td>
					        <td class="td8">
					        	<input type="hidden" value="${bo.book_idx}">
					            <img class="bookmark-icon" src="/img/bookmark_fill.svg" alt="북마크 아이콘">
					        </td>
					    </tr>

					</c:forEach>
	           </tbody>
	         </table>
         	</div>
         </div>
                  		   <div class="d-flex justify-content-center paging-bottom-container">
	         <%@include file="/WEB-INF/pagination/personBookmarkPaging.jsp" %>
	         </div>
		</div>
	
	</div>



	
	<!-- 합격 결과 모달 창 HTML -->
<div class="modal" tabindex="-1" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="modalData">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
	





<!-- 기업 평가 모달 창 HTML -->
<div class="modal" tabindex="-1" id="modalState1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="modalState">

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>


	

	<%@include file="/WEB-INF/include/footer.jsp" %>
	<script>
    const tabs = document.querySelectorAll("#mypagetab .nav-link");

    tabs.forEach(function (tab) {
        tab.addEventListener("click", function (event) {
            event.preventDefault();
            const targetId = tab.getAttribute("data-target");
            const targetContent = document.getElementById(targetId);

            // 모든 탭 콘텐츠를 숨깁니다.
            document.querySelectorAll(".tab-content").forEach(function (content) {
                content.style.display = "none";
            });

            // 대상 탭 콘텐츠를 표시합니다.
            targetContent.style.display = "block";

            // 모든 탭에서 active 클래스를 제거합니다.
            document.querySelectorAll("#mypagetab .nav-link").forEach(function (tab) {
                tab.classList.remove("active");
            });

            // 클릭된 탭에 active 클래스를 추가합니다.
            tab.classList.add("active");

            // URL 매개변수로 현재 탭 설정
            const url = new URL(window.location.href);
            url.searchParams.set('tab', targetId);
            history.pushState(null, '', url.toString());

            // 활성 탭 데이터 로드
            loadTabData(targetId, 1);
        });
    });

    function addPaginationEventListeners() {
        document.querySelectorAll(".pagination a").forEach(function (link) {
            link.addEventListener("click", function (event) {
                event.preventDefault();
                const url = new URL(this.href);
                const params = new URLSearchParams(url.search);

                // 현재 활성 탭 확인
                const activeTabContent = document.querySelector(".tab-content:not([style*='display: none'])");
                const activeTabId = activeTabContent.getAttribute("id");

                // 필요한 매개변수 추가
                if (!params.has("nowpage")) {
                    params.set("nowpage", "1");
                }
                params.set("tab", activeTabId);

                // 활성 탭 데이터 로드
                loadTabData(activeTabId, params.get("nowpage"));
            });
        });
    }

    function loadTabData(tabId, page) {
        const url = new URL(window.location.href);
        url.searchParams.set('tab', tabId);
        url.searchParams.set('nowpage', page);

        fetch(url.toString(), {
            headers: {
                'X-Requested-With': 'XMLHttpRequest'
            }
        })
        .then(response => response.text())
        .then(html => {
            const parser = new DOMParser();
            const doc = parser.parseFromString(html, "text/html");

            // 현재 활성 탭의 컨텐츠를 업데이트
            const newContent = doc.querySelector(`#${tabId}`);
            document.getElementById(tabId).innerHTML = newContent.innerHTML;

            // 새로 로드된 콘텐츠에 이벤트 리스너를 다시 추가합니다.
            addPaginationEventListeners();
        })
        .catch(error => console.error("Error:", error));
    }

    // 페이지 로드 시 URL 매개변수에 따라 탭 상태를 유지하고 데이터 로드
    const urlParams = new URLSearchParams(window.location.search);
    const activeTab = urlParams.get('tab') || 'userinfo';
    const activeTabLink = document.querySelector(`#mypagetab .nav-link[data-target='${activeTab}']`);

    if (activeTabLink) {
        // 탭 클릭 이벤트 강제 호출
        activeTabLink.click();
    }

    // 초기 이벤트 리스너 설정
    addPaginationEventListeners();
});
</script>
	<script>
	
// // 탭이동 스크립트	
//     document.addEventListener("DOMContentLoaded", function () {
//         const tabs = document.querySelectorAll("#mypagetab .nav-link");

//         tabs.forEach(function (tab) {
//             tab.addEventListener("click", function (event) {
//                 event.preventDefault();
//                 const targetId = tab.getAttribute("data-target");
//                 const targetContent = document.getElementById(targetId);

//                 // 모든 탭 콘텐츠를 숨깁니다.
//                 document.querySelectorAll(".tab-content").forEach(function (content) {
//                     content.style.display = "none";
//                 });

//                 // 대상 탭 콘텐츠를 표시합니다.
//                 targetContent.style.display = "block";

//                 // 모든 탭에서 active 클래스를 제거합니다.
//                 document.querySelectorAll("#mypagetab .nav-link").forEach(function (tab) {
//                     tab.classList.remove("active");
//                 });

//                 // 클릭된 탭에 active 클래스를 추가합니다.
//                 tab.classList.add("active");
//             });
//         });

//         // 페이지가 로드될 때 #userinfo 탭의 내용을 보이도록 설정합니다.
//         const userinfoTab = document.querySelector("#mypagetab .nav-link[data-target='userinfo']");
//         const userinfoContent = document.getElementById("userinfo");
//         userinfoTab.classList.add("active");
//         userinfoContent.style.display = "block";
//     });
 </script> 

<script>


// 이력서 수정하러가기
	const goUpdateEl = document.querySelector('#goUpdate')
	goUpdateEl.addEventListener('click', ()=>{
		location.href='/MyPage/UpdateForm';
		
	})
	
	
// 이력서 작성하러가기	
	const goWriteEl = document.querySelector('#goWrite')
	goWriteEl.addEventListener('click',()=>{
		location.href='/MyPage/Resume/WriteForm';	
	})

// 해당 이력서의 추천공고 보러가기
	const recommendListEls = document.getElementsByName('recommendList');
	
	for (let i = 0; i < recommendListEls.length; i++) {
	    const btn = recommendListEls[i];
	    
	    btn.addEventListener('click', () => {
	        //alert('dd');
        const parentRow = btn.closest('tr');
        // 부모 요소 내에서 <a> 태그를 선택합니다.
        const aTag = parentRow.querySelector('td.td2 a');
        // <a> 태그의 href 속성 값을 가져옵니다.
        const href = aTag.getAttribute('href');
        // href 속성 값에서 ${ro.resume_idx} 값을 추출합니다.
        const resume_idx = href.split('=')[1];
        
	        let url = '/Resume/GetrecommendList?resume_idx='+resume_idx+'&nowpage=1';
	        location.href=url;	
	    });
	}
	

// 이력서 추천공고
	document.addEventListener('DOMContentLoaded', () => {
	    const recommendBtns = document.querySelectorAll('.resume .content1 .td4 button[name="recommend"]');
	    
	    recommendBtns.forEach(btn => {
	        btn.addEventListener('click', () => {
	            const resume_idx = btn.closest('.content1').querySelector('.td2 a').getAttribute('href').split('=')[1];
	            //alert(resume_idx);
	            const url = '/Resume/GetRecommendList?resume_idx='+resume_idx;
	            const outputEl = btn.closest('.content1').querySelector('.output');
	            
	            // 상태 변수 선언
	            let isOpen = outputEl.classList.contains('open');
	            
	            if (isOpen) {
	                outputEl.innerHTML = ''; // 해당 리스트의 출력 요소 초기화
	                outputEl.classList.remove('open');
	            } else {
	                fetch(url)
	                .then(response => response.json())
	                .then(postList => {
	                    outputEl.innerHTML = ''; // 해당 리스트의 출력 요소 초기화
	                    postList.forEach(post => {
	                        let html =  '<p>'+post.row_num+'</p>'
	                            html +=  '<p>title:'+post.title+'</p>'
	                            html +=  '<p>career:'+post.career+'</p>'
	                            html +=  '<p>salary:'+post.salary+'</p>'
	                            html +=  '<p>mphone:'+post.mphone+'</p>'
	                            html +=  '<p>created:'+post.created+'</p>'
	                        ;
	                       outputEl.innerHTML += html; // 해당 리스트의 출력 요소에 HTML 추가
	                    });
	                    outputEl.classList.add('open');
	                })
	                .catch(error => {
	                    console.dir(error);
	                    console.log(error);
	                    alert(error)
	                });
	            }
	        });
	    });
	});
	
	
	
// 내가 지원한 이력서 	

	document.addEventListener('DOMContentLoaded', () => {
	    const applyBtns = document.querySelectorAll('.apply .td8 button[name="apply"]');
	    const modalResult = document.getElementById('myModal');
	    const modalState = document.getElementById('modalState1');
	    const modalCloseBtns = document.querySelectorAll('[data-bs-dismiss="modal"]');
	    //let   selectedRating = 0;
	    applyBtns.forEach(btn => {
	        btn.addEventListener('click', () => {
	            const tr = btn.closest('tr');
	            
	            // tr 안에서 post_idx 값을 가져옵니다.
	            const postLink = tr.querySelector('.td2 a');
	            const post_idx = postLink.getAttribute('href').split('=')[1];
	            const url = '/Resume/GetApplyList?post_idx=' + post_idx;
	            const outputEl = tr.nextElementSibling.querySelector('.output');
	            
	            // 상태 변수 선언
	            let isOpen = false;
	            if (outputEl) {
	                isOpen = outputEl.getAttribute('data-open') === 'true';
	            }
	            
	            if (isOpen) {
	                outputEl.innerHTML = ''; // 해당 리스트의 출력 요소 초기화
	                outputEl.removeAttribute('data-open'); // 속성 제거
	            } else {
	                fetch(url)
	                .then(response => response.json())
	                .then(resumeList => {
	                    outputEl.innerHTML = ''; // 해당 리스트의 출력 요소 초기화
	                    resumeList.forEach(resume => {
	                        let html = '';
	                        html += '<table class="table">';
// 	                        html += '<tr>';
// 	                        html += '<td>순번';
// 	                        html += '</td>';
// 	                        html += '<td>이름';
// 	                        html += '</td>';
// 	                        html += '<td> 제목';
// 	                        html += '</td>';
// 	                        html += '<td>연락처';
// 	                        html += '</td>';
// 	                        html += '<td>지원날짜';
// 	                        html += '</td>';
// 	                        html += '<td>결과보기';
// 	                        html += '</td>';
// 	                        html += '<td>평가하기';
// 	                        html += '</td>';
// 	                        html += '</tr>';
	                        html += '<tr>';
	                        html += '<td>'+resume.row_num+'</td>';
	                        html += '<td>'+resume.name+'</td>';
	                        html += '<td>'+resume.rtitle+'</td>';
	                        html += '<td>'+resume.phone+'</td>';
	                        html += '<td>'+resume.created+'</td>';
	                        html += '<td><button class="btn btn-primary result-btn">결과보기</button></td>'; // 클래스 추가
	                        html += '<td><button class="btn btn-danger rate-btn">기업평가</button></td>'; // 클래스 추가
	                        html += '<input type="hidden" value="'+resume.apply_idx+'" name="apply_idx">'; // 클래스 추가
	                        html += '<input type="hidden" value="'+resume.per_idx+'" name="per_idx">'; // 클래스 추가
	                        html += '</tr>'; // 클래스 추가
	                        html += '</table>';
	                          
	                        outputEl.innerHTML += html; // 해당 리스트의 출력 요소에 HTML 추가
	                    });

	                    // 결과보기 버튼에 이벤트 리스너 추가
	                    const resultButtons = outputEl.querySelectorAll('.result-btn'); // 클래스로 선택
	                    resultButtons.forEach((button, i) => {
	                        button.addEventListener('click', () => {
	                            // 클릭된 버튼을 기준으로 가장 가까운 tr 요소 찾기
	                            const tr = button.closest('tr');
	                            
	                            // tr 안에서 input[type=hidden] 요소를 찾아서 apply_idx 값을 가져오기
	                            const apply_idx = tr.querySelector('input[type=hidden]').value;
	                            
	                            const modalData = document.getElementById('modalData');

	                            // 모달 창 열기
	                            modalResult.style.display = "block";

	                            // fetch로 데이터 가져오기
	                            const modalUrl = '/MyPage/Resume/GetState?apply_idx=' + apply_idx;
	                            fetch(modalUrl)
	                                .then(response => response.json())
	                                .then(vo => {
	                                    modalData.innerHTML = ''; // 초기화
	                            
	                                    let modalHtml = '<p>점수:'+vo.score+'</p>';
	                                    modalHtml += '<p>코멘트:'+vo.comments+'</p>';
	                                    modalData.innerHTML += modalHtml;
	                                    
	                                })
	                                .catch(error => console.error('Error:', error));
	                        });
	                    });
	                    
	                    // 기업평가 버튼에 이벤트 리스너 추가
	                    const rateButtons = outputEl.querySelectorAll('.rate-btn'); // 클래스로 선택
	                    rateButtons.forEach((button, i) => {
	                        button.addEventListener('click', (event) => {
	                        	event.preventDefault(); // 폼 제출 기본 동작 중단
	                        		                        	
	                            // 클릭된 버튼을 기준으로 가장 가까운 tr 요소 찾기
	                            const tr = button.closest('tr');
	                            
	                            // tr 안에서 input[type=hidden] 요소를 찾아서 apply_idx 값을 가져오기
	                            const apply_idx = tr.querySelector('input[type=hidden]').value;
	                            const modalData = document.getElementById('modalState');
	                            // 모달 창 열기
	                            modalState.style.display = "block";
	                            
	                            let comidx = 0;
	                            let peridx = 0;
	                            
	                            const modalUrl = '/MyPage/Company/GetRateForm?apply_idx=' + apply_idx;
	                            fetch(modalUrl)
	                                .then(response => response.json())
	                                .then(vo => {
                                        comidx = vo.com_idx;
                                        peridx = vo.per_idx;
	                                    modalData.innerHTML = ''; // 초기화
	                            
	                                    let modalHtml = '<p>per_idx:'+vo.per_idx+'</p>';
	                                    
	                                    modalHtml += vo.com_idx;
	                                    modalHtml += '<form>';
	                                    //modalHtml += '<form action="/Company/Rate?com_idx='+vo.com_idx+'&per_idx='+vo.per_idx+'" method="POST">';
	                                    modalHtml += '<input type="hidden" id="rate_per_idx" name="per_idx" value="'+vo.per_idx+'">';
	                                    modalHtml += '<input type="hidden" id="rate_com_idx" name="com_idx" value="'+vo.com_idx+'">';
	                                    modalHtml += '<div class="rating">';
	                                    modalHtml += '<label class="rating__label rating__label--half" for="starhalf">';
	                                    modalHtml += '<input type="radio" id="starhalf" class="rating__input" name="rating" value="1">';
	                                    modalHtml += '<span class="star-icon">';
	                                    modalHtml += '</span>';
	                                    modalHtml += '</label>';
	                                    modalHtml += '<label class="rating__label rating__label--full" for="starhalf">';
	                                    modalHtml += '<input type="radio" id="starhalf1" class="rating__input" name="rating" value="2">';
	                                    modalHtml += '<span class="star-icon">';
	                                    modalHtml += '</span>';
	                                    modalHtml += '</label>';
	                                    modalHtml += '<label class="rating__label rating__label--half" for="starhalf">';
	                                    modalHtml += '<input type="radio" id="starhalf2" class="rating__input" name="rating" value="3">';
	                                    modalHtml += '<span class="star-icon">';
	                                    modalHtml += '</span>';
	                                    modalHtml += '</label>';
	                                    modalHtml += '<label class="rating__label rating__label--full" for="starhalf">';
	                                    modalHtml += '<input type="radio" id="starhalf3" class="rating__input" name="rating" value="4">';
	                                    modalHtml += '<span class="star-icon">';
	                                    modalHtml += '</span>';
	                                    modalHtml += '</label>';
	                                    modalHtml += '<label class="rating__label rating__label--half" for="starhalf">';
	                                    modalHtml += '<input type="radio" id="starhalf4" class="rating__input" name="rating" value="5">';
	                                    modalHtml += '<span class="star-icon">';
	                                    modalHtml += '</span>';
	                                    modalHtml += '</label>';
	                                    modalHtml += '<label class="rating__label rating__label--full" for="starhalf">';
	                                    modalHtml += '<input type="radio" id="starhalf5" class="rating__input" name="rating" value="6">';
	                                    modalHtml += '<span class="star-icon">';
	                                    modalHtml += '</span>';
	                                    modalHtml += '</label>';
	                                    modalHtml += '<label class="rating__label rating__label--half" for="starhalf">';
	                                    modalHtml += '<input type="radio" id="starhalf6" class="rating__input" name="rating" value="7">';
	                                    modalHtml += '<span class="star-icon">';
	                                    modalHtml += '</span>';
	                                    modalHtml += '</label>';
	                                    modalHtml += '<label class="rating__label rating__label--full" for="starhalf">';
	                                    modalHtml += '<input type="radio" id="starhalf7" class="rating__input" name="rating" value="8">';
	                                    modalHtml += '<span class="star-icon">';
	                                    modalHtml += '</span>';
	                                    modalHtml += '</label>';
	                                    modalHtml += '<label class="rating__label rating__label--half" for="starhalf">';
	                                    modalHtml += '<input type="radio" id="starhalf8" class="rating__input" name="rating" value="9">';
	                                    modalHtml += '<span class="star-icon">';
	                                    modalHtml += '</span>';
	                                    modalHtml += '</label>';
	                                    modalHtml += '<label class="rating__label rating__label--full" for="starhalf">';
	                                    modalHtml += '<input type="radio" id="starhalf9" class="rating__input" name="rating" value="10">';
	                                    modalHtml += '<span class="star-icon">';
	                                    modalHtml += '</span>';
	                                    modalHtml += '</label>';
	                                    modalHtml += '</div>';
	                                    modalHtml += '<button type="submit" id="rateSubmitBtn" class="btn btn-primary">평가하기</button>';
	                                    
	                                    modalHtml += '</form>';
	                                    modalData.innerHTML += modalHtml;
	                                    initializeRating();
	                                    
	                                  
	                                    // 평가하기 버튼
	                                    const submitButton = modalData.querySelector('#rateSubmitBtn');
	                                    submitButton.addEventListener('click', (e) => {
	                                        e.preventDefault();
											let   ratingValue = modalData.querySelector('input[name="rating"]:checked').value;
											//let ratingValue = selectedRating;
											//alert(ratingValue);
											
	                                        // 여기에서 fetch를 사용하여 데이터를 전송하고 처리하는 코드를 작성합니다.
											    // 선택된 값을 저장할 변수를 선언합니다.
 
	                                        let   rate_url = 'Company/Rate'; 
	                                        const formData = new FormData();
	                                        formData.append('rating', ratingValue);
	                                        formData.append('per_idx', peridx);
	                                        formData.append('com_idx', comidx);
	                                  
	                                        
	                                        fetch('Company/Rate', {
	                                            method: 'POST',
	                                            body: formData
	                                        })
	                                        .then(response => {
	                                            if (!response.ok) {
	                                                throw new Error('Network response was not ok');
	                                            }
	                                            return response.json();
	                                        })
	                                        .then(data => {
	                                            // 데이터 전송이 성공하면 모달을 닫습니다.
	                                            modalState.style.display = "none";
	                                        })
	                                        .catch(error => {
	                                            console.error('Error:', error);
	                                            // 에러 처리
	                                        });
	                                   
	                                        
	                                    });
	                                   	                                   
	                                    const rateSubmitButton = modalData.querySelector('.btn-primary');
	                                    rateSubmitButton.addEventListener('click', () => {
	                                        // 모달 창 닫기
	                                        modalState.style.display = "none";
	                                    });
	                                    
	                                })
	                                .catch(error => console.error('Error:', error));
	                            
	                            // 여기에 기업평가 버튼을 눌렀을 때 수행할 동작을 추가하세요.
	                            // 예를 들어, 모달을 띄우거나 다른 처리를 수행할 수 있습니다.
	                        });
	                    });

	                    outputEl.setAttribute('data-open', 'true'); // 속성 추가
	                })
	                .catch(error => {
	                    console.error('Error:', error);
	                    alert(error);
	                });
	            }
	        });
	    });
	    
	    // 모달 닫기 버튼에 이벤트 리스너 추가
	    modalCloseBtns.forEach(btn => {
	        btn.addEventListener('click', () => {
	            modalResult.style.display = "none"; // 모달 닫기
	            modalState.style.display = "none"; // 모달 닫기
	        });
	    });
	    
	    // 모달 외부 클릭 시 닫기
	    window.addEventListener('click', (event) => {
	        if (event.target == modalResult || event.target == modalState) {
	            modalResult.style.display = "none"; // 모달 닫기
	            modalState.style.display = "none"; // 모달 닫기
	        }
	    });
	});

	function initializeRating() {
	    const rateWrap = document.querySelectorAll('.rating');
	    const opacityHover = '0.5';

	    rateWrap.forEach(wrap => {
	        const stars = wrap.querySelectorAll('.star-icon');
	        wrap.addEventListener('click', () => {
	            stars.forEach((starIcon, idx) => {
	                starIcon.addEventListener('mouseenter', () => {
	                    initStars(stars); 
	                    filledRate(idx, stars.length, stars); 

	                    for (let i = 0; i < stars.length; i++) {
	                        if (stars[i].classList.contains('filled')) {
	                            stars[i].style.opacity = opacityHover;
	                        }
	                    }
	                });

	                starIcon.addEventListener('mouseout', () => {
	                    starIcon.style.opacity = '1';
	                });

	                wrap.addEventListener('mouseleave', () => {
	                    starIcon.style.opacity = '1';
	                });
	                
	                starIcon.addEventListener('click', () => {
	                    selectedRating = idx + 1; // 선택한 별의 값은 별의 순서에 1을 더한 값
	                    console.log('Selected Rating:', selectedRating);
	                    const ratingEl = document.querySelector('[name=rating]');
	                    ratingEl.value = selectedRating;
	                    
	                    // 여기에서 선택한 별점 값을 활용하여 원하는 작업을 수행할 수 있습니다.
	                    // 예를 들어, 선택한 별점 값을 서버로 전송하거나 다른 동작을 수행할 수 있습니다.
	                });
	                
	            });
	        });
	    });
	}

	function filledRate(index, length, stars) {
	    if (index <= length) {
	        for (let i = 0; i <= index; i++) {
	            stars[i].classList.add('filled');
	        }
	    }
	}

	function checkedRate(stars) {
	    const checkedRadio = document.querySelectorAll('input[type="radio"]:checked');

	    initStars(stars);
	    checkedRadio.forEach(radio => {
	        const previousSiblings = prevAll(radio);

	        for (let i = 0; i < previousSiblings.length; i++) {
	            previousSiblings[i].querySelector('.star-icon').classList.add('filled');
	        }

	        radio.nextElementSibling.classList.add('filled');

	        function prevAll() {
	            const radioSiblings = [];
	            let prevSibling = radio.parentElement.previousElementSibling;

	            while (prevSibling) {
	                radioSiblings.push(prevSibling);
	                prevSibling = prevSibling.previousElementSibling;
	            }
	            return radioSiblings;
	        }
	    });
	}

	function initStars(stars) {
	    for (let i = 0; i < stars.length; i++) {
	        stars[i].classList.remove('filled');
	    }
	}

	
// 북마크 리스트 
	document.addEventListener('DOMContentLoaded', () => {
	    let deletedRows = []; // 삭제된 행을 기록하는 배열
	
	    // 클릭 이벤트를 상위 요소에 등록하여 중첩 방지
	    document.querySelector('.bookmark .table-group-divider').addEventListener('click', (event) => {
	        const clickedElement = event.target;
	        if (clickedElement.classList.contains('bookmark-icon')) {
	            const bookmarkValue = clickedElement.closest('.td8').querySelector('[type=hidden]').value;
	            
	            const url = '/Bookmark/Delete?book_idx=' + bookmarkValue;
	
	            fetch(url, {
	                method: 'DELETE'
	            })
	            .then(response => {
	                if (!response.ok) {
	                    throw new Error('Network response was not ok');
	                }
	                return response.json();
	            })
	            .then(deletedData => {
	                const deletedRowNum = deletedData.row_num;
	
	                // 삭제된 요소의 인덱스를 기록
	                deletedRows.push(deletedRowNum);
	
	                // 화면에서 삭제된 데이터를 제외하고 나머지 데이터를 다시 그림
	                fetch('/Bookmark/List')
	                .then(response => response.json())
	                .then(bookmarkList => {
	                    const tableDivider = document.querySelector('.bookmark .table-group-divider');
	                    tableDivider.innerHTML = '';
	
	                    bookmarkList.forEach(bo => {
	                        // 삭제된 요소가 아닌 경우에만 추가
	                        if (!deletedRows.includes(bo.row_num)) {
	                            let html = '<tr data-row-num="' + bo.row_num + '">';
	                            html += '<th scope="row">'+bo.row_num+'</th>';
	                            html += '<td class="td2"><a href="/Post?post_idx='+bo.post_idx+'">'+bo.title+'</a></td>';
	                            html += '<td>'+bo.salary+'</td>';
	                            html += '<td>'+bo.career+'</td>';
	                            html += '<td>'+bo.mphone+'</td>';
	                            html += '<td class="td8">';
	                            html += '<input type="hidden" value="'+bo.book_idx+'">';
	                            html += '<img class="bookmark-icon" src="/img/bookmark_fill.svg" alt="북마크 아이콘">';
	                            html += '</td>';
	                            html += '</tr>';
	
	                            tableDivider.innerHTML += html;
	                        }
	                    });
	                })
	                .catch(error => console.error('Error:', error));
	            })
	            .catch(error => {
	                console.error('Error:', error);
	            });
	        }
	    });
	});

</script>

</body>

</html>