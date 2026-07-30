USE [master]
GO

CREATE DATABASE [biblio]

GO

USE [biblio]
GO


CREATE TABLE [dbo].[Livres](
	[Id] [int] NOT NULL,
	[Titre] [nvarchar](100) NULL,
 CONSTRAINT [PK_Livres] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Livres] ([Id], [Titre]) VALUES (1, N'Les aventures de Superman')
INSERT [dbo].[Livres] ([Id], [Titre]) VALUES (2, N'Tintin et le lac aux requins')
INSERT [dbo].[Livres] ([Id], [Titre]) VALUES (3, N'Des requins sur la lune')
INSERT [dbo].[Livres] ([Id], [Titre]) VALUES (4, N'Les dents du requin')
INSERT [dbo].[Livres] ([Id], [Titre]) VALUES (5, N'Naruto: L''attaque des ninjas')
INSERT [dbo].[Livres] ([Id], [Titre]) VALUES (6, N'Batman vs Superman')
INSERT [dbo].[Livres] ([Id], [Titre]) VALUES (7, N'Naruto et Boruto')
