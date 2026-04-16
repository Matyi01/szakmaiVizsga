using System;
using System.Collections.Generic;
using System.Text;

namespace RealEstate
{
    internal class Seller
    {
        public int Id;
        public string Name;
        public string Phone;
        public Seller (int id, string name, string phone)
        {
            Id = id;
            Name = name;
            Phone = phone;
        }
    }
}
