using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.ReferenceDocs.FieldExamples
{
    [PageName("TransactionalDataTabPage")]
    class TransactionalData
    {
        public static readonly AbstractedBy ProgressiveField = AbstractedBy.Xpath("Progressive Field", "//div[@sm1-id='prgId']//input");
    }
}
