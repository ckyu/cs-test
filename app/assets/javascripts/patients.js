// angularJS module
var patientApp = angular.module('PatientApp', ['ngResource']);

patientApp.factory("Patient", function($resource) {
  return $resource("patient/:ssn", {ssn: '@ssn'}, {
    show: { method: 'GET', responseType: 'json'}
  });
})

patientApp.controller("patientController", function($scope, Patient) {
  $scope.patient = Patient.show()
})