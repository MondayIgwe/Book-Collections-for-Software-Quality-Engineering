using Kantar_BDD.Support.Selenium;

namespace Kantar_BDD.Pages
{
    [PageName("SideTabs")]
    public class SideTabs
    {
        public static readonly AbstractedBy ConstraintsTab = AbstractedBy.VisibleSm1ID("Constraints Tab", "TAB_CONSTRAINTS");
        public static readonly AbstractedBy SummaryTab = AbstractedBy.VisibleSm1ID("Summary Tab", "TABSUMMARY");
        public static readonly AbstractedBy CustomerTab = AbstractedBy.VisibleSm1ID("Customer Node Tab", "CUSTOMER_NODES");
        public static readonly AbstractedBy WorkflowTab = AbstractedBy.Xpath("Workflow Tab", "//*[@sm1-id='TAB_H5_WORKFLOW' or @sm1-id='Workflow' or @sm1-id='tabNewWorkflow']");
        public static readonly AbstractedBy AttachmentsNotesTab = AbstractedBy.VisibleSm1ID("Attachments Notes Tab", "TAB_ATTACHMENTS_NOTES");
        //Promo Action
        public static readonly AbstractedBy CockpitTab = AbstractedBy.VisibleSm1ID("Cockpit Tab", "TAB_H5_OVERVIEW");
        public static readonly AbstractedBy DashboardTab = AbstractedBy.VisibleSm1ID("Dashboard Tab", "TAB_H5_DASH");
        public static readonly AbstractedBy ProfitLossTab = AbstractedBy.VisibleSm1ID("Profit & Loss Tab", "TAB_H5_PROFIT_AND_LOSS");
        public static readonly AbstractedBy GeneralInfoTab = AbstractedBy.VisibleSm1ID("General Info Tab", "TAB_H5_GENERAL");
        public static readonly AbstractedBy ProductsTab = AbstractedBy.VisibleSm1ID("Products Tab", "TAB_H5_PRODUCTS");
        public static readonly AbstractedBy ParticipantsTab = AbstractedBy.VisibleSm1ID("Participants Tab", "TAB_H5_PARTICIPANTS");

        // Reference Docs 
        public static readonly AbstractedBy RefDocsDetailsTab = AbstractedBy.VisibleSm1ID("Ref Docs Details Tab", "ReferenceDocDetailTab");
        public static readonly AbstractedBy RefDocsSummaryTab = AbstractedBy.VisibleSm1ID("Ref Docs Summary Tab", "tabSummary");
        public static readonly AbstractedBy RefDocsFieldExamplesTab = AbstractedBy.VisibleSm1ID("Ref Docs Field Examples Tab", "tabFields");
        public static readonly AbstractedBy RefDocsWorkGridsExamplesTab = AbstractedBy.VisibleSm1ID("Ref Docs Grids Examples Tab", "tabGrid");
        public static readonly AbstractedBy RefDocsPanelExamplesTab = AbstractedBy.VisibleSm1ID("Ref Docs Panel Examples Tab", "tabPanelExample");
        public static readonly AbstractedBy RefDocsAttachmentsNotesTab = AbstractedBy.VisibleSm1ID("Ref Docs Attachments Notes Tab", "tabNotesAndAttachments");

        // Claims
        public static readonly AbstractedBy ClaimsSummaryTab = AbstractedBy.VisibleSm1ID("Claims Summary Tab", "TAB_GENERALINFO");
        public static readonly AbstractedBy MatchingsTab = AbstractedBy.VisibleSm1ID("Matchings Tab", "TAB_MATCHINGS");
    }
}
