﻿guiaDoApostador.controller('homeController', ['$scope', '$cordovaPush', '$rootScope', function ($scope, $cordovaPush, $rootScope) {
    
    $scope.items = [
    {
        id: 1, concurso: '1234',
        loteria: 'Mega-Sena',
        image: 'img/loteriaslogo/megasena.png',
        premio: 'R$ 25 milhões',
        proximoSorteio: 'dois dias'
    }];

    $scope.registrarPush = function () {
        registraPush();
    };

    //$rootScope.$on('$cordovaPush:notificationReceived', function (event, notification) {
    //    switch (notification.event) {
    //        case 'registered':
    //            if (notification.regid.length > 0) {
    //                $scope.regID = notification.regid;
    //            }
    //            break;

    //        case 'message':
    //            // this is the actual push notification. its format depends on the data model from the push server
    //            alert('message = ' + notification.message + ' msgCount = ' + notification.msgcnt);
    //            break;

    //        case 'error':
    //            alert('GCM error = ' + notification.msg);
    //            break;

    //        default:
    //            alert('An unknown GCM event has occurred');
    //            break;
    //    }
    //});

    try {
        navigator.splashscreen.hide();
    }
    catch (e) {

    }
}]);


