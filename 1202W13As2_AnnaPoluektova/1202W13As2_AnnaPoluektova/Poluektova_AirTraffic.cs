/* 1202W13As2_AnnaPoluektova - Project
 * Poluektova_AirTraffic.cs
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
    public class Poluektova_AirTraffic
    {
        private string airportLocation;
        private string[] dateName;
        private uint [] flightCount;
        private double avg;
        private uint maxFlightCount;
        private string maxDate;
        private string monthWithMostFlights;
        private uint[] passCount;
        private uint maxPassCount;
        
        //Default constructor
        public Poluektova_AirTraffic()
        {

        }
        
        //Constructor
        public Poluektova_AirTraffic(string airLoc, string[] date, uint[] flightcnt, uint[] passcnt, uint numOfFlights)
        {
            dateName = new string[numOfFlights];
            flightCount = new uint[numOfFlights];
            passCount = new uint[numOfFlights];
            Array.Copy(date, 0, dateName, 0, numOfFlights);
            Array.Copy(flightcnt, 0, flightCount, 0, numOfFlights);
            Array.Copy(passcnt, 0, passCount, 0, numOfFlights);
            airportLocation = airLoc;
        }
        
        //Properties
        public string AirportLocation
        {
            get
            {
                return airportLocation;
            }
            set
            {
                airportLocation = value;
            }
        }

        public string MonthWithMostFlights
        {
            get
            {
                DetermineMax();
                return monthWithMostFlights;
            }
        }

        public double Avg
        {
            get
            {
                CalculateAvg();
                return avg;
            }
        }

        public uint MaxFlightCount
        {
            get
            {
                DetermineMax();
                return maxFlightCount;
            }
        }

        public uint MaxPassCount
        {
            get
            {
                DetermineMax();
                return maxPassCount;
            }
        }

        public string MaxDate
        {
            get
            {
                DetermineMax();
                return maxDate;
            }
        }

        //Determines what the average number of flights is per location
        public void CalculateAvg()
        {
            int total = 0;
            foreach (int c in flightCount)
                total += c;
            avg = total / flightCount.Length;
        }

        //Determines the maximum number of flights serviced on any one given date. Method to set the Month name
        public void DetermineMax()
        {
            int maxCntIndex1 = 0;
            for (int i = 0; i < flightCount.Length; i++)
                if (flightCount[i] > flightCount[maxCntIndex1])
                    maxCntIndex1 = i;
            maxFlightCount = flightCount[maxCntIndex1];
            maxDate = dateName[maxCntIndex1];
            monthWithMostFlights = ReturnMonth(maxDate);
            int maxCntIndex2 = 0;
            for (int i = 0; i < passCount.Length; i++)
                if (passCount[i] > passCount[maxCntIndex2])
                    maxCntIndex2 = i;
            maxPassCount = passCount[maxCntIndex2];
        }

        //Given a month number the average is computed for a given location
        public double ComputeMonthAvg(string mon)
        {
            int total = 0;
            int days = 0;
            double monAverage;
            for (int i = 0; i < dateName.Length; i++)
            {
                if (dateName[i].StartsWith(mon))
                {
                    total += (int)flightCount[i];
                    days++;
                }
            }
            if (days > 0)
                monAverage = total / days;
            else
                monAverage = 0;
            return monAverage;
        }

        //Given a date in the format of mm/dd/yyyy the name of the month is returned
        public string ReturnMonth(string someDate)
        {
            string[] monthName = {"January", "February", "March",
                                      "April", "May", "June", "July",
                                      "August", "September", "October",
                                      "November", "December"};
            string[] dateParts = someDate.Split('/');
            dateParts[0] = dateParts[0].TrimStart('0');
            return monthName[Convert.ToUInt32(dateParts[1]) - 1];
        }
    }
}
