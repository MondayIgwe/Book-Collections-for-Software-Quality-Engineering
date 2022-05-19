using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages
{
    [PageName("Claims Page")]
    class ClaimsPage
    {
        public static readonly AbstractedBy NewClaimPopupOkButton = AbstractedBy.Xpath("New Claim Ok Button", "//div[@sm1-id='LOGICALNEWCLAIMPOPUP']//span[@sm1-id='SM1OkButton']//span[@data-ref='btnInnerEl']");
        public static readonly AbstractedBy AmountTextfield = AbstractedBy.Xpath("Amount Text Field", "//div[@sm1-id='numNetAmount']//input");
        public static readonly AbstractedBy CustomerOpenIcon = AbstractedBy.Xpath("Customer Open Icon", "//div[@sm1-id='customerSelector']//div[@class='sm1-triggers']");
        public static readonly AbstractedBy DocumentTypeTextField = AbstractedBy.Xpath("Customer Document Type TextField", "//div[@sm1-id='cmbDocType']//input");
        public static readonly AbstractedBy DocumentIDLink = AbstractedBy.Xpath("Document ID Link", "//*[@class='sm1-column-link']");
        public static readonly AbstractedBy DocumentIDTextfield = AbstractedBy.Xpath("Document ID Field", "//div[@sm1-id='DOCUMENTID']//input");
        public static readonly AbstractedBy PayableAmountButton = AbstractedBy.Xpath("Payable Amount Button", "//a[@sm1-id='ACTION_MATCHTOPAYABLE']");
        public static readonly AbstractedBy PromoIdButton = AbstractedBy.Xpath("Promo ID Button", "//a[@sm1-id='ACTION_MATCHTOPAYABLE_AGG1']");
        public static readonly AbstractedBy PromoIdMechanicsOption = AbstractedBy.Xpath("Promo ID Mechanics Option", "//div[@sm1-id='ACTION_MATCHTOPAYABLE_AGG2']//a");
        public static readonly AbstractedBy ReasonOption = AbstractedBy.Xpath("Reason Option", "//div[@sm1-id='ACTION_MATCHTOPAYABLE_AGG3']//a");
        public static readonly AbstractedBy PromoMechanicsProductOption = AbstractedBy.Xpath("Promo Mechanics Product Option", "//div[@sm1-id='ACTION_MATCHTOPAYABLE_AGG4']//a");
        public static readonly AbstractedBy CustomerDocumentNrTextField = AbstractedBy.Xpath("Customer Document Number TextField", "//div[@sm1-id='txtDocNr']//div[contains(@id,'sm1textbox')][contains(@id,'inputEl')]");
        public static readonly AbstractedBy ClaimsMatchToField = AbstractedBy.Xpath("Claims Match To Field", "//div[@sm1-id='cmbMatchToOption']//input");
        public static readonly AbstractedBy AssignButton = AbstractedBy.Xpath("Assign Button", "//span[@sm1-id='btnAssign']");
        public static readonly AbstractedBy MatchingsRemoveIcon = AbstractedBy.Xpath("Matchings Remove Icon", "//span[@sm1-id='RemoveButton']");
        public static readonly AbstractedBy CloseWizardYesButton = AbstractedBy.Xpath("Close Wizard Yes Button", "//a[@sm1-id='messageboxbuttonyes'][@aria-hidden='false']");
        public static readonly AbstractedBy CloseWizardMessage = AbstractedBy.Xpath("Close Wizard Message", "//div[@sm1-id='messageboxmessage']");     
        public static AbstractedBy ContractorTableSelect(string item) => AbstractedBy.Xpath("Customer code table", "//div[contains(text(),'" + item + "')]");
        public static AbstractedBy MatchingsTableField(string value) => AbstractedBy.Xpath("Matchings Table Field", "//table[contains(@id,'record')]//td//div[contains(text(),'"+value+"')]");
        public static AbstractedBy SavedMessage(string message) => AbstractedBy.Xpath("Saved Message", "//div[@sm1-id='saveDocToast']//span[text()='"+ message+"']");
    }
}
