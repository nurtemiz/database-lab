--VERİ TABANI OLUŞTURMAK İÇİN;

--Veri tabanı yönetim sisteminde, bir SQL penceresi açılarak aşağıdaki komut kümesi oluşturulup çalıştırıldığında; yeni bir veritabanı oluşturulmuş olur.
CREATE DATABASE kitapevi
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1 ;

--Microsoft SQL Server-da ise $PC_NAME -> DATABASE -> NEW DATABASE seçilere –kitabevi- adında yeni bir veri tabanı oluşturulur. 
--Üst menüden New Query seçilerek aşağıdaki komut kümesi (DDL) kullanılarak yeni bir veri tabanı da oluşturulabilir. 

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

--Tablolar aşağıdaki sql kod kümesi ile oluşturulabilir ya da arayüzden de oluşturulabilir. 
CREATE TABLE table_name (
    column_name data_type,
    column_name data_type
);

--PostgreSQL-de tabloların oluşturulması:
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

--Oluşturulan tablolara veri girişinin yapılması;
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

--Microsoft SQL Server-da tabloların oluşturulması:
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

--Oluşturulan tablolara veri girişinin yapılması(Microsof SQL Server için);
INSERT INTO subject
VALUES ('Modern Klasikler')
INSERT INTO subject
VALUES ('Siber Güvenlik Kitapları')

--SORGULAR

--Abaküs yayın evi tarafından yayınlanan kitapların numaralarını ve isimlerinin listelenmesi (yayın yılı artan düzende):
SELECT book_no, book_name, publisher_no
FROM book
WHERE publisher_no = 3 -- Abaküs yayınevi no
ORDER BY book_year DESC;

--ya da
SELECT book_no, book_name, publisher_no
FROM book
WHERE publisher_no = ( 	SELECT publisher_no 
			FROM publisher 
			WHERE publisher_name = 'Abaküs Yayınevi' )
ORDER BY book_year DESC;

--Kitap adlarını yayıncı adına göre gruplanması ve her grup içerisindeki kayıtları yayınlanma tarihine göre sıralanması:

SELECT book_name,book_year,publisher_no 
FROM book 
ORDER BY publisher_no, book_year DESC;

--Her bir yayıncı gurubundan kaç adet kitabın olduğunu adet ve yayıncı adını verecek şekilde oluşturulması:

SELECT COUNT(publisher.publisher_name) AS "toplam_kitap", publisher.publisher_name 
FROM Publisher
INNER JOIN book 
ON publisher.publisher_no = book.publisher_no 
GROUP BY publisher.publisher_no, publisher.publisher_name;

--2000-2002 döneminde en fazla beş kitap yayınlayan yayıncıların listelenmesi:

SELECT COUNT(publisher.publisher_name) AS "toplam_kitap", publisher.publisher_name 
FROM publisher
INNER JOIN book 
ON publisher.publisher_no = book.publisher_no 
WHERE book_year >= 2000 AND book_year <= 2015
GROUP BY publisher.publisher_no, publisher.publisher_name 
HAVING COUNT (publisher.publisher_name) < 5;

--En pahalı 10 kitabı adlarına göre listelenmesi:

--Microsoft SQL server için;
SELECT top (10) book_name, book_price 
FROM book 
ORDER BY book_price DESC;

--pgAdmin için;
SELECT book_name, book_price 
FROM book 
ORDER BY book_price DESC limit 10;

--2002'den 2004'e kadar her yıl en az bir kitap yayınlayan yayıncıların listelenmesi:

SELECT publishers.publisher_name 
FROM (	SELECT publisher.publisher_name,
	(SELECT COUNT(*) book_count FROM book, publisher WHERE book_year=2002) book_count_2002,
	(SELECT COUNT(*) book_count FROM book, publisher WHERE book_year=2003) book_count_2003,
	(SELECT COUNT(*) book_count FROM book, publisher WHERE book_year=2004) book_count_2004 
	FROM publisher 
      ) publishers 
WHERE publishers.book_count_2002 > 0 
OR publishers.book_count_2003 > 0 
OR publishers.book_count_2004 > 0;

--Son beş yılda her yıl en az bir kitap yayınlayan yayıncıların listelenmesi:

SELECT publishers.publisher_name 
FROM (	SELECT publisher.publisher_name,
	(SELECT COUNT(*) book_count FROM book, publisher WHERE book_year=2018) book_count_2018,
	(SELECT COUNT(*) book_count FROM book, publisher WHERE book_year=2017) book_count_2017,
	(SELECT COUNT(*) book_count FROM book, publisher WHERE book_year=2016) book_count_2016,
	(SELECT COUNT(*) book_count FROM book, publisher WHERE book_year=2015) book_count_2015,
	(SELECT COUNT(*) book_count FROM book, publisher WHERE book_year=2014) book_count_2014 
	FROM publisher
     ) publishers 
WHERE publishers.book_count_2018 > 0 
OR publishers.book_count_2017 > 0 
OR publishers.book_count_2016 > 0 
OR publishers.book_count_2015 > 0 
OR publishers.book_count_2014 > 0;

--En çok kitap yazan yazarın yazmış olduğu kitapların listelenmesi:

--Microsoft SQL server için;
SELECT book_name 
FROM book 
WHERE book_author 
IN (	SELECT TOP(1) book_author 
	FROM book 
	GROUP BY book_author 
	ORDER BY COUNT(*) DESC
    );

--pgAdmin için;
SELECT book_name 
FROM book 
WHERE book_author 
IN (	SELECT book_author 
	FROM book 
	GROUP BY book_author 
	ORDER BY COUNT(*) DESC limit 1
    );

--Ortalama kitap fiyatının üzerinde olan kitap isimlerinin listelenmesi:

SELECT book_name, book_price 
FROM book 
WHERE book_price > (	SELECT AVG(book_price) "ortalama_stok" 
			FROM book
		   );
--ya da

SELECT book_name, SUM(book_price) "book_price" 
FROM book 
GROUP BY book_name 
HAVING SUM(book_price) > (	SELECT AVG(book_price) 
				FROM book
			 );
			 
--Bilgisayar Mühendisliği Bölümü öğrencilerinden VERİTABANLARI konusu ile ilgilenenlerin isimlerinin listelenmesi:

SELECT student.student_name 
FROM (	SELECT student_no 
	FROM book 
	INNER JOIN buys 
	ON book.book_no = buys.book_no 
	WHERE subject_no = 2
     ) interested 
INNER JOIN student 
ON student.student_no=interested.student_no;

--AĞLAR konusunda satın kitap alan Bilgisayar Mühendisliği Bölümünde olmayan öğrencilerin adlarının ve bölüm adlarının listelenmesi:

SELECT xx.student_name, department_name 
FROM (SELECT student_name, department_no 
	FROM student 
	WHERE student_no 
	IN (SELECT student_no 
		FROM buys 
		WHERE book_no 
		IN (SELECT book_no 
			FROM book 
			WHERE subject_no = (SELECT subject_no 
				FROM subject 
				WHERE subject_title = 'Yazılım Kitapları')
			)
		)
	) xx 
INNER JOIN department 
ON department.department_no=xx.department_no 
WHERE department.department_no != 2;

-- Çalıştığı tüm konularla ilgili kitapları satın almış öğrencilerin isimlerinin listelenmesi:

--Başlığı "VERİTABANLARI" olan konu kapsamındaki kitap tablosuna en son eklenen kitap adının listelenmesi:

--Microsoft SQL server için;
SELECT  TOP(1) *  
FROM book
WHERE subject_no=2 
ORDER BY book_no DESC;

--pgAdmin için;
SELECT *  
FROM book 
WHERE subject_no=2 
ORDER BY book_no 
DESC limit 1;

--Kitaplar için 200 TL den fazla harcama yapan öğrencilerinin listelenmesi:

SELECT student.student_name, book_price 
FROM (	SELECT student_no, SUM(book_price) book_price 
	FROM book 
	INNER JOIN buys 
	ON buys.book_no=book.book_no 
	WHERE book_price > 20
	GROUP BY student_no 
      ) xx 
INNER JOIN student 
ON student.student_no=xx.student_no;

--Kitap tablosu üzerinde şart yazmadan yaptığınız bir select cümlesi sonucunda toplam 40 kayıt geleceğini düşünerek;
--bunlar arasında 10 ile 20 inci kayıtlar arasındaki ikinci 10’ lu birlikteliği getiren bir sql cümlesi:

SELECT * FROM book 
ORDER BY book_no 
OFFSET 10 ROWS 
FETCH NEXT 10 ROWS ONLY
