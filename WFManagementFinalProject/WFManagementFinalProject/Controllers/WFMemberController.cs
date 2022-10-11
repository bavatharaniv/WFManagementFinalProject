using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient.Memcached;
using MySqlX.XDevAPI;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WFManagementFinalProject.Models;

namespace WFManagementFinalProject.Controllers
{
    public class WFMemberController : Controller
    {
        List<WFMember> details = new List<WFMember>();
        public ActionResult Index()
        {
            string Uri = string.Format("http://localhost:44586");
            RestRequest request = new RestRequest(Uri);
            var response = Client.ExecuteTaskAsync<List<Core.Models>>(request);
            details = response.Result;
            return View("WfmMember", details);
        }

        // GET: WfmMemberController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: WfmMemberController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: WfmMemberController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: WfmMemberController/Edit/5
        public ActionResult Edit(int id)
        {
            WFMember e = details.Where(x => x.EmpId == id).SingleOrDefault();
            return View("WFMemberEdit", e);
        }

        // POST: WfmMemberController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(WFMember details)
        {
            try
            {
                int id = details.EmpId;
                string Uri = string.Format("http://localhost:44586");
                RestRequest request = new RestRequest(Uri);
                var response = Client.ExecuteTaskAsync<List<Core.Models>>(request);
                return View("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: WfmMemberController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: WfmMemberController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
    }
}
