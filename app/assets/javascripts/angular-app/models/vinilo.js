angular
  .module('app')
  .factory('Vinilo', ['$http', function($http) {
    return {
      all: function(){
        return $http({method: 'GET', url: '/api/v1/vinilos'});
      }
  };
}]);