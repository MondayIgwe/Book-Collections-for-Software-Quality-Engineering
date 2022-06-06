using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.SA
{
    [PageName("Balances Page")]
    class Balances
    {
        public static readonly AbstractedBy CustomerOpenIcon = AbstractedBy.Xpath("Customer Open Icon", "//div[@sm1-id='customerSelector']//div[@class='sm1-triggers']");
        public static readonly AbstractedBy BalanceSelectorButton = AbstractedBy.Xpath("Balance Selector Button", "//span[@sm1-id='GUIBalance.Selector_Button']");
        public static readonly AbstractedBy BalanceIDField = AbstractedBy.Xpath("Balance ID Field", "//div[@sm1-id='TxtBalanceID']");
        public static readonly AbstractedBy BalanceYearField = AbstractedBy.Xpath("Balance Year Field", "//div[@sm1-id='CmbYear']");
        public static readonly AbstractedBy CustomerSelector = AbstractedBy.Xpath("Customer Selector", "//div[@sm1-id='customerSelector']");
        public static readonly AbstractedBy SupplierSelector = AbstractedBy.Xpath("Supplier Selector", "//div[@sm1-id='supplierSelector']");
        public static readonly AbstractedBy AmountField = AbstractedBy.Xpath("Amount Field", "//div[@sm1-id='AmountTotal']");
        public static readonly AbstractedBy AmountPayableSelectorOption = AbstractedBy.Xpath("Amount Payable Selector Option", "//div[@sm1-id='ACTION_BALANCETOPAYABLE']");
        public static readonly AbstractedBy PromoSelectorOption = AbstractedBy.Xpath("Promo Selector Option", "//div[@sm1-id='ACTION_BALANCETOPAYABLE']");
        public static readonly AbstractedBy CurrencyField = AbstractedBy.Xpath("Currency Field", "//div[@sm1-id='Currency']");
        public static readonly AbstractedBy DescriptionField = AbstractedBy.Xpath("Description Field", "//div[@sm1-id='Description']");
        public static readonly AbstractedBy ModOnBehalfOfField = AbstractedBy.Xpath("Mod On Behalf Of Field", "//div[@sm1-id='CODUSRMOD']");
        public static readonly AbstractedBy ModifiedByField = AbstractedBy.Xpath("Modified By Field", "//div[@sm1-id='CODUSRMODREAL']");
        public static readonly AbstractedBy ModificationDateField = AbstractedBy.Xpath("Modification Date Field", "//div[@sm1-id='DTEMOD']");
        public static readonly AbstractedBy OnBehalfOfField = AbstractedBy.Xpath("On Behalf Of Field", "//div[@sm1-id='CODUSRMOD']");
        public static readonly AbstractedBy CreatedByField = AbstractedBy.Xpath("Created By Field", "//div[@sm1-id='CODUSRCREREAL']");
        public static readonly AbstractedBy CreationDateField = AbstractedBy.Xpath("Creation Date Field", "//div[@sm1-id='DTECRE']");
    }
}
