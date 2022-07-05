using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.Grids
{
    [PageName("SectionGrid")]
    public class SectionGrid
    {
        public static AbstractedBy SectionInputCell(string popUpName) => AbstractedBy.Xpath("Section Grid Row",
           "//div[text()='" + popUpName + "']//ancestor::div[contains(@class, 'sm1section')]//table//tr//td//div[@class='x-grid-cell-inner ']");
        public static AbstractedBy SectionInputCell(string popUpName, string rowNumber) => AbstractedBy.Xpath("Section Grid Multiple Row",
            "(//div[text()='" + popUpName + "']//ancestor::div[contains(@class, 'sm1section')]//table//tr//td//div[@class='x-grid-cell-inner '])[" + rowNumber + "]");
        public static AbstractedBy SectionInputFieldCell(string popUpName) => AbstractedBy.Xpath("Section Grid Row Input Field",
            "//div[text()='" + popUpName + "']//ancestor::div[contains(@class, 'sm1section')]//table//div[@class='x-form-text-wrap x-form-text-wrap-default']//input");
        public static AbstractedBy SectionInputFieldCell(string popUpName, string rowNumber) => AbstractedBy.Xpath("Section Grid Multiple Row Input Field",
            "(//div[text()='" + popUpName + "']//ancestor::div[contains(@class, 'sm1section')]//table//div[@class='x-form-text-wrap x-form-text-wrap-default']//input)[" + rowNumber + "]");
        public static AbstractedBy SectionRowCount(string popUpName) => AbstractedBy.Xpath("Section Grid Number of Rows Label",
            "//div[text()='" + popUpName + "']//ancestor::td//div[contains(@class, 'sm1section')]//div[contains(@class,'sm1-grid-rownum')]");
        public static AbstractedBy SectionCountRows(string popUpName) => AbstractedBy.Xpath("Section Grid Number of Rows",
            "//div[text()='" + popUpName + "']//ancestor::div[contains(@class, 'sm1section')]//table");
        public static AbstractedBy SectionAddButton(string popUpName) => AbstractedBy.Xpath("Section Add Button",
            "//div[text()='" + popUpName + "']//ancestor::div[contains(@class, 'sm1section')]//span[contains(@class, 'toolbar-add')]");

        public static readonly AbstractedBy Input = AbstractedBy.Xpath("", ".//div[@class='x-form-text-wrap x-form-text-wrap-default']//input");
        public static AbstractedBy SectionAddButtonSM1ID(string section) => AbstractedBy.Xpath("Section Add Button by sm1 id", $"//div[text() = '{section}']//ancestor::div[contains(@class,'sm1section sm1cardsection ')]//span[@sm1-id = 'AddButton'][@aria-hidden='false']");
        public static AbstractedBy SectionPopUpAddButton(string popUpName) => AbstractedBy.Xpath("Section Pop Up Add Button", "//div[contains(text(),'" + popUpName + "')]//ancestor::div[contains(@class, 'sm1section')][not(contains(@class, 'sm1-popup-header-draggable'))]//span[contains(@class, 'toolbar-add')]");
        public static AbstractedBy SectionContainsTextInGrid(string popup, string text) => AbstractedBy.Xpath("Section Pop Up Contains Text in Grid", "//div[contains(text(),'" + popup + "')]//ancestor::div[contains(@class,'sm1section')]//table//tr//td//*[contains(text(),'" + text + "')]");
        public static AbstractedBy SectionPopUpRemoveButton(string popUpName) => AbstractedBy.Xpath("Section Pop Up Remove Button", "//div[contains(text(),'" + popUpName + "')]//ancestor::div[contains(@class, 'sm1section')][not(contains(@class, 'sm1-popup-header-draggable'))]//span[contains(@class, 'toolbar-remove')]");
    }
}
