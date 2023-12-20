<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">
<style type="text/css">


.table-article img { max-width: 650px; }
.file-item { padding: 7px; margin-bottom: 3px; border: 1px solid #ced4da; color: #777777; }
</style>

<main class="wrapper" style="margin:0 auto; width:100%;">
	<div id="layoutSidenav_content" style="background: #F8F8FF;">
		<div class="container-fluid px-5">
			<div class="body-container" style="width:80%; margin:5% auto; ">
				<div class="body-main">
		    			
				<div id="tab-content" style="padding: 15px 10px 5px; clear: both;">
				    <table class="table">
						<tr>
							<td align="left" width="50%">
								&nbsp;
							</td>
							<td align="right">
								&nbsp;
							</td>
						</tr>
					</table>
				
					<div class="card mb-5 w-80 " style="margin:0 auto">
					    <div class="card-header text-center">
					    	<h3>
					    		<i class="fas fa-clipboard-list"></i> 플러스 존 질문지
					    	</h3>
						</div>
						<div id="tab-content" style="padding: 15px 10px 5px; clear: both;">
							<table class="table">
								<thead>
									<tr>
										<td colspan="2" align="center">
											${dto.userName} 님의 응답
										</td>
									</tr>
								</thead>
								
								<tbody>
									<tr>
										<td width="50%" align="left">
											이름 : ${dto.userName}
										</td>
										<td width="50%" align="right">
											&nbsp;
										</td>
									</tr>
									
									<tr style="border-bottom:none;">
										<td colspan="2" valign="top" height="200">
											${dto.subject}
										</td>
										
										<td colspan="2" valign="top" height="200">
											${dto.content}
										</td>
									</tr>
									
								</tbody>
							</table>
								
							<table class="table">
								<tr>
									<td align="right">
										<button type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/pluszone/question/list';">리스트</button>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</main>