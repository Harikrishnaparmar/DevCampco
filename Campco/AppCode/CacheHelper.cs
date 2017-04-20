using CacheManager.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Campco.AppCode
{
    public class CacheHelper
    {
        public static ICacheManager<object> cache = null;

        public static ICacheManager<object> getCacheManager()
        {
            if (cache == null)
            {
                cache = CacheFactory.Build("CampcoCache", settings =>
                {
                    settings.WithSystemRuntimeCacheHandle("GeneralCache").WithExpiration(ExpirationMode.Absolute,TimeSpan.FromHours(24));
                });

            }
            return cache;
        }

    }
}