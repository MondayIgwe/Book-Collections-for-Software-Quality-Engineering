﻿// ------------------------------------------------------------------------------
//  <auto-generated>
//      This code was generated by SpecFlow (https://www.specflow.org/).
//      SpecFlow Version:3.9.0.0
//      SpecFlow Generator Version:3.9.0.0
// 
//      Changes to this file may cause incorrect behavior and will be lost if
//      the code is regenerated.
//  </auto-generated>
// ------------------------------------------------------------------------------
#region Designer generated code
#pragma warning disable
namespace Kantar_BDD.Features.SA.NightlyRunsRecoped
{
    using TechTalk.SpecFlow;
    using System;
    using System.Linq;
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("TechTalk.SpecFlow", "3.9.0.0")]
    [System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    [NUnit.Framework.TestFixtureAttribute()]
    [NUnit.Framework.DescriptionAttribute("TestCase316220")]
    public partial class TestCase316220Feature
    {
        
        private TechTalk.SpecFlow.ITestRunner testRunner;
        
        private string[] _featureTags = ((string[])(null));
        
#line 1 "TestCase316220.feature"
#line hidden
        
        [NUnit.Framework.OneTimeSetUpAttribute()]
        public virtual void FeatureSetup()
        {
            testRunner = TechTalk.SpecFlow.TestRunnerManager.GetTestRunner();
            TechTalk.SpecFlow.FeatureInfo featureInfo = new TechTalk.SpecFlow.FeatureInfo(new System.Globalization.CultureInfo("en-US"), "Features/SA/NightlyRunsRecoped", "TestCase316220", "\tWEB_SA_CLAIM_CLAIM DOCUMENT_004 - Close a new claim without saving - created fro" +
                    "m Main menu + default VAT", ProgrammingLanguage.CSharp, ((string[])(null)));
            testRunner.OnFeatureStart(featureInfo);
        }
        
        [NUnit.Framework.OneTimeTearDownAttribute()]
        public virtual void FeatureTearDown()
        {
            testRunner.OnFeatureEnd();
            testRunner = null;
        }
        
        [NUnit.Framework.SetUpAttribute()]
        public virtual void TestInitialize()
        {
        }
        
        [NUnit.Framework.TearDownAttribute()]
        public virtual void TestTearDown()
        {
            testRunner.OnScenarioEnd();
        }
        
        public virtual void ScenarioInitialize(TechTalk.SpecFlow.ScenarioInfo scenarioInfo)
        {
            testRunner.OnScenarioInitialize(scenarioInfo);
            testRunner.ScenarioContext.ScenarioContainer.RegisterInstanceAs<NUnit.Framework.TestContext>(NUnit.Framework.TestContext.CurrentContext);
        }
        
        public virtual void ScenarioStart()
        {
            testRunner.OnScenarioStart();
        }
        
        public virtual void ScenarioCleanup()
        {
            testRunner.CollectScenarioErrors();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("WEB_SA_CLAIM_CLAIM DOCUMENT_004")]
        [NUnit.Framework.CategoryAttribute("TTC_Nightly")]
        [NUnit.Framework.CategoryAttribute("TTC")]
        [NUnit.Framework.CategoryAttribute("BDD_316220")]
        [NUnit.Framework.TestCaseAttribute("REO", "VAT CODE 1", "EC86292", "105.67", "316220_REO", "Level 2", "2", "VATAMOUNT", "VAT CODE 1", null)]
        [NUnit.Framework.TestCaseAttribute("NCC", "VAT CODE 1", "EC86292", "324.99", "316220_REO", "Level 2", "2", "VATAMOUNT", "VAT CODE 1", null)]
        public virtual void WEB_SA_CLAIM_CLAIMDOCUMENT_004(string documentType1, string defaultVat, string customer, string amount, string documentNumber, string level, string rowNumber, string columnSM1ID, string cellValue, string[] exampleTags)
        {
            string[] @__tags = new string[] {
                    "TTC_Nightly",
                    "TTC",
                    "BDD_316220"};
            if ((exampleTags != null))
            {
                @__tags = System.Linq.Enumerable.ToArray(System.Linq.Enumerable.Concat(@__tags, exampleTags));
            }
            string[] tagsOfScenario = @__tags;
            System.Collections.Specialized.OrderedDictionary argumentsOfScenario = new System.Collections.Specialized.OrderedDictionary();
            argumentsOfScenario.Add("DocumentType1", documentType1);
            argumentsOfScenario.Add("defaultVat", defaultVat);
            argumentsOfScenario.Add("Customer", customer);
            argumentsOfScenario.Add("Amount", amount);
            argumentsOfScenario.Add("DocumentNumber", documentNumber);
            argumentsOfScenario.Add("Level", level);
            argumentsOfScenario.Add("rowNumber", rowNumber);
            argumentsOfScenario.Add("ColumnSM1ID", columnSM1ID);
            argumentsOfScenario.Add("CellValue", cellValue);
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("WEB_SA_CLAIM_CLAIM DOCUMENT_004", null, tagsOfScenario, argumentsOfScenario, this._featureTags);
#line 5
this.ScenarioInitialize(scenarioInfo);
#line hidden
            bool isScenarioIgnored = default(bool);
            bool isFeatureIgnored = default(bool);
            if ((tagsOfScenario != null))
            {
                isScenarioIgnored = tagsOfScenario.Where(__entry => __entry != null).Where(__entry => String.Equals(__entry, "ignore", StringComparison.CurrentCultureIgnoreCase)).Any();
            }
            if ((this._featureTags != null))
            {
                isFeatureIgnored = this._featureTags.Where(__entry => __entry != null).Where(__entry => String.Equals(__entry, "ignore", StringComparison.CurrentCultureIgnoreCase)).Any();
            }
            if ((isScenarioIgnored || isFeatureIgnored))
            {
                testRunner.SkipScenario();
            }
            else
            {
                this.ScenarioStart();
#line 8
 testRunner.Given("the user navigates to the \'Claims\' page under division\'Claims\'", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line hidden
#line 11
    testRunner.When(string.Format("the user creates a New Claim \'{0}\' \'{1}\' \'{2}\' \'{3}\' \'{4}\'", documentType1, documentNumber, level, customer, amount), ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line hidden
#line 12
    testRunner.Then("the user validates that the \'Add Button\' is displayed", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
#line 13
    testRunner.And("the user validates that the \'Button\' with value \'Edit\' is enabled", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 16
    testRunner.And(string.Format("the user validates that column \'VAT Code\' has \'{0}\' with row text \'{1}\'", cellValue, amount), ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 19
    testRunner.When("the user clicks on the \'Toolbar Close Button\'", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line hidden
#line 20
    testRunner.Then("the user validates that the \'Alert Dialog Message Box\' is not present", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            }
            this.ScenarioCleanup();
        }
    }
}
#pragma warning restore
#endregion