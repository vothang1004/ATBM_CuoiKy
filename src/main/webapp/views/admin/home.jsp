<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<div class="direct">
	<span><i class="direct-icon fas fa-home"></i>Trang chủ</span> &#160;
	&#62; &#160; Thống kê
</div>
<div class="chart">
	<div class="row">
		<div class="col l-6">
			<div class="char-main" style="margin-bottom: 24px">
				<canvas id="chart1" style="width: 100%; height: 400px;"></canvas>
			</div>
		</div>
		<div class="col l-6">
			<div class="char-main" style="margin-bottom: 24px">
				<canvas id="chart2" style="width: 100%; height: 400px;"></canvas>
			</div>
		</div>
		<div class="col l-6">
			<div class="char-main" style="margin-bottom: 24px">
				<canvas id="chart3" style="width: 100%; height: 400px;"></canvas>
			</div>
		</div>
		<div class="col l-6">
			<div class="char-main" style="margin-bottom: 24px">
				<canvas id="chart4" style="width: 100%; height: 400px;"></canvas>
			</div>
		</div>
	</div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
<script src="<c:url value='/templates/admin/js/chart.js' />"></script>