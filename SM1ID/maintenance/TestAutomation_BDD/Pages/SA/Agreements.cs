using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.SA
{
    [PageName("Agreements Page")]
    class Agreements
    {
        public static readonly AbstractedBy AgreementIDIncrementIcon = AbstractedBy.Xpath("Agreement ID Increment Icon", "//div[@sm1-id='twoActTxtBoxAgreementID']//div[contains(@class,'sm1textboxactiontriggerplus')]");
    }
}
