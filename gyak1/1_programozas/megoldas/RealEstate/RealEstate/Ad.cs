using System;
using System.Collections.Generic;
using System.Reflection.PortableExecutable;
using System.Text;

namespace RealEstate
{
    internal class Ad
    {
        public int Area;
        public Category Category;
        public DateTime CreateAt;
        public string Description;
        public int Floors;
        public bool FreeOfCharge;
        public int Id;
        public string ImageUrl;
        public string LatLong;
        public int Rooms;
        public Seller Seller;
        public Ad (string line)
        {

            string[] s = line.Split(";");
            
            Category category = new Category(Int32.Parse(s[5]), s[13]);

            Seller seller = new Seller(Int32.Parse(s[5]), s[10], s[11]);


            this.Area = Int32.Parse(s[0]);
            this.Category = category;
            this.Description = s[2];
            this.Floors = Int32.Parse(s[3]);
            this.FreeOfCharge = bool.Parse(s[4];
            this.Id = Int32.Parse(s[5]);
            this.ImageUrl = s[6];
            this.LatLong = s[7];
            this.Rooms = Int32.Parse(s[8]);
            this.Seller = seller;
        }
    }
}
