USE [GuiaDoApostador]
GO
/****** Object:  Table [dbo].[DuplaSenaConcursos]    Script Date: 14/06/2015 01:59:38 ******/
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
/****** Object:  Table [dbo].[DuplaSenaDezenas]    Script Date: 14/06/2015 01:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DuplaSenaDezenas](
	[IdConcurso] [int] NOT NULL,
	[sorteio] [tinyint] NOT NULL,
	[dezena] [tinyint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DuplaSenaPremiacoes]    Script Date: 14/06/2015 01:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DuplaSenaPremiacoes](
	[idConcurso] [int] NOT NULL,
	[sorteio] [tinyint] NOT NULL,
	[acertos] [tinyint] NOT NULL,
	[valorPago] [decimal](18, 2) NOT NULL,
	[ganhadores] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FederalConcursos]    Script Date: 14/06/2015 01:59:38 ******/
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
/****** Object:  Table [dbo].[FederalPremiacoes]    Script Date: 14/06/2015 01:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FederalPremiacoes](
	[idConcurso] [int] NOT NULL,
	[premio] [tinyint] NOT NULL,
	[bilhete] [int] NOT NULL,
	[valorPago] [decimal](18, 2) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LotecaConcursos]    Script Date: 14/06/2015 01:59:38 ******/
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
/****** Object:  Table [dbo].[LotecaJogos]    Script Date: 14/06/2015 01:59:38 ******/
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
/****** Object:  Table [dbo].[LotecaPremiacoes]    Script Date: 14/06/2015 01:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LotecaPremiacoes](
	[idConcurso] [int] NOT NULL,
	[acertos] [tinyint] NOT NULL,
	[valorPago] [decimal](18, 2) NOT NULL,
	[ganhadores] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LotofacilConcursos]    Script Date: 14/06/2015 01:59:38 ******/
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
/****** Object:  Table [dbo].[LotofacilDezenas]    Script Date: 14/06/2015 01:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LotofacilDezenas](
	[IdConcurso] [int] NOT NULL,
	[dezena] [tinyint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LotofacilPremiacoes]    Script Date: 14/06/2015 01:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LotofacilPremiacoes](
	[idConcurso] [int] NOT NULL,
	[acertos] [tinyint] NOT NULL,
	[valorPago] [decimal](18, 2) NOT NULL,
	[ganhadores] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LotogolConcursos]    Script Date: 14/06/2015 01:59:38 ******/
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
/****** Object:  Table [dbo].[LotogolJogos]    Script Date: 14/06/2015 01:59:38 ******/
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
	[diaSemana] [tinyint] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LotogolPremiacoes]    Script Date: 14/06/2015 01:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LotogolPremiacoes](
	[idConcurso] [int] NOT NULL,
	[acertos] [tinyint] NOT NULL,
	[valorPago] [decimal](18, 2) NOT NULL,
	[ganhadores] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LotomaniaConcursos]    Script Date: 14/06/2015 01:59:38 ******/
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
/****** Object:  Table [dbo].[LotomaniaDezenas]    Script Date: 14/06/2015 01:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LotomaniaDezenas](
	[IdConcurso] [int] NOT NULL,
	[dezena] [tinyint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LotomaniaPremiacoes]    Script Date: 14/06/2015 01:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LotomaniaPremiacoes](
	[idConcurso] [int] NOT NULL,
	[acertos] [tinyint] NOT NULL,
	[valorPago] [decimal](18, 2) NOT NULL,
	[ganhadores] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MegasenaConcursos]    Script Date: 14/06/2015 01:59:38 ******/
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
/****** Object:  Table [dbo].[MegasenaDezenas]    Script Date: 14/06/2015 01:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MegasenaDezenas](
	[IdConcurso] [int] NOT NULL,
	[dezena] [tinyint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MegasenaPremiacoes]    Script Date: 14/06/2015 01:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MegasenaPremiacoes](
	[idConcurso] [int] NOT NULL,
	[acertos] [tinyint] NOT NULL,
	[valorPago] [decimal](18, 2) NOT NULL,
	[ganhadores] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuinaConcursos]    Script Date: 14/06/2015 01:59:38 ******/
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
/****** Object:  Table [dbo].[QuinaDezenas]    Script Date: 14/06/2015 01:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuinaDezenas](
	[IdConcurso] [int] NOT NULL,
	[dezena] [tinyint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuinaPremiacoes]    Script Date: 14/06/2015 01:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuinaPremiacoes](
	[idConcurso] [int] NOT NULL,
	[acertos] [tinyint] NOT NULL,
	[valorPago] [decimal](18, 2) NOT NULL,
	[ganhadores] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TimemaniaConcursos]    Script Date: 14/06/2015 01:59:38 ******/
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
/****** Object:  Table [dbo].[TimemaniaDezenas]    Script Date: 14/06/2015 01:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimemaniaDezenas](
	[IdConcurso] [int] NOT NULL,
	[dezena] [tinyint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TimemaniaPremiacoes]    Script Date: 14/06/2015 01:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimemaniaPremiacoes](
	[idConcurso] [int] NOT NULL,
	[acertos] [tinyint] NOT NULL,
	[valorPago] [decimal](18, 2) NOT NULL,
	[ganhadores] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TimemaniaTimesCoracao]    Script Date: 14/06/2015 01:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TimemaniaTimesCoracao](
	[idConcurso] [int] NOT NULL,
	[timeCoracao] [varchar](40) NOT NULL,
	[valorPago] [decimal](18, 2) NOT NULL,
	[ganhadores] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[DuplaSenaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (1392, CAST(0x0D3A0B00 AS Date), N'OSASCO-SP', N'Caminhão da Sorte', CAST(9565217.27 AS Decimal(18, 2)), CAST(7196670.00 AS Decimal(18, 2)), CAST(0x103A0B00 AS Date), CAST(10500000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[DuplaSenaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (1393, CAST(0x103A0B00 AS Date), N'ITABAIANA-SE', N'Caminhão da Sorte', CAST(10787481.18 AS Decimal(18, 2)), CAST(7933328.00 AS Decimal(18, 2)), CAST(0x143A0B00 AS Date), CAST(11600000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1392, 1, 1)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1392, 1, 6)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1392, 1, 11)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1392, 1, 15)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1392, 1, 24)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1392, 1, 40)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1392, 2, 9)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1392, 2, 18)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1392, 2, 30)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1392, 2, 31)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1392, 2, 32)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1392, 2, 36)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1393, 1, 3)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1393, 1, 8)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1393, 1, 11)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1393, 1, 19)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1393, 1, 29)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1393, 1, 35)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1393, 2, 5)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1393, 2, 17)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1393, 2, 23)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1393, 2, 29)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1393, 2, 43)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1393, 2, 49)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1392, 6, 6, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1392, 5, 5, CAST(6522.17 AS Decimal(18, 2)), 51)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1392, 4, 4, CAST(110.30 AS Decimal(18, 2)), 2872)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1392, 6, 6, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1392, 5, 5, CAST(6652.62 AS Decimal(18, 2)), 50)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1392, 4, 4, CAST(121.74 AS Decimal(18, 2)), 2602)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1393, 6, 6, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1393, 5, 5, CAST(5392.34 AS Decimal(18, 2)), 68)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1393, 4, 4, CAST(87.87 AS Decimal(18, 2)), 3974)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1393, 6, 6, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1393, 5, 5, CAST(2756.99 AS Decimal(18, 2)), 133)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1393, 4, 4, CAST(72.55 AS Decimal(18, 2)), 4813)
INSERT [dbo].[FederalConcursos] ([idConcurso], [data], [cidade], [local], [observacao]) VALUES (4978, CAST(0x0E3A0B00 AS Date), N'ITABAIANA-SE', N'Caminhão da Sorte', N'O VALOR DO 1º PREMIO FOI DISTRIBUÍDO PARA A CIDADE DE CATANDUVA/SP')
INSERT [dbo].[FederalPremiacoes] ([idConcurso], [premio], [bilhete], [valorPago]) VALUES (4978, 1, 59932, CAST(300000.00 AS Decimal(18, 2)))
INSERT [dbo].[FederalPremiacoes] ([idConcurso], [premio], [bilhete], [valorPago]) VALUES (4978, 2, 13587, CAST(18600.00 AS Decimal(18, 2)))
INSERT [dbo].[FederalPremiacoes] ([idConcurso], [premio], [bilhete], [valorPago]) VALUES (4978, 3, 76788, CAST(18300.00 AS Decimal(18, 2)))
INSERT [dbo].[FederalPremiacoes] ([idConcurso], [premio], [bilhete], [valorPago]) VALUES (4978, 4, 35989, CAST(18000.00 AS Decimal(18, 2)))
INSERT [dbo].[FederalPremiacoes] ([idConcurso], [premio], [bilhete], [valorPago]) VALUES (4978, 5, 22245, CAST(17067.00 AS Decimal(18, 2)))
INSERT [dbo].[LotecaConcursos] ([idConcurso], [data], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado], [especialNumero]) VALUES (656, CAST(0x0C3A0B00 AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(3055752.00 AS Decimal(18, 2)), CAST(0x133A0B00 AS Date), CAST(2300000.00 AS Decimal(18, 2)), CAST(217509.93 AS Decimal(18, 2)), 660)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (656, N'BRASIL', 2, N'MÉXICO', 0, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (656, N'ATLÉTICO/MG', 1, N'CRUZEIRO/MG', 3, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (656, N'SÃO PAULO/SP', 2, N'GRÊMIO/RS', 0, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (656, N'PAYSANDU/PA', 2, N'PARANÁ/PR', 1, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (656, N'BRAGANTINO/SP', 2, N'BAHIA/BA', 0, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (656, N'CEARÁ/CE', 1, N'SAMPAIO CORRÊA/MA', 3, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (656, N'GOIÁS/GO', 0, N'AVAÍ/SC', 1, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (656, N'FIGUEIRENSE/SC', 2, N'PALMEIRAS/SP', 1, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (656, N'SANTOS/SP', 2, N'PONTE PRETA/SP', 2, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (656, N'FLAMENGO/RJ', 1, N'CHAPECOENSE/SC', 0, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (656, N'INTERNACIONAL/RS', 2, N'CORITIBA/PR', 0, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (656, N'FLUMINENSE/RJ', 0, N'SPORT/PE', 0, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (656, N'JOINVILLE/SC', 0, N'CORINTHIANS/SP', 1, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (656, N'ATLÉTICO/PR', 2, N'VASCO DA GAMA/RJ', 0, 7)
INSERT [dbo].[LotecaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (656, 14, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[LotecaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (656, 13, CAST(2791.25 AS Decimal(18, 2)), 44)
INSERT [dbo].[LotofacilConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (1220, CAST(0x0E3A0B00 AS Date), N'Itabaiana-SE', N'Caminhão Da Sorte', CAST(0.00 AS Decimal(18, 2)), CAST(28675268.00 AS Decimal(18, 2)), CAST(0x103A0B00 AS Date), CAST(1700000.00 AS Decimal(18, 2)), CAST(48741081.74 AS Decimal(18, 2)))
INSERT [dbo].[LotofacilConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (1221, CAST(0x103A0B00 AS Date), N'Osasco-SP', N'Estúdio De Tv', CAST(0.00 AS Decimal(18, 2)), CAST(22670382.00 AS Decimal(18, 2)), CAST(0x133A0B00 AS Date), CAST(1700000.00 AS Decimal(18, 2)), CAST(49154967.68 AS Decimal(18, 2)))
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1220, 2)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1220, 3)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1220, 4)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1220, 5)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1220, 6)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1220, 7)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1220, 9)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1220, 13)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1220, 14)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1220, 17)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1220, 18)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1220, 19)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1220, 20)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1220, 23)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1220, 25)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1221, 2)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1221, 3)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1221, 4)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1221, 6)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1221, 9)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1221, 10)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1221, 12)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1221, 14)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1221, 15)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1221, 18)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1221, 19)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1221, 21)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1221, 22)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1221, 23)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1221, 24)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1220, 15, CAST(1026828.47 AS Decimal(18, 2)), 4)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1220, 14, CAST(1371.62 AS Decimal(18, 2)), 473)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1220, 13, CAST(20.00 AS Decimal(18, 2)), 20133)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1220, 12, CAST(8.00 AS Decimal(18, 2)), 266061)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1220, 11, CAST(4.00 AS Decimal(18, 2)), 1364338)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1221, 15, CAST(896752.87 AS Decimal(18, 2)), 2)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1221, 14, CAST(1395.31 AS Decimal(18, 2)), 565)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1221, 13, CAST(20.00 AS Decimal(18, 2)), 17566)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1221, 12, CAST(8.00 AS Decimal(18, 2)), 198564)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1221, 11, CAST(4.00 AS Decimal(18, 2)), 1024426)
INSERT [dbo].[LotogolConcursos] ([idConcurso], [data], [valorAcumulado1], [valorAcumulado2], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado]) VALUES (704, CAST(0x0C3A0B00 AS Date), CAST(95210.13 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(345192.00 AS Decimal(18, 2)), CAST(0x0F3A0B00 AS Date), CAST(140000.00 AS Decimal(18, 2)))
INSERT [dbo].[LotogolConcursos] ([idConcurso], [data], [valorAcumulado1], [valorAcumulado2], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado]) VALUES (705, CAST(0x0F3A0B00 AS Date), CAST(126934.51 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(296000.00 AS Decimal(18, 2)), CAST(0x133A0B00 AS Date), CAST(160000.00 AS Decimal(18, 2)))
INSERT [dbo].[LotogolJogos] ([IdConcurso], [jogo], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (704, 1, N'BRASIL', 2, N'MÉXICO', 0, 1)
INSERT [dbo].[LotogolJogos] ([IdConcurso], [jogo], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (704, 2, N'ATLÉTICO/MG', 1, N'CRUZEIRO/MG', 3, 7)
INSERT [dbo].[LotogolJogos] ([IdConcurso], [jogo], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (704, 3, N'SÃO PAULO/SP', 2, N'GRÊMIO/RS', 0, 7)
INSERT [dbo].[LotogolJogos] ([IdConcurso], [jogo], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (704, 4, N'PAYSANDU/PA', 2, N'PARANÁ/PR', 1, 7)
INSERT [dbo].[LotogolJogos] ([IdConcurso], [jogo], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (704, 5, N'BRAGANTINO/SP', 2, N'BAHIA/BA', 0, 7)
INSERT [dbo].[LotogolJogos] ([IdConcurso], [jogo], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (705, 1, N'BRASIL', 1, N'HONDURAS', 0, 4)
INSERT [dbo].[LotogolJogos] ([IdConcurso], [jogo], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (705, 2, N'ATLÉTICO/MG', 2, N'SANTOS/SP', 2, 4)
INSERT [dbo].[LotogolJogos] ([IdConcurso], [jogo], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (705, 3, N'TREZE/PB', 2, N'BOTAFOGO/PB', 0, 4)
INSERT [dbo].[LotogolJogos] ([IdConcurso], [jogo], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (705, 4, N'AUTO ESPORTE/PB', 0, N'CAMPINENSE/PB', 2, 4)
INSERT [dbo].[LotogolJogos] ([IdConcurso], [jogo], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (705, 5, N'ALEMANHA', 1, N'ESTADOS UNIDOS', 2, 4)
INSERT [dbo].[LotogolPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (704, 5, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[LotogolPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (704, 4, CAST(509.46 AS Decimal(18, 2)), 135)
INSERT [dbo].[LotogolPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (704, 3, CAST(9.07 AS Decimal(18, 2)), 4369)
INSERT [dbo].[LotogolPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (705, 5, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[LotogolPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (705, 4, CAST(2974.16 AS Decimal(18, 2)), 8)
INSERT [dbo].[LotogolPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (705, 3, CAST(85.83 AS Decimal(18, 2)), 396)
INSERT [dbo].[LotomaniaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (1562, CAST(0x0E3A0B00 AS Date), N'ITABAIANA-SE', N'Caminhão da Sorte', CAST(1222487.05 AS Decimal(18, 2)), CAST(4816929.00 AS Decimal(18, 2)), CAST(0x113A0B00 AS Date), CAST(1800000.00 AS Decimal(18, 2)), CAST(6118928.54 AS Decimal(18, 2)))
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1562, 2)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1562, 7)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1562, 16)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1562, 17)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1562, 21)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1562, 26)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1562, 33)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1562, 50)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1562, 54)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1562, 57)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1562, 63)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1562, 64)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1562, 71)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1562, 72)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1562, 74)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1562, 79)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1562, 84)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1562, 85)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1562, 92)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1562, 97)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1562, 20, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1562, 19, CAST(15832.10 AS Decimal(18, 2)), 15)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1562, 18, CAST(1730.91 AS Decimal(18, 2)), 196)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1562, 17, CAST(97.52 AS Decimal(18, 2)), 1522)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1562, 16, CAST(20.39 AS Decimal(18, 2)), 7277)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1562, 0, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[MegasenaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (1711, CAST(0x0A3A0B00 AS Date), N'PIQUEROBI-SP', N'Caminhão da Sorte', CAST(41133200.24 AS Decimal(18, 2)), CAST(65167424.00 AS Decimal(18, 2)), CAST(0x0E3A0B00 AS Date), CAST(50000000.00 AS Decimal(18, 2)), CAST(29936980.56 AS Decimal(18, 2)))
INSERT [dbo].[MegasenaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (1712, CAST(0x0E3A0B00 AS Date), N'OSASCO-SP', N'Caminhão da Sorte', CAST(50996825.22 AS Decimal(18, 2)), CAST(91459522.00 AS Decimal(18, 2)), CAST(0x113A0B00 AS Date), CAST(65000000.00 AS Decimal(18, 2)), CAST(31346069.86 AS Decimal(18, 2)))
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1711, 22)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1711, 26)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1711, 38)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1711, 39)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1711, 45)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1711, 50)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1712, 2)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1712, 12)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1712, 19)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1712, 29)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1712, 50)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1712, 59)
INSERT [dbo].[MegasenaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1711, 6, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[MegasenaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1711, 5, CAST(44885.37 AS Decimal(18, 2)), 85)
INSERT [dbo].[MegasenaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1711, 4, CAST(891.74 AS Decimal(18, 2)), 6112)
INSERT [dbo].[MegasenaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1712, 6, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[MegasenaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1712, 5, CAST(31683.66 AS Decimal(18, 2)), 169)
INSERT [dbo].[MegasenaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1712, 4, CAST(810.05 AS Decimal(18, 2)), 9443)
INSERT [dbo].[QuinaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (3809, CAST(0x0E3A0B00 AS Date), N'ITABAIANA-SE', N'Caminhão da Sorte', CAST(658437.00 AS Decimal(18, 2)), CAST(6105294.50 AS Decimal(18, 2)), CAST(0x0F3A0B00 AS Date), CAST(1300000.00 AS Decimal(18, 2)), CAST(97997579.84 AS Decimal(18, 2)))
INSERT [dbo].[QuinaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (3811, CAST(0x103A0B00 AS Date), N'ITABAIANA-SE', N'Caminhão da Sorte', CAST(2215307.49 AS Decimal(18, 2)), CAST(7625335.00 AS Decimal(18, 2)), CAST(0x113A0B00 AS Date), CAST(3000000.00 AS Decimal(18, 2)), CAST(98664810.08 AS Decimal(18, 2)))
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3809, 30)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3809, 33)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3809, 61)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3809, 66)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3809, 67)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3811, 1)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3811, 16)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3811, 30)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3811, 73)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3811, 80)
INSERT [dbo].[QuinaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (3809, 5, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[QuinaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (3809, 4, CAST(18812.48 AS Decimal(18, 2)), 25)
INSERT [dbo].[QuinaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (3809, 3, CAST(270.26 AS Decimal(18, 2)), 2486)
INSERT [dbo].[QuinaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (3811, 5, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[QuinaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (3811, 4, CAST(8767.26 AS Decimal(18, 2)), 67)
INSERT [dbo].[QuinaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (3811, 3, CAST(201.57 AS Decimal(18, 2)), 4163)
INSERT [dbo].[TimemaniaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (735, CAST(0x0D3A0B00 AS Date), N'ITABAIANA-SE', N'Caminhão da Sorte', CAST(3875386.13 AS Decimal(18, 2)), CAST(1808252.00 AS Decimal(18, 2)), CAST(0x0F3A0B00 AS Date), CAST(4200000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[TimemaniaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (736, CAST(0x0F3A0B00 AS Date), N'ITABAIANA-SE', N'Caminhão da Sorte', CAST(4150927.73 AS Decimal(18, 2)), CAST(2041432.00 AS Decimal(18, 2)), CAST(0x113A0B00 AS Date), CAST(4400000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (735, 4)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (735, 24)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (735, 37)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (735, 64)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (735, 69)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (735, 73)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (735, 74)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (736, 27)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (736, 36)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (736, 41)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (736, 54)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (736, 58)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (736, 72)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (736, 73)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (735, 7, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (735, 6, CAST(20231.01 AS Decimal(18, 2)), 5)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (735, 5, CAST(855.07 AS Decimal(18, 2)), 169)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (735, 4, CAST(6.00 AS Decimal(18, 2)), 3154)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (735, 3, CAST(2.00 AS Decimal(18, 2)), 29933)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (736, 7, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (736, 6, CAST(110216.64 AS Decimal(18, 2)), 1)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (736, 5, CAST(791.21 AS Decimal(18, 2)), 199)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (736, 4, CAST(6.00 AS Decimal(18, 2)), 3655)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (736, 3, CAST(2.00 AS Decimal(18, 2)), 33886)
INSERT [dbo].[TimemaniaTimesCoracao] ([idConcurso], [timeCoracao], [valorPago], [ganhadores]) VALUES (735, N'TUNA LUSO/PA', CAST(5.00 AS Decimal(18, 2)), 6094)
INSERT [dbo].[TimemaniaTimesCoracao] ([idConcurso], [timeCoracao], [valorPago], [ganhadores]) VALUES (736, N'TREZE/PB', CAST(5.00 AS Decimal(18, 2)), 12419)
/****** Object:  Index [duplaSenaDezenas_concurso_sorteio_dezena]    Script Date: 14/06/2015 01:59:38 ******/
ALTER TABLE [dbo].[DuplaSenaDezenas] ADD  CONSTRAINT [duplaSenaDezenas_concurso_sorteio_dezena] UNIQUE NONCLUSTERED 
(
	[IdConcurso] ASC,
	[sorteio] ASC,
	[dezena] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [federalPremiacoes_concurso_premio]    Script Date: 14/06/2015 01:59:38 ******/
ALTER TABLE [dbo].[FederalPremiacoes] ADD  CONSTRAINT [federalPremiacoes_concurso_premio] UNIQUE NONCLUSTERED 
(
	[idConcurso] ASC,
	[premio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [lotecaPremiacoes_concurso_acertos]    Script Date: 14/06/2015 01:59:38 ******/
ALTER TABLE [dbo].[LotecaPremiacoes] ADD  CONSTRAINT [lotecaPremiacoes_concurso_acertos] UNIQUE NONCLUSTERED 
(
	[idConcurso] ASC,
	[acertos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [lotofacilDezenas_concurso_dezena]    Script Date: 14/06/2015 01:59:38 ******/
ALTER TABLE [dbo].[LotofacilDezenas] ADD  CONSTRAINT [lotofacilDezenas_concurso_dezena] UNIQUE NONCLUSTERED 
(
	[IdConcurso] ASC,
	[dezena] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [lotofacilPremiacoes_concurso_acertos]    Script Date: 14/06/2015 01:59:38 ******/
ALTER TABLE [dbo].[LotofacilPremiacoes] ADD  CONSTRAINT [lotofacilPremiacoes_concurso_acertos] UNIQUE NONCLUSTERED 
(
	[idConcurso] ASC,
	[acertos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [lotogolJogos_concurso_jogo]    Script Date: 14/06/2015 01:59:38 ******/
ALTER TABLE [dbo].[LotogolJogos] ADD  CONSTRAINT [lotogolJogos_concurso_jogo] UNIQUE NONCLUSTERED 
(
	[IdConcurso] ASC,
	[jogo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [lotogolPremiacoes_concurso_acertos]    Script Date: 14/06/2015 01:59:38 ******/
ALTER TABLE [dbo].[LotogolPremiacoes] ADD  CONSTRAINT [lotogolPremiacoes_concurso_acertos] UNIQUE NONCLUSTERED 
(
	[idConcurso] ASC,
	[acertos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [lotomaniaDezenas_concurso_dezena]    Script Date: 14/06/2015 01:59:38 ******/
ALTER TABLE [dbo].[LotomaniaDezenas] ADD  CONSTRAINT [lotomaniaDezenas_concurso_dezena] UNIQUE NONCLUSTERED 
(
	[IdConcurso] ASC,
	[dezena] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [lotomaniaPremiacoes_concurso_acertos]    Script Date: 14/06/2015 01:59:38 ******/
ALTER TABLE [dbo].[LotomaniaPremiacoes] ADD  CONSTRAINT [lotomaniaPremiacoes_concurso_acertos] UNIQUE NONCLUSTERED 
(
	[idConcurso] ASC,
	[acertos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [megaSenaDezenas_concurso_dezena]    Script Date: 14/06/2015 01:59:38 ******/
ALTER TABLE [dbo].[MegasenaDezenas] ADD  CONSTRAINT [megaSenaDezenas_concurso_dezena] UNIQUE NONCLUSTERED 
(
	[IdConcurso] ASC,
	[dezena] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [megaSenaPremiacoes_concurso_acertos]    Script Date: 14/06/2015 01:59:38 ******/
ALTER TABLE [dbo].[MegasenaPremiacoes] ADD  CONSTRAINT [megaSenaPremiacoes_concurso_acertos] UNIQUE NONCLUSTERED 
(
	[idConcurso] ASC,
	[acertos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [quinaDezenas_concurso_dezena]    Script Date: 14/06/2015 01:59:38 ******/
ALTER TABLE [dbo].[QuinaDezenas] ADD  CONSTRAINT [quinaDezenas_concurso_dezena] UNIQUE NONCLUSTERED 
(
	[IdConcurso] ASC,
	[dezena] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [quinaPremiacoes_concurso_acertos]    Script Date: 14/06/2015 01:59:38 ******/
ALTER TABLE [dbo].[QuinaPremiacoes] ADD  CONSTRAINT [quinaPremiacoes_concurso_acertos] UNIQUE NONCLUSTERED 
(
	[idConcurso] ASC,
	[acertos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [timemaniaDezenas_concurso_dezena]    Script Date: 14/06/2015 01:59:38 ******/
ALTER TABLE [dbo].[TimemaniaDezenas] ADD  CONSTRAINT [timemaniaDezenas_concurso_dezena] UNIQUE NONCLUSTERED 
(
	[IdConcurso] ASC,
	[dezena] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [timemaniaPremiacoes_concurso_acertos]    Script Date: 14/06/2015 01:59:38 ******/
ALTER TABLE [dbo].[TimemaniaPremiacoes] ADD  CONSTRAINT [timemaniaPremiacoes_concurso_acertos] UNIQUE NONCLUSTERED 
(
	[idConcurso] ASC,
	[acertos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_TimemaniaConcursos_TimemaniaTimeCoracao]    Script Date: 14/06/2015 01:59:38 ******/
ALTER TABLE [dbo].[TimemaniaTimesCoracao] ADD  CONSTRAINT [FK_TimemaniaConcursos_TimemaniaTimeCoracao] UNIQUE NONCLUSTERED 
(
	[idConcurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
