## Veri Tabanı Laboratuvarı Dersi Föy-1

#### MySQL, PostgreSQL, Microsoft SQL Server, ORACLE 11g XE veritabanı yönetim sistemlerinden seçtiğiniz herhangi iki tanesinin kurulumunu yapınız ve aşağıdaki işlemleri her iki sistem üzerinde de ayrı ayrı gerçekleştiriniz. 
PostgreSQL ve Microsoft SQL Server yönetim sistemlerinde veri tabanı işlemleri yapılacaktır.

##### 1- Kurulum yaptığınız her bir sistem üzerinde “kitapevi” isminde bir veritabanı yaratınız ve daha sonra aşağıda tablo şemaları verilen tabloları bu veritabanı içerisine, veri tanımlama dili olan DDL(Data Definition Language) ile oluşturunuz. 

##### 2- Aşağıdaki tabloları uygun veri tipleri ve anahtarlarını belirleyerek oluşturun ve bu taplolara uygun veri girişleri yapınız (SQL kullanarak (insert into) birden fazla veri girişini aynı anda yaptırınız). Aşağıda verilen SQL sorgularını hazırlayıp sonuçlarına ilişkin ekran çıktılarını elde ediniz. 
* Tablolar:
 * Book (book_no, name, first-author, year, price, publisher_no,subject_no)
 * Student (student_no, name, department_no)
 * Subject (subject_no, stitle)
 * Department(department_no,departmentname)
 * Publisher (publisher_no, name)
 * Buys (student_no, book_no) : Öğrencilerin almış olduğu kitaplar
 * Covers (subject_no, book_no): Her bir kitabın hangi konulara ait olduğunu ifade eder. Bir kitap birden fazla konu altına girebilir.
 * Studies (student_no, subject_no): Her bir öğrencinin hangi konularda ilgilendiğini ifade eder.
