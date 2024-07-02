using lab8.Infrastructure.Commands;
using lab8.Infrastructure.Commands.Base;
using lab8.ViewModels.Base;
using Microsoft.SqlServer.Server;
using Microsoft.Win32;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media.Animation;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Xml.Linq;

namespace lab8.ViewModels
{
    public class MainViewModel : BaseViewModel
    {
        SqlDataAdapter pAdapter;
        SqlDataAdapter cAdapter;
        SqlCommandBuilder commandBuilder;
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        string reserveString = System.Configuration.ConfigurationManager.ConnectionStrings["ReserveConnection"].ConnectionString;
        string queryProducts = "Select * from Products";
        string queryCompanies = "Select * from Companies";
        string create_db;
        string country = "Belarus";

        public ICommand UpdateTableCommand { get; }
        private void OnUpdateTableCommandExecuted(object parameter)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            SqlTransaction transaction;

            try
            {
                #region Products

                pAdapter = new SqlDataAdapter(queryProducts, connection);
                commandBuilder = new SqlCommandBuilder(pAdapter);
                pAdapter.InsertCommand = new SqlCommand("AddProduct", connection);
                pAdapter.InsertCommand.CommandType = System.Data.CommandType.StoredProcedure;
                pAdapter.InsertCommand.Parameters.Add(new SqlParameter("@product_id", SqlDbType.Int, 0, "product_id"));
                pAdapter.InsertCommand.Parameters.Add(new SqlParameter("@name", SqlDbType.NVarChar, 20, "name"));
                pAdapter.InsertCommand.Parameters.Add(new SqlParameter("@size", SqlDbType.NVarChar, 1, "size"));
                pAdapter.InsertCommand.Parameters.Add(new SqlParameter("@weight", SqlDbType.Real, 0, "weight"));
                pAdapter.InsertCommand.Parameters.Add(new SqlParameter("@type", SqlDbType.NVarChar, 11, "type"));
                pAdapter.InsertCommand.Parameters.Add(new SqlParameter("@receipt_date", SqlDbType.Date, 10, "receipt_date"));
                pAdapter.InsertCommand.Parameters.Add(new SqlParameter("@amount", SqlDbType.Int, 0 , "amount"));
                pAdapter.InsertCommand.Parameters.Add(new SqlParameter("@price", SqlDbType.Real, 0, "price"));
                pAdapter.InsertCommand.Parameters.Add(new SqlParameter("@company_id", SqlDbType.Int, 0, "company_id"));


                pAdapter.UpdateCommand = commandBuilder.GetUpdateCommand();
                pAdapter.DeleteCommand = commandBuilder.GetDeleteCommand();

                transaction = connection.BeginTransaction();
                pAdapter.InsertCommand.Transaction = transaction;
                pAdapter.UpdateCommand.Transaction = transaction;
                pAdapter.DeleteCommand.Transaction = transaction;

                pAdapter.Update(ProductsTable.Copy());

                transaction.Commit();
                transaction.Dispose();
                #endregion

                #region Companies

                cAdapter = new SqlDataAdapter(queryCompanies, connection);
                commandBuilder = new SqlCommandBuilder(cAdapter);
                cAdapter.InsertCommand = new SqlCommand("AddCompany", connection);
                cAdapter.InsertCommand.CommandType = System.Data.CommandType.StoredProcedure;
                cAdapter.InsertCommand.Parameters.Add(new SqlParameter("@company_id", SqlDbType.Int, 0, "company_id"));
                cAdapter.InsertCommand.Parameters.Add(new SqlParameter("@name", SqlDbType.NVarChar, 20, "name"));
                cAdapter.InsertCommand.Parameters.Add(new SqlParameter("@country", SqlDbType.NVarChar, 30, "country"));
                cAdapter.InsertCommand.Parameters.Add(new SqlParameter("@address", SqlDbType.NVarChar, 50, "address"));
                cAdapter.InsertCommand.Parameters.Add(new SqlParameter("@tel_number", SqlDbType.NVarChar, 13, "tel_number"));
                cAdapter.InsertCommand.Parameters.Add(new SqlParameter("@logo", SqlDbType.NVarChar, int.MaxValue, "logo"));

                cAdapter.UpdateCommand = commandBuilder.GetUpdateCommand();
                cAdapter.DeleteCommand = commandBuilder.GetDeleteCommand();

                transaction = connection.BeginTransaction();
                cAdapter.InsertCommand.Transaction = transaction;
                cAdapter.UpdateCommand.Transaction = transaction;
                cAdapter.DeleteCommand.Transaction = transaction;

                cAdapter.Update(CompaniesTable.Copy());

                transaction.Commit();
                transaction.Dispose();

                #endregion

                CompaniesTable.AcceptChanges();
                ProductsTable.AcceptChanges();

                
                if (SelectedQueryIndex)
                {
                    SqlCommand newCommand = new SqlCommand(queryCompanies, connection);
                    newCommand.Parameters.AddWithValue("@country", "Belarus");
                    cAdapter.UpdateCommand = newCommand;
                    CompaniesTable.Clear();

                    cAdapter.Fill(CompaniesTable);
                }
                else
                {
                    SqlCommand newCommand = new SqlCommand(queryCompanies, connection);
                    cAdapter.UpdateCommand = newCommand;
                    CompaniesTable.Clear();

                    cAdapter.Fill(CompaniesTable);
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            finally
            {
                connection?.Close();
            }
        }
        private bool CanUpdateTableCommandExecute(object parameter) => true;

        public ICommand DeleteRowCommand { get; }
        private void OnDeleteRowCommandExecuted(object parameter)
        {
            try
            {
                DataRow row;
                int index = PageIndex;//(int)parameter
                switch (index)
                {
                    case 0:
                        row = ProductsTable.Rows[SelectedProductIndex];
                        row.Delete();
                        pAdapter.Update(ProductsTable);
                        cAdapter.Update(CompaniesTable);
                        
                        break;
                    case 1:
                        row = CompaniesTable.Rows[SelectedCompanyIndex];
                        row.Delete();
                        cAdapter.Update(CompaniesTable);
                        pAdapter.Update(ProductsTable);
                        
                        break;
                    default: return;
                }
            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            UpdateTables();
        }
        private bool CanDeleteRowCommandExecute(object parameter) => true;
        
        private void UpdateTables()
        {
            ProductsTable = new DataTable();
            CompaniesTable = new DataTable();
            Fill();
        }
        public ICommand UpRowCommand { get; }
        private void OnUpRowCommandExecuted(object parameter)
        {
            switch(PageIndex)
            {
                case 0:
                    SelectedProductIndex--;
                    break;
                case 1:
                    SelectedCompanyIndex--;
                    break;
                
            }
        }
        private bool CanUpRowCommandExecute(object parameter) => (PageIndex == 1 && SelectedCompanyIndex > 0) || (PageIndex == 0 && SelectedProductIndex > 0);

        public ICommand DownRowCommand { get; }
        private void OnDownRowCommandExecuted(object parameter)
        {
            switch (PageIndex)
            {
                case 0:
                    SelectedProductIndex++;
                    break;
                case 1:
                    SelectedCompanyIndex++;
                    break;
                
            }
        }
        
        private bool CanDownRowCommandExecute(object parameter) => (PageIndex == 1 && SelectedCompanyIndex < CompaniesTable.Rows.Count) || (PageIndex == 0 && SelectedProductIndex < ProductsTable.Rows.Count);

        private DataTable _productsTable;
        public DataTable ProductsTable
        {
            get => _productsTable; 
            set => Set(ref _productsTable, value);
        }

        private DataTable _companiesTable;
        public DataTable CompaniesTable
        {
            get => _companiesTable;
            set => Set(ref _companiesTable, value);
        }

        private int _selectedProductIndex = 0;
        public int SelectedProductIndex
        {
            get { return _selectedProductIndex; }
            set { Set(ref _selectedProductIndex, value); }
        }

        private int _selectedCompanyIndex = 0;
        public int SelectedCompanyIndex
        {
            get { return _selectedCompanyIndex; }
            set { Set(ref _selectedCompanyIndex, value); }
        }

        private DataTable _queryTable;
        public DataTable QueryTable
        {
            get => _queryTable;
            set => Set(ref _queryTable, value);
        }

        private bool _selectedQueryIndex;
        public bool SelectedQueryIndex
        {
            get { return _selectedQueryIndex; }
            set { 
                Set(ref _selectedQueryIndex, value);
                
                if (SelectedQueryIndex)
                {
                    queryCompanies = $"Select * from Companies where country = '{country}'";
                }
                else
                {
                    queryCompanies = "Select * from Companies";
                }
                OnUpdateTableCommandExecuted(null);
            }
        }

        private int _pageIndex = 0;
        public int PageIndex
        {
            get { return _pageIndex; }
            set { Set(ref _pageIndex, value); }
        }

        private void Fill()
        {
            pAdapter.Fill(ProductsTable);
            cAdapter.Fill(CompaniesTable);
        }

        public MainViewModel() 
        {
            UpdateTableCommand = new LambdaCommand(OnUpdateTableCommandExecuted, CanUpdateTableCommandExecute);
            DeleteRowCommand = new LambdaCommand(OnDeleteRowCommandExecuted, CanDeleteRowCommandExecute);
            UpRowCommand = new LambdaCommand(OnUpRowCommandExecuted, CanUpRowCommandExecute);
            DownRowCommand = new LambdaCommand(OnDownRowCommandExecuted, CanDownRowCommandExecute);
            try
            {
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                pAdapter = new SqlDataAdapter(queryProducts, connection);
                cAdapter = new SqlDataAdapter(queryCompanies, connection);
                ProductsTable = new DataTable();
                CompaniesTable = new DataTable();
                QueryTable = new DataTable();
                Fill();
                OnUpdateTableCommandExecuted(cAdapter);
            }
            catch (Exception ex)
            {

                MessageBox.Show("Отсутствет база данных или таблицы");
                SqlConnection buff_connection = new SqlConnection(reserveString);
                SqlCommand create = new SqlCommand("Create Database C#", buff_connection);
                buff_connection.Open();
                try
                {
                    create.ExecuteNonQuery();
                }
                catch (Exception e)
                {

                }

                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();

                string table = "create table Products\r\n(\r\n\tproduct_id int not null primary key check(product_id > 0),\r\n\tname nvarchar(20) not null check(name like '%[a-zA-Zа-яА-Я- ]%'),\r\n\tsize nvarchar(1) not null check(size in ('s', 'm', 'l')),\r\n\tweight real not null check(weight>0),\r\n\ttype nvarchar(11) not null check(type in ('electronics','food','clothes')),\r\n\treceipt_date date not null check(receipt_date <= getdate()),\r\n\tamount int not null check(amount > 0),\r\n\tprice real not null check(price > 0),\r\n\tcompany_id int not null foreign key references Companies(company_id)\r\n)";

                create = new SqlCommand(table, connection);
                try
                {
                    create.ExecuteNonQuery();
                }
                catch (Exception e)
                {

                }

                table = "create table Companies\r\n(\r\n\tcompany_id int not null primary key check(company_id > 0),\r\n\tname nvarchar(20) not null check(name like '%[a-zA-Zа-яА-Я- ]%'),\r\n\tcountry nvarchar(30) not null check(country like '%[a-zA-Zа-яА-Я- ]%'),\r\n\taddress nvarchar(50) not null,\r\n\ttel_number nvarchar(13) not null check(tel_number like '+[0-9]%' AND LEN(tel_number) = 13),\r\n\tlogo nvarchar(max)\r\n)";

                create = new SqlCommand(table, connection);
                try
                {
                    create.ExecuteNonQuery();
                }
                catch (Exception e)
                {

                }
                MessageBox.Show(ex.Message);
            }
        }
    }
}
