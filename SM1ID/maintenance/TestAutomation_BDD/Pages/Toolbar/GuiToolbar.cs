using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.Toolbar
{
    [PageName("GuiToolbar")]
    public class GuiToolbar
    {
        public static readonly AbstractedBy CloseTab = AbstractedBy.Xpath("Close Tab", "//a[contains(@sm1-id,'CLOSEBUTTON')]");
        public static readonly AbstractedBy RefreshButton = AbstractedBy.Xpath("Refresh button", "//a[@sm1-id='ACTION_refresh'][@aria-hidden='false']");
        public static readonly AbstractedBy SaveButton = AbstractedBy.Xpath("Save Button", "//a[@sm1-id='TLBSAVEBUTTON'][@aria-hidden='false']");
        public static readonly AbstractedBy StatusComboField = AbstractedBy.Xpath("Toolbar Status Field", "//div[@sm1-id = 'CODSTATUS']//input");
        public static readonly AbstractedBy ConfirmOrderButton = AbstractedBy.Xpath("Confirm Order Button", "//a[@sm1-id][@aria-hidden = 'false']//span[text()='Confirm order']//ancestor::a");
        public static readonly AbstractedBy CancalOrderButton = AbstractedBy.Xpath("Cancel Order Button", "//a[@sm1-id][@aria-hidden = 'false']//span[text()='Cancel order']//ancestor::a");
        public static readonly AbstractedBy PrintButton = AbstractedBy.Xpath("Print Button", "//a[@sm1-id][@aria-hidden = 'false']//span[text()='Print']//ancestor::a");
        public static AbstractedBy ErrorIcon(string errorMessage) => AbstractedBy.Xpath("Navigation Error Icon", "//a[contains(@class, 'sm1-maintoolbar-error-icon')]//following-sibling::div[contains(@class, 'sm1-maintoolbar-error')][contains(text(),\"" + errorMessage + "\")]");
        public static readonly AbstractedBy ToolbarErrorIcon = AbstractedBy.Xpath("Toolbar Error Icon", "//a[contains(@class, 'sm1-maintoolbar-error-icon')]");
        public static readonly AbstractedBy VisibleToolbarErrorIcon = AbstractedBy.Xpath("Visible Toolbar Error Icon", "//a[contains(@class, 'sm1-maintoolbar-error-icon')]//span[contains(@class,'x-btn-icon-left')]");
        public static readonly AbstractedBy EditButton = AbstractedBy.Xpath("View Button", "//a[(@sm1-id='TLBSEGMENTEDBUTTON')]//a[contains(@class,'x-segmented-button-first')]");
        public static readonly AbstractedBy ViewButton = AbstractedBy.Xpath("Edit Button", "//a[(@sm1-id='TLBSEGMENTEDBUTTON')]//a[contains(@class,'x-segmented-button-last')]");
        public static readonly AbstractedBy AddButton = AbstractedBy.Xpath("Add Button", "//span[@sm1-id='AddButton'][@aria-hidden='false']//span[@data-ref='btnWrap']");
        public static readonly AbstractedBy GuiUpdateButton = AbstractedBy.Xpath("Gui Update Button", "//span[@sm1-id='LogicalNavCtrl.QCALCSESS_Button'][@aria-hidden='false']//span[@data-ref='btnWrap']");
        public static AbstractedBy ClaimsMatchButton = AbstractedBy.Xpath("Claims Match Button", GenericElementsPage.ButtonBySM1ID("ACTION_MULTIMATCH").ByToString);
    }
}
