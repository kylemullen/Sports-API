(function() {
	"use strict";

	angular.module("app").controller("sportsCtrl", function($scope, $http){

		$http.get("/api/v1/sports.json").then(function (response)	{
			$scope.sports = response.data;
		});

    $scope.sportVisible =

		$scope.addSport = function(sportTitle, sportCourt, sportPlayers) {
      var newSport = { name: sportTitle, court: sportCourt, players: sportPlayers};
      $http.post('/api/v1/sports.json', {sport: newSport}).then(function(response) {
        $scope.sports.push(newSport);
        $scope.sportTitle = "";
        $scope.sportCourt = "";
        $scope.sportPlayers = "";

        }, function (error) {
          $scope.errors = error.data.errors;
        });
           
      

    };
    
    $scope.changeOrder = function(attribute) {
      $scope.orderAttribute = attribute;
      $scope.sortDirection = !$scope.sortDirection;
    };



		window.scope = $scope;

	 });

	}());

