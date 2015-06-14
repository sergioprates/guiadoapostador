guiaDoApostador.factory('DBA', function ($cordovaSQLite, openDb, mostraPopUpErro, ocultaAguarde) {
    var self = this;
    var db = openDb();
    // Handle query's and potential errors
    self.query = function (query, parameters, funcaoCallback) {
        try
        {
            parameters = parameters || [];

            $cordovaSQLite.execute(db, query, parameters).then(funcaoCallback, function (err) {
                ocultaAguarde();
                mostraPopUpErro('Ocorreu um erro ao executar a transação: ' + err.message);
            });
        }
        catch(e){
            mostraPopUpErro('Ocorreu um erro no banco de dados: ' + e.message + ', Stack: ' + e.stack);
        }
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

