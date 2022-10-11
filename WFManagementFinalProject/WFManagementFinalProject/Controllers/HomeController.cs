using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using MySql.Data.MySqlClient.Memcached;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using WFManagementFinalProject.Models;

namespace WFManagementFinalProject.Controllers
{
    public class HomeController : Controller
    {       
            private readonly ILogger<HomeController> _logger;

            public HomeController(ILogger<HomeController> logger)
            {
                _logger = logger;
            }

            public IActionResult Login()
            {
                return View("Login");
            }

            [HttpPost]
            [ValidateAntiForgeryToken]
            public ActionResult Login(UserProfile user)
            {
                try
                {
                    string Uri = string.Format("http://localhost:44586");
                    RestRequest request = new RestRequest(Uri);
                    var response = Client.ExecuteTaskAsync<List<Core.Models.LoginCriteria>>(request);
                    if (response.Role == "Manager")
                    {
                        return RedirectToAction("Index", "Manager");
                    }
                    else
                    {
                        return RedirectToAction("Fail", "WFMember");
                    }

                }
                catch
                {
                    return View();
                }
            }

            public IActionResult Privacy()
            {
                return View();
            }

            [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
            public IActionResult Error()
            {
                return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
            }
        }
}
