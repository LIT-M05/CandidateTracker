using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CandidateTracker.Data;

namespace CandidateTracker.Web
{
    public class LayoutPageActionFilterAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var manager = new CandidateRepository(Properties.Settings.Default.ConStr);
            CandidateCounts counts = manager.GetCounts();
            filterContext.Controller.ViewBag.CandidateCounts = counts;
            base.OnActionExecuting(filterContext);
        }
    }
}