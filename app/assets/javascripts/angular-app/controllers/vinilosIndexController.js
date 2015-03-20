angular
  .module('app')
  .controller('vinilosIndexCtrl', ['$scope', 'Vinilo', function($scope, Vinilo) {
    Vinilo.all().success(function(data){
      $scope.vinilos = data;
    });
}]);