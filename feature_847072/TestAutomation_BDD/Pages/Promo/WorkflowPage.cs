using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Kantar_BDD.Support.Selenium;

namespace Kantar_BDD.Pages.Promo
{
    [PageName("Workflow Page")]
    class WorkflowPage
    {
        public static AbstractedBy AnomaliesNumber = AbstractedBy.Xpath("Anomalies Number", "//div[@sm1-id='RowsNumLabel']");
    }
}
