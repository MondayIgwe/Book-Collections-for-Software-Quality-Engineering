using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Support.Utils
{
    public static class CommonDates
    {

        /// <summary>
        /// Documenting what the code does
        /// Method to parse a dynamic date
        /// i.e 'd/m/y' or 'd+20/m/2021' or to send further
        /// to another function if it decides that the need
        /// is for an extraction rather than a simple parse
        /// </summary>
        /// <param name="date">the date in dynamic format</param>
        /// <returns>a string in the MM/dd/yyyy format</returns>
        public static string DateParser(string date) // e.g 12/04/2022
        {
            if ((date.Split('/')).Length != 3)
            {
                return date;
            }

            // decides if we are in for an extraction
            if (date.Contains("x"))
            {
                return DateExtracter(date);
            }

            // split the date to smaller pieces
            string day = date.Split('/')[0];
            string month = date.Split('/')[1];
            string year = date.Split('/')[2];
            string dateBuilt = string.Empty;
            DateTime currentDate = DateTime.Now.Date;

            // check if the day is dynamic else it's fixed
            if (day.Contains('d'))
            {
                // add the current day instead of the dynamic letter
                dateBuilt += currentDate.Day.ToString() + '/';

                // keep the potential addition/substraction to change the date later
                day = day.Substring(1);
            }
            else
            {
                // the day is given already so we just concat it
                dateBuilt += day + '/';
                day = string.Empty;  // Resetting the day variable to store empty value
            }

            // check if the month is dynamic else it's fixed
            if (month.Contains('m'))
            {
                // add the current month instead of the dynamic letter
                dateBuilt += currentDate.Month.ToString() + '/';

                // keep the potential addition/substraction to change the date later
                month = month.Substring(1);
            }
            else
            {
                // the month is given already so we just concat it
                dateBuilt += month + '/';
                month = string.Empty;
            }

            // check if the year is dynamic else it's fixed
            if (year.Contains('y'))
            {
                // add the current year instead of the dynamic letter
                dateBuilt += currentDate.Year.ToString();

                // keep the potential addition/substraction to change the date later
                year = year.Substring(1);
            }
            else
            {
                // the month is given already so we just concat it
                dateBuilt += year;
                year = string.Empty;
            }

            // turn the dateBuilt above into a real DateTime
            try
            {
                currentDate = DateTime.ParseExact(dateBuilt, "d/M/yyyy", CultureInfo.InvariantCulture);
            }
            catch (FormatException)
            {
                try
                {
                    if (dateBuilt.Contains("31"))
                    {
                        currentDate = DateTime.ParseExact(dateBuilt.Replace("31", "30"), "d/M/yyyy", CultureInfo.InvariantCulture);
                    }
                }
                catch (FormatException)
                {
                    return dateBuilt;
                }
            }
            // if we still have numbers for the day, add/substract them
            if (day != string.Empty)
            {
                currentDate = currentDate.AddDays(Convert.ToDouble(day));
            }

            // if we still have numbers for the month, add/substract them
            if (month != string.Empty)
            {
                currentDate = currentDate.AddMonths(Convert.ToInt32(month));
            }

            // if we still have numbers for the year, add/substract them
            if (year != string.Empty)
            {
                currentDate = currentDate.AddYears(Convert.ToInt32(year));
            }

            // return the result in the application format
            return currentDate.ToString("MM/dd/yyyy");
        }

        /// <summary>
        /// Method to handle the extraction of a part of the date
        /// after the calculations are over
        /// i.e 'x/x/y+3'
        /// </summary>
        /// <param name="date">the date in dynamic format</param>
        /// <returns>a string representing a piece of the date</returns>
        private static string DateExtracter(string date)
        {
            // split the date to smaller pieces
            string day = date.Split('/')[0];
            string month = date.Split('/')[1];
            string year = date.Split('/')[2];
            DateTime currentDate = DateTime.Now.Date;

            // if the day is not 'x', then we have to extract this, else we skip
            if (day != "x")
            {
                // check if the day is not dynamic, then return the hardcoded desired value
                if (!day.Contains('d'))
                {
                    return day;
                }

                day = day.Substring(1);

                if (day != string.Empty)
                {
                    currentDate = currentDate.AddDays(Convert.ToDouble(day));
                }

                return currentDate.Day.ToString();
            }

            // if the month is not 'x', then we have to extract this, else we skip
            if (month != "x")
            {
                // check if the month is not dynamic, then return the hardcoded desired value
                if (!month.Contains('m'))
                {
                    return month;
                }

                month = month.Substring(1);

                if (month != string.Empty)
                {
                    currentDate = currentDate.AddMonths(Convert.ToInt32(month));
                }

                return currentDate.Month.ToString();
            }

            // if the year is not 'x', then we have to extract this, else we skip
            if (year != "x")
            {
                // check if the year is not dynamic, then return the hardcoded desired value
                if (!year.Contains('y'))
                {
                    return year;
                }

                year = year.Substring(1);

                if (year != string.Empty)
                {
                    currentDate = currentDate.AddYears(Convert.ToInt32(year));
                }

                return currentDate.Year.ToString();
            }

            return string.Empty;
        }
    }
}
