using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Kantar_BDD.Pages;
using Kantar_BDD.Pages.Grids;
using Kantar_BDD.Pages.Popups;
using Kantar_BDD.Pages.SFA.Containers;
using Kantar_BDD.Support.Helpers;
using Kantar_BDD.Support.Selenium;
using Kantar_BDD.Support.Utils;
using OpenQA.Selenium;

namespace Kantar_BDD.Support.Helpers
{
    public class NodeStepHelpers : StepHelpers
    {
        public NodeStepHelpers(IWebDriver driver) : base(driver)
        {
        }

        /// <summary>
        /// Builds a dynamic hierarchy node. 
        /// Must be separated by a '->'
        /// Typically found in the Advanced Pricing Actions section
        /// </summary>
        /// <param name="arrowSeparatedNode">Arrow '->' separated value</param>
        /// <returns></returns>
        public static string BuildDynamicNode(string arrowSeparatedNode)
        {
            string firstNodeElement(string element) => "//div[@class = 'x-panel sm1-tabitem x-fit-item x-panel-default']//span[contains(@class,'tree-node-text')][contains(text(),'" + element + "')]";
            string nthNodeElement(string element) => "//ancestor::table[contains(@id,'treeview')]//following-sibling::table[contains(@id,'treeview')]//span[contains(text(),'" + element + "')]";
            if (!arrowSeparatedNode.Contains("=>"))
            {
                return firstNodeElement(arrowSeparatedNode.Trim());
            }
            else
            {
                StringBuilder node = new StringBuilder();
                string[] nodalPoints = arrowSeparatedNode.Split("=>");
                node.Append(firstNodeElement(nodalPoints[0].Trim()));
                for (int i = 1; i < nodalPoints.Length; i++)
                {
                    node.Append(nthNodeElement(nodalPoints[i].Trim()));
                }
                return node.ToString();
            }
        }
    }
}
