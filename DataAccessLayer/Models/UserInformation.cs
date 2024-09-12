using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;


namespace DataAccessLayer.Models
{
    public class UserInformation
    {

        public int UserInformation_ID { get; set; }


        [Required(ErrorMessage = "Name is required.")]
        public string Name { get; set; }


        [DisplayName("Email Address")]
        [Required(ErrorMessage = "Email is required.")]
        [EmailAddress(ErrorMessage = "Invalid email address.")]
        public string Email_Address { get; set; }


        [Required(ErrorMessage = "Phone number is required.")]
        [RegularExpression(@"^\d{10}$", ErrorMessage = "Invalid phone number. Must be 10 digits.")]
        public string Phone { get; set; }

        public string Address { get; set; }


        [DisplayName("State")]
        [Required(ErrorMessage = "State is required.")]
        public int State_ID { get; set; }


        public IEnumerable<SelectListItem> States { get; set; }


        [DisplayName("City")]
        [Required(ErrorMessage = "City is required.")]
        public int City_ID { get; set; }


        public IEnumerable<SelectListItem> Cities { get; set; }


        [Required(ErrorMessage = "You must agree to the terms.")]
        public bool Agree { get; set; }

    }
}
