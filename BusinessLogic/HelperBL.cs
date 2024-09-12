using DataAccessLayer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace BusinessLogic
{
    public class HelperBL : IHelperBL
    {
        HelperDAL helpDAL = new HelperDAL();

        public IList<UserInformation> GetRecords()
        {
            return helpDAL.GetRecords();
        }

        public UserInformation GetRecords(int id)
        {
            return helpDAL.GetRecords(id);
        }

        public int Insert(UserInformation UI)
        {
            return helpDAL.Insert(UI); ;
        }

        public int Update(UserInformation UI)
        {
            return helpDAL.Update(UI);
        }

        public int Delete(UserInformation UI)
        {
            return helpDAL.Delete(UI);
        }

        public IEnumerable<SelectListItem> GetStates()
        {
            return helpDAL.GetStates();
        }

        public IEnumerable<SelectListItem> GetCitiesByState(int stateId)
        {
            return helpDAL.GetCitiesByState(stateId);
        }
    }
}
