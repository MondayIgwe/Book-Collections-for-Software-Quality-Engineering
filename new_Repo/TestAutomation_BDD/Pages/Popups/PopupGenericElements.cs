using Kantar_BDD.Support.Selenium;
using System;

namespace Kantar_BDD.Pages.Popups
{
    [PageName("Popup Generic Elements")]
    public class PopupGenericElements
    {
        public static readonly AbstractedBy PopupLabel = AbstractedBy.Xpath("Popup Title", "//div[contains(@class,'m1-popup')]//div[contains(@class,'x-window-header-title')]//div[contains(@class,'x-title')]");
        public static readonly AbstractedBy PopupAllCheckbox = AbstractedBy.Xpath("Popup All Checkbox", "//div[@sm1-id='LOGICALSELECTPOPUP']//span[@class='x-column-header-checkbox']");
        public static AbstractedBy PopupAllCheckboxByName(string popupName) => AbstractedBy.Xpath("Popup All Checkbox By Name", "//div[contains(text(),'" + popupName + "')]/ancestor::div[@role='dialog']//span[@class='x-column-header-checkbox']");
        public static readonly AbstractedBy GridFilterPopupOkButton = AbstractedBy.Xpath("Grid Filter Popup Ok Button", "//div[contains(text(),'Column:')]/ancestor::div[contains(@class,'sm1-popup')]//span[text()='OK']");
        public static readonly AbstractedBy ErrorPopup = AbstractedBy.Xpath("Error Popup", "//div[text()='Error']/ancestor::div[contains(@class,'x-message-box')][@aria-hidden='false']");
        public static readonly AbstractedBy ErrorPopupOkButton = AbstractedBy.Xpath("Error Popup Ok Button", "//div[text()='Error']/ancestor::div[contains(@class,'x-message-box')][@aria-hidden='false']//span[text()='OK']");
        public static readonly AbstractedBy AlertDialogMessageBox = AbstractedBy.Xpath("Alert Dialog Message Box", "//div[@role='alertdialog'][@aria-hidden='false']//div[@sm1-id='messageboxmessage']");
        public static readonly AbstractedBy AlertDialogOkButton = AbstractedBy.Xpath("Alert Dialog Ok Button", "//div[@role='alertdialog' and @aria-hidden='false']//span[text()='OK']");
        public static readonly AbstractedBy AlertDialogYesButton = AbstractedBy.Xpath("Alert Dialog Yes Button", "//div[@role='alertdialog' and @aria-hidden='false']//span[text()='Yes']");
        public static readonly AbstractedBy AlertDialogNoButton = AbstractedBy.Xpath("Alert Dialog No Button", "//div[@role='alertdialog' and @aria-hidden='false']//span[text()='No']");
        public static readonly AbstractedBy AlertDialogCancelButton = AbstractedBy.Xpath("Alert Dialog Cancel Button", "//div[@role='alertdialog' and @aria-hidden='false']//span[text()='Cancel']");
        public static readonly AbstractedBy PopupAddButton = AbstractedBy.Xpath("Popup Add Button", "//div[@role='dialog'][@aria-hidden='false']//span[contains(@class, 'toolbar-add')]/ancestor::span[@sm1-id = 'AddButton'][@aria-hidden='false']//span[@data-ref='btnWrap']");
        public static readonly AbstractedBy HierLevelRows = AbstractedBy.Xpath("Hier. level Rows", "//div[@sm1-id='FILTER_PANEL']//td[contains(@class,'sm1gridhtmlcolumn')]");

        public static AbstractedBy SelectionPopupCheckboxContains(string value) => AbstractedBy.Xpath("Popup Checkbox Contains", "//div[contains(text(),'" + value + "')]/ancestor::td/preceding-sibling::td//div");
        public static AbstractedBy PopupCheckbox(string value) => AbstractedBy.Xpath("Popup Checkbox", "//div[text()='" + value + "']/ancestor::td/preceding-sibling::td//div[contains(@class,'x-grid-checkcolumn-cell-inner')]");
        public static AbstractedBy PopupCancelButton(string popupName) => AbstractedBy.Xpath("Popup Cancel Button", "//div[contains(text(),'" + popupName + "')]/ancestor::div[@role='dialog']//span[text()='Cancel']/ancestor::span[@role='button']");
        public static AbstractedBy PopupOkButton(string popupName) => AbstractedBy.Xpath("Popup Ok Button", "//div[contains(text(),'" + popupName + "')]/ancestor::div[@role='dialog']//span[text()='OK']");
        public static AbstractedBy PopupBackButton(string popupName) => AbstractedBy.Xpath("Popup Back Button", "//div[contains(text(),'" + popupName + "')]/ancestor::div[@role='dialog']//span[text()='Back']/ancestor::span[@role='button']");
        public static AbstractedBy PopupNextButton(string popupName) => AbstractedBy.Xpath("Popup Next Button", "//div[text()='" + popupName + "']/ancestor::div[@role='dialog']//span[text()='Next']/ancestor::span[@role='button']");
        public static AbstractedBy PopupConfirmButton(string popupName) => AbstractedBy.Xpath("Popup Confirm Button", "//div[contains(text(),'" + popupName + "')]/ancestor::div[@role='dialog']//span[text()='Confirm']/ancestor::span[@role='button']");
        public static AbstractedBy Popup(string popupName) => AbstractedBy.Xpath("Popup", "//div[text()='" + popupName + "']/ancestor::div[@role='dialog']");
        public static AbstractedBy PopupButton(string buttonLabel) => AbstractedBy.Xpath("Popup Button", "//div[@role='dialog'][@aria-hidden='false']//span[text()='" + buttonLabel + "']/ancestor::*[@role='button']");
        public static AbstractedBy AlertDialogButton(string buttonLabel) => AbstractedBy.Xpath("Alert Dialog Button", "//div[@role='alertdialog' and @aria-hidden='false']//span[text()='" + buttonLabel + "']");
        public static AbstractedBy PopupButtonSm1Id(string popupName) => AbstractedBy.Xpath("Popup Ok Button SM1Id", "//div[text()='" + popupName + "']//following::span[@sm1-id='SM1OkButton'][@aria-hidden='false']");
        public static AbstractedBy PopupGridTriggerIcon(string popupSm1Id) => AbstractedBy.Xpath("Popup Grid Trigger", "//div[@sm1-id='"+ popupSm1Id + "']//div[@class='sm1-triggers']");
        public static AbstractedBy PopupFilteredRows(string columnName) => AbstractedBy.Xpath("Popup Filtered Rows Column Name", "//div[@sm1-id='FILTER_PANEL']//following::span[text()='"+ columnName +"']//following::table");
        public static AbstractedBy GenericPopUpHeader(string popUpHeader) => AbstractedBy.Xpath("Generic Pop Up Heading", "//div[contains(@class, 'x-title-text')][text() = '" + popUpHeader + "']");
        public static AbstractedBy GenericPopUpContainsHeader(string popUpHeader) => AbstractedBy.Xpath("Generic Pop Up Contains Heading", "//div[contains(@class, 'x-title-text')][contains(text(),'" + popUpHeader + "')]");
    }
}
