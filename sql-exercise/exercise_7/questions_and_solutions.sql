-- 7.1
-- client_master tablosunda client_no alanı için indeks oluşturulması:
CREATE INDEX client_no ON client_master (client_no)

-- 7.2
-- sales_order tablosu üzerinde s_order_no alanı üzerinde indeks oluşturulması:
CREATE INDEX s_order_no ON sales_order (s_order_no)

-- 7.3
-- sales_order tablosu üzerinde s_order_no ve product_no alanları üzerinde iki alanı birlikte kullanılarak composite indeks oluşturulması:
CREATE INDEX s_order_product_no ON sales_order (s_order_no, salesman_no)

-- 7.4
-- Bir üst seçenekte oluşturulan indeksin silinmesi:
DROP INDEX s_order_product_no

-- 7.5 
-- sales_master tablosu üzerinde sal_amt değeri 3500 den büyük olanlar için view oluşturulması:
CREATE VIEW sal_amt_bigger_t3000 AS 
SELECT * FROM salesman_master WHERE sal_amt > 3000

-- 7.6
-- client_master tablosu üzerinde client_view isminde bir view oluşturulması ve sütun isimlerinin add1, add2, city, pcode, state olacak şekilde sırasıyla değiştirilmesi:
CREATE VIEW client_view(no, name, add1, add2, city, state, pcode)
AS SELECT  client_no, client_name, client_address1, client_address2, city, state, pincode
FROM client_master

-- 7.7
-- client_view isimli view’den şehir ismi ‘Bombay’ olan client isimlerini getiren sorgu:
SELECT no, name, city FROM client_view  WHERE city = ‘Bombay’

-- 7.8
-- client_view isimli view-in silinmesi:
DROP INDEX client_view

-- 7.9
-- sales_order tablosu kullanılarak günlük siparişleri listelemeye yarayan view (bu view her çalıştırıldığında sistem tarihini alarak o güne ilişkin siparişleri listeler) oluşturulması:
SELECT * FROM sales_order WHERE s_order_date = CURRENT_DATE

-- 7.10
-- Sipariş tarihi 10 gün geçen siparişleri müşteri isimleri ve ürün isimleri olarak listeleyen bir sorgu:
SELECT * FROM sales_order WHERE dely_date < CURRENT_DATE - INTERVAL '10' DAY;

