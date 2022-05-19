using Kantar_BDD.Support.Selenium;

namespace Kantar_BDD.Pages.ReferenceDocs.FieldExamples
{
    [PageName("amCharts Page")]
    class amCharts
    {
        public static readonly AbstractedBy DownloadIcon = AbstractedBy.Xpath("Download Icon", "//div[contains(@id,'PNLSALES_X_LINE_BARamchart')]//span[text()='menu.label.undefined']/ancestor::a");

        public static AbstractedBy DownloadLink(string label) => AbstractedBy.Xpath("amCharts Download Link", "//div[contains(@id,'PNLSALES_X_LINE_BARamchart')]//span[text()='" + label + "']/ancestor::a");
    }
}
