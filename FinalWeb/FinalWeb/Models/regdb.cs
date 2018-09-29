//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace FinalWeb.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.Web.Mvc;
    using System.Data.SqlClient;
    using System.Configuration;
    
    public partial class regdb
    {
        public int UserID { get; set; }

        [Required(ErrorMessage = "Please provide Full Name", AllowEmptyStrings = false)]
        public string Fullname { get; set; }
        
        [RegularExpression(@"^([0-9a-zA-Z]([\+\-_\.][0-9a-zA-Z]+)*)+@(([0-9a-zA-Z][-\w]*[0-9a-zA-Z]*\.)+[a-zA-Z0-9]{2,3})$",
        ErrorMessage = "Please provide valid email id")]
        public string Email { get; set; }
        
        [Required(ErrorMessage = "Please provide Username", AllowEmptyStrings = false)]
        public string Username { get; set; }

        [Required(ErrorMessage = "Please provide Password", AllowEmptyStrings = false)]
        [DataType(System.ComponentModel.DataAnnotations.DataType.Password)]
        [StringLength(50, MinimumLength = 8, ErrorMessage = "Password must be 8 character long")]
        public string Password { get; set; }


        [System.ComponentModel.DataAnnotations.Compare("Password", ErrorMessage = "Confrim Password does not match")]
        [DataType(System.ComponentModel.DataAnnotations.DataType.Password)]
        public string ConfirmPassword { get; set; }

        [Required(ErrorMessage = "Please provide Usertype", AllowEmptyStrings = false)]
        public string Usertype { get; set; }

        public bool checkUser(string Username, string Password) //This method check the user existence
        {
            bool flag = false;
            string connString = ConfigurationManager.ConnectionStrings["FinalWebEntities"].ConnectionString; // Read the connection string from the web.config file
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("Select count(*) from regdb where Username='" + Username + "' and Password='" + Password + "'", conn);
                flag = Convert.ToBoolean(cmd.ExecuteScalar());
                return flag;
            }
        }
    }
}
