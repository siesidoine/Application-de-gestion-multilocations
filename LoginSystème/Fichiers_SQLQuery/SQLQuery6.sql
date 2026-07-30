-- 1. Créer la table Clients si elle n'existe pas
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.Clients') AND type in (N'U'))
BEGIN
    CREATE TABLE dbo.Clients
    (
        IdClient INT IDENTITY(1,1) PRIMARY KEY,
        Nom NVARCHAR(50) NOT NULL,
        Prenom NVARCHAR(50) NOT NULL,
        Adresse NVARCHAR(200) NULL
    );
END

-- 2. Supprimer les doublons pour éviter les conflits
DELETE FROM dbo.Clients
WHERE Nom IN ('Dupont','Latreille','Guindon','Monfils','Léon');

-- 3. Insérer les clients
INSERT INTO dbo.Clients(Nom, Prenom, Adresse)
VALUES 
('Dupont', 'Jean', '123 rue de Plas'),
('Latreille', 'Claudine', '1000 chemin des Pruches, St-Clinclin, Qc'),
('Guindon', 'Armand', '728 rue Vorien, St Benit, Qc'),
('Monfils', 'Pierre', '248 Garneau, Tenaga, Qc'),
('Léon', 'Alfred', '1269 chemin des Anges, St-Clinclin, Qc');
