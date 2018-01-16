var app = angular.module('mainApp');

app.controller('loginCtrl', function($scope, $http, $location, $window){
	var token = $window.localStorage.getItem('token');
	if(token){
		$location.url('/user');
	}else{
		$scope.isLoading = false;
		$scope.user = {
			username: '',
			password: ''
		};
		$scope.onSubmit = function(){
			$scope.isLoading = true;
			var login = {
				method: 'POST',
				url: '/api/auth/check_login',
				headers: {
					'Content-Type': 'application/x-www-form-urlencoded'
				},
				data: {
					'username': $scope.user.username,
					'password': $scope.user.password
				}
			};
			$http(login).then(function(res){
				$scope.isLoading = false;
				if(res.data.status === 'success'){
					console.log('login berhasil, selanjutnya terserah anda');
					$window.localStorage.setItem('token', res.data.token);
					$location.url('/user');
				}else{
					console.log('gagal '+res);
				}
			});
		}
	}
	
})