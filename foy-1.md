## Veri Tabanı Laboratuvarı Dersi Föy-1

#### MySQL, PostgreSQL, Microsoft SQL Server, ORACLE 11g XE veritabanı yönetim sistemlerinden seçtiğiniz herhangi iki tanesinin kurulumunu yapınız ve aşağıdaki işlemleri her iki sistem üzerinde de ayrı ayrı gerçekleştiriniz. 

PostgreSQL ve Microsoft SQL Server veritabanı yönetim sistemlerinde veri tabanı işlemleri yapılacaktır.

##### 1- Kurulum yaptığınız her bir sistem üzerinde “kitapevi” isminde bir veritabanı yaratınız ve daha sonra aşağıda tablo şemaları verilen tabloları bu veritabanı içerisine, veri tanımlama dili olan DDL(Data Definition Language) ile oluşturunuz. 

PostgreSQL veritabanı yönetim sisteminde veri tabanı oluşturmak için sol menuden Servers -> PostgreSQL -> Databases ->  Create -> Database seçilerek -kitapevi- adında bir veri tabanı oluşturulur. Çalışma alanında SQL penceresini açıldığında aşağıdaki komut kümesi görüntülenir.

```sql
CREATE DATABASE kitapevi
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1 ;
```
Microsoft SQL Server-da ise $PC_NAME -> DATABASE -> NEW DATABASE seçilere –kitabevi- adında yeni bir veri tabanı oluşturulur. Üst menüden New Query seçilerek aşağıdaki komut kümesi (DDL) kullanılarak yeni bir veri tabanı da oluşturulabilir. 

```sql
CREATE DATABASE kitapevi ON PRIMARY( --PRIMARY belirtilmemişse, CREATE DATABASE deyiminde listelenen ilk dosya birincil dosya olur.
    NAME = kitapevi_Data, --SQL Server veritabanına başvurduğunda bu ismi kullanır. İsim uniqe(benzersiz) olmak zorundadır.
    FILENAME = 'C:\kitaoeviData.mdf', --Veritabanın kaydedileceği yolun belirtildiği yerdir. Eğer belirtilen klasör yok ise önceden oluşturulması gerekir.
    SIZE = 2MB, --Veritabanın ilk boyutu.
    MAXSIZE = 10MB, --Veritabanın en fazla ulaşabileceği boyut.
    FILEGROWTH = 10%) --Yeterli boşluk kalmadığında veritabanın genişleme miktarı.
    LOG ON ( 
    NAME = kitaoevi_Log, --Log dosyasının SQL Server'a başvurduğunda kullanacağı isim. Uniqe olmak zorundadır.
    FILENAME = 'C:\kitaoeviLog.ldf', --Log dosyasının kaydedileceği yolun belirtildiği yerdir.
    SIZE = 1MB, --Log dosyasının ilk boyutu.
    MAXSIZE = 5MB, --Log dosyasının en fazla ulaşabileceği boyut.
    FILEGROWTH = 10%) --Yeterli boşluk kalmadığında log dosyasının genişleme miktarı.
```

##### 2- Aşağıdaki tabloları uygun veri tipleri ve anahtarlarını belirleyerek oluşturun ve bu taplolara uygun veri girişleri yapınız (SQL kullanarak (insert into) birden fazla veri girişini aynı anda yaptırınız). Aşağıda verilen SQL sorgularını hazırlayıp sonuçlarına ilişkin ekran çıktılarını elde ediniz. 

_Oluşturulması istenilen tablolar:_

 _Book (book_no, name, first-author, year, price, publisher_no,subject_no)_
 
 _Student (student_no, name, department_no)_
 
 _Subject (subject_no, stitle)_
 
 _Department(department_no,departmentname)_
 
 _Publisher (publisher_no, name)_
 
 _Buys (student_no, book_no) : Öğrencilerin almış olduğu kitaplar._
 
 _Covers (subject_no, book_no): Her bir kitabın hangi konulara ait olduğunu ifade eder. Bir kitap birden fazla konu altına girebilir._
 
 _Studies (student_no, subject_no): Her bir öğrencinin hangi konularda ilgilendiğini ifade eder._
 
Tablolar aşağıdaki sql kod kümesi ile oluşturulabilir ya da arayüzden de oluşturulabilir. 

```sql
CREATE TABLE table_name (
    column_name data_type,
    column_name data_type
);
```

PostgreSQL-de tabloların oluşturulması:

```sql
CREATE TABLE publisher (
    publisher_no bigserial PRIMARY KEY, 
    publisher_name char(50)
);

CREATE TABLE student (
    student_no bigserial PRIMARY KEY,
    student_name char(50),
    department_no integer REFERENCES department(department_no) --foreign key
);

CREATE TABLE studies (
    student_no integer REFERENCES student(student_no),
    subject_no integer REFERENCES subject(subject_no) 
);

CREATE TABLE book (
    book_no bigserial PRIMARY KEY,
    book_name char(50),
    book_author char(50),
    book_year integer,
    book_price numeric,
    subject_no integer REFERENCES subject(subject_no),
    publisher_no integer REFERENCES publisher(publisher_no)
);
```

Oluşturulan tablolara veri girişinin yapılması;

```sql
INSERT INTO subject VALUES (1, 'Modern Klasikler'), (2, 'Siber Güvenlik Kitapları');
INSERT INTO publisher VALUES (1, 'Kültür Yayınları'), (2, 'Kodlab Yayınları'), (3, 'Abaküs Yayınları');
INSERT INTO department VALUES (1, 'Bilgisayar Mühendisliği'), (2, 'Sanat Tarihi');
INSERT INTO student VALUES (1, 'Nur Temiz', 1), (2, 'Ece Türk', 2), (3, 'Yavuz Gök', 2), (4, 'Silan Başaran', 1);
INSERT INTO studies VALUES (1, 1), (1, 2), (2, 2), (3, 2), (4, 1), (4, 2);
INSERT INTO book VALUES 
    (1, 'Yıldız Gezgini', 'Jack London', 2014, 25, 1, 1),
    (2, 'Bilinmeyen Bir Kadının Mektubu', 'Stefan Zweig', 2016, 6, 1, 1),
    (3, 'Ethical Hacking', 'Ömer Çıtak', 2018, 30, 2, 3), 
    (4, 'Kali Linux', 'Abdülaziz Altuntaş', 2015, 35, 2, 2);
```

Microsoft SQL Server-da tabloların oluşturulması:

```sql
CREATE TABLE book (
   book_no TINYINT IDENTITY(1,1) NOT NULL,
   book_name NVARCHAR(50),
   book_author NVARCHAR(50),
   book_year TINYINT,
   book_price TINYINT,
	subject_no TINYINT,
	publisher_no TINYINT,
	PRIMARY KEY (book_no),
	FOREIGN KEY (subject_no) REFERENCES subject (subject_no),
	FOREIGN KEY (publisher_no) REFERENCES publisher (publisher_no)
);

CREATE TABLE buys (
    student_no TINYINT,
    book_no TINYINT,
	FOREIGN KEY (student_no) REFERENCES student (student_no),
	FOREIGN KEY (book_no) REFERENCES book (book_no)
);
```

Oluşturulan tablolara veri girişinin yapılması;

```sql
INSERT INTO subject
VALUES ('Modern Klasikler')
INSERT INTO subject
VALUES ('Siber Güvenlik Kitapları')
```

şeklinde verilen tüm tablolar oluşturulur ve tablolara göre veri girişleri yapılır.

##### 3. Gerçeklenilmesi istenilen SQL Sorguları:

* Abaküs yayın evi tarafından yayınlanan kitapların numaralarını ve isimlerinin listelenmesi (yayın yılı artan düzende):

```sql
SELECT book_no, book_name, publisher_no
FROM book
WHERE publisher_no = 3 -- Abaküs yayınevi no
ORDER BY book_year DESC;
```

ya da

```sql
SELECT book_no, book_name, publisher_no
FROM book
WHERE publisher_no = ( SELECT publisher_no FROM publisher WHERE publisher_name = 'Abaküs Yayınevi' )
ORDER BY book_year DESC;
```

* Kitap adlarını yayıncı adına göre gruplanması ve her grup içerisindeki kayıtları yayınlanma tarihine göre sıralanması:

```sql
SELECT book_name,book_year,publisher_no 
FROM book 
ORDER BY publisher_no, book_year DESC;
```

* Her bir yayıncı gurubundan kaç adet kitabın olduğunu adet ve yayıncı adını verecek şekilde oluşturulması:

```sql
SELECT COUNT(publisher.publisher_name) AS "toplam_kitap", publisher.publisher_name 
FROM Publisher
INNER JOIN book ON publisher.publisher_no = book.publisher_no 
GROUP BY publisher.publisher_no, publisher.publisher_name;
```

* 2000-2002 döneminde en fazla beş kitap yayınlayan yayıncıların listelenmesi:

```sql
SELECT COUNT(publisher.publisher_name) AS "toplam_kitap", publisher.publisher_name 
FROM publisher
INNER JOIN book ON publisher.publisher_no = book.publisher_no 
WHERE book_year >= 2000 AND book_year <= 2015
GROUP BY publisher.publisher_no, publisher.publisher_name 
HAVING COUNT (publisher.publisher_name) < 5
```

* En pahalı 10 kitabı adlarına göre listelenmesi:

```sql
```

* 2002'den 2004'e kadar her yıl en az bir kitap yayınlayan yayıncıların listelenmesi:

```sql
```

* Son beş yılda her yıl en az bir kitap yayınlayan yayıncıların listelenmesi:

```sql
```

* En çok kitap yazan yazarın yazmış olduğu kitapların listelenmesi:

```sql
```

* Ortalama kitap fiyatının üzerinde olan kitap isimlerinin listelenmesi:

```sql
```

* Bilgisayar Mühendisliği Bölümü öğrencilerinden VERİTABANLARI konusu ile ilgilenenlerin isimlerinin listelenmesi:

```sql
```

* AĞLAR konusunda satın kitap alan Bilgisayar Mühendisliği Bölümünde olmayan öğrencilerin adlarının ve bölüm adlarının listelenmesi:

```sql
```

* Çalıştığı tüm konularla ilgili kitapları satın almış öğrencilerin isimlerinin listelenmesi:

```sql
```

* Başlığı "VERİTABANLARI" olan konu kapsamındaki kitap tablosuna en son eklenen kitap adının listelenmesi:

```sql
```

* Kitaplar için 200 TL den fazla harcama yapan öğrencilerinin listelenmesi:

```sql
```

* Kitap tablosu üzerinde şart yazmadan yaptığınız bir select cümlesi sonucunda toplam 40 kayıt geleceğini düşünerek bunlar arasında 10 ile 20 inci kayıtlar arasındaki ikinci 10’ lu birlikteliği getiren bir sql cümlesi:

```sql
```

