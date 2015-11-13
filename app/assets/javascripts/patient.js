var app = angular.module('caresharing', ['ngResource','ngRoute']);

// Routes
app.config(function($routeProvider, $locationProvider) {
  $routeProvider
    .when('/patient/:ssn', {
      templateUrl: 'index.html',
      controller: 'TestCtrl',
      controllerAs: 'test',
    })
    .otherwise({ 
      redirectTo: '/'
    });
    $locationProvider
      .html5Mode(true);
});

// Factory
app.factory('Patient', ['$resource', function($resource) {
  return $resource('/patients/:ssn.json', {ssn: "@ssn"});
}]);

var controllers = {};
controllers.TestCtrl = function ($scope, $route, $routeParams, $interval, $window, Patient) {
  $scope.$on('$routeChangeSuccess', function() {
    $scope.patient = Patient.get({
        // GET parameters
        ssn: $routeParams.ssn
      },
      function() {
        // success callback
      },
      function(response) {
        // error callback
        if (response.status == 404) {
          $scope.error = "Patient does not exist."
          $window.location.href = "/404.html"
        }
    });

    // 5-second refresh behavior
    $interval(function() {
      patient_new = Patient.get({
        ssn: $routeParams.ssn
      },
      function() {
        $scope.patient = patient_new;
      },
      function() {
        $scope.error = "Something went wrong.";
      });
    }, 5000);

  });
};

app.controller(controllers);