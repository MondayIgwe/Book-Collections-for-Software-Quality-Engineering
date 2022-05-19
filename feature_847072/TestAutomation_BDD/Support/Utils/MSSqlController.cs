using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace Roman_Framework.Data
{
    internal class MSSqlController
    {
        public MSSqlController(string connectionString)
        {
            sqlConnection = connectionString;
        }

        private SqlConnection openConnection { get; set; }
        internal string sqlConnection { get; set; }
        internal DataTable ExecuteQuery(string query, bool MaintainConnection = false, int sqlCommandTimeoutInSeconds = 30)
        {
            DataTable table = new DataTable();
            SqlConnection conn;

            if (MaintainConnection)
            {
                conn = openConnection;
            }
            else
            {
                conn = new SqlConnection(sqlConnection);
                conn.Open();
            }

            SqlCommand command = conn.CreateCommand();
            command.CommandTimeout = sqlCommandTimeoutInSeconds;
            command.CommandText = query;
            SqlDataReader reader = command.ExecuteReader();
            table.Load(reader);

            if (!MaintainConnection) conn.Dispose();

            return table;
        }

        internal void OpenConnection()
        {
            openConnection = new SqlConnection(sqlConnection);
            openConnection.Open();
        }

        internal void CloseConnection()
        {
            openConnection.Close();
        }

        internal int ExecuteStatement(string statement, List<object> parameters, bool MaintainConnection = false, int sqlCommandTimeoutInSeconds = 30)
        {
            SqlConnection conn;

            if (MaintainConnection)
            {
                conn = openConnection;
            }
            else
            {
                conn = new SqlConnection(sqlConnection);
                conn.Open();
            }

            SqlCommand command = conn.CreateCommand();
            command.CommandTimeout = sqlCommandTimeoutInSeconds;
            command.CommandText = statement;
            foreach (SqlParameter param in parameters)
            {
                command.Parameters.Add(param);
            }

            int affected = command.ExecuteNonQuery();

            if (!MaintainConnection) conn.Dispose();

            return affected;
        }

        internal int ExecuteProcedure(string procedureName, Dictionary<string, object> parameters, bool MaintainConnection = false, int sqlCommandTimeoutInSeconds = 30)
        {
            SqlConnection conn;

            if (MaintainConnection)
            {
                conn = openConnection;
            }
            else
            {
                conn = new SqlConnection(sqlConnection);
                conn.Open();
            }


            SqlCommand command = new SqlCommand(procedureName, conn);
            command.CommandTimeout = sqlCommandTimeoutInSeconds = 30;
            command.CommandType = CommandType.StoredProcedure;
            foreach (var param in parameters)
            {
                SqlParameter sqlParameter = command.CreateParameter();
                sqlParameter.ParameterName = param.Key;
                sqlParameter.Value = param.Value;

                command.Parameters.Add(sqlParameter);
            }

            int affected = command.ExecuteNonQuery();

            if (!MaintainConnection) conn.Dispose();

            return affected;

        }

        internal T ExecuteScalar<T>(string scalarQuery, List<object> parameters, bool MaintainConnection = false, int sqlCommandTimeoutInSeconds = 30)
        {
            SqlConnection conn;

            if (MaintainConnection)
            {
                conn = openConnection;
            }
            else
            {
                conn = new SqlConnection(sqlConnection);
                conn.Open();
            }


            SqlCommand command = new SqlCommand(scalarQuery, conn);            
            command.CommandTimeout = sqlCommandTimeoutInSeconds = 30;
            foreach (SqlParameter param in parameters)
            {
                command.Parameters.Add(param);
            }

            var scalar = (T)command.ExecuteScalar();
            if (!MaintainConnection) conn.Dispose();

            return scalar;


        }
    }
}
