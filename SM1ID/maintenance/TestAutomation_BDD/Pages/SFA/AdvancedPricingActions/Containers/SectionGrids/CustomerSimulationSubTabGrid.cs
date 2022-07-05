using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.SFA.AdvancedPricingActions.Containers.SectionGrids
{
    [PageName("Advanced Pricing Actions - Sub Tab - Customer Simulation Grid")]
    public class CustomerSimulationSubTabGrid
    {
        public static readonly AbstractedBy RefreshButton = AbstractedBy.Xpath(SFACommonElements.RefreshButton.LogicalName, GenericElementsPage.ElementBySM1ID("NavigatorGridToolbar").ByToString + SFACommonElements.RefreshButton.ByToString);

        public static readonly AbstractedBy NameColumn = AbstractedBy.Xpath("Name Column", GenericElementsPage.ElementBySM1ID("DESPARTY1").ByToString);
        public static readonly AbstractedBy CustomerCodeColumn = AbstractedBy.Xpath("Customer Code Column", GenericElementsPage.ElementBySM1ID("CODPARTY").ByToString);
        public static readonly AbstractedBy HierLevelColumn = AbstractedBy.Xpath("Hier Level Column", GenericElementsPage.ElementBySM1ID("IDLEVEL").ByToString);
        public static readonly AbstractedBy LevelColumn = AbstractedBy.Xpath("Level Column", GenericElementsPage.ElementBySM1ID("DESLEVEL").ByToString);
        public static readonly AbstractedBy ChainDescriptionColumn = AbstractedBy.Xpath("Chain Description Column", GenericElementsPage.ElementBySM1ID("DESSIGN").ByToString);
        public static readonly AbstractedBy AddressColumn = AbstractedBy.Xpath("Address Column", GenericElementsPage.ElementBySM1ID("DESADDR1").ByToString);
        public static readonly AbstractedBy PlaceColumn = AbstractedBy.Xpath("Place Column", GenericElementsPage.ElementBySM1ID("DESLOC1").ByToString);
        public static readonly AbstractedBy ZIPColumn = AbstractedBy.Xpath("ZIP Column", GenericElementsPage.ElementBySM1ID("CODZIP").ByToString);
        public static readonly AbstractedBy DistrictColumn = AbstractedBy.Xpath("District Column", GenericElementsPage.ElementBySM1ID("CODPRV").ByToString);

        public static readonly AbstractedBy RepIDColumn = AbstractedBy.Xpath("Rep ID Column", GenericElementsPage.ElementBySM1ID("CODUSR1").ByToString);
        public static readonly AbstractedBy RepNameColumn = AbstractedBy.Xpath("Rep Name Column", GenericElementsPage.ElementBySM1ID("DESUSR1").ByToString);
        public static readonly AbstractedBy StatusCodeColumn = AbstractedBy.Xpath("Status Code Column", GenericElementsPage.ElementBySM1ID("CODSTATUS").ByToString);
        public static readonly AbstractedBy StatusDescColumn = AbstractedBy.Xpath("Status Desc Column", GenericElementsPage.ElementBySM1ID("DESSTATUS").ByToString);
        public static readonly AbstractedBy CustomerCategoryColumn = AbstractedBy.Xpath("Customer Category Column", GenericElementsPage.ElementBySM1ID("DESCATDIV2").ByToString);
        public static readonly AbstractedBy DivisionColumn = AbstractedBy.Xpath("Division Column", GenericElementsPage.ElementBySM1ID("CODDIV").ByToString);
        public static readonly AbstractedBy InvoicingCodeColumn = AbstractedBy.Xpath("Invoicing Code", GenericElementsPage.ElementBySM1ID("CODCUSTINV").ByToString);
        public static readonly AbstractedBy BillToCustomerColumn = AbstractedBy.Xpath("Bill To Customer Column", GenericElementsPage.ElementBySM1ID("DESCUSTINV").ByToString);

        public static readonly AbstractedBy BillToCustomerStatusColumn = AbstractedBy.Xpath("Bill To Customer Status Column", GenericElementsPage.ElementBySM1ID("CODSTATUSCUSTINV").ByToString);
        public static readonly AbstractedBy VATNumberColumn = AbstractedBy.Xpath("VAT Number Column", GenericElementsPage.ElementBySM1ID("CODVAT").ByToString);
        public static readonly AbstractedBy TypologyOfDeliveryPointColumn = AbstractedBy.Xpath("Typology Of Delivery Point Column", GenericElementsPage.ElementBySM1ID("DESCHANNEL").ByToString);
        public static readonly AbstractedBy DistrictManagerIDColumn = AbstractedBy.Xpath("District Manager ID Column", GenericElementsPage.ElementBySM1ID("CODUSR2").ByToString);
        public static readonly AbstractedBy DistrictManagerColumn = AbstractedBy.Xpath("District Manager Column", GenericElementsPage.ElementBySM1ID("DESUSR2").ByToString);
        public static readonly AbstractedBy SalesAreaColumn = AbstractedBy.Xpath("Sales Area Column", GenericElementsPage.ElementBySM1ID("CODPRV").ByToString);
        public static readonly AbstractedBy VisitFrequencyColumn = AbstractedBy.Xpath("Visit Frequency Column", GenericElementsPage.ElementBySM1ID("DESVISITFREQUENCE").ByToString);
        public static readonly AbstractedBy AmountCYColumn = AbstractedBy.Xpath("Amount CY Column", GenericElementsPage.ElementBySM1ID("AMOUNTCY").ByToString);

        public static readonly AbstractedBy AmountLYColumn = AbstractedBy.Xpath("Amount LY Column", GenericElementsPage.ElementBySM1ID("CODSTATUSCUSTINV").ByToString);
        public static readonly AbstractedBy AmountLYTDColumn = AbstractedBy.Xpath("Amount LY TD Column", GenericElementsPage.ElementBySM1ID("CODVAT").ByToString);
        public static readonly AbstractedBy NoVisDoneColumn = AbstractedBy.Xpath("No Vis Done Column", GenericElementsPage.ElementBySM1ID("DESCHANNEL").ByToString);
        public static readonly AbstractedBy TheoNoVisColumn = AbstractedBy.Xpath("Theo No Vis Column", GenericElementsPage.ElementBySM1ID("CODUSR2").ByToString);
        public static readonly AbstractedBy SalesLevelCodeColumn = AbstractedBy.Xpath("", GenericElementsPage.ElementBySM1ID("DESUSR2").ByToString);
        public static readonly AbstractedBy SalesLevelColumn = AbstractedBy.Xpath("Sales Level Column", GenericElementsPage.ElementBySM1ID("CODPRV").ByToString);
        public static readonly AbstractedBy SubGroupCodeColumn = AbstractedBy.Xpath("Sub Group Code Column", GenericElementsPage.ElementBySM1ID("DESVISITFREQUENCE").ByToString);
        public static readonly AbstractedBy SubGroupColumn = AbstractedBy.Xpath("Sub Group Column", GenericElementsPage.ElementBySM1ID("AMOUNTCY").ByToString);

        // Section not covered by automation as of yet
        // Partially mapped section
    }
}
