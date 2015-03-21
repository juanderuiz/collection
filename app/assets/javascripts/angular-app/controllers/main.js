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

    $scope.fullCollection = true;
    $scope.currentBand = null;

    function setFullCollection(){
    	$scope.fullCollection = true;
    	$scope.currentBand = null;

    	cancelCreating();
    	cancelEditing();
    }

    function setCurrentBand(band){
    	$scope.currentBand = band;
    	$scope.fullCollection = false;

    	cancelCreating();
    	cancelEditing();
    }
   
    $scope.setFullCollection = setFullCollection;
    $scope.setCurrentBand = setCurrentBand;

    //CREATE AND EDIT
    $scope.isCreating = false;
    $scope.isEditing = false;

    function startCreating(){
    	$scope.isCreating = true;
    	$scope.isEditing = false;
    }

    function cancelCreating(){
    	$scope.isCreating = false;
    }

    function startEditing(){
    	$scope.isEditing = true;
    	$scope.isCreating = false;
    }

    function cancelEditing(){
    	$scope.isEditing = false;
    }

    function shouldShowCreating(){
    	return $scope.currentBand && !$scope.isEditing;
    }

    function shouldShowEditing(){
    	return $scope.isEditing && !$scope.isCreating;
    }

    $scope.startCreating = startCreating;
    $scope.startEditing = startEditing;
    $scope.cancelCreating = cancelCreating;
    $scope.cancelEditing = cancelEditing;
    $scope.shouldShowCreating = shouldShowCreating;
    $scope.shouldShowEditing = shouldShowEditing;

  }]);