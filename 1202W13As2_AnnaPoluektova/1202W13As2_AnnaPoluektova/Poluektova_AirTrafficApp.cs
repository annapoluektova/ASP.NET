/* 1202W13As2_AnnaPoluektova - Project
 * Poluektova_AirTrafficApp.cs
 * The course code: COMP 1202
 * Student ID: 100786356
 * Author: Anna Poluektova
 * This application monitors the air traffic for airports
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace _1202W13As2_AnnaPoluektova
{
    class Poluektova_AirTrafficApp
    {
  
        static void Main(string[] args)
        {
            DisplayMenu();
        }

        public static void AddData() 
        {
            string res = "Y";
        
            while (res == "Y")
            {
                Console.WriteLine("\nDo you wish to add the airport? [Y/N]");
                res = Console.ReadLine();
            
                if (res.ToUpper() != "Y") break;
                
                string location;
                uint Cnt;
                string[] d1 = new String[20];
                uint[] flightCount = new uint[20];
                uint[] passCount = new uint[20];
                
                Cnt = GetData(out location, d1, flightCount, passCount);
                
                Poluektova_AirTraffic m = new Poluektova_AirTraffic(location, d1, flightCount, passCount, Cnt);
     
                Console.WriteLine();
                Console.WriteLine();
                Console.WriteLine("Location: {0}", m.AirportLocation);
                Console.WriteLine("Average number of Flights: {0}", m.Avg);
                Console.WriteLine();
                Console.WriteLine("Month Name for Date with Most Flights: {0}", m.MonthWithMostFlights);
                Console.WriteLine("Date of the Most Flights: {0}", m.MaxDate);
                Console.WriteLine("Count for Flights {0}: {1} ", m.MaxDate, m.MaxFlightCount);
                Console.WriteLine("Count for Passengers {0}: {1}", m.MaxDate, m.MaxPassCount);
                Console.ReadKey();
            }
        }

        public static uint GetData(out string location, string [] dArray, uint [] flightCnt, uint [] passCnt)
        {
            uint i;
            
            Console.Write("Location: ");
            location = Console.ReadLine();
            
            if (location == "")
            {
                throw new Exception();
            }
            
            Console.Write("How many records for {0}? ", location);
            
            int loopCnt = Convert.ToInt32(Console.ReadLine());
        
            for (i = 0; i < loopCnt; i++)
            {
                try
                {
                    do
                    {
                        Console.Write("Date (yyyy/mm/dd): ");
                        dArray[i] = Console.ReadLine();
                        DateTime d1;
                        if (DateTime.TryParse(dArray[i], out d1))
                        {
                            break;
                        }
                        else
                        {
                            Console.WriteLine("Incorrect input");
                        }
                    } 
                    while (true);
                  
                    string inValueA, inValueD;
                    
                    Console.Write("Number of Flights Arrivals: ");
                    inValueA = Console.ReadLine();
                    uint inValueAr = Convert.ToUInt32(inValueA);
                    
                    if (inValueAr == 0)
                    {
                        throw new Exception();
                    }
                    
                    Console.Write("Number of Flights Departures: ");
                    inValueD = Console.ReadLine();
                    uint inValueDep = Convert.ToUInt32(inValueD);
                    
                    if (inValueDep == 0)
                    {
                        throw new Exception();
                    }
                    
                    uint inValueFl = inValueAr + inValueDep;
                    flightCnt[i] = inValueFl;
                    
                    string inValueP;
                    
                    Console.Write("Number of Passengers: ");
                    inValueP = Console.ReadLine();
                    uint inValuePas = Convert.ToUInt32(inValueP);
                    
                    if (inValuePas == 0)
                    {
                        throw new Exception();
                    }
                    
                    passCnt[i] = inValuePas;
                }
                catch
                {
                    Console.WriteLine("Input Error");
                    Console.Write("Press any key to to continue.");
                    Console.Read();
                    
                    Environment.Exit(0);
                }
            }
        
            return i;
        }

        static int DisplayMenu()
        {
          bool b = false;
          int option = 0;
          
            do
             {
               Console.WriteLine("Menu: ");
               Console.WriteLine();
               Console.WriteLine("[1] Add Data");
               Console.WriteLine("[2] Exit");
               Console.WriteLine();
             
               string menu = Console.ReadLine();
             
                if ((int.TryParse(menu, out option)) && option > 0 && option < 3)
                 {
                   b = true;
                 }
                else
                 {
                   Console.WriteLine("Error");
                 }
             }
            while (!b);
          
            if (option == 1)
             {
               AddData(); 
             }
            else if (option == 2)
            {
              Environment.Exit(0);
            }
          
            return option;
          }
     }
}
