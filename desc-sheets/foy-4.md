## Web Servisleri Nedir? Nerelerde Kullanılır?

_Bu dökümanda oluşturulan web service kullanımına ilişkin Web sitesi örneğine [buradan](https://github.com/nurtemiz/web-service-samples) ulaşabilirsiniz._

Web Servisleri, web üzerinden HTTP protokolü ile hizmet veren program parçalarıdır. Genel anlamda farklı uygulamaların ağ üzerinden haberleşmesini sağlayan ve iletişimini standart bir XML mesajlaşma sistemi kullanarak gerçekleştiren bir yazılım parçasıdır. Burada XML, bir web servisindeki tüm iletişimleri kodlamak için kullanılır. Örneğin, bir istemci bir XML iletisi göndererek bir web hizmetini çağırır, ardından karşılık gelen bir XML yanıtı bekler. Tüm iletişim XML türünden gerçekleştirildiği için web servisi herhangi bir işletim sistemine veya programlama diline bağlı değildir. Hangi dilde ve/veya platformda geliştirildiklerinin bir önemi olmadığı için farklı sistemler arasında veri alış verişi yapmamıza olanak sağlar. Örneğin .NET’te yazılmış bir servis ile PHP’de yazılmış bir uygulama bir biri ile iletişim kurabilir.

Bir uygulamanın fonksiyonlarını, internet üzerinden çok geniş bir kullanıcı kitlesine açmak Web servisleri ile mümkündür. Örneğin; Merkez bankasından döviz kurlarını web sitelerinin, bankaların, ajansların vs.. alması.

**Web servislerden bahsederken 2 önemli özeliğine de değinmek gerekmektedir:**

•	interoperability (birlikte çalışabilirlik)
•	extensibility (genişleyebilirlik/geliştirilebilirlik)

ve bu özellikleri gerçekleştirmek için XML/JSON işaretleme dillerinden faydalanılır. Sistemler arası veri transferi bu işaretleme dilleri aracılığı ile hızlı bir şekilde gerçekleştirilebilir.

**Web Servislerin iki temel kullanımı vardır:**

•	Reusable application-components (Yeniden kullanılabilir uygulama bileşenleri): Bazı uygulama bileşenleri birden fazla yerde değişik şekillerde kullanılabilir. Web servisler bunu sağlayabilir. Örneğin para birimi dönüşümü, hava durumu raporları veya dil tercümanlığını dahi servis olarak uygulama bileşeni halinde sunabilir.
•	Connect existing software: Web Servisler verilen farklı uygulamaların veri bağlantısı için birliktelik(interoperability) problemini çözmenize yardım edebilir. Web Servisleri ile veriyi farklı uygulamalar ve farklı platformlar arasında değiştirebilirsiniz.

**Web servisler ile diğer programlama dilleri veya diğer platformlardan xml ile erişilebilir bu sayede platformdan ve programlama dilinden bağımsız olarak aynı uygulamayı yapabiliriz. Bunun için temel platform elemenleri şunlardır:**
•	SOAP (Simple Object Access Protocol)
•	UDDI (Universal Description, Discovery and Integration)
•	WSDL (Web Services Description Language)

**SOAP(Simple Object Access Protocol):**SOAP, XML tabanlı uygulamalarda HTTP üzerinden bilgi değişimine izin veren protokoldür. Basitçe SOAP, Web Servis erişimi için protokoldür. RPC (Remote Procedure Call, DCOM, IIOP (Internet Inter-ORB Protocol) ve Java RMI bu çözümlerden bazılarıdır. SOAP,  mesaj göndermek için bir formattır. Internet üzerinden iletişim kurmak amacıyla tasarlanmıştır. Platformdan ve programlama dilinden bağımsızdır. Firewall geçebilmeye izin verir. W3C standardıdır. 

**WSDL(Web Services Description Language): **WSDL, XML tabanlı web servisleri tanımlamak ve yerini belirtmek için tanımlanmış dildir. WSDL, W3C standardıdır. Bir anlamda dağıtık programlamada kullanılan IDL’e (Interface Definition Language – Arayüz Tanımlama Dili) benzer. Web servisi tanımı işlemler, giren ve çıkan mesaj formatları, ağ ve port adresleri gibi bilgileri tanımlar. Bir web servisi tanım belgesi aşağıdaki temel elemanları içerir:
•	Types: mesajlarda kullanılacak veri tiplerini belirtir.
•	Message: İletişimde kullanılacak measjları tanımlar.
•	PortType : Web servisinin içerdiği işlemleri (methods) ve ilgili mesajları tanımlar.
•	Binding : İşlem ve mesajlarda kullanılacak veri formatlarını tanımlar.
•	Port: Binding ve web adresinden oluşan servis noktasını tanımlar. Web adresi servisin çalıştırılacağı URL’dir.
•	Service: Kullanılan port’lar kümesidir.

**UDDI(Universal Description, Discovery and Integration):** Şirketlerin web servisler için kayıt edebildiği ve arayabildiği dizin servisidir. UDDI Kurum Kayıt Servisi (UDDI Business Registry) kurum ve web servisleri bilgilerini saklayan sunuculardır. Bu sunucular servis sağlayıcılarından gelen bilgilerini kendi veritabanlarına kayıt ederek diğer kurumların erişimine açar. Şu anda aktif olarak çalışan kurum kayıt sunucuları uddi.microsoft.com ve uddi.ibm.com ‘dur.

UDDI, web servisler hakkında bilgi depolandığı dizinlerdir. WSDL tarafından tanımlanmış web servis arayüz (interface) dizinidir. SOAP üzerinden iletişim kurar. Microsoft .NET platformu üzerine kurulmuştur.

![image4.1](/desc-sheets/images/foy-4/4.png) 

**Bir web servisi istemcisinin bir servis sağlayıcıdan bir servisi çağırma aşamasındaki temel adımlar:**

•	Web servisi istemcisi (SOAP Client) servis kayıt biriminden (UDDI) web servisini bulur. 
•	İstemci bir SOAP mesajı hazırlar. SOAP mesajı bir XML belgesidir. 
•	İstemci SOAP mesajını web server veya uygulama sunucusunda çalışan SOAP istek dinleyicisine gönderir. İstek dinleyici gelen isteklere cevap veren sunucu programlardır.  Bu programlar bir JSP, ASP, CGI veya ISAPI programıdır. 
•	SOAP sunucu gelen SOAP mesajını parse eder ve gerekli parametreleri göndererek istenen nesnenin istenen yöntemini çağırır. 
•	Çağırılan nesnedeki yöntem çalışır ve sonuçları SOAP sunucusuna gönderir. SOAP sunucusu gelen sonucu SOAP mesajı formatında biçimlendirerek istemciye gönderir. 
•	İstemci gelen SOAP mesajının içindeki bilgileri alarak istekte bulunan programa gönderir.

## UYGULAMA

Burada bir web service oluşturulup ve bir web form tarafından kullanılımı gösterilmiştir.

•	Microsoft SQL Server'da, üzerinde işlem yapılacak olan veri tabanının oluşturulması ve tabloların oluşturulup verilerin girilmesi:

![image4.2](/desc-sheets/images/foy-4/4-1.png) 

![image4.3](/desc-sheets/images/foy-4/4-2.png)

![image4.4](/desc-sheets/images/foy-4/4-3.png)

![image4.5](/desc-sheets/images/foy-4/4-4.png)

![image4.6](/desc-sheets/images/foy-4/4-5.png)

![image4.7](/desc-sheets/images/foy-4/4-6.png)

![image4.8](/desc-sheets/images/foy-4/4-7.png)

•	Ürün id-sine göre o ürüne ait satırı getiren saklı yordamın (Stored Procedure) oluşturulması:

![image4.9](/desc-sheets/images/foy-4/4-8.png)

![image4.10](/desc-sheets/images/foy-4/4-9.png)

**-fetch_info-** isimli bir prosedür oluşturuldu. Bu prosedürde parametre olarak “@productID” değeri alınır ve web servisine gönderilecek olan parametre değeri de bu değer olacaktır. Böylece her hangi bir web servisinden istek yapıldığında, sadece productID değeri ile o değere ait bilgileri istek yapılan yere sağlayabiliriz. 

•	Visual Studio IDE ortamında bir Web service örneği oluşturmak için gerçeklenen adımlar aşağıdaki gibidir. Yeni bir web projesi oluşturulması:

_File -> New -> Project_

![image4.11](/desc-sheets/images/foy-4/4-10.png)

_Web -> ASP.NET Web Application (.NET Framework) -> Empty_

![image4.12](/desc-sheets/images/foy-4/4-11.png)

![image4.13](/desc-sheets/images/foy-4/4-12.png)

•	Oluşturulan projeye web service eklenmesi:

_Projeye sağ click -> Add -> New Item… -> Web Service_

![image4.14](/desc-sheets/images/foy-4/4-13.png)

![image4.15](/desc-sheets/images/foy-4/4-14.png)

Oluşturulan web servisi browserda görmek için:

![image4.16](/desc-sheets/images/foy-4/4-15.png)

Web servisinde hazır olarak yazılmış ve “Hello World” değerini istek yapan kullanıcıya döndüren metod bulunmaktadır. 

![image4.17](/desc-sheets/images/foy-4/4-16.png)

Web servise tıkladığında web servisi kullanacak kişilerin isteklerini gönderecekleri “POST” metodunun görüntülenmesi için “Çağır” metoduna tıklanarak web serviste gönderilecek bilgileri görüntüleyebiliriz.

![image4.18](/desc-sheets/images/foy-4/4-17.png)

Web servis “XML” formatında bilgi döndürmektedir.

•	Veri tabanının projeye bağlantısının yapılması: 

Burada veri tabanı bağlantısı için Entity Framework(EF) kullanılacak olup, EF .Net platformunda ORM (Object Relational Mapping) araçlarından biridir. ORM (Object Relational Mapping) ise veritabanı ile nesneye yönelik programlama (OOP) arasındaki ilişkiyi kuran teknolojidir. Yani Entity Framework, nesne tabanlı programlamada veritabanındaki tablolara uygun nesneler oluşturma tekniğidir.

_Solution Explorer’de projemize sağ tıklayıp “Add > New Item“e tıklıyoruz. Açılan listede “Ado.Net Entity Data Model“i seçip isim vererek “Add” butonuna tıklıyoruz._

![image4.19](/desc-sheets/images/foy-4/4-18.png)

![image4.20](/desc-sheets/images/foy-4/4-19.png)

“Add” butonuna tıklayınca “Choose Model Contents” ekranı gelir. Bu ekranda bize iki araç sunmaktadır. Eğer önce model oluşturup daha sonra veritabanı oluşturacaksanız Empty modeli, var olan veritabanınından model oluşturacaksanız Generate from database‘yi seçmelisiniz.  Biz var olan veritabanı üzerinde çalışacağımız için Generate from database‘yi seçip Next butonuna tıklıyoruz. 

Sonrasında Choose Your Data Connection ekranına geliriz. Burada veritabanını seçmemiz gerekmektedir. New Connection butonuna tıklayarak veritabanınızı seçiniz.

![image4.21](/desc-sheets/images/foy-4/4-20.png)

![image4.22](/desc-sheets/images/foy-4/4-21.png)

Veritabanı bağlantı işlemlerini tamamladıktan sonra görüntüde olduğu gibi veritabanını buldu. Next butonuna tıklayıp devam edildiğinde sonraki ekranda Tables menüsü altında veritabanını ve tabloları seçip modeli isim alanını (namespace) belirlenir.

Sonraki pencere de ise Finish butonuna tıklayıp veritabanı yapısına uygun modellerimizin oluşması tamamlanmış olur. Bu çalışma için iki tablo oluşturduğumuz için model görüntüsü aşağıdaki ekran görüntülerinde olduğu gibi olacaktır.

![image4.23](/desc-sheets/images/foy-4/4-22.png)

![image4.24](/desc-sheets/images/foy-4/4-23.png)

![image4.25](/desc-sheets/images/foy-4/4-24.png)

•	Projeye web form eklenmesi:

_Solution Explorer’de projemize sağ tıklayıp “Add > New Item“e tıklanarak, açılan pencerede Web kısmından WebForm seçilir._

![image4.26](/desc-sheets/images/foy-4/4-25.png)

Programın çalıştırılması:

![image4.27](/desc-sheets/images/foy-4/4-26.png)

![image4.28](/desc-sheets/images/foy-4/4-27.png)

![image4.29](/desc-sheets/images/foy-4/4-28.png)

![image4.30](/desc-sheets/images/foy-4/4-29.png)

![image4.31](/desc-sheets/images/foy-4/4-30.png)

![image4.32](/desc-sheets/images/foy-4/4-31.png)

## UYGULAMA 2

[TCverificationWebService](https://github.com/nurtemiz/windows-form-app/tree/master/TCverificationWebService) : XML Web Servisi kullanarak [adresinde](http://tckimlik.nvi.gov.tr) hizmete sunulan vatandaşlık numarası doğrulama hizmetini ele alan bir Windows Form örneğidir. 

- Windows Form projesinin oluşturulması:

_File -> New -> Project_

![image4.33](/desc-sheets/images/foy-4/4-32.png)

Formun tasarlanması:

![image4.34](/desc-sheets/images/foy-4/4-33.png)

T.C. İçişleri Bakanlığı Nüfus ve Vatandaşlık İşleri Genel Müdürlüğü tarafından kullanıma sunulan web servisinin projeye eklenmesi:

**DİKKAT: **KPS Servisi yalnızca SSL (https adresi) üzerinden hizmet veriyor.

Bu servisi proje içerisinde kullanabilmek için öncelikle Solution Explorer içerisinde yer alan References alanına sağ tıklayalım ve Add Service Reference… seçeneğini seçelim.

Açılan ekranda Address bölümüne servisin WSDL dosyasının [adresini](https://tckimlik.nvi.gov.tr/Service/KPSPublic.asmx?WSDL) verelim, Namespace bilgisi olarak “Kimlik” kullanalım ve GO butonuna tıklayıp, servisin Services bölümünde listelenmesini sağlayalım.

![image4.35](/desc-sheets/images/foy-4/4-34.png)

![image4.36](/desc-sheets/images/foy-4/4-35.png)

Bu işlemlerin ardından OK butonuna tıklayarak servis referansının projeye eklenme sürecini tamamlayalım. 

Şimdi de, servise çağrı yapıp sonucu alacak olan kodları projeye ekleyelim. Bunun için btnDogrula isimli buton kontrolünün Click olayına aşağıdaki metodu bağlayalım.

```C#
private void button1_Click(object sender, EventArgs e)
        {
            long tcno = long.Parse(textBox1.Text);
            int birtdate = int.Parse(textBox4.Text);

            bool? state;
            try
            {
                using (Kimlik.KPSPublicSoapClient service = new Kimlik.KPSPublicSoapClient())
                {
                    state = service.TCKimlikNoDogrula(tcno, textBox2.Text.ToUpper(), textBox3.Text.ToUpper(), birtdate);
                }
            }
            catch
            {
                state = null;
            }

            MessageBox.Show(state.ToString());
        }
```

Uygulamanın çelıştırılması:

![image4.37](/desc-sheets/images/foy-4/4-36.png)

![image4.38](/desc-sheets/images/foy-4/4-37.png)

![image4.39](/desc-sheets/images/foy-4/4-38.png)

![image4.40](/desc-sheets/images/foy-4/4-39.png)

_**Nur TEMİZ**_

