guiaDoApostador.service('mostraAguarde', function ($ionicLoading) {
    return function () {
        $ionicLoading.show({
            template: "<img src='img/aguarde.gif' /> <b>Loading...</b>"
        });
    }
})
.service('ocultaAguarde', function ($ionicLoading) {
    return function () { $ionicLoading.hide(); }
})
.service('mostraPopUpSucesso', function ($ionicLoading, $ionicPopup, returnToState) {
    return function (tituloModal, texto, pagina) {
        var alertPopup = $ionicPopup.alert({
            title: tituloModal,
            template: texto
        });
        alertPopup.then(function (res) {
            returnToState(pagina);
        });
    }
})
.service('openDb', function ($cordovaSQLite) {
    return function () {
        var db;
        if (window.cordova) {
            db = $cordovaSQLite.openDB("guiadoapostador.db"); //device

        } else {
            db = window.openDatabase("guiadoapostador.db", '1', 'my', 1024 * 1024 * 100); // browser
        }

        $cordovaSQLite.execute(db, "DROP TABLE apostas");
        $cordovaSQLite.execute(db, "DROP TABLE dezenas");
        $cordovaSQLite.execute(db, "CREATE TABLE IF NOT EXISTS apostas (idAposta integer primary key, idConcurso integer, TipoConcurso TEXT, Verificado integer,  datCadastro datetime default current_timestamp, datSorteio datetime)");
        $cordovaSQLite.execute(db, "CREATE TABLE IF NOT EXISTS dezenas (idAposta integer, dezena integer)");
        return db;
    }
})
.service('cadastraAposta', function (cadastraApostaMegaSena) {
    return function (aposta) {
        switch (aposta.Loteria.Tipo) {
            case 7:
                cadastraApostaMegaSena(aposta);
                break;
            default:
        }
    }
})
.service('cadastraApostaMegaSena', function ($cordovaSQLite, openDb) {
    return function (aposta) {
        var db = openDb();
        var query = "INSERT INTO apostaMegasena (idConcurso) VALUES (?)";

        $cordovaSQLite.execute(db, query, [aposta.Loteria.ID]).then(function (res) {
            console.log("INSERT ID -> " + res.insertId);

            aposta.ID = res.insertId;

            var db = openDb();
            var query = "INSERT INTO dezenasApostaMegasena (idAposta, dezena) VALUES (?,?)";

            for (var i = 0; i < aposta.Dezenas.length; i++) {
                $cordovaSQLite.execute(db, query, [aposta.ID, aposta.Dezenas[i]]).then(function (res) {
                    console.log("INSERT ID -> " + res.insertId);

                }, function (err) {
                    alert('Erro na hora de inserir a dezena da aposta na mega sena: ' + JSON.stringify(err));
                    console.error(err);
                });
            }

        }, function (err) {
            alert('Erro na hora de inserir a aposta: ' + JSON.stringify(err));
            console.error(err);
        });
    }
})
.service('listarApostas', function (openDb, $cordovaSQLite) {
    return function (funcaoCallback) {
        
        //if (tipoLoteria == undefined) {
            var query = "SELECT idAposta, idConcurso FROM apostaMegasena";
            var db = openDb();
            $cordovaSQLite.execute(db, query, []).then(funcaoCallback,
                function (error) {
                    console.log(JSON.stringify(error));
                });
      //  }
    }
})