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

    self.remove = function (aposta) {
        var parameters = [aposta.ID];
        return DBA.query("DELETE FROM bilhete WHERE idAposta = (?)", parameters);
    }

    self.update = function (origMember, editMember) {
        //var parameters = [editMember.id, editMember.name, origMember.id];
        //return DBA.query("UPDATE team SET id = (?), name = (?) WHERE id = (?)", parameters);
    }

    return self;
})