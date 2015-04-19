angular.module('app', [
  'ngRoute',
  'ngResource'
])
  .config(['$routeProvider', function($routeProvider){
    $routeProvider
        .when('/',{
              controller: 'MainCtrl',
              templateUrl:'assets/angular-app/partials/main.html'
        }).when('/bands', {
              controller: 'BandsCtrl'
        }).otherwise({
              redirectTo: '/'
    });
  }]);
