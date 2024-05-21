<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   
   <div class="container" name="mypostparticipate">
     <h2>지원 현황</h2>
     
        <div id="mypost" class="mt-3">
           <table class="table">
             <thead>
               <tr>
                 <th scope="col">번호</th>
                 <th scope="col">이력서 이름</th>
                 <th scope="col">지원자</th>
                 <th scope="col">상태</th>
               </tr>
             </thead>
             <tbody class="table-group-divider">
                <c:forEach var="participateList" items="${participateList}" varStatus="status">
                  <tr>
                    <th scope="row">${status.count}</th>
                    <td><a href="/Company/ParticipateDetail?apply_idx=${participateList.apply_idx}">${participateList.title}</a></td>
                    <td>${participateList.name}</td>
                    <td>${participateList.state}</td>
                  </tr>
               </c:forEach>
             </tbody>
           </table>
        </div>
        
   </div>
