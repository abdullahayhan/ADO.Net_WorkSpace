using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MyFirstDemoPage : System.Web.UI.Page
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        /*
         Bu olay, sayfa ön hazırlık işlemleri yapılmadan önce tetiklenir. Örneğin, sayfanın görünümünün belirlenmesi veya kullanıcı tarafından yapılandırılması 
         gibi işlemler bu olayda yapılabilir.
         */
        Response.Write("Pre init event fired<br/>");
    }
    protected void Page_Init(object sender, EventArgs e)
    {
        /*
         Bu olay, sayfa başlangıç işlemleri yapılmadan önce tetiklenir. Örneğin, sayfadaki kontrollerin oluşturulması veya veritabanından 
         veri alınması gibi işlemler bu olayda yapılabilir.
         */
        Response.Write("Init event fired<br/>");
    }
    protected void Page_InitComplete(object sender, EventArgs e)
    {
        /*
         Bu olay, sayfa başlangıç işlemlerinin tamamlandığı anda tetiklenir. Örneğin, 
         sayfadaki kontrollerin oluştuğu veya veritabanından veri alındığı anda bu olay tetiklenir.
         */
        Response.Write("Init Complete event fired<br/>");
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            Response.Write("Page loaded for the first time");
        else
        {
            Response.Write("This is a post back");
        }


        lblDateTimeNow.Text = DateTime.Now.ToString();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Write("Inside Button Click Event");
    }
}