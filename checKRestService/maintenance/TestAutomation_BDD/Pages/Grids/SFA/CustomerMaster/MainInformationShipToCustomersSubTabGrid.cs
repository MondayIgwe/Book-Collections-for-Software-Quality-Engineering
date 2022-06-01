using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.Grids.SFA.CustomerMaster
{
    [PageName("Customer Master - Main Information - Ship To Customers Sub Tab Grid")]

    public class MainInformationShipToCustomersSubTabGrid
    {
        //span[@class = 'x-column-header-text-inner'][text()='Ship-to code']//ancestor::div[@sm1-id='GridContainer']//div[@class='x-column-header-text']//span
        public static readonly AbstractedBy Columns = AbstractedBy.Xpath("Ship To Customers Sub Tab Grid Columns", "//span[@class = 'x-column-header-text-inner'][text()='Ship-to code']//ancestor::div[@sm1-id='GridContainer']//div[@class='x-column-header-text']//span");
        //span[@class = 'x-column-header-text-inner'][text()='Ship-to code']//ancestor::div[@sm1-id='GridContainer']//table
        public static readonly AbstractedBy Rows = AbstractedBy.Xpath("Ship To Customers Sub Tab Grid Rows", "//span[@class = 'x-column-header-text-inner'][text()='Ship-to code']//ancestor::div[@sm1-id='GridContainer']//table");
    }
}
