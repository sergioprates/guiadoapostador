guiaDoApostador.factory('dezenasFactory', function ($cordovaSQLite, DBA) {
    var self = this;

    self.all = function () {
        return DBA.query("SELECT idAposta, dezena FROM dezenas")
          .then(function (result) {
              return DBA.getAll(result);
          });
    }

    self.get = function (idAposta, funcaoCallback) {
        var parameters = [idAposta];
        DBA.query("SELECT idAposta, dezena FROM dezenas WHERE idAposta = (?)", parameters, funcaoCallback);
    }

    self.add = function (aposta, dezena, funcaoCallback) {
        var parameters = [aposta.ID, dezena];
        var query = "INSERT INTO dezenas (idAposta, dezena) VALUES (?,?)"; 
        DBA.query(query, parameters, funcaoCallback);
    }

    self.remove = function (aposta) {
        var parameters = [aposta.ID];
        return DBA.query("DELETE FROM dezenas WHERE idAposta = (?)", parameters);
    }

    self.update = function (origMember, editMember) {
        //var parameters = [editMember.id, editMember.name, origMember.id];
        //return DBA.query("UPDATE team SET id = (?), name = (?) WHERE id = (?)", parameters);
    }

    return self;
})