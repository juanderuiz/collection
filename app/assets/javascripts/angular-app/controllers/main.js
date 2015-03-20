angular
  .module('app')
  .controller('MainCtrl', ['Band', 'Album', 'Vinilo', '$scope', function(Band, Album, Vinilo, $scope){
    $scope.bands = Band.query();
    $scope.vinilos = Vinilo.all().success(function(data){
      $scope.vinilos = data;
    });
    
    $scope.selectAlbums = function(id){ //Get Albums from a Band
    	console.log("Buscando discos...");
    	$scope.discos = Album.get({band_id: id});
    	//$scope.totalDiscosBanda = $scope.discos.length;
    	console.log("Fin Buscando discos...");
    };

  }]);