using Kantar_BDD.Support.Selenium;
using System;

namespace Kantar_BDD.Pages.Grids
{
    [PageName("ProductGrid")]
    public class ProductGrid
    {
        public static readonly AbstractedBy AllProducts = AbstractedBy.Xpath("All Products", "//div[@class='sm1-promo-product']");
        public static readonly AbstractedBy AllColumnNames = AbstractedBy.Xpath("All Columns", "//div[@role='grid' and contains(@id,'sm1treegrid')]//div[@aria-hidden='false' and @role='columnheader']//div[@class='x-column-header-text']//span");
        public static readonly AbstractedBy AllCheckedCheckboxes = AbstractedBy.Xpath("All Checked Checkboxes", "//td[contains(@aria-describedby,'cell-description-selected')]//div[contains(@class,'x-grid-checkcolumn-cell-inner')]");
        public static readonly AbstractedBy AllSelectedCheckbox = AbstractedBy.Xpath("All Selected Checkbox", "//tr[contains(@class,'x-grid-tree-node-expanded')]//span[@class='x-grid-checkcolumn']");
        public static readonly AbstractedBy AllBusinessRulesColumnNames = AbstractedBy.Xpath("All Business Rules Columns", "//span[text()='Typology']/ancestor::div[@role='rowgroup']//div[contains(@id,'headercontainer')]//span[@class='x-column-header-text-inner']");
        public static AbstractedBy AllBusinessRules(string index) => AbstractedBy.Xpath("All Business Rules", "//span[text()='Typology']/ancestor::div[contains(@class,'x-grid')]//table[contains(@class,'x-grid-item')]//td[" + index+"]");
        public static AbstractedBy BusinessRuleCheckbox(string index) => AbstractedBy.Xpath("Business Rule Checkbox", "//span[text()='Typology']/ancestor::div[contains(@class,'x-grid')]//table[contains(@class,'x-grid-item')][" + index + "]//img");
        public static AbstractedBy TdByColumnAndRow(string Row, string Column) => AbstractedBy.Xpath("Product Grid Table Data", "(//div[@class='x-grid-scrollbar-clipper ']//table[contains(@id, 'tableview')][" + Row + "]//td)[" + Column + "]");

        public static AbstractedBy DivByColumnAndRow(string Row, string Column) => AbstractedBy.Xpath("Product Grid Cell", "(//span[text()='Edit Prod. Groups In Excel']/ancestor::div[@data-ref='bodyWrap'][position() = 1]//div[@class='x-grid-scrollbar-clipper ']//table[contains(@id, 'tableview')][" + Row + "]//div[@class='x-grid-cell-inner '])[" + Column + "]");
        public static AbstractedBy InputByColumnAndRow(string Row) => AbstractedBy.Xpath("Input By Column And Row", "(//div[@class='x-grid-scrollbar-clipper ']//table[contains(@id, 'tableview')][" + Row + "]//input)");
        public static AbstractedBy ProductCellContains(string product) => AbstractedBy.Xpath("Product Grid Cell Contains", "//div[@class='sm1-promo-product' and contains(text(),'"+ product + "')]");
        public static AbstractedBy ProductGridCheckBox(string product) => AbstractedBy.Xpath("Product Grid CheckBox", "//div[contains(text(),'"+ product + "')]/ancestor::table//div[@class='x-grid-cell-inner x-grid-checkcolumn-cell-inner']");
        public static AbstractedBy ProductGridUncheckedCheckBox(string product) => AbstractedBy.Xpath("Product Unchecked Checkbox", "//div[text()='"+ product + "']/ancestor::table//td[contains(@aria-describedby,'cell-description-not-selected')]//span[@class='x-grid-checkcolumn']");
        public static AbstractedBy ProductGridAllCheckedBoxed(string product) => AbstractedBy.Xpath("Product Unchecked Checkbox", "//table[contains(@class,'x-grid-item-selected')]//span[@class='x-grid-checkcolumn']");
        public static AbstractedBy ProductGridAllUnCheckedBoxed(string product) => AbstractedBy.Xpath("Product Unchecked Checkbox", "//table[not(contains(@class,'x-grid-item-selected'))]//span[@class='x-grid-checkcolumn']");    
    }
}
