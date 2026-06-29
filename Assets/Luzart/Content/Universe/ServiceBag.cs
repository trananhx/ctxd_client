namespace Luzart
{
    using System.Collections.Generic;
    using UnityEngine;

    public sealed class ServiceBag : ScriptableObject
    {
        [SerializeField] private List<AbstractScriptableService> services;

        public IReadOnlyList<IService> AllServices => services;
    }
}

