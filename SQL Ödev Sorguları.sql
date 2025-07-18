USE etrade;
GO

-- 1) address tablosunun kontrol etmek için top 100'ünü çekiniz.
SELECT TOP 100 * FROM dbo.ADDRESS;

-- 2) CITIES tablosuna yeni bir kayıt olarak ID, COUNTRYID ve memleketinizi ekleyin.
INSERT INTO dbo.CITIES (ID, COUNTRYID, CITY)
VALUES (9999, 1, 'Eskişehir');

-- 3) USERS tablosundaki 10 numaralı id'yi kendi bilgileriniz ile update edin.
UPDATE dbo.USERS
SET NameSurname = 'Senin Adın Soyadın', EMAIL = 'seninmail@example.com', Password_ = 'YENISIFRE'
WHERE ID = 10;

-- 4) SALEORDERS tablosunda category1'i ŞEKERLEME olan kayıtları getirin.
SELECT * FROM dbo.SALEORDERS
WHERE CATEGORY1 = 'ŞEKERLEME';

-- 5) SALEORDERS tablosunda LineTotal'ı 20.000'den büyük kayıtları getirin.
SELECT * FROM dbo.SALEORDERS
WHERE LINETOTAL > 20000;

-- 6) SALEORDERS tablosunda hafta içi olan kayıtları getirin.
SELECT * FROM dbo.SALEORDERS
WHERE DATENAME(WEEKDAY, ORDERDATE) NOT IN ('Saturday', 'Sunday');

-- 7) SALEORDERS tablosunda pazar günü ve Tablet satışlarını getirin.
SELECT * FROM dbo.SALEORDERS
WHERE DATENAME(WEEKDAY, ORDERDATE) = 'Sunday' AND CATEGORY3 = 'Tablet';

-- 8) ITEMS tablosunda kaç tane tekil category1 vardır?
SELECT COUNT(DISTINCT CATEGORY1) AS TekilKategoriSayisi FROM dbo.ITEMS;

-- 9) ITEMS tablosundaki ürünleri UnitPrice'a göre büyükten küçüğe sıralayınız.
SELECT * FROM dbo.ITEMS
ORDER BY UNITPRICE DESC;

-- 10) SALEORDERS tablosunda şehirlere göre (SUM, COUNT, MIN, MAX, AVG) adeti getirin.
SELECT CITY, SUM(LINETOTAL), COUNT(*), MIN(LINETOTAL), MAX(LINETOTAL), AVG(LINETOTAL)
FROM dbo.SALEORDERS
GROUP BY CITY;

-- 11) Ürün kategorilerine göre toplam satışları getirin.
SELECT CATEGORY1, SUM(LINETOTAL) AS ToplamSatis
FROM dbo.SALEORDERS
GROUP BY CATEGORY1;

-- 12) ORDER ve USERS tablolarını LEFT, RIGHT ve INNER olarak birleştiriniz.
SELECT * FROM dbo.SALEORDERS o LEFT JOIN dbo.USERS u ON o.ID = u.ID;
SELECT * FROM dbo.SALEORDERS o RIGHT JOIN dbo.USERS u ON o.ID = u.ID;
SELECT * FROM dbo.SALEORDERS o INNER JOIN dbo.USERS u ON o.ID = u.ID;

-- 13) ADDRESS ve USERS tablolarını LEFT, RIGHT ve INNER olarak birleştiriniz.
SELECT * FROM dbo.ADDRESS a LEFT JOIN dbo.USERS u ON a.USERID = u.ID;
SELECT * FROM dbo.ADDRESS a RIGHT JOIN dbo.USERS u ON a.USERID = u.ID;
SELECT * FROM dbo.ADDRESS a INNER JOIN dbo.USERS u ON a.USERID = u.ID;

-- 14) En fazla alışveriş hangi markada yapılmıştır?
SELECT BRAND, SUM(LINETOTAL) AS ToplamSatis
FROM dbo.SALEORDERS
GROUP BY BRAND
ORDER BY ToplamSatis DESC;

-- 15) Oyuncak ana kategorisinde, zeka geliştirici üst kategorisinde, oyuncaklar alt kategorisinde en fazla satış yapan bebe oyuncakları nelerdir?
SELECT ITEMNAME, SUM(LINETOTAL) AS ToplamSatis
FROM dbo.SALEORDERS
WHERE CATEGORY1 = 'OYUNCAK' AND CATEGORY2 = 'ZEKA GELISTIRICI' AND CATEGORY3 = 'OYUNCAKLAR' AND CATEGORY4 = 'BEBE OYUNCAKLARI'
GROUP BY ITEMNAME
ORDER BY ToplamSatis DESC;

-- 16) Temizlik kategorisindeki ürünlerin ortalama fiyatı nedir?
SELECT AVG(UNITPRICE) AS OrtalamaFiyat
FROM dbo.ITEMS
WHERE CATEGORY1 = 'TEMIZLIK';

-- 17) Hangi yaş grupları daha fazla alışveriş yapmıştır?
SELECT
  CASE 
    WHEN DATEDIFF(YEAR, BIRTHDATE, GETDATE()) < 20 THEN '0-20'
    WHEN DATEDIFF(YEAR, BIRTHDATE, GETDATE()) BETWEEN 20 AND 35 THEN '20-35'
    WHEN DATEDIFF(YEAR, BIRTHDATE, GETDATE()) BETWEEN 36 AND 55 THEN '36-55'
    ELSE '55+'
  END AS YasGrubu,
  SUM(LINETOTAL) AS ToplamSatis
FROM dbo.USERS u
JOIN dbo.SALEORDERS s ON u.ID = s.ID
GROUP BY 
  CASE 
    WHEN DATEDIFF(YEAR, BIRTHDATE, GETDATE()) < 20 THEN '0-20'
    WHEN DATEDIFF(YEAR, BIRTHDATE, GETDATE()) BETWEEN 20 AND 35 THEN '20-35'
    WHEN DATEDIFF(YEAR, BIRTHDATE, GETDATE()) BETWEEN 36 AND 55 THEN '36-55'
    ELSE '55+'
  END;

-- 18) ITEMS tablosundaki tüm category kolonlarını birleştirin.
SELECT *,
  CONCAT(CATEGORY1, ' > ', CATEGORY2, ' > ', CATEGORY3, ' > ', CATEGORY4) AS KategoriYolu
FROM dbo.ITEMS;

-- 19) PAYMENTS tablosundaki ApproveCode kolonunun ilk 5 değerini ayrı bir kolon olarak yazın.
SELECT *, LEFT(APPROVECODE, 5) AS KOD_ILK5
FROM dbo.PAYMENTS;

-- 20) ApproveCode’daki sayısal değerleri ayrı bir kolon olarak yazın.
SELECT *, 
  CASE 
    WHEN PATINDEX('%[0-9]%', APPROVECODE) > 0 
    THEN SUBSTRING(APPROVECODE, PATINDEX('%[0-9]%', APPROVECODE), LEN(APPROVECODE)) 
    ELSE '' 
  END AS SAYISAL_KISIM
FROM dbo.PAYMENTS;

-- 21) USERS tablosundaki Password kolonundaki tüm değerleri büyük yazın.
SELECT UPPER(PASSWORD_) AS BUYUKSIFRE FROM dbo.USERS;

-- 22) USERS tablosundaki NameSurname kolonundaki soyisimleri küçük yazın.
SELECT LOWER(RIGHT(NameSurname, LEN(NameSurname) - CHARINDEX(' ', NameSurname))) AS kucuk_soyisim
FROM dbo.USERS;

-- 23) INVOICES tablosundaki DATE kolonunu farklı formatlara çevirin.
SELECT 
  FORMAT(DATE_, 'MM/dd/yyyy') AS Format1,
  FORMAT(DATE_, 'yyyy.MM.dd') AS Format2,
  FORMAT(DATE_, 'dd.MM.yyyy') AS Format3,
  FORMAT(DATE_, 'yyyyMMdd') AS Format4
FROM dbo.INVOICES;

-- 24) INVOICES tablosundaki DATE kolonunu yıl, ay, gün, hafta olarak ayrı ayırın.
SELECT 
  YEAR(DATE_) AS YIL,
  MONTH(DATE_) AS AY,
  DAY(DATE_) AS GUN,
  DATEPART(WEEK, DATE_) AS HAFTA
FROM dbo.INVOICES;

-- 25) SALEORDERS tablosundaki MONTH kolonuna göre hangi ayın hangi mevsime geldiğini yazın.
SELECT *,
  CASE 
    WHEN MONTH(ORDERDATE) IN (12, 1, 2) THEN 'Kış'
    WHEN MONTH(ORDERDATE) IN (3, 4, 5) THEN 'İlkbahar'
    WHEN MONTH(ORDERDATE) IN (6, 7, 8) THEN 'Yaz'
    WHEN MONTH(ORDERDATE) IN (9, 10, 11) THEN 'Sonbahar'
  END AS MEVSIM
FROM dbo.SALEORDERS;

-- 26) ITEMS tablosundaki brand'lere göre yeni bir kategori oluşturun.
SELECT *,
  CASE 
    WHEN BRAND = 'ULKER' THEN 'YEME ICME'
    WHEN BRAND = 'REXONA' THEN 'KOZMETIK'
    WHEN BRAND = 'ALGIDA' THEN 'DONDURMA'
    WHEN BRAND = 'NESCAFE' THEN 'SICAKICECEK'
    ELSE 'DIGER'
  END AS YENIKATEGORI
FROM dbo.ITEMS;























