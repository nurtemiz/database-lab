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
