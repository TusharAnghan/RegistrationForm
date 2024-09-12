using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace DataAccessLayer.Models
{
    internal interface IHelperDAL
    {
        IList<UserInformation> GetRecords();

        UserInformation GetRecords(int id);

        int Insert(UserInformation UI);

        int Update(UserInformation UI);

        int Delete(UserInformation UI);

        IEnumerable<SelectListItem> GetStates();

        IEnumerable<SelectListItem> GetCitiesByState(int stateId);

    }
}
