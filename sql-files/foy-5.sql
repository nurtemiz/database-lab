--faculty tablosunun oluşturulması
CREATE TABLE faculty(
	facultyId INT NOT NULL,
	facultyName NVARCHAR(50) NOT NULL,
	PRIMARY KEY (facultyId)
); 

-- department tablosunun oluşturulması
CREATE TABLE department(
	departmentId INT NOT NULL,
	facultyId INT NOT NULL,
	departmentName NVARCHAR(50) NOT NULL,
	PRIMARY KEY (departmentId),
	FOREIGN KEY (facultyId) REFERENCES faculty(facultyId)
);

--student tablosunun oluşturulması
CREATE TABLE student(
	studentId INT NOT NULL,
	departmentId INT NOT NULL,
	studentName NVARCHAR(50) NOT NULL,
	studentSurname NVARCHAR(50) NOT NULL,
	PRIMARY KEY (studentId),
	FOREIGN KEY (departmentId) REFERENCES department(departmentId)
);

-- faculty tablosuna veri girilmesi
INSERT INTO faculty
VALUES (1000, 'Mühendislik Fakültesi'),
	(1001, 'Tıp Fakültesi'),
	(1002, 'Hukuk Fakültesi'),
	(1003, 'Sağlık Meslek Yüksek Okulu'),
	(1004, 'İktisadi Ve İderi Bilimler Fakültesi'),
	(1005, 'Beden Eğitimi Meslek Yüksek Okulu'),
	(1006, 'Güzel Sanatlar Fakültesi');

-- department tablosuna veri girilmesi
INSERT INTO department
VALUES (100, 1000, 'Bilgisayar Mühendisliği'),
	(101, 1000, 'Elektrik Elektronik Mühendisliği'),
	(102, 1000, 'Makine Mühendisliği'),
	(103, 1000, 'İnşaat Mühendisliği'),
	(104, 1000, 'Malzeme Mühendisliği'),
	(105, 1000, 'Kimya Mühendisliği'),
	(106, 1001, 'Acil Tıp'),
	(107, 1001, 'Adli Tıp'),
	(108, 1001, 'Alie Hekimliği'),
	(109, 1001, 'Beyin ve Sinir Cerrehisi'),
	(110, 1001, 'Çocuk Cerrahisi'),
	(111, 1001, 'Kalp ve Damar Cerrahisi'),
	(112, 1001, 'Genel Cerrahi'),
	(113, 1001, 'Tıbbi Genetik'),
	(114, 1002, 'Özel Hukuk'),
	(115, 1002, 'Kamu Hukuku'),
	(116, 1003, 'Ameliyathane Hizmetleri'),
	(117, 1003, 'Anestezi'),
	(118, 1003, 'Diyaliz'),
	(119, 1003, 'Fizyoterapi Teknikerliği'),
	(120, 1003, 'İlk ve Acil Yardım'),
	(121, 1003, 'Radyoterapi'),
	(122, 1004, 'İşletme'),
	(123, 1004, 'Maliye'),
	(124, 1004, 'Siyaset Bilimi ve Kamu Yönetimi'),
	(125, 1005, 'Antrenörlük Eğitimi Bölümü'),
	(126, 1005, 'Beden Eğitimi ve Spor Eğitimi Bölümü'),
	(127, 1005, 'Spor Yöneticiliği'),
	(128, 1006, 'Resim Heykel Bölümü'),
	(129, 1006, 'Grafik Tasarım Bölümü');

-- student tablosuna veri girilmesi
INSERT INTO student
VALUES	(1, 100, 'Nur', 'Temiz'),
		(2, 100, 'Rabia', 'Aydoğdu'),
		(3, 101, 'Baki', 'Özden'),
		(4, 102, 'Melek', 'Yurt'),
		(5, 103, 'Buğra', 'Aydoğan'),
		(6, 104, 'Bade', 'Toprak'),
		(7, 105, 'Edis', 'Görgülü'),
		(8, 106, 'Sema', 'Temiz'),
		(9, 107, 'Elif', 'Erdinç'),
		(10, 108, 'Gökhan', 'Gölpınar'),
		(11, 109, 'Esma', 'Şahin'),
		(12, 110, 'Onur', 'Ufuk'),
		(13, 111, 'Cemre', 'Özden'),
		(14, 112, 'Bahar', 'Yılmaz'),
		(15, 113, 'Emel', 'Türk'),
		(16, 114, 'Şeyma', 'Sezen'),
		(17, 115, 'Şeyma', 'Tuncer'),
		(18, 116, 'Sude', 'Burcu'),
		(19, 117, 'İpek', 'Çidem'),
		(20, 118, 'Onur', 'Aybars'),
		(21, 119, 'Alptekin', 'Şengül'),
		(22, 120, 'Ela', 'Çelik'),
		(23, 121, 'Ayşe', 'Aslan'),
		(24, 122, 'Selim', 'Özdemir'),
		(25, 123, 'Can', 'Türk'),
		(26, 124, 'Akşın', 'Ay'),
		(27, 125, 'Yavuz', 'Öz'),
		(28, 126, 'Uzay', 'Türkoğlu'),
		(29, 127, 'Emre', 'Kutalmış'),
		(30, 128, 'Simge', 'Burcu'),
		(31, 129, 'Murat', 'Yeşiltepe');

-- öğrenci ID-sine göre öğrenci bilgilerini döndüren procedure
CREATE PROCEDURE student_info (@studentId INT) AS BEGIN
SELECT * FROM student WHERE studentId = @studentId
END

-- student_info procedure'nün çalıştırılması
EXECUTE student_info '5'
