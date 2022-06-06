using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.SFA.Containers
{
    [PageName("Customers Tab")]
    public class CustomersPage
    {
        public static readonly AbstractedBy AssortmentCustomerSimulation = AbstractedBy.Xpath("Customer Simulation", "//span[contains(text(),'Customer Simulation')]");
        public static AbstractedBy AssortmentCustomerCustomerCode(string customer, string rowNumber) => AbstractedBy.Xpath("Customer Code", $"(//div[text()='{customer}'])[{rowNumber}]");
        public static AbstractedBy AssortmentCustomerSimulationGrid(string simulationGrid) => AbstractedBy.Xpath("Customer Simulation Grid", $"(//tbody//div[text()='{simulationGrid}']/ancestor::tr[contains(@class,'sm1-row')])");
    }
}
