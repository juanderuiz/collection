angular
  .module('app')
  .factory('Album', function($resource){
    var Album = $resource('/api/v1/bands/:id/albums',
    	                 {id: '@id'}, {
    	                 	'query':  { method:'GET', isArray:true },
    	                 	'update': { method: 'PUT' }
    	                 });
    return Album;
  });