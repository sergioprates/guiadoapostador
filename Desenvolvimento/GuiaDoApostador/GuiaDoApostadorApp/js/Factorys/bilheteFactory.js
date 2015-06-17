guiaDoApostador.factory('bilheteFactory', function (DBA) {
    var self = this;

    self.all = function () {
        return DBA.query("SELECT idAposta, numeroBilhete FROM bilhete")
          .then(function (result) {
              return DBA.getAll(result);
          });
    }

    self.get = function (idAposta, funcaoCallback) {
        var parameters = [idAposta];
        DBA.query("SELECT idAposta, numeroBilhete FROM bilhete WHERE idAposta = (?)", parameters, funcaoCallback);
    }

    self.add = function (aposta, bilhete, funcaoCallback) {
        var parameters = [aposta.ID, bilhete];
        var query = "INSERT INTO bilhete (idAposta, numeroBilhete) VALUES (?,?)";
        DBA.query(query, parameters, funcaoCallback);
    }

    self.remove = function (id, funcaoCallback) {
        var parameters = [id];
        return DBA.query("DELETE FROM bilhete WHERE idAposta = (?)", parameters, funcaoCallback);
    }

    self.update = function (id, bilhete, funcaoCallback) {
        var parameters = [bilhete, id];
        return DBA.query("UPDATE bilhete SET numeroBilhete = (?) WHERE idAposta = (?)", parameters, funcaoCallback);
    }

    return self;
})