-- 1. Créer la table si elle n'existe pas
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.Identifiants') AND type in (N'U'))
BEGIN
    CREATE TABLE dbo.Identifiants
    (
        IdIdentifiant INT IDENTITY(1,1) PRIMARY KEY,
        Prenom NVARCHAR(50) NOT NULL,
        Nom NVARCHAR(50) NOT NULL,
        Adresse NVARCHAR(200) NULL,
        Ville NVARCHAR(50) NULL,
        Province NVARCHAR(50) NULL,
        CodePostal NVARCHAR(20) NULL,
        Telephone NVARCHAR(20) NULL
    );
END

-- 2. Supprimer les entrées existantes pour éviter les doublons
DELETE FROM dbo.Identifiants
WHERE Prenom IN ('Claudine', 'Armand', 'Pierre', 'Alfred')
  AND Nom IN ('Latrelle', 'Guindon', 'Monfils', 'Léon');

-- 3. Insérer les 4 locataires
INSERT INTO dbo.Identifiants (Prenom, Nom, Adresse, Ville, Province, CodePostal, Telephone)
VALUES
('Claudine', 'Latrelle', '', '', '', '', ''),
('Armand', 'Guindon', '', '', '', '', ''),
('Pierre', 'Monfils', '', '', '', '', ''),
('Alfred', 'Léon', '', '', '', '', '');
