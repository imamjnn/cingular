<!DOCTYPE html>
<html ng-app="mainApp">
<head>
	<title>Main</title>
	<?php $this->load->view('partial/head') ?>
</head>
<body>
	<div class="container">
		<div class="row">
			<div ng-view></div>
		</div>
	</div>
	<?php $this->load->view('partial/foot') ?>
</body>
</html>