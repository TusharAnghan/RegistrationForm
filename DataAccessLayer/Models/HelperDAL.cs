using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Mvc;
using System.Xml.Linq;

namespace DataAccessLayer.Models
{
    public class HelperDAL : IHelperDAL
    {
        SqlConnection Connection()
        {
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["cn"].ConnectionString);
            return cn;
        }

        public IList<UserInformation> GetRecords()
        {
            List<UserInformation> lst = new List<UserInformation>();
            SqlConnection cn = Connection();
            SqlCommand cmd = new SqlCommand();
            DataTable dt = new DataTable();
            try
            {
                cmd.CommandText = "GetRecords";
                cmd.Connection = cn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 100;
                cn.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
                if (dt.Rows.Count > 0)
                {
                    lst = dt.AsEnumerable().Select(i => new UserInformation
                    {
                        UserInformation_ID = i.Field<int>("UserInformation_ID"),
                        State_ID = i.Field<int>("State_ID"),
                        City_ID = i.Field<int>("City_ID"),
                        Name = i.Field<string>("Name"),
                        Email_Address = i.Field<string>("Email_Address"),
                        Phone = i.Field<string>("Phone"),
                        Address = i.Field<string>("Address")
                    }).ToList();
                }
                sdr.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                cn.Close();
                cmd.Dispose();
                dt.Dispose();
            }
            return lst;
        }

        public UserInformation GetRecords(int id)
        {
            UserInformation UI = new UserInformation();
            SqlConnection cn = Connection();
            SqlCommand cmd = new SqlCommand();
            DataTable dt = new DataTable();
            try
            {
                cmd.CommandText = "GetRecordsUsingID";
                cmd.Parameters.AddWithValue("@UserInformation_ID", id);
                cmd.Connection = cn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 100;
                cn.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
                if (dt.Rows.Count > 0)
                {
                    UI = dt.AsEnumerable().Select(i => new UserInformation
                    {
                        UserInformation_ID = i.Field<int>("UserInformation_ID"),
                        State_ID = i.Field<int>("State_ID"),
                        City_ID = i.Field<int>("City_ID"),
                        Name = i.Field<string>("Name"),
                        Email_Address = i.Field<string>("Email_Address"),
                        Phone = i.Field<string>("Phone"),
                        Address = i.Field<string>("Address")
                    }).FirstOrDefault();
                }
                sdr.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                cn.Close();
                cmd.Dispose();
                dt.Dispose();
            }
            return UI;
        }

        public int Insert(UserInformation UI)
        {
            SqlConnection cn = Connection();
            SqlCommand cmd = new SqlCommand();
            int response = 0;
            try
            {
                cmd.CommandText = "InsertNewRecord";
                cmd.Connection = cn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@State_ID", UI.State_ID);
                cmd.Parameters.AddWithValue("@City_ID", UI.City_ID);
                cmd.Parameters.AddWithValue("@Name", UI.Name);
                cmd.Parameters.AddWithValue("@Email_Address", UI.Email_Address);
                cmd.Parameters.AddWithValue("@Phone", UI.Phone);
                cmd.Parameters.AddWithValue("@Address", UI.Address ?? (object)DBNull.Value);
                cn.Open();
                response = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                cn.Close();
                cmd.Dispose();
            }

            return response;
        }

        public int Update(UserInformation UI)
        {
            SqlConnection cn = Connection();
            SqlCommand cmd = new SqlCommand();
            int response = 0;
            try
            {
                cmd.CommandText = "UpdateRecord";
                cmd.Connection = cn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserInformation_ID", UI.UserInformation_ID);
                cmd.Parameters.AddWithValue("@State_ID", UI.State_ID);
                cmd.Parameters.AddWithValue("@City_ID", UI.City_ID);
                cmd.Parameters.AddWithValue("@Name", UI.Name);
                cmd.Parameters.AddWithValue("@Email_Address", UI.Email_Address);
                cmd.Parameters.AddWithValue("@Phone", UI.Phone);
                cmd.Parameters.AddWithValue("@Address", UI.Address ?? (object)DBNull.Value);
                cn.Open();
                response = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                cn.Close();
                cmd.Dispose();
            }
            return response;
        }

        public int Delete(UserInformation UI)
        {
            SqlConnection cn = Connection();
            SqlCommand cmd = new SqlCommand();
            int response = 0;
            try
            {
                cmd.CommandText = "DeleteRecord";
                cmd.Connection = cn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserInformation_ID", UI.UserInformation_ID);
                cn.Open();
                response = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                cn.Close();
                cmd.Dispose();
            }
            return response;
        }

        public IEnumerable<SelectListItem> GetStates()
        {
            SqlConnection cn = Connection();
            SqlCommand cmd = new SqlCommand();
            List<SelectListItem> lst = new List<SelectListItem>();
            try
            {
                cmd.CommandText = "GetStates";
                cmd.Connection = cn;
                cmd.CommandType = CommandType.StoredProcedure;
                cn.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    lst.Add(new SelectListItem { Text = sdr["State_Name"].ToString(), Value = sdr["State_ID"].ToString() });
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                cn.Close();
                cmd.Dispose();
            }

            return lst;
        }

        public IEnumerable<SelectListItem> GetCitiesByState(int stateId)
        {
            SqlConnection cn = Connection();
            SqlCommand cmd = new SqlCommand();
            List<SelectListItem> lst = new List<SelectListItem>();
            try
            {
                lst.Add(new SelectListItem { Value = "", Text = "Select City" });

                cmd.CommandText = "GetCitiesByState";
                cmd.Connection = cn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@State_ID", stateId);
                cn.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    lst.Add(new SelectListItem { Text = sdr["City_Name"].ToString(), Value = sdr["City_ID"].ToString() });
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                cn.Close();
                cmd.Dispose();
            }

            return lst;
        }
    }
}
