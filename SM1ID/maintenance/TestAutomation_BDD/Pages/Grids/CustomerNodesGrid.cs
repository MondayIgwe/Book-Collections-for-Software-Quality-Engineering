using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.Grids
{
    public class CustomerNodesGrid
    {
        public static AbstractedBy SelectRowNode(string node) => AbstractedBy.Xpath("Customer Node", $"//div[text() = 'Customer Hierarchy Nodes']//ancestor::div[@role='dialog']//table//tbody//tr//td//div[@class='x-grid-cell-inner '][text()='{node}']");
        public static AbstractedBy SelectRow(string rowNumber) => AbstractedBy.Xpath("Customer Node Row", $"(//div[text() = 'Customer Hierarchy Nodes']//ancestor::div[@role='dialog']//table//tbody//tr)[{rowNumber}]");
     
    }
}