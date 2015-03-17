angular
  .module('app', ['ngRoute', 'ngResource'])
  .config(['$routeProvider', function($routeProvider){
    $routeProvider.when('/',{
      controller: 'MainCtrl',
    }).when('/bands', {
      controller: 'BandsCtrl'
    }).otherwise({
      redirectTo: '/'
    });
  }]);
