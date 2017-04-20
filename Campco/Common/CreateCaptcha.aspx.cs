using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Collections;
using System.Text;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
//--------------Nisha Patel -----------------------------------
namespace Campco.Common
{
    public partial class CreateCaptcha : System.Web.UI.Page
    {
//--------------Nisha Patel -----------------------------------
        protected void Page_Load(object sender, EventArgs e)
        {
            // CreateCaptchaImage();
            // Response.Clear();
         #region Captcha Code creation
            int height = 30;
        int width = 100;
        Bitmap bmp = new Bitmap(width, height);
        RectangleF rectf = new RectangleF(10,5, 0, 0);
        Graphics g = Graphics.FromImage(bmp);
        g.Clear(Color.Gray);
        g.SmoothingMode = SmoothingMode.AntiAlias;
        g.InterpolationMode = InterpolationMode.HighQualityBicubic;
        g.PixelOffsetMode = PixelOffsetMode.HighQuality;
        g.DrawString(SessionVariable.Captcha, new Font("Times New Roman", 14, FontStyle.Bold), Brushes.Black, rectf);
        g.DrawRectangle(new Pen(Color.Gray), 1, 1, width-2, height-2);
        g.Flush();
        Response.ContentType = "image/jpeg";
        bmp.Save(Response.OutputStream, ImageFormat.Jpeg);
        g.Dispose();
        bmp.Dispose();
        #endregion
        }
    }
}