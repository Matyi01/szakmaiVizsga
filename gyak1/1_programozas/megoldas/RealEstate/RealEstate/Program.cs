using RealEstate;
using System.Xml.Schema;

static List<Ad> LoadFromCsv(string fileName)
{
    List<Ad> list = new List<Ad>();
    StreamReader reader = new StreamReader(fileName);
    while (!reader.EndOfStream)
    {
        string line = reader.ReadLine();
        list.Add(new Ad(line));
    }
    reader.Close();
    return list;
}