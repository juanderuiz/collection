angular
  .module('app')
  .controller('MainCtrl', ['Band', 'Album', '$scope', function(Band, Album, $scope){
    $scope.bands = Band.query();
    
    $scope.selectAlbums = function(id){ //Get Albums from a Band
    	console.log("Buscando discos...");
    	$scope.discos = Album.get({band_id: id});
    	$scope.totalDiscosBanda = $scope.discos.length;
    	console.log("Fin Buscando discos...");
    };

  }]);