using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.Promo
{
    [PageName("General Info Page")]
    class GeneralInfoPage
    {
        public static AbstractedBy ActionCodeTextBox = AbstractedBy.Xpath("Action Code Textbox", GenericElementsPage.InputElementBySM1ID("PROMO_ID").ByToString);
    }
}
