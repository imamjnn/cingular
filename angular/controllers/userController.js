var app = angular.module('mainApp');

app.controller('userCtrl', function($scope, $location, $http, $routeParams, $window){
	
	var token = $window.localStorage.getItem('token');
	if(token == null){
		$location.url('/login');
	}else{
		var get_user = {
			method: 'GET',
			url: '/api/user/getuser',
			headers: {
				Authorization: token
			}
		};
		$http(get_user)
		.then(function(res){
			$scope.users = res.data.users;
			console.log(res);
		});

		$scope.refresh = function(){
			$http.get('/api/user/getuser')
			.then(function(res){
				$scope.users = res.data.users;
			})
		};

		$scope.delUser = function(id){
			var del = {
				method: 'DELETE',
				url: '/api/user/deleteuser/'+id
			}
			var c = confirm('Are you sure?');
			if(c == true){
				$http(del).then(function(res){
					$scope.refresh();
				})
			}
			
		};

		$scope.logOut = function() {
			$window.localStorage.removeItem('token');
			console.log('logout man');
		}
	}
	

});