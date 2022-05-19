using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Kantar_BDD.Support.Selenium;

namespace Kantar_BDD.Pages.Promo
{
    [PageName("ProductsPage")]
    class ProductsPage
    {
        public static readonly AbstractedBy OkButton = AbstractedBy.Xpath("Ok Button", "//div[@sm1-id='LOGICALAVANCEDENTITYSELECTORPOPUP']//span[@sm1-id='SM1OkButton']");
        public static readonly AbstractedBy PromoCreateWhatIfText = AbstractedBy.Xpath("Promo Create WhatIf Text", "//span[text()='Create What if:']/ancestor::label/following-sibling::div//div[@role='textbox']");
        public static readonly AbstractedBy PromoWhatIfButton = AbstractedBy.Xpath("Promo What If Button", "//div[@data-qtip='Promotional What If']");
        public static readonly AbstractedBy PromoCreateWhatIfButton = AbstractedBy.Xpath("Promo Create WhatIf Button", "//span[text()='Create What-If']/ancestor::span[@data-ref='btnWrap']/following-sibling::div");
        public static readonly AbstractedBy PromoConfirmWhatIfButton = AbstractedBy.Xpath("Promo Confirm WhatIf Button", "//a[@sm1-id='ACTION_CONFIRM_SHOT']");
        public static readonly AbstractedBy ProductGridAllocation = AbstractedBy.Xpath("Product Grid Allocation DropDown", "//a[@sm1-id='COMBO_ACTION_PRODUCT_GRID_WORK_MODE']//div[contains(@class,'x-form-trigger-default')]");
        public static readonly AbstractedBy ProductGridSelectMeasures = AbstractedBy.Xpath("Product Grid Select Measures", "//a[@sm1-id='COMBO_ACTION_PRODUCT_GRID_SELECT_MEASURES']//div[contains(@class,'x-form-trigger-default')]");
        public static readonly AbstractedBy InAssortmentSection = AbstractedBy.Xpath("In Assortment Section", "//div[@sm1-id='FILTER_SECTION_FLGASSORTMENT']");
        public static AbstractedBy ProductLevel(string level) => AbstractedBy.Xpath("Product Level", "//div[@sm1-id = 'FILTER_SECTION_LEVPRODUCT']//div[text() = '" + level + "']");
        public static AbstractedBy HostProductCodeGrid(string code) => AbstractedBy.Xpath("Host Product Code", "//div[text() = '" + code + "']");
        public static AbstractedBy WhatIfDescription(string description) => AbstractedBy.Xpath("What If Description", "//div[@class='x-grid-cell-inner ' and text()='"+ description + "']");
        public static AbstractedBy TagsFields(string description) => AbstractedBy.Xpath("Product Tags Fields", "//li//div[text()='MIRENE VINHO VERDE 1.5 lt' and @class='x-tagfield-item-text']");
    }
}
