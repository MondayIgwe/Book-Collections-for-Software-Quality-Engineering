using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.Grids
{
    [PageName("Customer Master Pop Up Grid")]
    public class CustomerMasterGrid
    {
        public static readonly AbstractedBy OKButton = AbstractedBy.Xpath("Customer Master pop up OK Button",
            "//div[text() = 'Customer Master']//ancestor::div//span[@sm1-id = 'SM1OkButton']//span[text()]");
        public static readonly AbstractedBy CancelButton = AbstractedBy.Xpath("Customer Master pop up Cancel Button",
            "//div[text() = 'Customer Master']//ancestor::div//span[@sm1-id = 'SM1CancelButton']//span[text()]");
        public static AbstractedBy Node(string node) => AbstractedBy.Xpath("Customer Master pop up Grid Node",
            "//div[text() = 'Customer Master']//ancestor::div[@role='dialog']//table//tbody//tr//td//div[@class='x-grid-cell-inner '][text()='" + node + "']");
        public static AbstractedBy SelectRow(string rowNumber) => AbstractedBy.Xpath("Customer Master pop up Row",
            "(//div[text() = 'Customer Master']//ancestor::div[@role='dialog']//table//tbody//tr//td//div)[" + rowNumber + "]");
        public static readonly AbstractedBy Columns = AbstractedBy.Xpath("Customer Master pop up Columns",
            "//div[text() = 'Customer Master']//ancestor::div[@role='dialog']//div[@sm1-id='GridContainer']//div[@role='columnheader'][@aria-hidden='false']//div[@class='x-column-header-text']//span");
        public static readonly AbstractedBy RowsLeft = AbstractedBy.Xpath("Customer Master pop up Left Rows",
            "//div[text() = 'Customer Master']//ancestor::div[@role='dialog']//div[contains(@class, 'x-grid-scrollbar-clipper-locked ')]//table");
        public static readonly AbstractedBy RowsRight = AbstractedBy.Xpath("Customer Master pop up Right Rows",
            "//div[text() = 'Customer Master']//ancestor::div[@role='dialog']//div[@class = 'x-grid-scrollbar-clipper ']//table");
        public static AbstractedBy CustomersSelectRow(string rowNumber) => AbstractedBy.Xpath("Customers pop up Row",
         "(//div[starts-with(@id, 'window') and contains(text(), 'Customer')]//ancestor::div[@role='dialog']//table//tbody//tr//td//div)[" + rowNumber + "]");
        public static AbstractedBy PopupButtonInGridSm1Id(string popupName) => AbstractedBy.Xpath("Popup Ok Button In Grid SM1Id", "//div[starts-with(@id, 'window') and contains(text(), '" + popupName + "')]//following::span[@sm1-id='SM1OkButton'][@aria-hidden='false']");
    }
}
