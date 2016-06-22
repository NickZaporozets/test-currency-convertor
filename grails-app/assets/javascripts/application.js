var app = angular.module('exchange', []);

app.controller('ExchangeController', ['$http', '$scope', function ($http, $scope) {
    $scope.amount = 100;

    var setResultCurrency = function (code) {
        angular.forEach($scope.base.rates, function (currency) {
            if (currency.code == code)
                $scope.toCurrency = currency;
        });
    };

    var setCurrency = function (code) {
        $http.get('assets/' + code + '.json').success(function (data) {
            $scope.base = data;
            setResultCurrency(data.rates[0].code);
        });
    };
    setCurrency("USD");

    $scope.selectResultCurrency = function (code) {
        setResultCurrency(code);
    };

    $scope.selectCurrency = function (code) {
        setCurrency(code);
    };
}]);