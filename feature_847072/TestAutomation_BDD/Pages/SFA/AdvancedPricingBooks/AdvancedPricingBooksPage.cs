using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.SFA.AdvancedPricingBooks
{
    [PageName("Advanced Pricing Books")]
    public class AdvancedPricingBooksPage
    {
        public static readonly AbstractedBy CopyAdvancedPricingBook = AbstractedBy.Xpath("Copy Advanced Pricing Books Button", "//a[@sm1-id = 'ACTION_COPYCNV']");
    }
}
