using Kantar_BDD.Support.Selenium;

namespace Kantar_BDD.Pages.Decoding_Tables
{
    [PageName("DecodingTables")]
    public class DecodingTables
    {
        public static readonly AbstractedBy ConfigurationTypeField = AbstractedBy.Xpath("Configuration Type Field", "//div[@sm1-id='txtCodConfig']//div[contains(@id,'inputEl')]");
        public static readonly AbstractedBy ConfigurationTypeMandatoryIcon = AbstractedBy.Xpath("Configuration Type Mandatory Icon", "//div[@sm1-id='txtCodConfig']//img");
        public static readonly AbstractedBy LastMaintenanceDateMandatoryIcon = AbstractedBy.Xpath("Last Maintenance Date Mandatory Icon", "//div[@sm1-id='dtpDteMod']//img");
        public static readonly AbstractedBy DivisionMandatoryIcon = AbstractedBy.Xpath("Division Mandatory Icon", "//div[@sm1-id='cmbCodDiv']//img");
        public static readonly AbstractedBy TableCodeMandatoryIcon = AbstractedBy.Xpath("Table Code Mandatory Icon", "//div[@sm1-id='txtCodTab']//img");
        public static readonly AbstractedBy DescriptionMandatoryIcon = AbstractedBy.Xpath("Description Mandatory Icon", "//div[@sm1-id='txtDesTab']//img");
        public static readonly AbstractedBy ProcessMandatoryIcon = AbstractedBy.Xpath("Process Mandatory Icon", "//div[@sm1-id='cmbCodModule']//img");
        public static readonly AbstractedBy CreationDate = AbstractedBy.Xpath("Creation Date", "//div[@sm1-id='dtpDteCre']//input");
        public static readonly AbstractedBy LastMaintenanceDateField = AbstractedBy.Xpath("Last Maintenance Date Field", "//div[@sm1-id='dtpDteMod']//input");
        public static readonly AbstractedBy DivisionField = AbstractedBy.Xpath("Division Field", "//div[@sm1-id='cmbCodDiv']//input");
        public static readonly AbstractedBy TableCodeField = AbstractedBy.Xpath("Table Code Field", "//div[@sm1-id='txtCodTab']//div[contains(@id,'inputEl')]");
        public static readonly AbstractedBy DescriptionField = AbstractedBy.Xpath("Description Field", "//div[@sm1-id='txtDesTab']//div[contains(@id,'inputEl')]");
        public static readonly AbstractedBy ProcessField = AbstractedBy.Xpath("Process Field", "//div[@sm1-id='cmbCodModule']//input");
        public static readonly AbstractedBy OKButton = AbstractedBy.Xpath("OK Button", "//span[@sm1-id='SM1OkButton'][@aria-hidden='false']");
    }
}
