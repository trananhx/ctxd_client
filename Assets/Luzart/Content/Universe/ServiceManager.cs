namespace Luzart
{
    using System.Collections.Generic;
    using UnityEngine;
    public sealed class ServiceManager
    {
        private readonly IDomain _domain;
        private readonly List<IService> _installed = new();

        public ServiceManager(IDomain domain) { _domain = domain; }

        public void InstallBags(IEnumerable<ServiceBag> bags)
        {
            foreach (var bag in bags)
            {
                foreach (var c in bag.AllServices)
                {
                    _installed.Add(c);
                    _domain.AddService(c, c.Id); // inject + register
                }
            }
        }

        public void InitializeAndStart()
        {
            int count = 0;
            foreach (var c in _installed)
            {
                c.Initialize();
                count++;
            }
            Debug.Log($"Run service {count}");
            foreach (var c in _installed)
            {
                try
                {
                    c.StartService();
                }
                catch (System.Exception e)
                {
                    Debug.LogError($"StartService with {c} : {e} ");
                }
            }
        }

        public void StopAndTerminate()
        {
            for (int i = _installed.Count - 1; i >= 0; i--) _installed[i].StopService();
            for (int i = _installed.Count - 1; i >= 0; i--) _installed[i].Terminate();
        }
    }
}

