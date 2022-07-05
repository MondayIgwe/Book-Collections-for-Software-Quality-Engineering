using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.Popups
{
    [PageName("Save Popup")]
    public class SavePopup
    {
        public static readonly AbstractedBy SaveChanges = AbstractedBy.Xpath("Save Changes?", "//div[text()='Save changes?']");
        public static readonly AbstractedBy Warning = AbstractedBy.Xpath("Warning", "//div[@role = 'alertdialog'][@aria-hidden = 'false']//div[text() = 'Warning']");
        public static readonly AbstractedBy YesButton = AbstractedBy.Xpath("Yes Button", "//div[@role = 'alertdialog'][@aria-hidden = 'false']//span[text()='Yes']");
        public static readonly AbstractedBy NoButton = AbstractedBy.Xpath("No Button", "//div[@role = 'alertdialog'][@aria-hidden = 'false']//div[@class='x-box-inner']//child::a[@sm1-id='messageboxbuttonno']");
        public static readonly AbstractedBy CancelButton = AbstractedBy.Xpath("Cancel Button", "//div[@role = 'alertdialog'][@aria-hidden = 'false']//span[text()='Cancel']");
        public static readonly AbstractedBy OKButton = AbstractedBy.Xpath("Warning Pop Up OK Button", "//div[@role = 'alertdialog'][@aria-hidden = 'false']//span[text()='OK']");
        public static AbstractedBy WarningPopUp(string warning) => AbstractedBy.Xpath("Warning Popup Heading", "//div[@role = 'alertdialog'][@aria-hidden = 'false']//div[text() = '" + warning + "']");
    }
}
