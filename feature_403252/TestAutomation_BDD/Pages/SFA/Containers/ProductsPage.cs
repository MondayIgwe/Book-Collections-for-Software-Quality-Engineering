using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.SFA.Containers
{
    [PageName("SFA Products Page")]
    public class ProductsPage
    {
        public static readonly AbstractedBy ExpandPanel = AbstractedBy.Xpath("Expand Panel", "//span[@sm1-id = 'SidePanelExpandButton']");
    }
}
