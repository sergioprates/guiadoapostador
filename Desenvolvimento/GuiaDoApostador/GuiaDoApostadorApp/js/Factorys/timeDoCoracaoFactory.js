guiaDoApostador.factory('timeDoCoracaoFactory', function (DBA) {
    var self = this;

    self.all = function () {
        return DBA.query("SELECT idAposta, time FROM timeDoCoracao")
          .then(function (result) {
              return DBA.getAll(result);
          });
    }

    self.get = function (idAposta, funcaoCallback) {
        var parameters = [idAposta];
        DBA.query("SELECT idAposta, time FROM timeDoCoracao WHERE idAposta = (?)", parameters, funcaoCallback);
    }

    self.add = function (aposta, time, funcaoCallback) {
        var parameters = [aposta.ID, time];
        var query = "INSERT INTO timeDoCoracao (idAposta, time) VALUES (?,?)";
        DBA.query(query, parameters, funcaoCallback);
    }

    self.remove = function (aposta) {
        var parameters = [aposta.ID];
        return DBA.query("DELETE FROM timeDoCoracao WHERE idAposta = (?)", parameters);
    }

    self.update = function (aposta, time, funcaoCallback) {
        var parameters = [time, aposta.ID];
        return DBA.query("UPDATE timeDoCoracao SET time = (?) WHERE idAposta = (?)", parameters, funcaoCallback);
    }

    return self;
})