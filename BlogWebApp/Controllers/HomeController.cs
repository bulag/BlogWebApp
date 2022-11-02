using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BlogWebApp.Models;
using System.Net.Mail;

namespace BlogWebApp.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/
        BlogDbDataContext vt = new BlogDbDataContext();
        public ActionResult Index(string id)
        {
          int sayfa=0;
            if (id == null || id == "")
            {
                sayfa = 1;
            }
            else sayfa = Convert.ToInt32(id);
            int kactan = 0;
            int kacar = 1;
            var query = from m in vt.makalelers
                        join k in vt.kategorilers on m.kategoriID equals k.ID
                        select new
                        {
                            m.ID,
                            k.kategoriAdi,
                            m.makaleAdi,
                            m.resim,
                            m.makaleKisaAciklama
                        };
           int verisayisi = query.Count();
           double sayfasayisi = Math.Ceiling((float)(verisayisi / kacar));
           ViewBag.sayfasayisi = sayfasayisi;
           ViewBag.sayfa = sayfa;
           kactan=(sayfa*kacar)-kacar;
           query = query.OrderByDescending(x=>x.ID).Skip(kactan).Take(kacar);
           List<makaleHelper> makaleler = new List<makaleHelper>();
           foreach (var item in query) {
                makaleHelper makale = new makaleHelper();
                makale.makaleAdi = item.makaleAdi;
                makale.makaleID = item.ID;
                makale.kategoriAdi = item.kategoriAdi;
                makale.resim = item.resim;
                makale.makaleKisaAciklama = item.makaleKisaAciklama;
                makaleler.Add(makale);
            }
            ViewBag.makaleList = makaleler;
            return View();
        }
        public ActionResult makale(string id)
        {
           int ID = Convert.ToInt32(id);
            var sorgu = from m in vt.makalelers
                        join k in vt.kategorilers on m.kategoriID equals k.ID
                        join y in vt.yoneticilers on m.yazarID equals y.ID
                        where m.ID==ID select new
                        {
                            m.makaleAdi,
                            m.makaleKeyword,
                            m.makaleTitle,
                            m.makale,
                            m.makaleDescription,
                            k.kategoriAdi,
                            y.adi,
                            m.ID,
                            m.resim

                        };
            var yorumS = from y in vt.yorumlars where y.onay == 1 && y.makaleID == ID select y;
            ViewBag.yorumList = yorumS.ToList();
            if (sorgu.Count() > 0)
            {
                makaleHelper makale = new makaleHelper();
                foreach (var item in sorgu)
                {
                    makale.kategoriAdi = item.kategoriAdi;
                    makale.makaleAdi = item.makaleAdi;
                    makale.makaleDescription = item.makaleDescription;
                    makale.makaleKeyword = item.makaleKeyword;
                    makale.makaleAciklama = item.makale;
                    makale.makaleTitle = item.makaleTitle;
                    makale.yazarAdi = item.adi;
                    makale.resim = item.resim;

                }
                return View(makale);
            }
            else
            {
                return RedirectToAction("404");
            }
            
            
        }
        [HttpPost]
        public ActionResult makale(FormCollection frm,string id)
        {
            string isim = frm.Get("isim");
            string email = frm.Get("email");
            string yorum = frm.Get("yorum");
            int ID = Convert.ToInt32(id);
            var sorgu = from m in vt.makalelers
                        join k in vt.kategorilers on m.kategoriID equals k.ID
                        join y in vt.yoneticilers on m.yazarID equals y.ID
                        where m.ID == ID
                        select new
                        {
                            m.makaleAdi,
                            m.makaleKeyword,
                            m.makaleTitle,
                            m.makale,
                            m.makaleDescription,
                            k.kategoriAdi,
                            y.adi,
                            m.ID,
                            m.resim

                        };
            var yorumS = from y in vt.yorumlars where y.onay == 1 && y.makaleID == ID select y;
            ViewBag.yorumList = yorumS.ToList();
            makaleHelper makale = new makaleHelper();
            foreach (var item in sorgu)
            {
                makale.kategoriAdi = item.kategoriAdi;
                makale.makaleAdi = item.makaleAdi;
                makale.makaleDescription = item.makaleDescription;
                makale.makaleKeyword = item.makaleKeyword;
                makale.makaleAciklama = item.makale;
                makale.makaleTitle = item.makaleTitle;
                makale.yazarAdi = item.adi;
                makale.resim = item.resim;

            }
            yorumlar yorum1 = new yorumlar();
            yorum1.makaleID = ID;
            yorum1.isim = isim;
            yorum1.email = email;
            yorum1.mesaj = yorum;
            vt.yorumlars.InsertOnSubmit(yorum1);
            vt.SubmitChanges();
            ViewBag.basarili = "Yorumunuz Gönderildi";
            return View(makale);
        }
        public ActionResult makaleler(string id)
        {
            var sorgu = from k in vt.kategorilers join m in vt.makalelers on k.ID equals m.kategoriID where k.urlsefKadAdi ==id select new {m.makaleAdi,m.resim,k.kategoriAdi,m.makaleKisaAciklama,m.ID};
            List<makaleHelper> makaleler = new List<makaleHelper>();
            int i=0;
             int[] yorumsayisi = new int[sorgu.Count()];
            foreach (var item in sorgu)
            {
               
                makaleHelper hlp = new makaleHelper();
                hlp.kategoriAdi = item.kategoriAdi;              
                hlp.makaleID = item.ID;
                hlp.makaleKisaAciklama = item.makaleKisaAciklama;
                hlp.makaleAdi = item.makaleAdi;
                hlp.resim = item.resim;
                makaleler.Add(hlp);
                ViewBag.kategoriAdi = item.kategoriAdi;
               
                var sorguYorums = from y in vt.yorumlars where y.makaleID == item.ID select y;
                yorumsayisi[i]=Convert.ToInt32(sorguYorums.ToList().Count());
                     i++;
            }
            ViewBag.yorumSayisi = yorumsayisi;
            return View(makaleler);
        }
        public ActionResult hakkimda()
        {
            return View();
        }
        public ActionResult iletişim()
        {
            return View();
        }
       /* [HttpPost]
        public ActionResult iletişim(FormCollection frm)
        {
            string email = frm.Get("email");
            string mesaj = frm.Get("mesaj");
            string isim = frm.Get("isim");
            string body = String.Format("<table><tr><td>İsim</td><td>Email></td><td>Mesaj</td></tr><tr><td>{0}</td><td>{1}</td><td>{2}</td></tr>", isim, email, mesaj);
            mail mail = new mail();
            if(mail.mailGonder(email,"Blog Sitesinden Gelen Mesaj",body)==true){
                ViewBag.mesaj = "Mesajınız Gönderildi En Kısa Zamanda Geri dönülecektir.";
            }
            else{
                ViewBag.mesaj="Mesajınız Gönderilemedi";
            }
            return View();
        }
      */
    }
}
