USE [Système de gestion Multi Locations]
GO

/****** Object:  Table [dbo].[Voiture]    Script Date: 2025-09-21 23:59:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE Voitures (
    IdVoiture INT PRIMARY KEY IDENTITY,
    Marque NVARCHAR(50),
    Modele NVARCHAR(50),
    Annee INT,
    Plaque NVARCHAR(20),
    PrixJour DECIMAL(10,2),
    Disponibilite BIT
);


