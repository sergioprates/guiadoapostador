guiaDoApostador.factory('DBA', function ($cordovaSQLite, mostraPopUpErro, $ionicPlatform) {
    var self = this;   

    // Handle query's and potential errors
    self.query = function (query, parameters, funcaoCallback) {
        try
        {
            $ionicPlatform.ready(function () {


                var db;
                try {
                    // if (window.cordova) {
                    alert('Criando base de dados cordova');
                    db = $cordovaSQLite.openDB({ name: "testenovovooo.db" }); //device

                    //} else {
                    //    alert('Criando base de dados web');
                    //    db = window.openDatabase("blabla.db", '1', 'blabla', 1024 * 1024 * 100); // browser
                    //}
                    alert('Base de dados criada, criando as tables');

                    $cordovaSQLite.execute(db, "CREATE TABLE IF NOT EXISTS apostas (idAposta integer primary key, idConcurso integer, TipoConcurso TEXT, Verificado integer,  datCadastro datetime default current_timestamp, datSorteio datetime)");
                    $cordovaSQLite.execute(db, "CREATE TABLE IF NOT EXISTS dezenas (idAposta integer, dezena integer)");
                    alert('tables criadas');
                }
                catch (e) {
                    mostraPopUpErro('Não foi possível conectar à base de dados repositorio. Erro: ' + JSON.stringify(e));
                }

                parameters = parameters || [];
                try{
                    $cordovaSQLite.execute(db, query, parameters).then(funcaoCallback, function (err) {
                        mostraPopUpErro('Não foi possível conectar à base de dados, Repositorio. Erro: ' + JSON.stringify(err));
                    });
                }
                catch(e){
                    mostraPopUpErro('Não foi possível executar a query. Erro: ' + JSON.stringify(e));
                }

            });
           
        }
        catch(e){
            alert('erro no metodo query: ' + JSON.stringify(e));
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

