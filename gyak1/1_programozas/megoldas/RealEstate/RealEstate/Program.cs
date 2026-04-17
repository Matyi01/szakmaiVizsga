using RealEstate;
using System.Xml.Schema;

static List<Ad> LoadFromCsv(string fileName)
{
    List<Ad> list = new List<Ad>();
    StreamReader reader = new StreamReader(fileName);

    if (!reader.EndOfStream)
    {
        reader.ReadLine();
    }

    while (!reader.EndOfStream)
    {
        string line = reader.ReadLine();
        list.Add(new Ad(line));
    }

    reader.Close();
    return list;
}

static double DistanceTo(double x1, double y1, double x2, double y2)
{
    double d = 0;

    d = Math.Sqrt((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1));

    return d;
}


List <Ad> adatok = LoadFromCsv("realestates.csv");

//6. Határozza meg és írja ki a minta szerint az eladásra kínált földszinti ingatlanok átlagos 
//alapterületét! Az eredményt a minta alapján két tizedesjegy pontossággal írja ki!

double foldszintiTerulet = 0;   
int foldszintDarab = 0;
foreach (Ad e in adatok)
{
    if (e.Floors == 0)
    {
        foldszintiTerulet += e.Area;
        foldszintDarab++;
    }
}

Console.WriteLine("1. Földszinti ingatlanok átlagos alapterülete: {0} m2", Math.Round(foldszintiTerulet/foldszintDarab, 2));

//7. Készítsen  DistanceTo néven  valós  értékkel  visszatérő 
//metódust, amelynek segítségével adott ingatlan esetében 
//meg lehet állapítani egy GPS koordinátától való távolságot 
//Pitagorasz-tétel segítségével!


//8. A  Mesevár  óvoda  Budán  a  47.4164220114023, 
//19.066342425796986  GPS koordinátán helyezkedik el. Keresse ki és írja ki a minta 
//alapján  annak  a  tehermentes  ingatlannak  az  adatait, melyik  a  legközelebb  van 
//légvonalban a Mesevár óvodához! 

double x1 = 47.4164220114023;
double y1 = 19.066342425796986;


double minTav = DistanceTo(x1,y1, Convert.ToDouble(adatok[0].LatLong.Split(',')[0].Replace('.', ',')), Convert.ToDouble(adatok[0].LatLong.Split(',')[1].Replace('.', ',')));

foreach(Ad e in adatok)
{
    if (e.FreeOfCharge == true)
    {
        double x2 = Convert.ToDouble(e.LatLong.Split(',')[0].Replace('.', ','));
        double y2 = Convert.ToDouble(e.LatLong.Split(',')[1].Replace('.', ','));

        double tav = DistanceTo(x1, y1, x2, y2);
        if (tav < minTav)
        {
            minTav = tav;
        }
    }
}

foreach (Ad e in adatok)
{
    double x2 = Convert.ToDouble(e.LatLong.Split(',')[0].Replace('.', ','));
    double y2 = Convert.ToDouble(e.LatLong.Split(',')[1].Replace('.', ','));
    double tav = DistanceTo(x1, y1, x2, y2);
    if (tav == minTav)
    {
        Console.WriteLine("2. Mesevár óvodához légvonalban legközelebbi tehermentes ingatlan adatai:");
        Console.WriteLine("\tEladó neve\t: {0}", e.Seller.Name);
        Console.WriteLine("\tEladó telefonja\t: {0}", e.Seller.Phone);
        Console.WriteLine("\tAlapterület\t: {0}", e.Area);
        Console.WriteLine("\tSzobák száma\t: {0}", e.Rooms);
    }
}

Console.ReadKey();