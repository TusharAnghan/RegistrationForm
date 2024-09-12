using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Mvc;
using BusinessLogic;
using DataAccessLayer.Models;
using Microsoft.Ajax.Utilities;

namespace RegistrationForm.Controllers
{
    public class HomeController : Controller
    {
        HelperBL HelpBL = new HelperBL();

        [HttpGet]
        public ActionResult Index()
        {
            return View(HelpBL.GetRecords());
        }

        public PartialViewResult AddOrEdit(int? id)
        {
            UserInformation UI = new UserInformation(); ;
            if (id == null) // Add new user
            {
                UI.States = HelpBL.GetStates();

                List<SelectListItem> lst = new List<SelectListItem>();
                lst.Add(new SelectListItem { Value = "", Text = "Select City" });
                UI.Cities = lst;
            }
            else // Edit existing user
            {
                UI = HelpBL.GetRecords(id.Value);
                UI.States = HelpBL.GetStates();
                UI.Cities = HelpBL.GetCitiesByState(UI.State_ID);
            }

            return PartialView("_AddItemPartial", UI);
        }

        public JsonResult GetCities(int stateId)
        {
            var cities = HelpBL.GetCitiesByState(stateId);
            return Json(cities, JsonRequestBehavior.AllowGet);

        }

        [HttpPost]
        public JsonResult SaveUser(UserInformation UI)
        {
            if (ModelState.IsValid)
            {
                if (UI.UserInformation_ID == 0)
                {
                    int response = HelpBL.Insert(UI);
                    if (response == 1)
                    {
                        return Json(new { success = true });
                    }
                    else
                    {
                        return Json(new { success = false });
                    }
                }
                else
                {
                    int response = HelpBL.Update(UI);
                    if (response == 1)
                    {
                        return Json(new { success = true });
                    }
                    else
                    {
                        return Json(new { success = false });
                    }
                }
            }

            return Json(new { success = false, errors = ModelState.Values.SelectMany(v => v.Errors).Select(e => e.ErrorMessage) });
        }

        public ActionResult DeleteConfirmation(int id)
        {
            UserInformation UI = new UserInformation()
            {
                UserInformation_ID = id
            };

            return PartialView("_DeleteConfirmation", UI);
        }

        [HttpPost]
        public ActionResult Delete(UserInformation UI)
        {
            int response = HelpBL.Delete(UI);
            if (response == 1)
            {
                return Json(new { success = true });
            }
            else
            {
                return Json(new { success = false });
            }
        }



    }
}