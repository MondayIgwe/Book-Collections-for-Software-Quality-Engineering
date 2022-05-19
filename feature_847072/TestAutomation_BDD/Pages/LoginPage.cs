using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages
{
    [PageName("Login")]
    public class LoginPage
    {
        public static readonly AbstractedBy Username = AbstractedBy.Id("Username Field","user-name");
        public static readonly AbstractedBy Password = AbstractedBy.Id("Password Field", "password");
        public static readonly AbstractedBy LoginBtn = AbstractedBy.Id("Login Button", "login-button");
    }
}
