using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.IBP.IBPDocuments
{
    [PageName("IBP Document Summary")]
    public class SummaryPage
    {
        public static AbstractedBy SelectSection(string sectionName) => AbstractedBy.Xpath("Custom Section",
        "//td[text()='"+sectionName+"']");
    }
}
