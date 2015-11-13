var app = angular.module('caresharing', ['ngResource','ngRoute']);

// Routes
app.config(function($routeProvider, $locationProvider) {
  $routeProvider
    .when('/patient/:ssn', {
      templateUrl: 'index.html',
      controller: 'TestCtrl',
      controllerAs: 'test',
      // resolve: {
      //   // 1 second delay
      //   delay: function($q, $timeout) {
      //     var delay = $q.defer();
      //     $timeout(delay.resolve, 1000);
      //     return delay.promise;
      //   }
      // }
    })
    .otherwise({ 
      redirectTo: '/404.html'
    });
    $locationProvider
      .html5Mode(true);
});

app.factory('Patient', ['$resource', function($resource) {
  return $resource('/patients/:ssn', {ssn: "@ssn"});
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