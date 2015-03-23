angular
  .module('app')
  .controller('MainCtrl', ['Band', 'Album', 'Vinilo', '$scope', function(Band, Album, Vinilo, $scope){
    $scope.bands = Band.query();
    setFullCollection();
    
    $scope.selectAlbums = function(id){ //Get All Albums from a Band
    	console.log("Buscando discos...");
    	//$scope.discos = Album.get({band_id: id});
    	$scope.discos = Album.query({band_id: id});
    	console.log("Fin Buscando discos...");
    };

    $scope.fullCollection = true;
    $scope.currentBand = null;
    $scope.currentBandId = null;

    function setFullCollection(){ // Get All Albums in the Collection
    	$scope.vinilos = Vinilo.all().success(function(data){
          $scope.vinilos = data;
        });
    	$scope.fullCollection = true;
    	$scope.currentBand = null;

    	cancelCreating();
    	cancelEditing();
    }

    function setCurrentBand(band){
    	$scope.currentBand = band;
    	$scope.currentBandId = band.id;
    	$scope.fullCollection = false;

    	cancelCreating();
    	cancelEditing();
    }
   
    $scope.setFullCollection = setFullCollection;
    $scope.setCurrentBand = setCurrentBand;

    //CRUD Actions
    function createAlbum(newAlbum){
    	console.log("Trying to create a new album...");
    	newAlbum.band_id = $scope.currentBandId;
    	//En el input hidden, newAlbum.band_id = $scope.currentBand.id;
    	Album.save({band_id: $scope.currentBandId}, newAlbum);
    	console.log("Creado!");
    	$scope.discos = Album.get({band_id: $scope.currentBandId});
    	resetCreateForm();
    	//Esto hay que pensarlo bien, viendo como coge la banda en controller
    	//de Rails... que lo coge de la url... eso se hace con el $resource?
    }

    $scope.createAlbum = createAlbum;

    function resetCreateForm(){
    	$scope.newAlbum = {
    		title: '',
    		band_id: null
    	};
    }

    $scope.resetCreateForm = resetCreateForm;

    //CREATE AND EDIT
    $scope.isCreating = false;
    $scope.isEditing = false;

    function startCreating(){
    	$scope.isCreating = true;
    	$scope.isEditing = false;

    	resetCreateForm();
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