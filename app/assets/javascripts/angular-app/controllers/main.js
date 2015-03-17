angular
  .module('app')
  .controller('MainCtrl', ['Band', '$scope', function(Band, $scope){
    $scope.bands = Band.query();
    $scope.numbands = $scope.bands.length;
    //console.log("Mis bandas" + $scope.bands);
    //$scope.numerobandas = $scope.bands.length;
    $scope.albums =[{"id":1,"band_id":1,"title":"The Suburbs"},{"id":3,"band_id":1,"title":"Funeral"},{"id":8,"band_id":1,"title":"Reflektor"},{"id":2,"band_id":2,"title":"Unknown Pleasures"},{"id":5,"band_id":2,"title":"Closer"},{"id":4,"band_id":3,"title":"Unidad de Desplazamiento"},{"id":11,"band_id":3,"title":"Canciones para una Orquesta Química"},
    {"id":6,"band_id":4,"title":"La zona sucia"},{"id":7,"band_id":4,"title":"El manifiesto desastre"}];
    $scope.total = $scope.albums.length;
  }]);