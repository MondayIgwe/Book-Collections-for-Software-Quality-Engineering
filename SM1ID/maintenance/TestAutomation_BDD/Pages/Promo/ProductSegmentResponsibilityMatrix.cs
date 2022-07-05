using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Kantar_BDD.Support.Selenium;

namespace Kantar_BDD.Pages.Promo
{
    [PageName("Product Segment Responsibility Matrix Page")]
    class ProductSegmentResponsibilityMatrix
    {
        public static readonly AbstractedBy ProductLevelCombo = AbstractedBy.Xpath("Product Level Combo", "//div[@sm1-id='PROD_SEGM_LEVELS']//ancestor::label/following-sibling::div//div[@class='sm1-triggers']");
    }
}
