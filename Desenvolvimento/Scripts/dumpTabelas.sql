USE [GuiaDoApostador]
GO
/****** Object:  Table [dbo].[DuplaSenaConcursos]    Script Date: 11/06/2015 02:21:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[DuplaSenaConcursos](
	[idConcurso] [int] NOT NULL,
	[data] [date] NOT NULL,
	[cidade] [varchar](50) NOT NULL,
	[local] [varchar](50) NOT NULL,
	[valorAcumulado] [decimal](18, 2) NOT NULL,
	[arrecadacaoTotal] [decimal](18, 2) NOT NULL,
	[proximoConcursoData] [date] NULL,
	[proximoConcursoValorEstimado] [decimal](18, 2) NULL,
	[especialValorAcumulado] [decimal](18, 2) NULL,
 CONSTRAINT [PK_DuplaSena] PRIMARY KEY CLUSTERED 
(
	[idConcurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DuplaSenaDezenas]    Script Date: 11/06/2015 02:21:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DuplaSenaDezenas](
	[IdConcurso] [int] NOT NULL,
	[sorteio] [tinyint] NOT NULL,
	[dezena] [tinyint] NOT NULL,
 CONSTRAINT [duplaSenaDezenas_concurso_sorteio_dezena] UNIQUE NONCLUSTERED 
(
	[IdConcurso] ASC,
	[sorteio] ASC,
	[dezena] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DuplaSenaPremiacoes]    Script Date: 11/06/2015 02:21:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DuplaSenaPremiacoes](
	[idConcurso] [int] NOT NULL,
	[sorteio] [tinyint] NOT NULL,
	[acertos] [tinyint] NOT NULL,
	[valorPago] [decimal](18, 2) NOT NULL,
	[ganhadores] [int] NOT NULL,
 CONSTRAINT [duplaSenaPremiacoes_concurso_sorteio_acertos] UNIQUE NONCLUSTERED 
(
	[idConcurso] ASC,
	[sorteio] ASC,
	[acertos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FederalConcursos]    Script Date: 11/06/2015 02:21:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[FederalConcursos](
	[idConcurso] [int] NOT NULL,
	[data] [date] NOT NULL,
	[cidade] [varchar](50) NOT NULL,
	[local] [varchar](50) NOT NULL
) ON [PRIMARY]
SET ANSI_PADDING ON
ALTER TABLE [dbo].[FederalConcursos] ADD [observacao] [varchar](150) NOT NULL
 CONSTRAINT [PK_Federal] PRIMARY KEY CLUSTERED 
(
	[idConcurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FederalPremiacoes]    Script Date: 11/06/2015 02:21:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FederalPremiacoes](
	[idConcurso] [int] NOT NULL,
	[premio] [tinyint] NOT NULL,
	[bilhete] [int] NOT NULL,
	[valorPago] [decimal](18, 2) NOT NULL,
 CONSTRAINT [federalPremiacoes_concurso_premio] UNIQUE NONCLUSTERED 
(
	[idConcurso] ASC,
	[premio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LotecaConcursos]    Script Date: 11/06/2015 02:21:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LotecaConcursos](
	[idConcurso] [int] NOT NULL,
	[data] [date] NOT NULL,
	[valorAcumulado] [decimal](18, 2) NOT NULL,
	[arrecadacaoTotal] [decimal](18, 2) NOT NULL,
	[proximoConcursoData] [date] NULL,
	[proximoConcursoValorEstimado] [decimal](18, 2) NULL,
	[especialValorAcumulado] [decimal](18, 2) NULL,
	[especialNumero] [int] NULL,
 CONSTRAINT [PK_Loteca] PRIMARY KEY CLUSTERED 
(
	[idConcurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LotecaJogos]    Script Date: 11/06/2015 02:21:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[LotecaJogos](
	[IdConcurso] [int] NOT NULL,
	[time1] [varchar](40) NOT NULL,
	[gols1] [tinyint] NOT NULL,
	[time2] [varchar](40) NOT NULL,
	[gols2] [tinyint] NOT NULL,
	[diaSemana] [tinyint] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LotecaPremiacoes]    Script Date: 11/06/2015 02:21:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LotecaPremiacoes](
	[idConcurso] [int] NOT NULL,
	[acertos] [tinyint] NOT NULL,
	[valorPago] [decimal](18, 2) NOT NULL,
	[ganhadores] [int] NOT NULL,
 CONSTRAINT [lotecaPremiacoes_concurso_acertos] UNIQUE NONCLUSTERED 
(
	[idConcurso] ASC,
	[acertos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LotofacilConcursos]    Script Date: 11/06/2015 02:21:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LotofacilConcursos](
	[idConcurso] [int] NOT NULL,
	[data] [date] NOT NULL,
	[cidade] [varchar](50) NOT NULL,
	[local] [varchar](50) NOT NULL,
	[valorAcumulado] [decimal](18, 2) NOT NULL,
	[arrecadacaoTotal] [decimal](18, 2) NOT NULL,
	[proximoConcursoData] [date] NULL,
	[proximoConcursoValorEstimado] [decimal](18, 2) NULL,
	[especialValorAcumulado] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Lotofacil] PRIMARY KEY CLUSTERED 
(
	[idConcurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LotofacilDezenas]    Script Date: 11/06/2015 02:21:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LotofacilDezenas](
	[IdConcurso] [int] NOT NULL,
	[dezena] [tinyint] NOT NULL,
 CONSTRAINT [lotofacilDezenas_concurso_dezena] UNIQUE NONCLUSTERED 
(
	[IdConcurso] ASC,
	[dezena] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LotofacilPremiacoes]    Script Date: 11/06/2015 02:21:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LotofacilPremiacoes](
	[idConcurso] [int] NOT NULL,
	[acertos] [tinyint] NOT NULL,
	[valorPago] [decimal](18, 2) NOT NULL,
	[ganhadores] [int] NOT NULL,
 CONSTRAINT [lotofacilPremiacoes_concurso_acertos] UNIQUE NONCLUSTERED 
(
	[idConcurso] ASC,
	[acertos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LotogolConcursos]    Script Date: 11/06/2015 02:21:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LotogolConcursos](
	[idConcurso] [int] NOT NULL,
	[data] [date] NOT NULL,
	[valorAcumulado1] [decimal](18, 2) NOT NULL,
	[valorAcumulado2] [decimal](18, 2) NOT NULL,
	[arrecadacaoTotal] [decimal](18, 2) NOT NULL,
	[proximoConcursoData] [date] NULL,
	[proximoConcursoValorEstimado] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Lotogol] PRIMARY KEY CLUSTERED 
(
	[idConcurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LotogolJogos]    Script Date: 11/06/2015 02:21:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[LotogolJogos](
	[IdConcurso] [int] NOT NULL,
	[jogo] [tinyint] NOT NULL,
	[time1] [varchar](40) NOT NULL,
	[gols1] [tinyint] NOT NULL,
	[time2] [varchar](40) NOT NULL,
	[gols2] [tinyint] NOT NULL,
	[diaSemana] [tinyint] NOT NULL,
 CONSTRAINT [lotogolJogos_concurso_jogo] UNIQUE NONCLUSTERED 
(
	[IdConcurso] ASC,
	[jogo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LotogolPremiacoes]    Script Date: 11/06/2015 02:21:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LotogolPremiacoes](
	[idConcurso] [int] NOT NULL,
	[acertos] [tinyint] NOT NULL,
	[valorPago] [decimal](18, 2) NOT NULL,
	[ganhadores] [int] NOT NULL,
 CONSTRAINT [lotogolPremiacoes_concurso_acertos] UNIQUE NONCLUSTERED 
(
	[idConcurso] ASC,
	[acertos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LotomaniaConcursos]    Script Date: 11/06/2015 02:21:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[LotomaniaConcursos](
	[idConcurso] [int] NOT NULL,
	[data] [date] NOT NULL,
	[cidade] [varchar](50) NOT NULL,
	[local] [varchar](50) NOT NULL,
	[valorAcumulado] [decimal](18, 2) NOT NULL,
	[arrecadacaoTotal] [decimal](18, 2) NOT NULL,
	[proximoConcursoData] [date] NULL,
	[proximoConcursoValorEstimado] [decimal](18, 2) NULL,
	[especialValorAcumulado] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Lotomania] PRIMARY KEY CLUSTERED 
(
	[idConcurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LotomaniaDezenas]    Script Date: 11/06/2015 02:21:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LotomaniaDezenas](
	[IdConcurso] [int] NOT NULL,
	[dezena] [tinyint] NOT NULL,
 CONSTRAINT [lotomaniaDezenas_concurso_dezena] UNIQUE NONCLUSTERED 
(
	[IdConcurso] ASC,
	[dezena] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LotomaniaPremiacoes]    Script Date: 11/06/2015 02:21:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LotomaniaPremiacoes](
	[idConcurso] [int] NOT NULL,
	[acertos] [tinyint] NOT NULL,
	[valorPago] [decimal](18, 2) NOT NULL,
	[ganhadores] [int] NOT NULL,
 CONSTRAINT [lotomaniaPremiacoes_concurso_acertos] UNIQUE NONCLUSTERED 
(
	[idConcurso] ASC,
	[acertos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MegasenaConcursos]    Script Date: 11/06/2015 02:21:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MegasenaConcursos](
	[idConcurso] [int] NOT NULL,
	[data] [date] NOT NULL,
	[cidade] [varchar](50) NOT NULL,
	[local] [varchar](50) NOT NULL,
	[valorAcumulado] [decimal](18, 2) NOT NULL,
	[arrecadacaoTotal] [decimal](18, 2) NOT NULL,
	[proximoConcursoData] [date] NULL,
	[proximoConcursoValorEstimado] [decimal](18, 2) NULL,
	[especialValorAcumulado] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Megasena] PRIMARY KEY CLUSTERED 
(
	[idConcurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MegasenaDezenas]    Script Date: 11/06/2015 02:21:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MegasenaDezenas](
	[IdConcurso] [int] NOT NULL,
	[dezena] [tinyint] NOT NULL,
 CONSTRAINT [megaSenaDezenas_concurso_dezena] UNIQUE NONCLUSTERED 
(
	[IdConcurso] ASC,
	[dezena] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MegasenaPremiacoes]    Script Date: 11/06/2015 02:21:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MegasenaPremiacoes](
	[idConcurso] [int] NOT NULL,
	[acertos] [tinyint] NOT NULL,
	[valorPago] [decimal](18, 2) NOT NULL,
	[ganhadores] [int] NOT NULL,
 CONSTRAINT [megaSenaPremiacoes_concurso_acertos] UNIQUE NONCLUSTERED 
(
	[idConcurso] ASC,
	[acertos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuinaConcursos]    Script Date: 11/06/2015 02:21:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[QuinaConcursos](
	[idConcurso] [int] NOT NULL,
	[data] [date] NOT NULL,
	[cidade] [varchar](50) NOT NULL,
	[local] [varchar](50) NOT NULL,
	[valorAcumulado] [decimal](18, 2) NOT NULL,
	[arrecadacaoTotal] [decimal](18, 2) NOT NULL,
	[proximoConcursoData] [date] NULL,
	[proximoConcursoValorEstimado] [decimal](18, 2) NULL,
	[especialValorAcumulado] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Quina] PRIMARY KEY CLUSTERED 
(
	[idConcurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QuinaDezenas]    Script Date: 11/06/2015 02:21:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuinaDezenas](
	[IdConcurso] [int] NOT NULL,
	[dezena] [tinyint] NOT NULL,
 CONSTRAINT [quinaDezenas_concurso_dezena] UNIQUE NONCLUSTERED 
(
	[IdConcurso] ASC,
	[dezena] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuinaPremiacoes]    Script Date: 11/06/2015 02:21:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuinaPremiacoes](
	[idConcurso] [int] NOT NULL,
	[acertos] [tinyint] NOT NULL,
	[valorPago] [decimal](18, 2) NOT NULL,
	[ganhadores] [int] NOT NULL,
 CONSTRAINT [quinaPremiacoes_concurso_acertos] UNIQUE NONCLUSTERED 
(
	[idConcurso] ASC,
	[acertos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TimemaniaConcursos]    Script Date: 11/06/2015 02:21:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[TimemaniaConcursos](
	[idConcurso] [int] NOT NULL,
	[data] [date] NOT NULL,
	[cidade] [varchar](50) NOT NULL,
	[local] [varchar](50) NOT NULL,
	[valorAcumulado] [decimal](18, 2) NOT NULL,
	[arrecadacaoTotal] [decimal](18, 2) NOT NULL,
	[proximoConcursoData] [date] NULL,
	[proximoConcursoValorEstimado] [decimal](18, 2) NULL,
	[especialValorAcumulado] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Timemania] PRIMARY KEY CLUSTERED 
(
	[idConcurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TimemaniaDezenas]    Script Date: 11/06/2015 02:21:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimemaniaDezenas](
	[IdConcurso] [int] NOT NULL,
	[dezena] [tinyint] NOT NULL,
 CONSTRAINT [timemaniaDezenas_concurso_dezena] UNIQUE NONCLUSTERED 
(
	[IdConcurso] ASC,
	[dezena] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TimemaniaPremiacoes]    Script Date: 11/06/2015 02:21:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimemaniaPremiacoes](
	[idConcurso] [int] NOT NULL,
	[acertos] [tinyint] NOT NULL,
	[valorPago] [decimal](18, 2) NOT NULL,
	[ganhadores] [int] NOT NULL,
 CONSTRAINT [timemaniaPremiacoes_concurso_acertos] UNIQUE NONCLUSTERED 
(
	[idConcurso] ASC,
	[acertos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TimemaniaTimeCoracao]    Script Date: 11/06/2015 02:21:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TimemaniaTimeCoracao](
	[idConcurso] [int] NOT NULL,
	[timeCoracao] [varchar](40) NOT NULL,
	[valorPago] [decimal](18, 2) NOT NULL,
	[ganhadores] [int] NOT NULL,
 CONSTRAINT [FK_TimemaniaConcursos_TimemaniaTimeCoracao] UNIQUE NONCLUSTERED 
(
	[idConcurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[DuplaSenaDezenas]  WITH CHECK ADD  CONSTRAINT [FK_DuplaSenaConcursos_DuplaSenaDezenas] FOREIGN KEY([IdConcurso])
REFERENCES [dbo].[DuplaSenaConcursos] ([idConcurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DuplaSenaDezenas] CHECK CONSTRAINT [FK_DuplaSenaConcursos_DuplaSenaDezenas]
GO
ALTER TABLE [dbo].[DuplaSenaPremiacoes]  WITH CHECK ADD  CONSTRAINT [FK_DuplaSenaConcursos_DuplaSenaPremiacao] FOREIGN KEY([idConcurso])
REFERENCES [dbo].[DuplaSenaConcursos] ([idConcurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DuplaSenaPremiacoes] CHECK CONSTRAINT [FK_DuplaSenaConcursos_DuplaSenaPremiacao]
GO
ALTER TABLE [dbo].[FederalPremiacoes]  WITH CHECK ADD  CONSTRAINT [FK_FederalConcursos_FederalPremiacao] FOREIGN KEY([idConcurso])
REFERENCES [dbo].[FederalConcursos] ([idConcurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FederalPremiacoes] CHECK CONSTRAINT [FK_FederalConcursos_FederalPremiacao]
GO
ALTER TABLE [dbo].[LotecaJogos]  WITH CHECK ADD  CONSTRAINT [FK_LotecaConcursos_LotecaJogos] FOREIGN KEY([IdConcurso])
REFERENCES [dbo].[LotecaConcursos] ([idConcurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LotecaJogos] CHECK CONSTRAINT [FK_LotecaConcursos_LotecaJogos]
GO
ALTER TABLE [dbo].[LotecaPremiacoes]  WITH CHECK ADD  CONSTRAINT [FK_LotecaConcursos_LotecaPremiacao] FOREIGN KEY([idConcurso])
REFERENCES [dbo].[LotecaConcursos] ([idConcurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LotecaPremiacoes] CHECK CONSTRAINT [FK_LotecaConcursos_LotecaPremiacao]
GO
ALTER TABLE [dbo].[LotofacilDezenas]  WITH CHECK ADD  CONSTRAINT [FK_LotofacilConcursos_LotofacilDezenas] FOREIGN KEY([IdConcurso])
REFERENCES [dbo].[LotofacilConcursos] ([idConcurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LotofacilDezenas] CHECK CONSTRAINT [FK_LotofacilConcursos_LotofacilDezenas]
GO
ALTER TABLE [dbo].[LotofacilPremiacoes]  WITH CHECK ADD  CONSTRAINT [FK_LotofacilConcursos_LotofacilPremiacao] FOREIGN KEY([idConcurso])
REFERENCES [dbo].[LotofacilConcursos] ([idConcurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LotofacilPremiacoes] CHECK CONSTRAINT [FK_LotofacilConcursos_LotofacilPremiacao]
GO
ALTER TABLE [dbo].[LotogolJogos]  WITH CHECK ADD  CONSTRAINT [FK_LotogolConcursos_LotogolJogos] FOREIGN KEY([IdConcurso])
REFERENCES [dbo].[LotogolConcursos] ([idConcurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LotogolJogos] CHECK CONSTRAINT [FK_LotogolConcursos_LotogolJogos]
GO
ALTER TABLE [dbo].[LotogolPremiacoes]  WITH CHECK ADD  CONSTRAINT [FK_LotogolConcursos_LotogolPremiacao] FOREIGN KEY([idConcurso])
REFERENCES [dbo].[LotogolConcursos] ([idConcurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LotogolPremiacoes] CHECK CONSTRAINT [FK_LotogolConcursos_LotogolPremiacao]
GO
ALTER TABLE [dbo].[LotomaniaDezenas]  WITH CHECK ADD  CONSTRAINT [FK_LotomaniaConcursos_LotomaniaDezenas] FOREIGN KEY([IdConcurso])
REFERENCES [dbo].[LotomaniaConcursos] ([idConcurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LotomaniaDezenas] CHECK CONSTRAINT [FK_LotomaniaConcursos_LotomaniaDezenas]
GO
ALTER TABLE [dbo].[LotomaniaPremiacoes]  WITH CHECK ADD  CONSTRAINT [FK_LotomaniaConcursos_LotomaniaPremiacao] FOREIGN KEY([idConcurso])
REFERENCES [dbo].[LotomaniaConcursos] ([idConcurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LotomaniaPremiacoes] CHECK CONSTRAINT [FK_LotomaniaConcursos_LotomaniaPremiacao]
GO
ALTER TABLE [dbo].[MegasenaDezenas]  WITH CHECK ADD  CONSTRAINT [FK_MegasenaConcursos_MegasenaDezenas] FOREIGN KEY([IdConcurso])
REFERENCES [dbo].[MegasenaConcursos] ([idConcurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MegasenaDezenas] CHECK CONSTRAINT [FK_MegasenaConcursos_MegasenaDezenas]
GO
ALTER TABLE [dbo].[MegasenaPremiacoes]  WITH CHECK ADD  CONSTRAINT [FK_MegasenaConcursos_MegasenaPremiacao] FOREIGN KEY([idConcurso])
REFERENCES [dbo].[MegasenaConcursos] ([idConcurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MegasenaPremiacoes] CHECK CONSTRAINT [FK_MegasenaConcursos_MegasenaPremiacao]
GO
ALTER TABLE [dbo].[QuinaDezenas]  WITH CHECK ADD  CONSTRAINT [FK_QuinaConcursos_QuinaDezenas] FOREIGN KEY([IdConcurso])
REFERENCES [dbo].[QuinaConcursos] ([idConcurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[QuinaDezenas] CHECK CONSTRAINT [FK_QuinaConcursos_QuinaDezenas]
GO
ALTER TABLE [dbo].[QuinaPremiacoes]  WITH CHECK ADD  CONSTRAINT [FK_QuinaConcursos_QuinaPremiacao] FOREIGN KEY([idConcurso])
REFERENCES [dbo].[QuinaConcursos] ([idConcurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[QuinaPremiacoes] CHECK CONSTRAINT [FK_QuinaConcursos_QuinaPremiacao]
GO
ALTER TABLE [dbo].[TimemaniaDezenas]  WITH CHECK ADD  CONSTRAINT [FK_TimemaniaConcursos_TimemaniaDezenas] FOREIGN KEY([IdConcurso])
REFERENCES [dbo].[TimemaniaConcursos] ([idConcurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TimemaniaDezenas] CHECK CONSTRAINT [FK_TimemaniaConcursos_TimemaniaDezenas]
GO
ALTER TABLE [dbo].[TimemaniaPremiacoes]  WITH CHECK ADD  CONSTRAINT [FK_TimemaniaConcursos_TimemaniaPremiacao] FOREIGN KEY([idConcurso])
REFERENCES [dbo].[TimemaniaConcursos] ([idConcurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TimemaniaPremiacoes] CHECK CONSTRAINT [FK_TimemaniaConcursos_TimemaniaPremiacao]
GO
