/* 1202W13As1_Poluektova_Anna - Project
 * AnnaPoluektova_SavingsApp.cs
 * The course code: COMP 1202
 * Student ID: 100786356
 * Author: Anna Poluektova
 * This application calculates the closing balance for the client. 
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace _1202W13As1_Poluektova_Anna
{
    class AnnaPoluektova_SavingsApp
    {
        static void Main(string[] args)
        {

            DisplayWelcome( );
   
            AnnaPoluektova_Savings firstSavingsObject = new AnnaPoluektova_Savings();
            firstSavingsObject.FirstName = AskForFirstName();
            firstSavingsObject.LastName = AskForLastName();
            firstSavingsObject.Sin = AskForSin();
            firstSavingsObject.HomeAddress = AskForHomeAddress();
            firstSavingsObject.PhoneNumber = AskForPhoneNumber();
            firstSavingsObject.OpeningBalance = AskForOpeningBalance();
            firstSavingsObject.Deposit = AskForDeposit();
            firstSavingsObject.ClosingBalance = CalculateClosingBalance(firstSavingsObject.OpeningBalance,
                                      firstSavingsObject.Deposit);
            DisplayResults(firstSavingsObject.FirstName, firstSavingsObject.LastName, firstSavingsObject.Sin,
                           firstSavingsObject.HomeAddress, firstSavingsObject.PhoneNumber,
                           firstSavingsObject.OpeningBalance, firstSavingsObject.Deposit, firstSavingsObject.ClosingBalance);
        
            Console.ReadKey();

        }

        //methods
        public static void DisplayWelcome()
        {
            Console.WriteLine("*****************************************************************");
            Console.WriteLine("*                     Welcome to Anna's Bank!                   *");
            Console.WriteLine("*                Your Manager is Anna Poluektova!               *");
            Console.WriteLine("*****************************************************************");
        }

        public static string AskForFirstName()
        {
            string inValue;
            Console.Write("Enter First Name: ");
            inValue = Console.ReadLine();
            return inValue;
        }
        
        public static string AskForLastName()
        {
            string inValue;
            Console.Write("Enter Last Name: ");
            inValue = Console.ReadLine();
            return inValue;
        }
        
        public static int AskForSin()
        {
            string inValue;
            Console.Write("Enter Social Insurance Number: ");
            inValue = Console.ReadLine();
            return (int.Parse(inValue));
        }
        
        public static string AskForHomeAddress()
        {
            string inValue;
            Console.Write("Enter Home Address: ");
            inValue = Console.ReadLine();
            return inValue;
        }
        
        public static string AskForPhoneNumber()
        {
            string inValue;
            Console.Write("Enter Phone Number: ");
            inValue = Console.ReadLine();
            return inValue;
        }
        
        public static double AskForOpeningBalance()
        {
            string inValue;
            Console.Write("Enter Opening Balance: ");
            inValue = Console.ReadLine();
            return (double.Parse(inValue));
        }
        
        public static double AskForDeposit()
        {
            string inValue;
            Console.Write("Enter Deposit: ");
            inValue = Console.ReadLine();
            return (double.Parse(inValue));
        }

        public static double CalculateClosingBalance(double openingBalance, 
                                            double deposit)
        {
            const double INTEREST = 0.19;
            return ((openingBalance + deposit) * ( 1 + INTEREST));
        }
         
        public static void DisplayResults(string firstName, string lastName, int sin, string homeAddress,
            string phoneNumber, double openingBalance, double deposit, double closingBalance)
        {
            Console.Clear();
            Console.WriteLine("{0,35}", "Closing Balance Calculator");
            Console.WriteLine();
            Console.WriteLine("{0,-25} {1} {2}",
                    "Name:", firstName, lastName);
            Console.WriteLine("{0,-25} {1}", "Social Insurance Number: ",
                    sin);
            Console.WriteLine("{0,-25} {1}", "Home Address: ",
                    homeAddress);
            Console.WriteLine("{0,-25} {1}", "Phone Number: ",
                    phoneNumber);
            Console.WriteLine("{0,-25} {1}", "Opening Balance: ",
                    openingBalance);
            Console.WriteLine("{0,-25} {1}", "Deposit: ",
                    deposit);
            Console.WriteLine("{0,-25} {1}", "Closing Balance: ",
                    closingBalance);
        }
    }
}

     
