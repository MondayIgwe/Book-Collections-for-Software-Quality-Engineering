using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;

namespace UnitTestProjectProgram
{
    [TestClass]
    public class UnitTest1
    {
        int? count;
        public int? MyProperty {
            get
            {
                return count; 
            }
            set 
            { 
                count = value; 
            }
        }

        [TestMethod]
        public void TestMethod1()
        {
            var objV = new { id = 1, score = 5 };
            Console.WriteLine(Convert.ToString(objV.id), objV.score);
            MyProperty = 200;

        }


    }
}
