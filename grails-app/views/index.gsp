<!DOCTYPE html>
<html>
<head>
	<title>Currency transfer</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
	<link rel="shortcut icon" href="${assetPath(src: 'transfer.png')}" type="image/png">
	<asset:stylesheet src="application.css"/>
	<asset:javascript src="lib/jquery/jquery-2.1.1.js"/>
	<asset:javascript src="lib/bootstrap.min.js"/>
	<asset:javascript src="lib/angular/angular.js"/>
	<asset:javascript src="lib/angular/angular-resource.js"/>
	<asset:javascript src="application.js"/>
</head>

<body ng-app="exchange">
	<div ng-controller="ExchangeController as exchange" class="workplace">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1 class="logo">
						<asset:image src="transfer.png" class="in-block"/>
						Currency transfer
					</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<h2>You will send</h2>
					<div class="input-group work-field">
						<input type="text" class="form-control text-right" style="padding-right: 20px" ng-model="amount"/>
						<div class="input-group-btn">
							<button type="button" class="btn btn-default dropdown-toggle"
									data-toggle="dropdown"
									aria-haspopup="true"
									aria-expanded="false">
								{{base.name}} <asset:image src="{{base.icon}}" class="desktop"/>
							</button>
							<ul class="dropdown-menu dropdown-menu-right">
								<li ng-repeat="currency in base.rates">
									<a href="#" ng-click="selectCurrency(currency.code)">
										{{currency.code}} <asset:image src="{{currency.icon}}"/>
									</a>
								</li>
							</ul>
						</div>
					</div>
					
					<h2>Than currency will be converted to</h2>
					<div class="input-group work-field">
						<div class="input-group-btn">
							<button type="button" class="btn btn-default btn-block dropdown-toggle"
									data-toggle="dropdown"
									aria-haspopup="true"
									aria-expanded="false">
								{{toCurrency.name}} <asset:image src="{{toCurrency.icon}}" class="desktop"/>
							</button>
							<ul class="dropdown-menu dropdown-menu-right">
								<li class="text-right" ng-repeat="currency in base.rates">
									<a href="#" ng-click="selectResultCurrency(currency.code)">
										{{currency.name}} <asset:image src="{{currency.icon}}"/>
									</a>
								</li>
							</ul>
						</div>
					</div>
					
					<h2>You must know</h2>
					<span class="text-block">
						We have unique currency: <b>1 {{base.name}} = {{toCurrency.coefficient | number : 4}} {{toCurrency.code}}</b>
					</span>
					
					<h2>Fee</h2>
					<span class="text-block">
						Our prices is lower is the world!<br>
						So, for this transaction you will pay only <b>{{toCurrency.fee * 100 | number: 2}}%</b> of this amount, which is equal to
						<b>{{amount * toCurrency.coefficient * toCurrency.fee | number : 2 | number : 2}} {{toCurrency.code}}</b>
					</span>
					
					<h2>Calculation and result</h2>
					<span class="text-block">After calculation as a result your recipient gets</span>
					<div class="work-field">
						<div class="form-control text-center">
							{{amount * toCurrency.coefficient * (1 - toCurrency.fee) | number : 2}} {{toCurrency.code}}
						</div>
					</div>
					
					<h3>If you think that all is well, we can continue</h3>
					<div class="text-center">
						<button class="continue">Continue</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
