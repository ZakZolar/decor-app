using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Configuration;
using System.ComponentModel.DataAnnotations;

namespace FinalWeb.Models
{
    public class usertype
    {
        [Required(ErrorMessage = "Please provide Usertype", AllowEmptyStrings = false)]
        public string Usertype { get; set; }
    }
}