using Kantar_BDD.Support.Selenium;

namespace Kantar_BDD.Pages
{
    [PageName("Excel Import Utility Page")]
    public class ExcelImportUtility
    {
        public static readonly AbstractedBy ToastMessageField = AbstractedBy.Xpath("Status Bar Textbox", "//div[contains(@class,'sm1-importExportUtility-statusBar')]//div[contains(@class,'x-toolbar-text')]");
        public static readonly AbstractedBy ChooseFileTextbox = AbstractedBy.Xpath("Choose File Textbox", GenericElementsPage.InputElementBySM1ID("fileChooserEI").ByToString);
        public static readonly AbstractedBy TableNameTextbox = AbstractedBy.Xpath("Table Name Textbox", GenericElementsPage.InputElementBySM1ID("tableNameEI").ByToString);
        public static readonly AbstractedBy TableNameComboTriggerIcon = AbstractedBy.Xpath("Table Name Combo Trigger Icon", GenericElementsPage.TextBoxComboTriggerBySM1ID("tableNameEI").ByToString);
        public static readonly AbstractedBy RemoveExistingDataCheckbox = AbstractedBy.Xpath("Remove Existing Data Checkbox", GenericElementsPage.InputElementBySM1ID("chkRemoveExistingData").ByToString);
        public static readonly AbstractedBy WorksheetTextbox = AbstractedBy.Xpath("Worksheet Textbox", GenericElementsPage.InputElementBySM1ID("worksheetEI").ByToString);
        public static readonly AbstractedBy FirstRowContainsColumnNameCheckbox = AbstractedBy.Xpath("First Row Contains Column Name Checkbox", GenericElementsPage.InputElementBySM1ID("chkFirstRowContainsColumnName").ByToString);
        public static readonly AbstractedBy InsertOrUpdateCheckbox = AbstractedBy.Xpath("Insert Or Update Checkbox", GenericElementsPage.InputElementBySM1ID("chkInsertOrUpdate").ByToString);
        public static readonly AbstractedBy ImportExcelUtilityPopup = AbstractedBy.Xpath("Import Excel Utility Popup", GenericElementsPage.ElementBySM1ID("LOGICALEXCELIMPORTUTILITYPOPUP").ByToString);
    }
}
