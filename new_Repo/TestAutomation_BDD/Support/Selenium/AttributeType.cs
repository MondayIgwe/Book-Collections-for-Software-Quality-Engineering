using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Support.Selenium
{
    public class AttrbuteType
    {
        public string Name { get; set; }
        public List<string> PartialAttributes{ get; set; }

        public static AttrbuteType CreateAttributePair(string name, List<string> partialAttrbutes)
        {
            return new AttrbuteType()
            {
                Name = name,
                PartialAttributes = partialAttrbutes
            };
        }
    }
}
