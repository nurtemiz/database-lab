## Veri Tabanı Laboratuvarı Dersi Föy-1

#### MySQL, PostgreSQL, Microsoft SQL Server, ORACLE 11g XE veritabanı yönetim sistemlerinden seçtiğiniz herhangi iki tanesinin kurulumunu yapınız ve aşağıdaki işlemleri her iki sistem üzerinde de ayrı ayrı gerçekleştiriniz. 
PostgreSQL ve Microsoft SQL Server yönetim sistemlerinde veri tabanı işlemleri yapılacaktır.

##### 1- Kurulum yaptığınız her bir sistem üzerinde “kitapevi” isminde bir veritabanı yaratınız ve daha sonra aşağıda tablo şemaları verilen tabloları bu veritabanı içerisine, veri tanımlama dili olan DDL(Data Definition Language) ile oluşturunuz. 

##### 2- Aşağıdaki tabloları uygun veri tipleri ve anahtarlarını belirleyerek oluşturun ve bu taplolara uygun veri girişleri yapınız (SQL kullanarak (insert into) birden fazla veri girişini aynı anda yaptırınız). Aşağıda verilen SQL sorgularını hazırlayıp sonuçlarına ilişkin ekran çıktılarını elde ediniz. 
_Tablolar:_
 _Book (book_no, name, first-author, year, price, publisher_no,subject_no)_
 _Student (student_no, name, department_no)_
 _Subject (subject_no, stitle)_
 _Department(department_no,departmentname)_
 _Publisher (publisher_no, name)_
 _Buys (student_no, book_no) : Öğrencilerin almış olduğu kitaplar._
 _Covers (subject_no, book_no): Her bir kitabın hangi konulara ait olduğunu ifade eder. Bir kitap birden fazla konu altına girebilir._
 _Studies (student_no, subject_no): Her bir öğrencinin hangi konularda ilgilendiğini ifade eder._

##### 3.	Hazırlanması istenilen SQL Sorguları:

* Abaküs yayın evi tarafından yayınlanan kitapların numaralarını ve isimlerinin listelenmesi (yayın yılı artan düzende):

* Kitap adlarını yayıncı adına göre gruplanması ve her grup içerisindeki kayıtları yayınlanma tarihine göre sıralanması:

* Her bir yayıncı gurubundan kaç adet kitabın olduğunu adet ve yayıncı adını verecek şekilde oluşturulması:

*	2000-2002 döneminde en fazla beş kitap yayınlayan yayıncıların listelenmesi:

* En pahalı 10 kitabı adlarına göre listelenmesi:

*	2002'den 2004'e kadar her yıl en az bir kitap yayınlayan yayıncıların listelenmesi:

*	Son beş yılda her yıl en az bir kitap yayınlayan yayıncıların listelenmesi:

*	En çok kitap yazan yazarın yazmış olduğu kitapların listelenmesi:

*	Ortalama kitap fiyatının üzerinde olan kitap isimlerinin listelenmesi:

*	Bilgisayar Mühendisliği Bölümü öğrencilerinden VERİTABANLARI konusu ile ilgilenenlerin isimlerinin listelenmesi:

*	AĞLAR konusunda satın kitap alan Bilgisayar Mühendisliği Bölümünde olmayan öğrencilerin adlarının ve bölüm adlarının listelenmesi:

*	Çalıştığı tüm konularla ilgili kitapları satın almış öğrencilerin isimlerinin listelenmesi:

*	Başlığı "VERİTABANLARI" olan konu kapsamındaki kitap tablosuna en son eklenen kitap adının listelenmesi:

*	Kitaplar için 200 TL den fazla harcama yapan öğrencilerinin listelenmesi:

* Kitap tablosu üzerinde şart yazmadan yaptığınız bir select cümlesi sonucunda toplam 40 kayıt geleceğini düşünerek bunlar arasında 10 ile 20 inci kayıtlar arasındaki ikinci 10’ lu birlikteliği getiren bir sql cümlesi:

