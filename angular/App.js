var app = angular.module('mainApp', ['ngRoute', 'ngStorage']);

app.config(function($routeProvider) {
    $routeProvider
    .when("/", {
        templateUrl : "/angular/pages/home.html",
        //controller : "crudCtrl"
    })
    .when("/login", {
        templateUrl : "/angular/pages/login.html",
        controller : "loginCtrl"
    })
    .when("/user", {
        templateUrl : "/angular/pages/user.html",
    })
    .when("/edit/:id", {
        templateUrl : function(stateParams){
        	return "/crud/add/"+stateParams.id;
        },
        //controller : "editCtrl"
    });
});