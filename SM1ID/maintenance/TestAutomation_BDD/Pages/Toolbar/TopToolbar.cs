using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.Toolbar
{
    [PageName("TopToolbar")]
    public class TopToolbar
    {
        public static readonly AbstractedBy MenuButton = AbstractedBy.Xpath("Menu Button", "//div[@sm1-id='homeToolbarMenuBTN']//span");
        public static readonly AbstractedBy BackButton = AbstractedBy.Xpath("Back Button", "//div[@sm1-id='homeToolbarCloseBTN']");
        public static AbstractedBy HomeToolbarPageName(string pageName) => AbstractedBy.Xpath("Toolbar Page Name", "//div[@sm1-id = 'homeToolbarLabelBTN']//span[contains(text(),'" + pageName + "')]");
        public static readonly AbstractedBy KantarLogo = AbstractedBy.Xpath("Kantar Logo", "//div[@class='x-component logo x-box-item x-toolbar-item x-component-default']");
        public static AbstractedBy KantarLogout(string Logout) => AbstractedBy.Xpath("Kantar Logout", $"//div[@sm1-id='homeToolbarLOGOUTBTN']//span[text()='{Logout}']");
        public static readonly AbstractedBy KantarUserButton = AbstractedBy.Xpath("Kantar User", "//div[@sm1-id='homeToolbarUserBTN']//span[@data-ref='btnIconEl']");
        public static readonly AbstractedBy HomeToolbarDocsButton = AbstractedBy.Xpath("Home Toolbar Docs Button", "//div[@sm1-id='homeToolbarDocsBTN']");
        public static AbstractedBy HomeToolbarDocs(string title) => AbstractedBy.Xpath("Home Toolbar Docs", "//div[@class='sm1-opendocs-des' and text()='" + title + "']/following-sibling::div");
    }
}
