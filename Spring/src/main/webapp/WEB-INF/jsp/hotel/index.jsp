<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance"
	prefix="layout"%>
<layout:extends name="../layout-resp.jsp">
	<layout:put block="content" type="REPLACE">
			<div class="table-wrapper">
				<div class="table-title">
					<div class="row">
						<div class="col-sm-6">
							<h2>
								Manage <b>Employees</b>
							</h2>
						</div>
						<div class="col-sm-6">
							<a href="#addEmployeeModal" class="btn btn-success"
								data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add
									New Employee</span></a> <a href="#deleteEmployeeModal"
								class="btn btn-danger" data-toggle="modal"><i
								class="material-icons">&#xE15C;</i> <span>Delete</span></a>
						</div>
					</div>
				</div>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th><span class="custom-checkbox"> <input
									type="checkbox" id="selectAll"> <label for="selectAll"></label>
							</span></th>
							<th>Nom hotel</th>
							<th>Nombre etoiles</th>
							<th>Ville</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody id="hotelslist">
						
					</tbody>
				</table>
			</div>
		
	</layout:put>
	
	<layout:put block="modals" type="REPLACE">
		<jsp:include page="modalHotel.jsp"></jsp:include>
	</layout:put>
	<layout:put block="cssfiles" type="REPLACE">
		<link rel="stylesheet" href="/delibdesign/css/hotel/style.css"/>
	</layout:put>
	<layout:put block="scriptsfile" type="REPLACE">
		<script src="/delibdesign/js/hotel/script.js"></script>
		<script src="/delibdesign/js/hotel/template.js"></script>
	</layout:put>
</layout:extends>



<script src="/hotel/script.js"></script>
<script src="/js/hotel/script.js"></script>
<link rel="stylesheet" href="/hotel/style.css">
	