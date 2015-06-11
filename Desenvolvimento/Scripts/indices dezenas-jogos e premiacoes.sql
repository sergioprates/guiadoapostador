/***** Índices XXXDezenas/Jogos e XXXPremiacoes *****/

USE GuiaDoApostador;

GO

-- DEZENAS / JOGOS

ALTER TABLE TimemaniaDezenas
ADD CONSTRAINT timemaniaDezenas_concurso_dezena
UNIQUE (idConcurso, Dezena)

GO

ALTER TABLE MegaSenaDezenas
ADD CONSTRAINT megaSenaDezenas_concurso_dezena
UNIQUE (idConcurso, Dezena)

GO

ALTER TABLE LotofacilDezenas
ADD CONSTRAINT lotofacilDezenas_concurso_dezena
UNIQUE (idConcurso, Dezena)

GO

ALTER TABLE QuinaDezenas
ADD CONSTRAINT quinaDezenas_concurso_dezena
UNIQUE (idConcurso, Dezena)

GO

ALTER TABLE DuplaSenaDezenas
ADD CONSTRAINT duplaSenaDezenas_concurso_sorteio_dezena
UNIQUE (idConcurso, sorteio, Dezena)

GO

ALTER TABLE LotomaniaDezenas
ADD CONSTRAINT lotomaniaDezenas_concurso_dezena
UNIQUE (idConcurso, Dezena)

GO

ALTER TABLE LotogolJogos
ADD CONSTRAINT lotogolJogos_concurso_jogo
UNIQUE (idConcurso, jogo)

GO

-- PREMIACOES

ALTER TABLE MegaSenaPremiacoes
ADD CONSTRAINT megaSenaPremiacoes_concurso_acertos
UNIQUE (idConcurso, acertos)

GO

ALTER TABLE LotofacilPremiacoes
ADD CONSTRAINT lotofacilPremiacoes_concurso_acertos
UNIQUE (idConcurso, acertos)

GO

ALTER TABLE QuinaPremiacoes
ADD CONSTRAINT quinaPremiacoes_concurso_acertos
UNIQUE (idConcurso, acertos)

GO

ALTER TABLE LotomaniaPremiacoes
ADD CONSTRAINT lotomaniaPremiacoes_concurso_acertos
UNIQUE (idConcurso, acertos)

GO

ALTER TABLE DuplaSenaPremiacoes
ADD CONSTRAINT duplaSenaPremiacoes_concurso_sorteio_acertos
UNIQUE (idConcurso, sorteio, acertos)

GO

ALTER TABLE TimemaniaPremiacoes
ADD CONSTRAINT timemaniaPremiacoes_concurso_acertos
UNIQUE (idConcurso, acertos)

GO

ALTER TABLE FederalPremiacoes
ADD CONSTRAINT federalPremiacoes_concurso_premio
UNIQUE (idConcurso, premio)

GO

ALTER TABLE LotogolPremiacoes
ADD CONSTRAINT lotogolPremiacoes_concurso_acertos
UNIQUE (idConcurso, acertos)

GO

ALTER TABLE LotecaPremiacoes
ADD CONSTRAINT lotecaPremiacoes_concurso_acertos
UNIQUE (idConcurso, acertos)

GO
