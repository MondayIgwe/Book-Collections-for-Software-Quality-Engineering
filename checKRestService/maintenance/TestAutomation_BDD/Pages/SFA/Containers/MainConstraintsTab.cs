using Kantar_BDD.Support.Helpers;
using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.SFA.Containers
{
    [PageName("Main Constraints Tab")]
    public class MainConstraintsTab
    {
        public static AbstractedBy AndNode(string andNode) => AbstractedBy.Xpath("AND Node", "//span[contains(@class,'tree-node-text')][text() = '" + andNode + "']");
        public static AbstractedBy MainConstraintsToolbar(string actionText) => AbstractedBy.Xpath("Main Constraints Toolbar", $"//a[contains(@sm1-id,'ACTION_{actionText}')]");
        
    }
}
