guiaDoApostador.factory('DBA', function ($cordovaSQLite, $ionicPlatform, openDb) {
    var self = this;
    var db = openDb();
    // Handle query's and potential errors
    self.query = function (query, parameters, funcaoCallback) {
        parameters = parameters || [];

        $cordovaSQLite.execute(db, query, parameters).then(funcaoCallback, function (err) {
            console.warn('I found an error');
            console.warn(err);
        });
    }

    // Proces a result set
    self.getAll = function (result) {
        var output = [];

        for (var i = 0; i < result.rows.length; i++) {
            output.push(result.rows.item(i));
        }
        return output;
    }

    // Proces a single result
    self.getById = function (result) {
        var output = null;
        output = angular.copy(result.rows.item(0));
        return output;
    }

    // Proces a single result
    self.getID = function (result) {
        return result.insertId;
    }

    return self;
})

