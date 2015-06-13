guiaDoApostador.factory('PushProcessingService', function() {
    
function gcmSuccessHandler(result) {
    alert('NOTIFY  pushNotification.register succeeded.  Result = '+result)
}
function gcmErrorHandler(error) {
    alert('NOTIFY  '+error);
}
function onDeviceReady() {
    alert('NOTIFY  Device is ready.  Registering with GCM server');
    //register with google GCM server
    try {
        var pushNotification = window.plugins.pushNotification;
    }
    catch (e) {
        alert('Falha ao pegar objeto push');
    }
    try {
        pushNotification.register(gcmSuccessHandler, gcmErrorHandler, { 'senderID': '497093213372', 'ecb': 'onNotificationGCM' });
    }
    catch (e) {
        alert('Falha ao registrar' + JSON.stringify(e));
    }
}
return {

    initialize : function () {
        alert('NOTIFY  initializing');
        document.addEventListener('deviceready', onDeviceReady, false);
    },
    registerID : function (id) {
        //Insert code here to store the user's ID on your notification server.
        //You'll probably have a web service (wrapped in an Angular service of course) set up for this.
        //For example:
        MyService.registerNotificationID(id).then(function(response){
            if (response.data.Result) {
                alert('NOTIFY  Registration succeeded');
            } else {
                alert('NOTIFY  Registration failed');
            }
        });
    },
    //unregister can be called from a settings area.
    unregister : function () {
        alert('unregister')
        var push = window.plugins.pushNotification;
        if (push) {
            push.unregister(function () {
                alert('unregister success')
            });
        }
    }
}
});