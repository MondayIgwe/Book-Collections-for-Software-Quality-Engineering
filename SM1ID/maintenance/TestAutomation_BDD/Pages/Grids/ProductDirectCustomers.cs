using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.Grids
{
    [PageName("ProductDirectCustomers")]
    class ProductDirectCustomers
    {
        public static AbstractedBy AllProductsByLevel(string level) => AbstractedBy.Xpath("All Products Table Rows", "//span[@class='sm1-promo-product']/ancestor::tr[@aria-level='"+ level + "']/ancestor::table");
        public static readonly AbstractedBy AllColumnNames = AbstractedBy.Xpath("All Product Direct Customers Columns", "//div[@role='tabpanel' and @aria-hidden='false']//div[@role='grid' and contains(@id,'sm1treegrid')]//div[@aria-hidden='false' and @role='columnheader']//div[@class='x-column-header-text']//span");
        public static AbstractedBy DivByColumnAndRow(string Column, string Row) => AbstractedBy.Xpath("Direct Customers Grid Cell", "(//div[@role='tabpanel' and @aria-hidden='false']//div[@class='x-grid-scrollbar-clipper ']//table[contains(@id, 'tableview')][" + Row + "]//div[@class='x-grid-cell-inner '])[" + Column + "]");
    }
}
