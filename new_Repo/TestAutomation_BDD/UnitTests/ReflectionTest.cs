using Kantar_BDD.Support.General;
using Kantar_BDD.Support.Selenium;
using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.UnitTests
{
    public class ReflectionTest
    {

        [Test]
        public void ModelerTest() 
        {
            PageObjectModeler modeler = new ();
            modeler.Model();
        }

        [Test]
        public void GetSteps() 
        {
            PageObjectModeler modeler = new();
            modeler.GetSteps();
        }
    }

}
