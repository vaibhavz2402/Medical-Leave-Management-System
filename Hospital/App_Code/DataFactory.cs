using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for DataFactory
/// </summary>
namespace com.eil.DAL
{
    using System;
    using System.Data;
    using System.Data.Common;
    using System.Data.SqlClient;
    using Oracle.DataAccess.Client;
    using Oracle.DataAccess.Client;


    public enum DatabaseType
    {
        Access,
        SQLServer,
        Oracle
        // any other data source type    
        
    }    
    public enum ParameterType
    {
        Integer,
        Char,
        VarChar
        // define a common parameter type set
    }

    public class DataFactory
    {
        private DataFactory()
        {
        }
       
        #region ConnectionFactory
        public static IDbConnection CreateConnection
          (string ConnectionString)
        {
            return CreateConnection(ConnectionString, (DatabaseType)0);
        }
        public static IDbConnection CreateConnection
           (string ConnectionString,
           DatabaseType dbtype)
        {

            IDbConnection cnn;

            switch (dbtype)
            {
                case DatabaseType.Access:
                    cnn = new OracleConnection
                       (ConnectionString);
                    break;
                case DatabaseType.SQLServer:
                    cnn = new SqlConnection
                       (ConnectionString);
                    break;
                case DatabaseType.Oracle:
                    cnn = new OracleConnection
                       (ConnectionString);
                    break;
                default:
                    cnn = new SqlConnection
                       (ConnectionString);
                    break;
            }

            return cnn;
        }
        #endregion

        #region CommandFactory
        public static IDbCommand CreateCommand(DatabaseType dbtype)
        {
            IDbCommand cmd;
            switch (dbtype)
            {
                case DatabaseType.Access:
                    cmd = new OracleCommand();
                    break;

                case DatabaseType.SQLServer:
                    cmd = new SqlCommand();
                    break;

                case DatabaseType.Oracle:
                    cmd = new OracleCommand();
                    break;
                default:
                    cmd = new SqlCommand();
                    break;
            }

            return cmd;
        }
        public static IDbCommand CreateCommand(String cmdText, IDbConnection conn, DatabaseType dbtype)
        {
            IDbCommand cmd;
            switch (dbtype)
            {
                case DatabaseType.Access:
                    cmd = new OracleCommand(cmdText, (OracleConnection)conn);
                    break;

                case DatabaseType.SQLServer:
                    cmd = new SqlCommand(cmdText, (SqlConnection)conn);
                    break;

                case DatabaseType.Oracle:
                    cmd = new OracleCommand(cmdText, (OracleConnection)conn);
                    break;
                default:
                    cmd = new SqlCommand(cmdText, (SqlConnection)conn);
                    break;
            }

            return cmd;
        }

        #endregion
        #region CommandBuilderFactory
        public static void CreateCommandBuilder(IDbCommand cmd, DatabaseType dbtype)
        {
            switch (dbtype)
            {
                case DatabaseType.Access:
                      OracleCommandBuilder.DeriveParameters((OracleCommand)cmd);
                    break;

                case DatabaseType.SQLServer:
                    SqlCommandBuilder.DeriveParameters((SqlCommand)cmd);
                    break;

                case DatabaseType.Oracle:
                     OracleCommandBuilder.DeriveParameters((OracleCommand) cmd);
                    break;

                default:
                    SqlCommandBuilder.DeriveParameters((SqlCommand)cmd);
                    break;
            }           
        }
        #endregion
        #region ParameterFactory       
        public static IDbDataParameter[] CreateDbParameter(int length, DatabaseType dbtype)
        {
            IDbDataParameter[] OracleParameter;
            switch (dbtype)
            {
                case DatabaseType.Access:
                    OracleParameter = new OracleParameter[length];
                    break;

                case DatabaseType.SQLServer:
                    OracleParameter = new SqlParameter[length];

                    break;

                case DatabaseType.Oracle:
                    OracleParameter = new OracleParameter[length];
                    break;

                default:
                    OracleParameter = new OracleParameter[length];
                    break;
            }
            return OracleParameter;
        }
        #endregion
        #region AdapterFactory
        public static DbDataAdapter CreateAdapter(DatabaseType dbtype)
        {
            DbDataAdapter da;
            switch (dbtype)
            {
                case DatabaseType.Access:
                    da = new OracleDataAdapter();
                    break;

                case DatabaseType.SQLServer:
                    da = new SqlDataAdapter();
                    break;

                case DatabaseType.Oracle:
                    da = new OracleDataAdapter();
                    break;

                default:
                    da = new SqlDataAdapter();
                    break;
            }

            return da;
        }
        public static DbDataAdapter CreateAdapter (IDbCommand cmd, DatabaseType dbtype)
        {
            DbDataAdapter da;
            switch (dbtype)
            {
                case DatabaseType.Access:
                    da = new OracleDataAdapter
                       ((OracleCommand)cmd);
                    break;

                case DatabaseType.SQLServer:
                    da = new SqlDataAdapter
                       ((SqlCommand)cmd);
                    break;

                case DatabaseType.Oracle:
                    da = new OracleDataAdapter
                       ((OracleCommand)cmd);
                    break;

                default:
                    da = new SqlDataAdapter
                       ((SqlCommand)cmd);
                    break;
            }

            return da;
        }
        #endregion

        #region updateDatasetGenric
        public static void SetDataSetCommand(IDbDataAdapter dataAdapter, IDbCommand updateCommand, IDbCommand insertCommand, IDbCommand deleteCommand, DatabaseType dbtype)
        {
            switch (dbtype)
            {
                case DatabaseType.Access:
                        dataAdapter.UpdateCommand = (OracleCommand) updateCommand;   
                        dataAdapter.InsertCommand =(OracleCommand) insertCommand;
                        dataAdapter.DeleteCommand = (OracleCommand) deleteCommand;
                    break;

                case DatabaseType.SQLServer:
                    dataAdapter.UpdateCommand = (SqlCommand)updateCommand;
                    dataAdapter.InsertCommand = (SqlCommand)insertCommand;
                    dataAdapter.DeleteCommand = (SqlCommand)deleteCommand;                    
                    break;

                case DatabaseType.Oracle:
                    dataAdapter.UpdateCommand = (OracleCommand)updateCommand;
                    dataAdapter.InsertCommand = (OracleCommand)insertCommand;
                    dataAdapter.DeleteCommand = (OracleCommand)deleteCommand;    
                break;

                default:
                        dataAdapter.UpdateCommand = (OracleCommand) updateCommand;   
                        dataAdapter.InsertCommand =(OracleCommand) insertCommand;
                        dataAdapter.DeleteCommand = (OracleCommand) deleteCommand;
                    break;
            }
        }
        #endregion


    }
}