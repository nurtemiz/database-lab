### Constraints(Kısıtlar), View (Görünüm) ve Indeks yapılarının araştırılması

#### 1.	Kısıtlar: 

Veritabanı üzerinde iş kurallarını zorunlu kılmak ve tablolar arasında ilişki kurarak veri bütünlüğünü sağlamak amacıyla oluşturulur. ( Postgresql kısıtlamaları; check, not null, unique, primary keys  )  Diğer VTYS sistemlerinde de benzer kısıtlar vardır.

Veri üzerindeki mantıksal sınırlamalara kısıt adı verilir. Kısıtların genel olması tercih edilen bir durumdur. Kısıtlar, veri modellerinde bütünlük sağlamak için kullanılır. Kısıtlamalar, tabloların tanımlanmasıyla beraber oluşan öğelerdir.

Kısıtlamalar ile Rule (kural) ve Default’ların (varsayılan) yapabileceği işler yapılabilir. Constraint’ler tablo oluştururken yani CREATE TABLE komutuyla tanımlanabilir. Tablo oluşturulmuşsa ALTER TABLE komutuyla bu işlem gerçekleşir. ALTER TABLE komutuyla kullanıldığında sütunlara girilen bilgilerin dikkate alınması gerekir.

•	**SQL Primary key:** Birincil anahtar kısıtlayıcı anlamındadır. Aynı olmayan değerler girilmesini sağlar. Bu da her kaydın farklı olması demektir. Her tablonun en fazla 1 adet Primary Key Constraint’i olabilir.

•	**SQL Foreign key:** Yabancıl anahtar kısıtlayıcı anlamındadır. Bir tablodaki bir sütuna ait verilerin başka bir tablonun belirli bir sütunundan gelmesini denetler.

•	**SQL Not Null Constraint:** Girilen Degerin Boş olmamasını sağlar.Kullanıcı boş bırakamaz..

•	**SQL Unique Key:** Bu sınırlama her satır veya sütun ayrı bir değere sahip olmasını sağlar. Sütun (lar) değerleri çoğaltılamaz. Ancak boş değer ama olabilir.(primary keyden farkı budur)

•	**SQL Check Constraint:** Kontrol kısıtlayıcı anlamındadır. Belirtilen formata göre verilerin girilmesini sağlar. Örneğin, T.C.Kimlik Num alanına 11 karakterin girilmesi Check Constraint ile sağlanabilir. Server/Client veya Web tabanlı uygulamalarda bu kontrolü client tarafında yapılması tavsiye edilir.

•	**Default Kısıtlayıcısı:** Varsayılan kısıtlayıcı anlamındadır. Tablodaki herhangi bir alan için girilmesi gereken bir değerin atanmasıdır. INSERT komutu için geçerlidir. Örneğin, kişi bilgilerinin alındığı bir tabloda kişinin uyruğunun girilmesi işleminde varsayılan değer olarak “T.C.” atanabilir.

#### 2.	View Kullanımı:

View’ lar hazırlanmış sql cümleleri olarak bilinir. Sadece çağırıldıklarında veri kümesini üretirler. Veritabanı programcılığında önemlidir. Sql komutlarından view oluşturma ve faydaları:

•	**Veri güvenliği:** Veri tabanı içinde bulunan tablolardaki bazı sütunlarda bulunan bilgilerin, herkes tarafından görülmesi istenmeyebilir.Örneğin, personelin maaşlarının herkes tarafından listelenebilir olması mahsurlu olabilir. Bu durumda, Personel adlı temel (base) tablodan, persview adlı bir view oluşturulabilir.Bir temel tablodan bir view oluşturulurken, temel tablodaki aynı sütun (alan) isimlerini kullanmak zorunda değildir.

•	**Sorgulamanın daha basit hale gelmesi:** Karmaşık sorgulamalarda, bazı SELECT komutlarının sonuçları diğer SELECT komutlarınca kullanıldığında, sorgulamanın düzenlenmesinde yanlışlıklar yapma olasılığı artar.    Karmaşık sorgulamalar, VIEW özelliği kullanılarak daha basit hale getirilebilir. Burada temel fikir şudur: Mademki bir view, bir sorgulama sonucu elde edilen bilgiyi (tabloyu) isimlendirerek elde edilen bir virtüel tablodur; o halde karmaşık SELECT komutu içinde, sonucu kullanılacak başka bir SELECT komutu kullanmak yerine, bu sonucu bir view olarak isimlendirerek, view adını kullanmak. Bazı durumlarda ise, işletmenin veri tabanı uygulamasında çok sık olarak sorulan karmaşık soruları bir view yapısı içinde saklayarak, daha sonra aynı tip sorgulamalar için bu view yapısını kullanarak daha basit ifadeler kullanmakta olasıdır.

•	**Sadece view kullanılarak gerçekleşebilen sorgulamalar:** Bir tablodan elde edilecek bilgiler için, iki kademeli işlem gerektiren sorgulamalarda, ilk adımda bir view oluşturup ikinci adımda esas sorgulamayı bu view yardımı ile gerçekleştirmek, çoğu kez kaçınılmaz bir durumdur.   

#### 3. Indexler:

Bir index, veri tabanı ortamında bir tablo ya da bir view gibi bir nesnedir ve ilişkili olarak kullanıldığı tablo ya da view’deki satırların, indexleme alanı (key field (anahtar alan)) olarak kullanılan kolondaki verilere göre sıralanmış biçimde işleme sokulmasını (listeleme ya da arama işlemi) sağlar.

Bir tablo, indexlenmiş ise, bu tablo içinde gerçekleştirilecek bir arama (search) ya da koşullu listeleme (SELECT komutu ile) işlemi çok daha hızlı biçimde gerçekleştirilebilecektir.

Genel olarak veritabanlarında veri miktarı arttıkça, tüm veriye ulaşımın maliyeti de benzer oranda artar. 

Mesela aynı tablo için 100 kayıtla çalışmak ile 1 milyon kayıtla çalışmak arasında aradığınız veriye ulaşım açısından çok buyuk maliyet farkı vardır. Bu maliyet genel olarak CPU ve disk erişimi olarak karşımıza çıkacaktır. Eğer veritabanınız başka bir makine üzerinde ise buna ilaveten bir de network kullanımı maliyeti eklenecektir.

**İndekslemenin dezavantajı:**

İndeksleme, sabit diskte ekstra yer tutar. Verdiği performans artışının yanında karşılaştırılabilecek kadar bile değildir ancak veritabanınızdaki her tablonun her sütununda indeks oluşturursanız, sabit diskinizin umduğunuzdan çok daha çabuk dolduğuna şahit olabilirsiniz!

İndeksleme INSERT, UPDATE ve DELETE komutlarının çalıştırılma sürelerinde yavaşlamaya neden olur. Yine bu yavaşlamanın gözle görülür bir fark olduğu söylenemez, ama MySQL’in tablolarda INSERT, UPDATE ve DELETE ile güncelleme yaparken indeks alanlarını da uygun şekilde güncellediğini unutmamak gerekir.

**Yani her tablonun her sütununu indekslememek gerekir!**

#### İndeksleme kararı nasıl verilir?

Hangi sütunda indeksleme yapacağınıza aslında sizin ihtiyaçlarınız yön veriyor. Sık sık yazdığınız sorgu cümleleri, aramalarda kullanılacak alanlar genelde indeks için uygun alanlar olurlar.

İndeksleme için en güzel aday sorgu cümlelerinde “WHERE” kelimesinden sonra yazdığınız alanlardır. Yazdığınız sorgu cümlelerinde bu şekilde öne çıkan bir sütun varsa o sütun indeks oluşturmak akıllıca olacaktır.

İndeksleme için bir diğer aday sütunlar ise, içlerinde farklı değerler tutan alanlardır. Yukarıdaki tablomuzu düşünürsek, “cinsiyet” alanı indeksleme için pek de uygun sayılmaz, çünkü tutabileceği iki farklı değer vardır, “E” veya “K”. Bu alanda bir indeks oluşturulsa bile MySQL yine de toplam satırların yarısını taramak zorunda kalacaktır, bize pek performans getirisi sağlamaz. Bunun yerine hemen hemen her satırda farklı değerlerin tutulduğu sütunlar indeksleme için kullanışlı olabilirler.

İndekslemede arama maliyeti ile DML işlemleri sonrası indeksin güncellenme maliyeti arasında kararı veritabanı yöneticisi verir.

Veritabanı yöneticisinin deneyimi ve tecrübesi bu noktada önemli rol oynar.

•	**Index Yaratma:** SQL’de bir tablo ile ilişkili olarak index yaratmak için gerekli komut CREATE INDEX komutudur. 

•	**Tek bir alana göre artan sırada indexleme:** İşletmede çalışan personeli maaşlarına göre artan sırada listelemek istersek, maaş alanına göre bir index oluşturmalıyız.

•	**Veri Tabanından Index Kaldırmak:**  Drop index  index_name  


### UYGULAMA

PostgreSQL veri yönetim sistemi üzerinde “foy2” isminde bir veri tabanı oluşturuldu.

•	Oluşturulan bu veri tabanında, client_master tablosunun oluşturulması:

![image2.1](/desc-sheets/images/foy-2/2-1.png)

_Resim2.1 client_master tablosunun oluşturulması_

•	client_master tablosuna veri girişi:

![image2.2](/desc-sheets/images/foy-2/2-2.png)
 
_Resim2.2 client_master tablosuna veri girilmesi_

![image2.3](/desc-sheets/images/foy-2/2-3.png)

_Resim2.3 client_master tablosundaki bütün verilerin listelenmesi_

•	product_master tablosunun oluşturulması:

![image2.4](/desc-sheets/images/foy-2/2-4.png)

_Resim2.4  product_master tablosunun oluşturulması_

•	product_master tablosuna veri girişi:

![image2.5](/desc-sheets/images/foy-2/2-5.png)

_Resim2.5 product_master tablosuna verilerin girilmesi_

![image2.6](/desc-sheets/images/foy-2/2-6.png)

_Resim2.6 product_master tablosundaki bütün verilerin görüntülenmesi_

•	salesman_master tablosunun oluşturulması:

![image2.7](/desc-sheets/images/foy-2/2-7.png)

_Resim2.7  salesman_master tablosunun kısıtlarıyla beraber oluşturulması_

•	salesman_master tablosuna veri girişi:

![image2.8](/desc-sheets/images/foy-2/2-8.png)
 
_Resim2.8  salesman_master tablosuna verlerin girilmesi_

![image2.9](/desc-sheets/images/foy-2/2-9.png) 

_Resim2.9  salesman_master tablosundaki bütün verilerin görüntülenmesi_

•	sales_order tablosunun oluşturulması:

![image2.10](/desc-sheets/images/foy-2/2-10.png)
 
_Resim2.10  salesman_order tablosunun kısıtlarıyla beraber oluşturulması_

•	sales_order tablosuna veri girişi:

![image2.11](/desc-sheets/images/foy-2/2-11.png)
 
_Resim2.11  sales_order tablosuna veri girilmesi_
 
![image2.12](/desc-sheets/images/foy-2/2-12.png)

_Resim2.12 sales_order tablosundaki bütün verilerin görüntülenmesi_

•	sales_order_details tablosunun oluşturulması:

![image2.13](/desc-sheets/images/foy-2/2-13.png)
 
_Resim2.13 salesman_order_details tablosunun kısıtlarıyla beraber oluşturulması_ 

•	sales_order_details tablosuna veri girişi:

![image2.14](/desc-sheets/images/foy-2/2-14.png)
 
_Resim2.14  Sales_order_details  tablosuna veri girilmesi_
 
![image2.15](/desc-sheets/images/foy-2/2-15.png)

_Resim2.15  sales_order_details tablosundaki bütün verilerin görüntülenmesi_


### SORGULAR

•	client_master tablosunda client_no alanı için indeks oluşturulması:

![image2.16](/desc-sheets/images/foy-2/2-16.png)

•	sales_order tablosu üzerinde s_order_no alanı üzerinde indeks oluşturulması:

![image2.17](/desc-sheets/images/foy-2/2-17.png)

•	sales_order tablosu üzerinde s_order_no ve product_no alanları üzerinde iki alanı birlikte kullanılarak composite indeks oluşturulması:

![image2.18](/desc-sheets/images/foy-2/2-18.png)

•	Bir üst seçenekte oluşturulan indeksin silinmesi:

![image2.19](/desc-sheets/images/foy-2/2-19.png)

•	sales_master tablosu üzerinde sal_amt değeri 3500 den büyük olanlar için view oluşturulması:

![image2.20](/desc-sheets/images/foy-2/2-20.png)

•	client_master tablosu üzerinde client_view isminde bir view oluşturulması ve sütun isimlerinin add1, add2, city, pcode, state olacak şekilde sırasıyla değiştirilmesi:

![image2.21](/desc-sheets/images/foy-2/2-21.png)

•	client_view isimli view’den şehir ismi ‘Bombay’ olan client isimlerini getiren sorgu:

![image2.22](/desc-sheets/images/foy-2/2-22.png)

•	client_view isimli view-in silinmesi:

![image2.23](/desc-sheets/images/foy-2/2-23.png)

•	sales_order tablosu kullanılarak günlük siparişleri listelemeye yarayan view (bu view her çalıştırıldığında sistem tarihini alarak o güne ilişkin siparişleri listeler) oluşturulması:

![image2.24](/desc-sheets/images/foy-2/2-24.png)

•	Sipariş tarihi 10 gün geçen siparişleri müşteri isimleri ve ürün isimleri olarak liteleyen bir sorgu:

![image2.25](/desc-sheets/images/foy-2/2-25.png)
