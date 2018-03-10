--Microsoft SQL Server için;
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
