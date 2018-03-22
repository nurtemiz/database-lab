--Ogrenci tablosunun oluşturulması
CREATE TABLE ogrenci
( 
	ogrenciID INT PRIMARY KEY NOT NULL,
	ad NVARCHAR(20),
	soyad NVARCHAR(20),
	dTarihi DATE,
	adres NVARCHAR(20),
	telefon NVARCHAR(10),
	bolumID INT,
	vizeNotu INT,
	finalNotu INT
)

--Ogrenci tablosuna veri girilmesi
INSERT INTO Ogrenci
VALUES (14060294, 'NUR', 'TEMİZ', '1996-04-29 00:00:00.0000000', 'Samsun', '5070273279', 1, 70, 70),
	   (15060295, 'ÖZGÜR', 'ÖZDEMİR', '1997-05-29 00:00:00.0000000', 'Samsun', '5050275259', 1, 90, 90);

/* add_student prosedürünün oluşturulması*/
CREATE PROCEDURE add_student
(
	@ogrenciID int,
    	@ad nvarchar(20),
    	@soyad nvarchar(20),
    	@dTarihi date,
    	@adres nvarchar(20),
    	@telefon nvarchar(10),
    	@bolumID int,
    	@vizeNotu int,
    	@finalNotu int
) AS 
INSERT INTO Ogrenci VALUES (@ogrenciID, @ad, @soyad, @dTarihi, @adres, @telefon, @bolumID, @vizeNotu, @finalNotu);

--add_student prosedürünün kullanılması
EXECUTE add_student 13054252, 'Sema', 'Gül', '05.05.1998', 'İstanbul', '1234567890', 2, 90, 90
SELECT * FROM Ogrenci;

--count_student prosedürünün oluşturulması
CREATE PROCEDURE count_student AS
SELECT count(*) FROM Ogrenci;


--count_student prosedürünün kullanılması
EXECUTE count_student;


--Öğrenci bölüm id si döndüren prosedür
CREATE PROCEDURE id_student @bolumID int AS
SELECT * FROM Ogrenci WHERE bolumID = @bolumID;


--id_student prosedürünün kullanılması
EXECUTE id_student '1'


--list_student prosedürünün oluşturulması
CREATE PROCEDURE list_student AS 
SELECT * FROM Ogrenci;

--list_student prosedürünün oluşturulması
EXECUTE list_student;

--delete_trigger oluşturulması
CREATE TRIGGER delete_trigger ON Ogrenci FOR DELETE AS
BEGIN
DECLARE @ogrenciID int
DECLARE @ad nvarchar(20)
DECLARE @soyad nvarchar(20)
DECLARE @dTarihi date
DECLARE @adres nvarchar(20)
DECLARE @telefon nvarchar(10)
DECLARE @bolumID int
DECLARE @vizeNotu int
DECLARE @finalNotu int
SELECT @ogrenciID = ogrenciID FROM DELETED
SELECT @ad = ad FROM DELETED
SELECT @soyad = soyad FROM DELETED
SELECT @dTarihi = dTarihi FROM DELETED
SELECT @adres = adres FROM DELETED
SELECT @telefon = telefon FROM DELETED
SELECT @bolumID = bolumID FROM DELETED
SELECT @vizeNotu = vizeNotu FROM DELETED
SELECT @finalNotu = finalNotu FROM DELETED
INSERT INTO OgrenciYedek 
VALUES (@ogrenciID, @ad, @soyad, @dTarihi, @adres, @telefon, @bolumID, @vizeNotu, @finalNotu)
END


--delete_trigger kullanılması
SELECT * FROM Ogrenci
DELETE FROM Ogrenci WHERE ogrenciID = 13054252;
SELECT * FROM Ogrenci;
SELECT * FROM OgrenciYedek;


--cursor oluşturulması
DECLARE @ad nvarchar(20)
DECLARE @soyad nvarchar(20)
DECLARE @vizeNotu int
DECLARE tCursor CURSOR FOR 
SELECT ad, soyad, vizeNotu FROM Ogrenci
OPEN tCursor
FETCH NEXT FROM tCursor INTO @ad, @soyad, @vizeNotu
WHILE @@FETCH_STATUS = 0
BEGIN UPDATE Ogrenci SET vizeNotu = (@vizeNotu + 5) 
WHERE ad LIKE '%a%' OR ad LIKE '%i%' 
FETCH NEXT FROM tCursor INTO @ad, @soyad, @vizeNotu
END
CLOSE tCursor
DEALLOCATE tCursor


--cursor kullanılması
DECLARE @ad nvarchar(20)
DECLARE @soyad nvarchar(20)
DECLARE @vizeNotu int
DECLARE tCursor CURSOR FOR 
SELECT ad, soyad, vizeNotu FROM Ogrenci
OPEN tCursor
FETCH NEXT FROM tCursor INTO @ad, @soyad, @vizeNotu
WHILE @@FETCH_STATUS = 0
BEGIN UPDATE Ogrenci SET vizeNotu = (@vizeNotu + 5) 
WHERE ad LIKE '%a%' OR ad LIKE '%i%' 
FETCH NEXT FROM tCursor INTO @ad, @soyad, @vizeNotu
END
CLOSE tCursor
DEALLOCATE tCursor
SELECT * FROM Ogrenci


-- CREATED BY NUR TEMİZ
