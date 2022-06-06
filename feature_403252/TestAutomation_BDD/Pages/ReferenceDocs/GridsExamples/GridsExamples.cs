using Kantar_BDD.Support.Selenium;

namespace Kantar_BDD.Pages.ReferenceDocs.FieldExamples
{
    [PageName("Grids Examples Tab Page")]
    class GridsExamples
    {
        public static AbstractedBy MultiSelectionWithToolbarCheckbox(string checkboxLabel) => AbstractedBy.Xpath("Multi Selection With Toolbar Checkbox", "//div[@sm1-id='MultiSelectionToolbar']//div[@class='x-grid-cell-inner '][text()='" + checkboxLabel + "']/ancestor::tr[@role='row']//td[contains(@class,'checkbox')]");
        public static AbstractedBy SectionSettingsIcon(string sectionLabel) => AbstractedBy.Xpath("Top Tab Sub Section Settings Icon", "//div[text()='"+ sectionLabel + "']/ancestor::div[contains(@class,'sm1section ')]//a[not(contains(@class,'disclosure'))]");
        public static AbstractedBy LogicalListGrid1Items(string itemPositionLabel) => AbstractedBy.Xpath("Logical ListGrid 1 Item", "//div[@sm1-id = 'ListGridDragRowSection1']//div[contains(text(),'" + itemPositionLabel+ "')]");
        
        public static readonly AbstractedBy GridsExamplesGridSettingsIcon = AbstractedBy.Xpath("Grids Examples Grid Settings Icon", "//div[contains(@class,'sm1-tabitem x-tabpanel-child')][not(contains(@class,'hidden'))]//span[@sm1-id = 'ConfigButton']");
        
    }
}
