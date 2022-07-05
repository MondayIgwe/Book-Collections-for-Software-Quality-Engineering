using Kantar_BDD.Support.Selenium;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using System.Xml.Serialization;
using TechTalk.SpecFlow;

namespace Kantar_BDD.Support.General
{
    public class PageObjectModeler
    {
        public void GetSteps() 
        {
            var methods = Assembly.GetExecutingAssembly().GetTypes()
                      .SelectMany(t => t.GetMethods())
                      .Where(m => m.GetCustomAttributes(typeof(GivenAttribute), false).Length > 0 
                      || m.GetCustomAttributes(typeof(WhenAttribute), false).Length > 0
                      || m.GetCustomAttributes(typeof(ThenAttribute), false).Length > 0)
                      .ToArray();
            StepModeller stepModeller = new();


            var givenMethods = methods.Where(m => m.GetCustomAttributes().Any(x => x.GetType().Equals(typeof(GivenAttribute))) ).ToList();

            foreach (var givenItem in givenMethods)
            {
                var gg = givenItem.GetParameters();
                var t = "";
            }



            foreach (var method in methods)
            {
                var givens = method.GetCustomAttributes().Where(m => m.GetType().Equals(typeof(GivenAttribute))).ToList();
                var whens = method.GetCustomAttributes().Where(m => m.GetType().Equals(typeof(WhenAttribute))).ToList();
                var thens = method.GetCustomAttributes().Where(m => m.GetType().Equals(typeof(ThenAttribute))).ToList();

                


                var g = givens.Select(x => new Step()
                {
                    Regex = ((GivenAttribute)x).Regex,
                    KeywordType = "GIVEN"
                });

                var wh = whens.Select(x => new Step()
                {
                    Regex = ((WhenAttribute)x).Regex,
                    KeywordType = "WHEN"
                });

                var th = thens.Select(x => new Step()
                {
                    Regex = ((ThenAttribute)x).Regex,
                    KeywordType = "THEN"
                });

                stepModeller.Steps.AddRange(g);
                stepModeller.Steps.AddRange(wh);
                stepModeller.Steps.AddRange(th);
            }

            string json = JsonConvert.SerializeObject(stepModeller);
        }
        public void Model() 
        {
            //Get all Classes with the Page Attribute
            var pages = GetPageClasses();
            ObjectModel model = new();
            
            var page = pages.Select(x => new Page()
            {
                Name = x.GetCustomAttribute<PageNameAttribute>().Name,
                Locators = GetLocatorsFromClass(x),
                LocatorMethods = GetLocatorsFromMethods(x)
                
            }).ToList();

            model.Pages.AddRange(page);
            model.Pages = model.Pages.Where(x => x.Name != null).ToList();
            

            var modelJson = JsonConvert.SerializeObject(model);
            RootObject rootObject = new() 
            {
                ObjectModel = model
            };

            XmlDocument xmlDocument = JsonConvert.DeserializeXmlNode(JsonConvert.SerializeObject(rootObject));

            string dir = Directory.GetParent(Environment.CurrentDirectory).Parent.Parent.FullName;
            xmlDocument.Save(dir+@"\PageObjectModel.xml");


            DateTime dateTime = DateTime.Now;
            var day = dateTime.Day;
        }

        public List<Type> GetPageClasses()
        {
            Type[] allTypes = Assembly.GetExecutingAssembly().GetTypes();
            var types = allTypes
                .Where(t => t.Namespace != null && t.Namespace.Contains("Kantar_BDD.Pages")).ToList();

            List<Type> filtered = null;
            
                filtered = types.Where(type => type.GetCustomAttributes(typeof(PageNameAttribute),true).Length > 0)
                .ToList();
            
            return filtered;
        }
        

        public List<AbstractedBy> GetLocatorsFromClass(Type type)
        {
            var f = type.GetFields();
            List<AbstractedBy> locators = type.GetFields().Where(f => f.FieldType.Equals(typeof(AbstractedBy))).Select(x => (AbstractedBy)x.GetValue(null)).ToList();
            return locators;
        }

        public List<AbstractedByMethod> GetLocatorsFromMethods(Type page) 
        {
            var methods = GetLocatorMethods(page);
            var constructor = page.GetConstructor(Type.EmptyTypes);
            List<AbstractedByMethod> bys = new();
            foreach (var method in methods)
            {
                AbstractedByMethod abstractedByMethod = new();
                var parameters = method.GetParameters().ToList();
                var placeholders = parameters.Select(x => "{" + x.Name + "}").ToArray<object>();
                
                //Get the abstract by
                object abstractedBy = method.Invoke(constructor, placeholders);
                AbstractedBy by = (AbstractedBy)abstractedBy;
                abstractedByMethod.LogicalName = by.LogicalName;
                abstractedByMethod.SeleniumBy = by.SeleniumBy;

                //Get the argument info
                foreach (var parameter in parameters)
                {
                    AbstractedByArgument argument = new() 
                    {
                        Name = parameter.Name,
                        Type = parameter.ParameterType.ToString()
                    };
                   abstractedByMethod.Arguments.Add(argument);
                }

                bys.Add((AbstractedByMethod)abstractedByMethod);
            }
            return bys;
        }

        public List<MethodInfo> GetLocatorMethods(Type type) 
        {
            var methods = type.GetMethods();
            var filtered = methods.Where(m => m.ReturnType == typeof(AbstractedBy)).ToList();
            return filtered;
        }

        /// <summary>
        /// Retrieves a list of all locators
        /// </summary>
        /// <returns>All locators with logical names are returned</returns>
        public List<AbstractedBy> GetAllLocators()
        {
            //Get all Classes with the Page Attribute
            List<Type> pageTypes = GetPageClasses();
            List<AbstractedBy> abstracted = new List<AbstractedBy >();

            foreach (Type page in pageTypes)
            {
                List<AbstractedBy> temp = GetLocatorsFromClass(page);
                temp = temp.Where(x => !x.LogicalName.Equals(string.Empty)).ToList();
                temp.ForEach(x => abstracted.Add(x));
            }

            return abstracted;
        }

        public List<AbstractedByClass> GetAllClassLocators()
        {
            //Get all Classes with the Page Attribute
            List<Type> pageTypes = GetPageClasses();
            List<AbstractedByClass> classLocators = new List<AbstractedByClass>();

            foreach (Type page in pageTypes)
            {
                List<AbstractedBy> templc = GetLocatorsFromClass(page);
                templc = templc.Where(x => !x.LogicalName.Equals(string.Empty)).ToList();
                List<AbstractedBy> abstracted = new List<AbstractedBy>();
                templc.ForEach(x => abstracted.Add(x));
                Attribute[] pageAttributes = Attribute.GetCustomAttributes(page);
                foreach (Attribute attribute in pageAttributes)
                {
                    if (attribute is PageNameAttribute)
                    {
                        PageNameAttribute pageName = (PageNameAttribute) attribute;
                        classLocators.Add(AbstractedByClass.GetClassLocators(pageName.Name, templc));
                    }
                }
            }

            return classLocators;
        }
    }
}
