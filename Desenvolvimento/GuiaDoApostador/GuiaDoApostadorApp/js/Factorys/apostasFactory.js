guiaDoApostador.factory('apostasFactory', function ($cordovaSQLite, DBA) {
    var self = this;
 
    self.all = function (funcaoCallback) {
        return DBA.query("SELECT idAposta, idConcurso, TipoConcurso, Verificado FROM apostas", [], funcaoCallback);
    }
 
    self.get = function (memberId, funcaoCallback) {
        var parameters = [memberId];
        return DBA.query("SELECT idAposta, idConcurso, TipoConcurso, Verificado FROM apostas WHERE idAposta = (?)", parameters, funcaoCallback)
          .then(function(result) {
              return DBA.getById(result);
          });
    }
 
    self.add = function (aposta, funcaoCallback) {
        var parameters = [aposta.Loteria.ID, aposta.TipoLoteria, 0];
        DBA.query("INSERT INTO apostas (idConcurso, TipoConcurso, Verificado) VALUES (?, ?, ?)", parameters, funcaoCallback);
    }
 
    self.remove = function(member) {
        var parameters = [member.id];
        return DBA.query("DELETE FROM apostas WHERE idAposta = (?)", parameters);
    }
 
    self.update = function(origMember, editMember) {
        var parameters = [editMember.id, editMember.name, origMember.id];
        //return DBA.query("UPDATE team SET id = (?), name = (?) WHERE id = (?)", parameters);
    }
 
    return self;
})