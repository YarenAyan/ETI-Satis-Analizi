# 📊 ETİ Satış Analizi 

Bu proje, [Patika.dev](https://www.patika.dev/) ve [Kız Başına](https://kizbasina.com/) iş birliğinde düzenlenen **Veri Analizi Bootcamp** kapsamında gerçekleştirilmiş ikinci bitirme projesidir. Projede amaç; bir markaya ait veriler üzerinde **SQL ve Power BI** kullanarak analiz yapmak, temel veri manipülasyonu gerçekleştirmek ve elde edilen içgörüleri görselleştirerek anlamlı bir rapor sunmaktır.

---

## 🧠 Proje Hedefi

Bu çalışmada ETİ markasının satış verileri üzerinde analizler yapılmıştır. Kullanıcı davranışları, satış adetleri, sipariş zamanlamaları ve demografik bilgiler üzerinden farklı açılardan raporlar oluşturulmuştur. Proje sonunda aşağıdaki sorulara görsel ve sayısal olarak cevaplar verilmiştir:

- Hangi bölgelerde daha çok satış yapılmakta?
- Kadın ve erkek müşterilerin davranışları nasıl farklılaşıyor?
- Saatlik, günlük ve haftalık satış trendleri nasıl?
- Hangi yaş grubu hangi ürünleri daha çok tercih ediyor?

---

## 🏷️ Marka Seçimi ve Veri Temizliği

Proje kapsamında **ETİ** markası seçilmiştir. Tercih edilme sebebi, veri setindeki veri yoğunluğu ve günlük hayatta sıkça karşılaşılan bir marka olmasıdır.

Veri setinde ETİ dışı bazı veriler de yer almaktaydı. Özellikle "eti" kelimesini içeren fakat **deterjan markası** olan ürünler tespit edilerek filtrelenmiştir. Bu sayede sadece ETİ ürünlerine odaklanılmıştır.

---

## ⚙️ Kullanılan Teknolojiler

- 🛠️ **SQL Server (MSSQL):** Veri sorgulama ve ön işleme adımlarında kullanıldı.
- 📊 **Power BI:** Görsel raporların hazırlanmasında kullanıldı.
- 🧹 **DAX Fonksiyonları:** Yaş hesaplama, cinsiyet sınıflandırma, tarihsel analiz gibi işlemler yapıldı.

---

## 🔎 Veri Üzerinde Yapılan İşlemler

- `Users` tablosunda yaş, cinsiyet, ad-soyad ayrımı gibi işlemler yapıldı.
- `Items` tablosunda kategoriler yeniden adlandırıldı ve `YENIANAKATEGORI` isimli yeni bir koşullu sütun oluşturuldu.
- `Orders` ve `OrderDetail` tablosu birleştirilerek tarihsel analizler yapıldı.
- `Adres` tablosundaki şehir bilgisi ile dışarıdan eklenen `Bölgeler` tablosu eşleştirildi.
- İstanbul’daki genç müşterilerin kategorilere göre cirosu gibi özel analizler yapıldı.

---

## 📌 Rapor Yapısı

Proje sonunda Power BI üzerinden 3 sayfalık interaktif bir rapor hazırlanmıştır:

### 1️⃣ Giriş Sayfası
Kullanıcıyı karşılayan sade bir tanıtım ekranıdır.

![Giriş Sayfası](https://github.com/YarenAyan/ETI-Satis-Analizi/blob/main/ET%C4%B0%20Giri%C5%9F%20Sayfas%C4%B1.png)

---

### 2️⃣ Özet Sayfa
- Saatlik satış grafiği  
- Haftaiçi ve haftasonu satış karşılaştırması  
- Bölgelere göre toplam satış adetleri  
- Temel metrikler: toplam sipariş, müşteri, ciro vb.

![Özet Sayfası](https://github.com/YarenAyan/ETI-Satis-Analizi/blob/main/ET%C4%B0%20%C3%96zet%20Sayfas%C4%B1.png)

---

### 3️⃣ Müşteri Perspektifi
- Tekil müşteri sayısı
- Cinsiyete göre müşteri dağılımı
- Bölgelere göre müşteri dağılımı
- Yaş grubu analizleri
- İstanbul’daki en çok alışveriş yapan ilk 10 müşteri

![Müşteri Sayfası](https://github.com/YarenAyan/ETI-Satis-Analizi/blob/main/ET%C4%B0%20M%C3%BC%C5%9Fteri%20Sayfas%C4%B1.png)

---

### 4️⃣ Kategori Perspektifi
- İstanbul’daki genç müşterilerin kategorilere göre cirosu (ağaç haritası ile)
- Ürün bazlı analizler

![Kategori Sayfası](https://github.com/YarenAyan/ETI-Satis-Analizi/blob/main/ET%C4%B0%20Kategori%20Sayfas%C4%B1.png)

---

## ☁️ Büyük Dosyalar

Power BI (.pbix) dosyası ve `.bak` uzantılı MSSQL yedeği GitHub dosya boyutu sınırını aştığı için ayrı bir Google Drive klasörüne yüklenmiştir. Buradan ulaşabilirsiniz:

🔗 [Drive Linki – ETI Satış Analizi Dosyaları](https://drive.google.com/drive/folders/11edhS--V7DwjYWBnixgv7CJOaOw6IUEQ?usp=sharing)

---

## 🙌 Katkı ve Teşekkür

Bu proje, **Patika.dev** ve **Kız Başına** tarafından yürütülen eğitim kapsamında geliştirilmiştir. Eğitimde emeği geçen tüm eğitmenlerime teşekkür ederim!

---

## 👩‍💻 Geliştirici Hakkında

Merhaba! Ben Yaren Ayan. Bu proje, veri analizi becerilerimi geliştirmek amacıyla Patika.dev & Kız Başına Bootcamp'inde gerçekleştirdiğim bitirme projesi çalışmasıdır. Her türlü öneri ve geri bildiriminiz için bana ulaşabilirsiniz.

* 📧 İletişim: ayanyaren@hotmail.com
* 📌 GitHub: [@yarenayan](https://github.com/yarenayan)  
* 🔗 LinkedIn: [www.linkedin.com/in/yaren-ayan](https://www.linkedin.com/in/yaren-ayan)
