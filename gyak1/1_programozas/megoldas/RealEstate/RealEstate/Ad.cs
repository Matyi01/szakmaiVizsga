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
            
            Category category = new Category(Int32.Parse(s[12]), s[13]);

            Seller seller = new Seller(Int32.Parse(s[9]), s[10], s[11]);


            this.Area = Int32.Parse(s[4]);
            this.Category = category;
            this.CreateAt = DateTime.Parse(s[8]);
            this.Description = s[5];
            this.Floors = Int32.Parse(s[3]);
            this.FreeOfCharge = s[6] == "1";
            this.Id = Int32.Parse(s[0]);
            this.ImageUrl = s[7];
            this.LatLong = s[2];
            this.Rooms = Int32.Parse(s[1]);
            this.Seller = seller;
        }
    }
}
