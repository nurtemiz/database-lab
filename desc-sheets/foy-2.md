### Constraints(Kısıtlar), View (Görünüm) ve Indeks yapılarının araştırılması

#### 1.	Kısıtlar: 

Veritabanı üzerinde iş kurallarını zorunlu kılmak ve tablolar arasında ilişki kurarak veri bütünlüğünü sağlamak amacıyla oluşturulur. ( Postgresql kısıtlamaları; check, not null, unique, primary keys  )  Diğer VTYS sistemlerinde de benzer kısıtlar vardır.

Veri üzerindeki mantıksal sınırlamalara kısıt adı verilir. Kısıtların genel olması tercih edilen bir durumdur. Kısıtlar, veri modellerinde bütünlük sağlamak için kullanılır. Kısıtlamalar, tabloların tanımlanmasıyla beraber oluşan öğelerdir.

Kısıtlamalar ile Rule (kural) ve Default’ların (varsayılan) yapabileceği işler yapılabilir. Constraint’ler tablo oluştururken yani CREATE TABLE komutuyla tanımlanabilir. Tablo oluşturulmuşsa ALTER TABLE komutuyla bu işlem gerçekleşir. ALTER TABLE komutuyla kullanıldığında sütunlara girilen bilgilerin dikkate alınması gerekir.

•	**SQL Primary key:** Birincil anahtar kısıtlayıcı anlamındadır. Aynı olmayan değerler girilmesini sağlar. Bu da her kaydın farklı olması demektir. Her tablonun en fazla 1 adet Primary Key Constraint’i olabilir.

•	**SQL Foreign key:** Yabancıl anahtar kısıtlayıcı anlamındadır. Bir tablodaki bir sütuna ait verilerin başka bir tablonun belirli bir sütunundan gelmesini denetler.

•	SQL Not Null Constraint: Girilen Degerin Boş olmamasını sağlar.Kullanıcı boş bırakamaz..

•	SQL Unique Key: Bu sınırlama her satır veya sütun ayrı bir değere sahip olmasını sağlar. Sütun (lar) değerleri çoğaltılamaz. Ancak boş değer ama olabilir.(primary keyden farkı budur)

•	SQL Check Constraint: Kontrol kısıtlayıcı anlamındadır. Belirtilen formata göre verilerin girilmesini sağlar. Örneğin, T.C.Kimlik Num alanına 11 karakterin girilmesi Check Constraint ile sağlanabilir. Server/Client veya Web tabanlı uygulamalarda bu kontrolü client tarafında yapılması tavsiye edilir.

•	Default Kısıtlayıcısı: Varsayılan kısıtlayıcı anlamındadır. Tablodaki herhangi bir alan için girilmesi gereken bir değerin atanmasıdır. INSERT komutu için geçerlidir. Örneğin, kişi bilgilerinin alındığı bir tabloda kişinin uyruğunun girilmesi işleminde varsayılan değer olarak “T.C.” atanabilir.

#### 2.	View Kullanımı:

View’ lar hazırlanmış sql cümleleri olarak bilinir. Sadece çağırıldıklarında veri kümesini üretirler. Veritabanı programcılığında önemlidir. Sql komutlarından view oluşturma ve faydaları:

•	Veri güvenliği: Veri tabanı içinde bulunan tablolardaki bazı sütunlarda bulunan bilgilerin, herkes tarafından görülmesi istenmeyebilir.Örneğin, personelin maaşlarının herkes tarafından listelenebilir olması mahsurlu olabilir. Bu durumda, Personel adlı temel (base) tablodan, persview adlı bir view oluşturulabilir.Bir temel tablodan bir view oluşturulurken, temel tablodaki aynı sütun (alan) isimlerini kullanmak zorunda değildir.

•	Sorgulamanın daha basit hale gelmesi: Karmaşık sorgulamalarda, bazı SELECT komutlarının sonuçları diğer SELECT komutlarınca kullanıldığında, sorgulamanın düzenlenmesinde yanlışlıklar yapma olasılığı artar.    Karmaşık sorgulamalar, VIEW özelliği kullanılarak daha basit hale getirilebilir. Burada temel fikir şudur: Mademki bir view, bir sorgulama sonucu elde edilen bilgiyi (tabloyu) isimlendirerek elde edilen bir virtüel tablodur; o halde karmaşık SELECT komutu içinde, sonucu kullanılacak başka bir SELECT komutu kullanmak yerine, bu sonucu bir view olarak isimlendirerek, view adını kullanmak. Bazı durumlarda ise, işletmenin veri tabanı uygulamasında çok sık olarak sorulan karmaşık soruları bir view yapısı içinde saklayarak, daha sonra aynı tip sorgulamalar için bu view yapısını kullanarak daha basit ifadeler kullanmakta olasıdır.

•	Sadece view kullanılarak gerçekleşebilen sorgulamalar: Bir tablodan elde edilecek bilgiler için, iki kademeli işlem gerektiren sorgulamalarda, ilk adımda bir view oluşturup ikinci adımda esas sorgulamayı bu view yardımı ile gerçekleştirmek, çoğu kez kaçınılmaz bir durumdur.   

#### 3. Indexler:

Bir index, veri tabanı ortamında bir tablo ya da bir view gibi bir nesnedir ve ilişkili olarak kullanıldığı tablo ya da view’deki satırların, indexleme alanı (key field (anahtar alan)) olarak kullanılan kolondaki verilere göre sıralanmış biçimde işleme sokulmasını (listeleme ya da arama işlemi) sağlar.Bir tablo, indexlenmiş ise, bu tablo içinde gerçekleştirilecek bir arama (search) ya da koşullu listeleme (SELECT komutu ile) işlemi çok daha hızlı biçimde gerçekleştirilebilecektir.

Genel olarak veritabanlarında veri miktarı arttıkça, tüm veriye ulaşımın maliyeti de benzer oranda artar. Mesela aynı tablo için 100 kayıtla çalışmak ile 1 milyon kayıtla çalışmak arasında aradığınız veriye ulaşım açısından çok buyuk maliyet farkı vardır. Bu maliyet genel olarak CPU ve disk erişimi olarak karşımıza çıkacaktır. Eğer veritabanınız başka bir makine üzerinde ise buna ilaveten bir de network kullanımı maliyeti eklenecektir.

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

•	Index Yaratma: SQL’de bir tablo ile ilişkili olarak index yaratmak için gerekli komut CREATE INDEX komutudur. 

•	Tek bir alana göre artan sırada indexleme: İşletmede çalışan personeli maaşlarına göre artan sırada listelemek istersek, maaş alanına göre bir index oluşturmalıyız.

•	Veri Tabanından Index Kaldırmak:  Drop index  index_name  


### UYGULAMA

PostgreSQL veri yönetim sistemi üzerinde “foy2” isminde bir veri tabanı oluşturuldu.

•	Oluşturulan bu veri tabanında, client_master tablosunun oluşturulması:

![image2.1](/images/foy-2/2-1.png)

_Resim2.1 client_master tablosunun oluşturulması_

•	client_master tablosuna veri girişi:

![image2.2](/images/foy-2/2-2.png)
 
_Resim2.2 client_master tablosuna veri girilmesi_

![image2.3](/images/foy-2/2-3.png)

_Resim2.3 client_master tablosundaki bütün verilerin listelenmesi_

•	product_master tablosunun oluşturulması:

![image2.4](/images/foy-2/2-4.png)

_Resim2.4  product_master tablosunun oluşturulması_

•	product_master tablosuna veri girişi:

![image2.5](/images/foy-2/2-5.png)

_Resim2.5 product_master tablosuna verilerin girilmesi_

![image2.6](/images/foy-2/2-6.png)

_Resim2.6 product_master tablosundaki bütün verilerin görüntülenmesi_

•	salesman_master tablosunun oluşturulması:

![image2.7](/images/foy-2/2-7.png)

_Resim2.7  salesman_master tablosunun kısıtlarıyla beraber oluşturulması_

•	salesman_master tablosuna veri girişi:

INSERT INTO salesman_master
VALUES ('500001', 'Kren', 'A/14 worli', 'Bombay', 'mah', '400002', 3000, 100, 50, 'goo'),
             ('500002', 'Manish', '65, Nariman', 'Bombay', 'mah', '400001', 3000, 200, 100, 'goo'),
            ('500003', 'Ravi', 'P-7 Bandra', 'Bombay', 'mah', '400032', 3000, 200, 100, 'goo'),
            ('500001', 'Ashish', 'A/5 Juhu', 'Bombay', 'mah', '400044', 3500, 200, 150, 'goo');

 
Resim2.8  salesman_master tablosuna verlerin girilmesi

 
Resim2.9  salesman_master tablosundaki bütün verilerin görüntülenmesi

•	sales_order tablosunun oluşturulması:

CREATE TABLE sales_order(
    s_order_no varchar(6) PRIMARY KEY CHECK (s_order_no LIKE '0%'),
    s_order_date date,
    client_no integer REFERENCES client_master(client_no),
    dely_add varchar(6),
    salesman_no varchar(6) REFERENCES salesman_master(salesman_no),
    dely_type char(1) CHECK(dely_type IN ('P','F')) DEFAULT 'F',
    billed_yn char(1),
    dely_date date CHECK(dely_date > s_order_date),
    order_status varchar(10) CHECK(order_status IN ('in process','fullfilled', 'back order', 'cancelled'))
);

 
Resim2.10  salesman_order  tablosunun kısıtlarıyla beraber oluşturulması 

•	sales_order tablosuna veri girişi:

INSERT INTO sales_order
	VALUES ('019001', '12-jan-96', '0001', '', '500001', 'F', 'N', '20-jan-96', 'in process'),
    	             ('019002', '25-jan-96', '0002', '', '500002', 'P', 'N', '27-jan-96', 'cancelled'),
                            ('016865', '18-feb-96', '0003', '', '500003', 'F', 'Y', '20-feb-96', 'fullfilled'),
                           ('019003', '3-apr-96', '0001', '', '500001', 'F', 'Y', '7-apr-96', 'fullfilled'),
                          ('046866', '20-may-96', '0004', '', '500002', 'P', 'N', '22-may-96', 'cancelled'),
                         ('010008', '24-may-96', '0005', '', '500004', 'F', 'N', '26-may-96', 'in process');

 
Resim2.11  sales_order  tablosuna veri girilmesi
 
Resim2.12  sales_order tablosundaki bütün verilerin görüntülenmesi

•	sales_order_details tablosunun oluşturulması:

CREATE TABLE sales_order_details(
    s_order_no varchar(6) REFERENCES sales_order(s_order_no),
    product_no varchar(10) REFERENCES product_master(product_no),
    qty_order integer,
    qty_disp integer,
    product_rate integer
);

 
Resim2.13  salesman_order_details tablosunun kısıtlarıyla beraber oluşturulması 

•	sales_order_details tablosuna veri girişi:

INSERT INTO sales_order_details
VALUES ('019001', 'P00001', 4, 4, 525),
             ('019001', 'P07965', 2, 1, 8400),
            ('019001', 'P07885', 2, 1, 5250),
            ('019002', 'P00001', 10, 0, 525),
            ('046866', 'P07868', 3, 3, 3150),
            ('046866', 'P07885', 10, 10, 5250),
            ('019003', 'P00001', 4, 4, 1050),
            ('019003', 'P03453', 2, 2, 1050),
            ('046866', 'P06734', 1, 1, 12000),
            ('046866', 'P07965', 1, 0, 8400),
            ('010008', 'P07975', 1, 0, 1050),
            ('010008', 'P00001', 10, 5, 525);

 
Resim2.14  Sales_order_details  tablosuna veri girilmesi
 
 
Resim2.15  sales_order_details tablosundaki bütün verilerin görüntülenmesi
SORGULAR

•	client_master tablosunda client_no alanı için indeks oluşturulması:

CREATE INDEX client_no ON client_master (client_no)

 
Resim2.16 

•	sales_order tablosu üzerinde s_order_no alanı üzerinde indeks oluşturulması:

CREATE INDEX s_order_no ON sales_order (s_order_no)

 
Resim2.17

•	sales_order tablosu üzerinde s_order_no ve product_no alanları üzerinde iki alanı birlikte kullanılarak composite indeks oluşturulması:

CREATE INDEX s_order_product_no ON sales_order (s_order_no, salesman_no)

 
Resim2.18
•	Bir üst seçenekte oluşturulan indeksin silinmesi:

DROP INDEX s_order_product_no
 
Resim2.19

•	sales_master tablosu üzerinde sal_amt değeri 3500 den büyük olanlar için view oluşturulması:

CREATE VIEW sal_amt_bigger_t3000 AS 
SELECT * FROM salesman_master WHERE sal_amt > 3000

 
Resim2.20

•	client_master tablosu üzerinde client_view isminde bir view oluşturulması ve sütun isimlerinin add1, add2, city, pcode, state olacak şekilde sırasıyla değiştirilmesi:

CREATE VIEW client_view(no, name, add1, add2, city, state, pcode)
AS SELECT  client_no, client_name, client_address1, client_address2, city, state, pincode
FROM client_master

 
Resim2.21
•	client_view isimli view’den şehir ismi ‘Bombay’ olan client isimlerini getiren sorgu:

SELECT no, name, city FROM client_view  WHERE city = ‘Bombay’

 
Resim2.22

•	client_view isimli view-in silinmesi:

DROP INDEX client_view

 
Resim2.23

•	sales_order tablosu kullanılarak günlük siparişleri listelemeye yarayan view (bu view her çalıştırıldığında sistem tarihini alarak o güne ilişkin siparişleri listeler) oluşturulması:

SELECT * FROM sales_order WHERE s_order_date = CURRENT_DATE

 
Resim2.24
•	Sipariş tarihi 10 gün geçen siparişleri müşteri isimleri ve ürün isimleri olarak liteleyen bir sorgu:

SELECT * FROM sales_order WHERE dely_date < CURRENT_DATE - INTERVAL '10' DAY;

 
Resim2.25
