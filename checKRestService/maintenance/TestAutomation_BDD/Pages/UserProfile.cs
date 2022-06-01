using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages
{
    [PageName("UserProfile")]
    public class UserProfile
    {
        public static readonly AbstractedBy HomeToolbarUserButton = AbstractedBy.Xpath("Home Toolbar User Button", "//div[@sm1-id='homeToolbarUserBTN']");
        public static readonly AbstractedBy ChangeGroupDivisionButton = AbstractedBy.Xpath("Change Group Division Button", "//div[@sm1-id='homeToolbarGRPDIVBTN']");
        public static readonly AbstractedBy OKButton = AbstractedBy.Xpath("OK Button", "//span[@sm1-id='SM1OkButton']");
        public static readonly AbstractedBy AlertDialogYesButton = AbstractedBy.Xpath("Alert Dialog Yes Button", "//div[@role='alertdialog']//a[@aria-hidden='false']//span[text()='Yes']");
        public static readonly AbstractedBy UserCodeInput = AbstractedBy.Xpath("User Code Input", "//span[text()='User Code:']/ancestor::label/following-sibling::div//input");
        public static readonly AbstractedBy UserCodeDropDownTrigger = AbstractedBy.Xpath("User Code DropDown Trigger", "//div[@sm1-id='CODE']//div[@class='sm1-triggers']");
        public static readonly AbstractedBy UserDescriptionText = AbstractedBy.Xpath("User Description Text", "//span[@sm1-id='USR_DESCRIPTION']");
        public static readonly AbstractedBy AboutKantar = AbstractedBy.Xpath("About Kantar", "//div[@sm1-id='homeToolbarABOUTAPPBTN']");
        public static readonly AbstractedBy ApplicationVersion = AbstractedBy.Xpath("Application Version", "//div[@class='sm1-version']");
        public static AbstractedBy UserCodeDropDown(string userCode) => AbstractedBy.Xpath("User Code Drop Down", "//li[contains(text(),'" + userCode + "')]");
        public static readonly AbstractedBy CloseAboutPopUpButton = AbstractedBy.Xpath("Close About Pop Up Button", "//div[@sm1-id='LOGICALABOUTPOPUP']//div[contains(@class, 'sm1-close-tool')]");

    }
}
