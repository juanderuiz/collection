angular
  .module('app')
  .factory('Band', function($resource){
    var Band = $resource('/api/v1/bands/:id',
    	                 {id: '@id'}, {
    	                 	'query':  { method:'GET', isArray:true },
    	                 	'update': { method: 'PUT' }
    	                 });
    return Band;
  });
