(function() {
	"use strict";

	angular.module("app").controller("sportsCtrl", function($scope, $http){

		$http.get("/api/v1/sports.json").then(function (response)	{
			$scope.sports = response.data;
		});

		$scope.addSport = function(sportTitle, sportDescription, sportPlayers) {
      var newSport = { name: sportTitle, description: sportDescription, players: sportPlayers};
      $http.post('/api/v1/sports.json', {sport: newSport}).then(function(response) {

        }, function (error) {
          $scope.error = error.statusText;
        });
      
      $scope.sports.push(newSport);
      $scope.sportTitle = "";
      $scope.sportDescription = "";
      $scope.sportPlayers = "";

    };
		window.scope = $scope;

	 });

	}());

