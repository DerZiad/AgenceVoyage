<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance"
	prefix="layout"%>
<layout:extends name="../layout-resp.jsp">
	<layout:put block="content" type="REPLACE">

		<div class="main-card mb-3 card">
			<div class="card-body">
				<form id="frm" class="form-group" action="/admin/activite"
					method="POST">

					<h5 class="card-title">Création d'une Activite Voyage</h5>
					<input name="id" id="id" type="hidden" class="form-control"
						value="${activite.id}">
					<div class="form-row">
						<div class="col-md-6">
							<div class="position-relative form-group">
								<label for="name" class="">Label Activite</label><input
									name="name" id="name" placeholder="Label Theme" type="text"
									class="form-control" value="${activite.nomActivite}">
								<c:choose>
									<c:when test="${ empty errors}">
										<p style="color: red;">
											<c:out value="${errors.nomActivite}"></c:out>
										</p>
									</c:when>
									<c:otherwise>
										<p style="color: red;">
											<c:out value="${errors.nomActivite}"></c:out>
										</p>
									</c:otherwise>
								</c:choose>

							</div>

						</div>
					</div>

					<div class="form-row">
						<div class="col-md-6">
							<div class="position-relative form-group">
								<label for="name" class="">Description Activite</label><input
									name="description" id="dscp"
									placeholder="Description du Theme " type="text"
									class="form-control" value="${activite.description}">
								<p style="color: red;">
									<c:if test="${not empty errors}">
										<c:out value="${errors.description}"></c:out>
									</c:if>
								</p>
							</div>

						</div>
					</div>
					<div class="form-row">
						<div class="col-md-6">
							<div class="position-relative form-group">
								<div class="container1">
									<button class="btn btn-info add_form_field">
										Ajouter Sous-Activite &nbsp; <span
											style="font-size: 16px; font-weight: bold;">+ </span>

									</button>
									<c:if test="${! modify}">
										<div class="form-row">
											<div class="col-md-6">
												<div class="position-relative form-group">
													<label for="name" class="">Label SousActivite</label> <input
														id="ssa" type="text" value="" name="myparams"
														class="form-control" /></br> <label for="name" class="">Description
														SousActivite</label> <input type="text" id="dess" value=""
														name="SousActdescrip" class="form-control" />
												</div>
											</div>
										</div>
									</c:if>
									<c:if test="${modify}">
										<c:forEach var="ss" items="${activite.sousActivites}">
											<div>
												<input name="sid" id="id" type="hidden" class="form-control"
													value="${ss.id}"> <label for="name" class="">Label
													SousActivite</label> <input type="text" value="${ss.titre}"
													name="myparams" /></br> <label for="name" class="">Description
													SousActivite</label> <input type="text" value="${ss.description}"
													name="SousActdescrip" /> <a href="#" class="delete">Delete</a>
											</div>
										</c:forEach>
									</c:if>
									<div>
										<p style="color: red;">

											<c:if test="${bool}">
												<c:out
													value="SousActivite doivent contenir un titre et une description qui depassent au moins 6 caraceters pour chacune"></c:out>
											</c:if>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>



					<button class="mt-2 btn btn-primary col-md-6" type="submit">Enregistrer</button>

				</form>
			</div>
			<div class='row'>
				<div class="col-md-6">
					<button id="rst" class=" mt-2 btn btn-danger">CLEAR</button>
				</div>
			</div>
			<c:set var="cmp" value="${cmp}" scope="request"></c:set>
			<div class="main-card mb-3">
				<div class="card-body">
					<h5 class="card-title">Liste des Activites de Voyage</h5>
					<table class="mb-0 table table-striped">
						<thead>
							<tr>
								<th>LABEL</th>
								<th>DESCRIPTION</th>
								<th>Sous Activites</th>
								<th>Actions</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="activity" items="${activities}">
								<tr>
									<td style="color: black">${activity.nomActivite}</td>
									<td style="color: black">${activity.description}</td>
									<td><c:forEach var="s" items="${activity.sousActivites}"
											varStatus="status">
											<li>${s.titre}</li>
											<c:set var="cmp" value="${cmp + 1}"></c:set>

										</c:forEach></td>
									<td><a style="color: black"
										href="/admin/activite/${activity.id}"> <i
											class="material-icons" data-toggle="tooltip" title="Edit" style="color:#1de9b6">&#xE254;</i></a>

										<a href="/admin/activite/deleteActivite/${activity.id}"
										class="delete"><i class="material-icons"
											data-toggle="tooltip" title="Delete" style="color:#f44336;">&#xE872;</i></a>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>

	</layout:put>
	<layout:put block="scriptsfile" type="REPLACE">
		<script src="/delibdesign/js/Activite/script.js"></script>
		<script src="/delibdesign/js/hotel/template.js"></script>
	</layout:put>
</layout:extends>
