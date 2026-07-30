using System;
using System.Collections.Generic;
using Microsoft.Data.SqlClient;
using System.Threading.Tasks;
using System.Windows;

namespace Login
{
    public partial class MainWindow : Window
    {
        private readonly string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=MultiLocations0201;Integrated Security=True;";


        public MainWindow()
        {
            InitializeComponent();
            _ = InitialiserDonneesAsync();
        }

        //  La méthode principale au lancement
        private async Task InitialiserDonneesAsync()
        {
            await InsererLocatairesParDefautAsync();
            await ChargerListeLocatairesAsync();
        }

        // Ajoute les locataires par défaut si absents
        private async Task InsererLocatairesParDefautAsync()
        {
            List<(string Prenom, string Nom)> locatairesDefaut = new()
            {
                ("Claudine", "Latrelle"),
                ("Armand", "Guindon"),
                ("Pierre", "Monfils"),
                ("Alfred", "Léon")
            };

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                await conn.OpenAsync();

                foreach (var locataire in locatairesDefaut)
                {
                    string checkQuery = "SELECT COUNT(*) FROM dbo.Identifiants WHERE Prenom=@Prenom AND Nom=@Nom";
                    using (SqlCommand checkCmd = new SqlCommand(checkQuery, conn))
                    {
                        checkCmd.Parameters.AddWithValue("@Prenom", locataire.Prenom);
                        checkCmd.Parameters.AddWithValue("@Nom", locataire.Nom);

                        int count = (int)await checkCmd.ExecuteScalarAsync();

                        if (count == 0) // si absent → on l’ajoute
                        {
                            string insertQuery = "INSERT INTO dbo.Identifiants (Prenom, Nom) VALUES (@Prenom, @Nom)";
                            using (SqlCommand insertCmd = new SqlCommand(insertQuery, conn))
                            {
                                insertCmd.Parameters.AddWithValue("@Prenom", locataire.Prenom);
                                insertCmd.Parameters.AddWithValue("@Nom", locataire.Nom);
                                await insertCmd.ExecuteNonQueryAsync();
                            }
                        }
                    }
                }
            }
        }

        // Charge la liste déroulante avec les locataires
        private async Task ChargerListeLocatairesAsync()
        {
            var locataires = new List<LocataireComboItem>();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                await conn.OpenAsync();
                string query = "SELECT IdIdentifiant, Prenom, Nom FROM dbo.Identifiants";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                using (SqlDataReader reader = await cmd.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        locataires.Add(new LocataireComboItem
                        {
                            Id = Convert.ToInt32(reader["IdIdentifiant"]),
                            NomComplet = $"{reader["Prenom"]} {reader["Nom"]}"
                        });
                    }
                }
            }

            CmbLocataires.ItemsSource = locataires;
            CmbLocataires.DisplayMemberPath = "NomComplet";
            CmbLocataires.SelectedValuePath = "Id";
        }
    }

    // Classe utilitaire pour la ComboBox
    public class LocataireComboItem
    {
        public int Id { get; set; }
        public string NomComplet { get; set; }
        public override string ToString() => NomComplet;
    }
}
