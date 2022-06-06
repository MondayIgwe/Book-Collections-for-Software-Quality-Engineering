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
        public static readonly AbstractedBy MenuButton = AbstractedBy.Xpath("Menu Button", "//div[@sm1-id='homeToolbarMenuBTN']//span");
        public static readonly AbstractedBy ViewCompleteMenuButton = AbstractedBy.Xpath("View Complete Menu", "//div[@sm1-id='mainMenuViewCompleteBTN']");
        public static readonly AbstractedBy MenuSearchBar = AbstractedBy.Xpath("Menu Search Bar","//div[@sm1-id='mainmenucontainer']//input");
        public static AbstractedBy SelectedPage(string page) => AbstractedBy.Xpath("Select Page", "//div[@sm1-id='mainMenuGroupsContainer']//span[text()='"+page+"']");
        public static AbstractedBy SelectedPage(string division, string page) => AbstractedBy.Xpath("Select Page", "//div[@sm1-id='mainMenuGroupsContainer']//label[text()='"+division+"']//following::div//span[text()='"+page+"']");
        public static readonly AbstractedBy SummaryTab = AbstractedBy.Xpath("Summary Tab", "//div[contains(@class,'sm1-sidetab-bt')]//span[contains(text(),'Summary')]");
        public static readonly AbstractedBy ShellTab = AbstractedBy.Xpath("Shell Tab", "//div[contains(@class,'sm1-sidetab-bt')]//span[contains(text(),'Shell')]");
        public static readonly AbstractedBy AssetStytoreCheckTab = AbstractedBy.Xpath("Asset Store Check Tab", "//div[contains(@class,'sm1-sidetab-bt')]//span[contains(text(),'Asset Store Check')]");
        public static readonly AbstractedBy ProductsTab = AbstractedBy.Xpath("Products Tab", "//div[contains(@class,'sm1-sidetab-bt')]//span[contains(text(),'Products')]");
        public static readonly AbstractedBy CloseTab = AbstractedBy.Xpath("Close Tab", "//a[contains(@sm1-id,'CLOSEBUTTON')]");
        public static readonly AbstractedBy RefreshButton = AbstractedBy.Xpath("Refresh button", "//a[@sm1-id='ACTION_refresh'][@aria-hidden='false']");
        public static readonly AbstractedBy GeneralInfoTab = AbstractedBy.Xpath("General Info Tab", "//div[contains(@class,'sm1-sidetab-bt')]//span[contains(text(),'General Info')]");
        public static readonly AbstractedBy MainInformationTab = AbstractedBy.Xpath("Main Information Tab", "//div[contains(@class,'sm1-sidetab-bt')]//span[contains(text(),'Main Information')]");

        public static readonly AbstractedBy ToolbarHomeCloseButton = AbstractedBy.Xpath("Toolbar Close Button", "//div[@sm1-id='homeToolbarCloseBTN']");
        public static readonly AbstractedBy SaveButton = AbstractedBy.Xpath("Save Button", "//a[@sm1-id='TLBSAVEBUTTON'][@aria-hidden='false']");
              
        public static readonly AbstractedBy AgreementIDIncrementIcon = AbstractedBy.Xpath("Agreement ID Increment Icon", "//div[@sm1-id='twoActTxtBoxAgreementID']//div[contains(@class,'sm1textboxactiontriggerplus')]");
        public static readonly AbstractedBy StatusComboField = AbstractedBy.Xpath("Toolbar Status Field", "//div[@sm1-id = 'CODSTATUS']//input");
        public static AbstractedBy HomeToolbarPageName(string pageName) => AbstractedBy.Xpath("Toolbar Page Name", "//div[@sm1-id = 'homeToolbarLabelBTN']//span[contains(text(),'" + pageName + "')]");
        public static readonly AbstractedBy ConfirmOrderButton = AbstractedBy.Xpath("Confirm Order Button", "//a[@sm1-id][@aria-hidden = 'false']//span[text()='Confirm order']//ancestor::a");
        public static readonly AbstractedBy CancalOrderButton = AbstractedBy.Xpath("Cancel Order Button", "//a[@sm1-id][@aria-hidden = 'false']//span[text()='Cancel order']//ancestor::a");
        public static readonly AbstractedBy PrintButton = AbstractedBy.Xpath("Print Button", "//a[@sm1-id][@aria-hidden = 'false']//span[text()='Print']//ancestor::a");
        public static readonly AbstractedBy AnomalyReportTab = AbstractedBy.Xpath("Anomaly Report Tab", "//div[contains(@class,'sm1-sidetab-bt')]//span[contains(text(),'Anomaly report')]");
        public static readonly AbstractedBy HomeToolbarDocsButton = AbstractedBy.Xpath("Home Toolbar Docs Button", "//div[@sm1-id='homeToolbarDocsBTN']");
        public static AbstractedBy HomeToolbarDocs(string title) => AbstractedBy.Xpath("Home Toolbar Docs", "//div[@class='sm1-opendocs-des' and text()='"+title+"']/following-sibling::div");

        public static readonly AbstractedBy BalanceButton = AbstractedBy.Xpath("Balance Button", "//a[@sm1-id='ACTION_BALANCE']");
        public static readonly AbstractedBy LinksButton = AbstractedBy.Xpath("Links Button", "//span[@sm1-id='LogicalNavCtrl.NAVIGATORLINKS_Button']");
        public static readonly AbstractedBy MatchedClaimsPromotionsLinksOption = AbstractedBy.Xpath("Matched Claims Promotions Links Option", "//a[@data-qtip='Matched Claims - Promotions']");
        public static readonly AbstractedBy ToolbarMatchLink = AbstractedBy.Xpath("Toolbar Match Link", "//a[@sm1-id='ACTION_MULTIMATCH']");
        public static readonly AbstractedBy UnmatchLink = AbstractedBy.Xpath("Unmatch Link", "//a/div[@data-qtip='Unmatch']");
        public static readonly AbstractedBy DeliveryDatesDropDown = AbstractedBy.Xpath("Delivery Date button", "//span[text()='Delivery dates:']//ancestor::label/following-sibling::div//div[@class='sm1-triggers']");
        public static readonly AbstractedBy MassChangeStatus = AbstractedBy.Xpath("Mass Change Status", "//a[@sm1-id='ACTION_MASSCHANGESTATUSBUTTON']");
        public static readonly AbstractedBy MassCopy = AbstractedBy.Xpath("Mass Copy", "//a[@sm1-id='ACTION_REBATE_MASS_COPY']");
        public static AbstractedBy ErrorIcon(string errorMessage) => AbstractedBy.Xpath("Navigation Error Icon", "//a[contains(@class, 'sm1-maintoolbar-error-icon')]//following-sibling::div[contains(@class, 'sm1-maintoolbar-error')][contains(text(),\""+ errorMessage + "\")]");
        public static readonly AbstractedBy KantarLogo = AbstractedBy.Xpath("Kantar Logo", "//div[@class='x-component logo x-box-item x-toolbar-item x-component-default']");
        public static readonly AbstractedBy KantarUserButton = AbstractedBy.Xpath("Kantar User", "//div[@sm1-id='homeToolbarUserBTN']//span[@data-ref='btnIconEl']");
        public static AbstractedBy KantarLogout(string Logout) => AbstractedBy.Xpath("Kantar Logout", $"//div[@sm1-id='homeToolbarLOGOUTBTN']//span[text()='{Logout}']");
    }
}
