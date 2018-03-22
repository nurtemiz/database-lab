
## Saklı Yordamlar(Stored Procedures), Fonksiyonlar(Functions), İmleçler(Cursorler) ve Transaction Blokları

### 1.	Saklı Yordamlar(Stored Procedures):

Bir tabloya bağlı olmaksızın veritabanı uzayında tanımlanan belirli bir işi yapmaya yönelik kodlardır. Başka bir değişle "Derlenmiş sql cümlecikleridir". Saklı yordam olarak tanımlanan bu yapılar kullanılan veritabanı yönetim sistemine ait programlanabilir sql dil kullanılarak gerçekleştirilir. 

Her veritabanı yönetim sistemi standart sql dilini desteklemekle birlikte kendi üzerinde bazı programlanabilir özelliklere sahip bir dil barındırırlar. MS SQL Server ortamında T-SQL dili, ORACLE ortamında PL-SQL PostgreSQL PL/pgSQL dili, Sybase (T-SQL).

#### 1.1	Stored Procedure ne işe yarar?

Çalıştırmak istediğimiz sql cümleciklerini bir Saklı Yordam içine yerleştirerek, bunun bir veritabanı nesnesi haline gelmesini ve çalıştırıldığında doğrudan, veritabanı yöneticisini üzerinde barındıran sunucu makinede işlemesini sağlarız.

#### 1.2	Stored Procedure faydaları nelerdir?

•	İstemci makinelerdeki iş yükünü azaltır ve performansı arttırır (yazıldığı zaman aynı zamanda compile edildikleri için query optimizer tarafından optimize edilmiş en hızlı şekilde çalışır). Sql cümleleri, Saklı Yordam’ lardan çok daha yavaş sonuç döndürür. Çok katlı mimariyi uygulamak isteğimiz projelerde faydalıdır.

•	Networkü (Ağ Trafiğini) azaltır.

•	Açık Sql cümleciklerine nazaran daha güvenlidir.

•	Programlama deyimlerini içerebilirler. if, next, set vs.. programlama dillerindekine benzer özellikler sunar. Gelen parametrelere göre sorgu yapılıp sonucun dönmesi sağlanabilir.

#### 2.	Fonksiyonlar (Functions) : 

Belli bir sonucu geri döndürmek için yapılmış bir veya birden fazla yerde kullanılan yapılardır. Programcılıkta kullanmış olduğumuz fonksiyonlar ile aynı mantıktadırlar.

#### 3.	Tetikleyiciler (Triggers):

Tetikleyiciler sadece tablolarda veya görünümlerde(views) Insert, Update ve Delete komutları çalıştırılırken başka işlerin yapılması için tanımlanan sql cümleleridir. Mantık olarak saklı yordamlara benzerler. Fakat bunlar ilişkili oldukları tablo veya görünümde ilgili işlem gerçekleştirilirken otomatik olarak çalışmalarıdır. 

T-SQL iki farklı tetikleyici vardır; bunlar AFTER ve INSTEAD OF tetikleyicileridir. AFTER tetikleyiciler ilgili işlemleri gerçekleştirildikten hemen sonra yapılırlar. INSTEAD OF tetikleyicileri ise işlem yapılırken araya girip öncesinde veya sonrasında başka işlemleri yapabilme yeteneğine sahiptir.

#### 4.	Transaction:

Transaction, özet olarak daha küçük parçalara ayrılamayan işlem demektir. Özellikle bir grup işlemin arka arkaya gerçekleşiyor olmasına rağmen, seri işlemler halinde ele alınması gerektiğinde kullanılır. Transaction bloğu içerisindeki işlemlerin tamamı gerçekleşinceye kadar hepsi gerçekleşmemiş varsayılır.

Bir banka uygulamasını düşünün. Bir kullanıcı başka bir kullanıcıya havale yaptığında ne olacağına bakalım. Öncelikle havale yapanın hesap bilgilerinden havale yaptığı miktar düşülür. Ardından alıcının hesabına bu miktar eklenir ve havale gerçekleşmiş olur. Ancak her zaman şartlar istendiği gibi olmayabilir. Örneğin, gönderenin hesabından para düşüldüğü anda elektrik kesilebilir ya da program takılabilir. Bu durumda, ne olur? Örneğin, gönderenin hesabından para düşülmüştür ama alıcının hesabına da geçmemiştir yani bir kısım paranın sahibinin kimliği kaybedilmiş olur. Bu da sistemin olası durumlar dışında veri kaybetmeye müsait bir hal alması demektir. Bu durumun bir şekilde önlenmesi gerekir.

Daha küçük parçalara ayrılamayan en küçük işlem yığınına Transaction denir. Geçerli kabul edilmesi bir dize işlemlerin tamamının yolunda gitmesine bağlı durumlarda transaction kullanılır. Transaction bloğu ya hep ya hiç mantığı ile çalışır. Ya tüm işlemler düzgün olarak gerçekleşir ve geçerli kabul edilir veya bir kısım işlemler yolunda gitse bile, blok sona ermeden bir işlem bile yolunda gitmese hiçbir işlem olmamış kabul edilir.

**SQL Server 3 farklı transaction desteği sağlar:**

•	**Harici(Explicit) Transaction:** SQL Server’in kullanıcı tarafından bir BEGIN TRAN ifadesi ile transaction’a başlatılması şeklindeki bloktur. Bir aksilik olması halinde SQL Server tarafından veya kullanıcı tarafından COMMIT ifadesi ile gerçekleşmiş olarak veya
ROLLBACK ifadesi ile hiç olmamış olarak sonlandırılabilir.

•	**Dahili(Implict) Transaction:** SQL Server’in belli ifadelerden sonra otomatik olarak transaction açmasını sağlar. Bu modda, bu belli ifadeler kullanıldıktan sonra, kullanıcı tarafından transaction’ın sonlandırılması gerekir. Bu nedenle zahmetli bir mod’dur.

•	**Auto Commit:** Hiç bir transaction mod’u tayin edilmedi ise, SQL Server bu modda çalışır. Auto Commit modunda iken, her bir batch(yığın, Query Analyzer için iki go arasındaki ifade veya bir defada çalıştırılan bütün SQL ifadeleri) bir transaction bloğu olarak ele alınır. Batch içerisinde bir sorun olursa, SQL Server otomatik olarak bütün batch’i geri alır(ROLLBACK eder).

**Ancak biz genel olarak transaction denilince, harici transaction işlemlerini kastederiz. Harici transaction bloğunun başlatılması ve gelişimini ele alacak olursak:**

•	Transaction bloğu başlatılır. Böylece yapılan işlemlerin geçersiz sayılabileceği VTYS’ye deklare edilmiş olur ve SQL Server Auto Commit modundan çıkıp, Explicit moda geçer.

•	Transaction bloğu arasında yapılan her bir işlem bittiği anda başarılı olup olmadığına gerek varsa, programcı tarafından bakılıp, başarılı olmadığı anda geri alım işlemine geçilebilir(ROLLBACK). Ancak bir sorun olması halinde, SQL Server tarafından da verilerin tutarlılığını denetlemek üzere, transaction bloğunun başladığı andan itibaren bir güç kesilmesi gibi durum ortaya çıkarsa, değişiklikler dikkate alınmayacak şekildedir. 

Bu, transaction loğları denilen yöntem ile yapılır. Bu yöntemde, bir transaction başladıktan sonra, verileri tutan sayfalar diskten(HDD) hafızaya(RAM) yüklenir ve ilgili değişiklikler, önce hafızada yapılır. Ardından, değişikliklerin izdüşümü loglar diske yazdırılır, ardından veriler de güncellenir.

•	Tüm işlemler tamamlandığı anda COMMIT ile bilgiler yeni hali ile sabitlenir. Başarısız bir sonuç ise ROLLBACK ile en başa alınır ve bilgiler ilk hali ile sabitlenir.


### UYGULAMA

• **Ogrenci tablosunun oluşturulması ve verilerin girilmesi:**
 
![image3.1](/desc-sheets/images/foy-3/3-1.png)
_Resim-1  Ogrenci tablosunun oluşturulması_

![image3.2](/desc-sheets/images/foy-3/3-2.png) 
_Resim-2 Ogrenci tablosuna verilerin girilmesi_

• **Ogrenci tablosuna, kendisine gelen parametreleri kullanarak kayıt ekleme işini yapan bir saklı yordam yazılması:**

![image3.3](/desc-sheets/images/foy-3/3-3.png) 
_Resim-3 add_student prosedürünün oluşturulması_

• **Bir önceki adımda oluşturulan add_student prosedürünün kullanılması:**

![image3.4](/desc-sheets/images/foy-3/3-4.png) 
_Resim-4 add_student prosedürünün kullanılması_

• **Ogrenci tablosından toplam öğrenci sayısını (count), tüm öğrenci listesini, bolumID’ si verilen öğrenci listesini döndüren saklı yordamların oluşturulması:**

![image3.5](/desc-sheets/images/foy-3/3-5.png)
_Resim-5 count_student prosedürünün oluşturulması_


![image3.6](/desc-sheets/images/foy-3/3-6.png) 
_Resim-6 count_student prosedürünün kullanılması_

![image3.7](/desc-sheets/images/foy-3/3-7.png)
_Resim-7 id_student prosedürünün oluşturulması_

![image3.8](/desc-sheets/images/foy-3/3-8.png)
_Resim-8 id_student prosedürünün kullanılması_

![image3.9](/desc-sheets/images/foy-3/3-9.png)
_Resim-9 list_student prosedürünün oluşturulması_

![image3.10](/desc-sheets/images/foy-3/3-10.png)
_Resim-10 list_student prosedürünün kullanılması_

• **Ogrenci tablosu üzerine bir silme tetikleyicisinin oluşturulması. Bu tablodan bir kayıt silindiğinde togrenciYedek isimli ve aynı özelliklere sahip başka bir tabloya silinen kaydın aynısının eklenmesi:**

![image3.11](/desc-sheets/images/foy-3/3-1.png)
_Resim-11 delete_trigger trigger-in oluşturulması_

![image3.12](/desc-sheets/images/foy-3/3-12.png)
_Resim-12 delete_trigger trigger-in kullanılması_

• **Cursor kullanarak adı içerisinde “a ve i” harfleri olan öğrencilerin vize notlarına 5 puan ekleme yapan bu harflerin geçmediği öğrencilerin vize notlarından 5 puan eksilten bir cursor uygulaması:**


![image3.13](/desc-sheets/images/foy-3/3-13.png)
_Resim-13 cursor oluşturulması_

![image3.14](/desc-sheets/images/foy-3/3-14.png)
_Resim-14 cursor kullanılması_


_**NUR TEMİZ**_
