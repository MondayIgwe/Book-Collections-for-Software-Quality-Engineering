using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages
{
    [PageName("Navmenu")]
    public class NavigationMenu
    {
        public static readonly AbstractedBy ViewCompleteMenuButton = AbstractedBy.Xpath("View Complete Menu", "//div[@sm1-id='mainMenuViewCompleteBTN']");
        public static readonly AbstractedBy MenuSearchBar = AbstractedBy.Xpath("Menu Search Bar","//div[@sm1-id='mainmenucontainer']//input");
        public static AbstractedBy SelectPage(string page) => AbstractedBy.Xpath("Select Page", "(//div[@sm1-id='mainMenuGroupsContainer']//span[text()='" + page + "'])[position()=1]");
        public static AbstractedBy SelectPage(string division, string page) => AbstractedBy.Xpath("Select Page", "(//div[@sm1-id='mainMenuGroupsContainer']//label[text()='"+division+"']//following::div//span[text()='"+page+"'])[position()=1]");
    }
}
