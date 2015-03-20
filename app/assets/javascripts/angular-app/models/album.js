angular
  .module('app')
  .factory('Album', function($resource){
    var Album = $resource('/api/v1/bands/:band_id/albums/:id',
    	                 {band_id: '@band_id', id: '@id'}, {
    	                 	'query':  { method:'GET', isArray:true },
    	                 	'get':  {method:'GET', isArray:true},
    	                 	'update': { method: 'PUT' }
    	                 });
    return Album;
  });