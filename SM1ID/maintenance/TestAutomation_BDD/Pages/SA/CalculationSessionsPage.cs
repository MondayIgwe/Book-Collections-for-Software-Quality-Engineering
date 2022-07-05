using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.SA
{
    [PageName("Calculation Sessions Page")]
    class CalculationSessionsPage
    {
        public static readonly AbstractedBy MonthTextbox = AbstractedBy.Xpath("Month Textbox", GenericElementsPage.InputElementBySM1ID("CMBMONTHS").ByToString);
        public static readonly AbstractedBy YearTexbox = AbstractedBy.Xpath("Year Textbox", GenericElementsPage.InputElementBySM1ID("CMBYEARS").ByToString);
    }
}
