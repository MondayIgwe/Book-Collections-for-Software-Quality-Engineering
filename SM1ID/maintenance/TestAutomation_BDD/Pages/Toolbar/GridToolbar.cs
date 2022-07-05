using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.Toolbar
{
    [PageName("GridToolbar")]
    public class GridToolbar
    {
        public static readonly AbstractedBy BalanceButton = AbstractedBy.Xpath("Balance Button", "//a[@sm1-id='ACTION_BALANCE']");
        public static readonly AbstractedBy LinksButton = AbstractedBy.Xpath("Links Button", "//span[@sm1-id='LogicalNavCtrl.NAVIGATORLINKS_Button']");
        public static readonly AbstractedBy MatchedClaimsPromotionsLinksOption = AbstractedBy.Xpath("Matched Claims Promotions Links Option", "//a[@data-qtip='Matched Claims - Promotions']");
        public static readonly AbstractedBy ToolbarMatchLink = AbstractedBy.Xpath("Toolbar Match Link", "//a[@sm1-id='ACTION_MULTIMATCH']");
        public static readonly AbstractedBy UnmatchLink = AbstractedBy.Xpath("Unmatch Link", "//a[@sm1-id='ACTION_UNMATCH']");
        public static readonly AbstractedBy MassChangeStatus = AbstractedBy.Xpath("Mass Change Status", "//a[@sm1-id='ACTION_MASSCHANGESTATUSBUTTON']");
        public static readonly AbstractedBy MassCopyButton = AbstractedBy.Xpath("Mass Copy Button", "//a[@sm1-id='ACTION_REBATE_MASS_COPY']");
        public static readonly AbstractedBy PromoMassCopyButton = AbstractedBy.Xpath("Promo Mass Copy Button", "//a[@sm1-id='ACTION_PROMO_EXTENDED_COPY']");
        public static readonly AbstractedBy ActionsButton = AbstractedBy.Xpath("Actions Button", "//span[@sm1-id='GUIPromoPlan.ACTIONS_Button']");
        public static readonly AbstractedBy AddNewScenarioActionLink = AbstractedBy.Xpath("Add New Scenario Action Link", "//div[@sm1-id='ACTION_ADD_SCENARIO']");
        public static readonly AbstractedBy DeleteLink = AbstractedBy.Xpath("Delete Link", "//div[@sm1-id='ACTION_DELETE']");
    }
}
