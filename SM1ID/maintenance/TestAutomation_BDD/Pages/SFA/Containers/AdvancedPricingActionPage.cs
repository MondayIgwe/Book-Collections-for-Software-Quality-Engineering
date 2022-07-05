using Kantar_BDD.Support.Selenium;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.Popups
{
    [PageName("Advanced Pricing Action Page")]
    class AdvancedPricingActionPage
    {

        public static readonly AbstractedBy BenefitGroupDescription = AbstractedBy.Xpath("Benefit Group Description", "//div[@sm1-id = 'LOGICALRANGEGRPPOPUP']//div[@sm1-id = 'txtBenGrpDes']//textarea");
        public static readonly AbstractedBy ToolbarGridEditButton = AbstractedBy.Xpath("Toolbar Grid Edit Button", "//span[text()='Edit' and @data-ref='btnInnerEl']/ancestor::a[@role='button'][@sm1-id = 'ACTION_edit']");

    }
}
