namespace MasterSystem.Common
{
    using System;

    public class Clarion
    {
        public static DateTime BaseDate = new DateTime(0x708, 12, 0x1c);

        public static int GetMonth(int intDate)
        {
            return BaseDate.AddDays((double)intDate).Month;
        }

        public static int GetYear(int intDate)
        {
            return BaseDate.AddDays((double)intDate).Year;
        }

        public static int NowTimeInt
        {
            get
            {
                return (((((DateTime.Now.Hour * 0xe10) + (DateTime.Now.Minute * 60)) + DateTime.Now.Second) * 100) + 1);
            }
        }

        public static int TodayInt
        {
            get
            {
                return DateTime.Today.Subtract(BaseDate).Days;
            }
        }

        public static DateTime IntToDate
        {
            get
            {
                return Convert.ToDateTime("19000101");
            }
        }
    }
}