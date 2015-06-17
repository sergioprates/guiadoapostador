guiaDoApostador.factory('apostasFactory', function ($cordovaSQLite, DBA) {
    var self = this;
 
    self.all = function (funcaoCallback) {

        var query = new String();
        query += 'SELECT a.idAposta, a.idConcurso, a.TipoConcurso, a.Verificado, b.time, c.numeroBilhete ';
        query += 'FROM apostas a ';
        query += 'LEFT JOIN timeDoCoracao b ';
        query += 'on a.idAposta = b.idAposta ';
        query += 'LEFT JOIN bilhete c ';
        query += 'on a.idAposta = c.idAposta ';
        query += 'ORDER BY a.datCadastro desc';
        DBA.query(query, [], funcaoCallback);
    }

    self.listaApostasNaoVerificadas = function (funcaoCallback) {

        var query = new String();
        query += 'SELECT a.idAposta, a.idConcurso, a.TipoConcurso ';
        query += 'FROM apostas a ';
        query += 'LEFT JOIN timeDoCoracao b ';
        query += 'on a.idAposta = b.idAposta ';
        query += 'LEFT JOIN bilhete c ';
        query += 'on a.idAposta = c.idAposta ';
        query += 'WHERE a.Verificado = 0 ';
        query += 'ORDER BY a.datCadastro desc';
        DBA.query(query, [], funcaoCallback);
    }
 
    self.get = function (memberId, funcaoCallback) {
        var parameters = [memberId];
        var query = new String();
        query += 'SELECT a.idAposta, a.idConcurso, a.TipoConcurso, a.Verificado, b.time, c.numeroBilhete ';
        query += 'FROM apostas a ';
        query += 'LEFT JOIN timeDoCoracao b ';
        query += 'on a.idAposta = b.idAposta ';
        query += 'LEFT JOIN bilhete c ';
        query += 'on a.idAposta = c.idAposta ';
        query += 'WHERE a.idAposta = (?)';
        return DBA.query(query, parameters, funcaoCallback);
    }
 
    self.add = function (aposta, funcaoCallback) {
        var parameters = [aposta.Loteria.ID, aposta.TipoLoteria, 0];
        DBA.query("INSERT INTO apostas (idConcurso, TipoConcurso, Verificado) VALUES (?, ?, ?)", parameters, funcaoCallback);
    }
 
    self.remove = function (id, funcaoCallback) {
        var parameters = [id];
        return DBA.query("DELETE FROM apostas WHERE idAposta = (?)", parameters, funcaoCallback);
    }
 
    self.update = function (aposta, funcaoCallback) {
       
        var verificado = 0;
        if (aposta.Verificado != undefined && aposta.Verificado != 0) {
            verificado = 1;
        }
        var parameters = [verificado, aposta.datSorteio, aposta.ID];
        return DBA.query("UPDATE apostas SET Verificado = (?), datSorteio = (?) WHERE idAposta = (?)", parameters, funcaoCallback);
    }
 
    return self;
})