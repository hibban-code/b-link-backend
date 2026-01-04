-- =====================================================
-- LIBRARY DATABASE SEED - PostgreSQL
-- =====================================================
-- Generated from: Final_all_library.xlsx
-- Total Books: 3592
-- Total Libraries: 3
-- Date: 2025-12-30
-- =====================================================

-- Drop existing tables
DROP TABLE IF EXISTS books CASCADE;
DROP TABLE IF EXISTS libraries CASCADE;
DROP TABLE IF EXISTS categories CASCADE;
DROP TABLE IF EXISTS general_categories CASCADE;
DROP TABLE IF EXISTS book_categories CASCADE;
DROP TABLE IF EXISTS book_general_categories CASCADE;

-- =====================================================
-- CREATE TABLES
-- =====================================================

-- Libraries Table
CREATE TABLE libraries (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Books Table
CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    author VARCHAR(500) NOT NULL,
    category TEXT,
    general_category TEXT,
    library_id INTEGER NOT NULL REFERENCES libraries(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Categories Table (for normalized category data)
CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- General Categories Table
CREATE TABLE general_categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Book-Categories Junction Table
CREATE TABLE book_categories (
    book_id INTEGER REFERENCES books(id) ON DELETE CASCADE,
    category_id INTEGER REFERENCES categories(id) ON DELETE CASCADE,
    PRIMARY KEY (book_id, category_id)
);

-- Book-General Categories Junction Table
CREATE TABLE book_general_categories (
    book_id INTEGER REFERENCES books(id) ON DELETE CASCADE,
    general_category_id INTEGER REFERENCES general_categories(id) ON DELETE CASCADE,
    PRIMARY KEY (book_id, general_category_id)
);

-- =====================================================
-- CREATE INDEXES FOR PERFORMANCE
-- =====================================================

-- Books indexes
CREATE INDEX idx_books_library_id ON books(library_id);
CREATE INDEX idx_books_author ON books(author);
CREATE INDEX idx_books_title_trgm ON books USING gin(title gin_trgm_ops);
CREATE INDEX idx_books_author_trgm ON books USING gin(author gin_trgm_ops);
CREATE INDEX idx_books_search ON books USING gin(to_tsvector('indonesian', title || ' ' || author));

-- Junction table indexes
CREATE INDEX idx_book_categories_book_id ON book_categories(book_id);
CREATE INDEX idx_book_categories_category_id ON book_categories(category_id);
CREATE INDEX idx_book_general_categories_book_id ON book_general_categories(book_id);
CREATE INDEX idx_book_general_categories_category_id ON book_general_categories(general_category_id);

-- Enable trigram extension for fuzzy search
CREATE EXTENSION IF NOT EXISTS pg_trgm;

-- =====================================================
-- INSERT LIBRARIES
-- =====================================================

INSERT INTO libraries (id, name, description) VALUES (1, 'Salman Reading Corner', 'Koleksi buku-buku Islam, dakwah, dan pengembangan diri');
INSERT INTO libraries (id, name, description) VALUES (2, 'HOWL Library', 'Koleksi buku sastra, puisi, dan karya kreatif');
INSERT INTO libraries (id, name, description) VALUES (3, 'Creative Space', 'Koleksi buku fiksi, novel, dan literatur kreatif');
SELECT setval('libraries_id_seq', (SELECT MAX(id) FROM libraries));

-- =====================================================
-- INSERT CATEGORIES
-- =====================================================

INSERT INTO categories (name) VALUES ('- Biology
- Anatomy
- Medicine') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('1975') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Abbasiyah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Adab') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Adat Istiadat Setempat') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Adventure') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Agama') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Ahli Sunnah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Ahli Tasawuf') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Ahlussunnah wal Jamaah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Akhir Zaman') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Akhirat') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Akhlak') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Akhlak dan Tasawuf') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Akhlaq') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Akhlaq dan Tasawuf') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Akidah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Al qur''an') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Al-Aqsa') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Al-Hadits dan yang berkaitan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Al-Qur''an dan Ilmu yang Berkaitan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Alam Barzah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Alam Kubur') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Alam Raya') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Alam Semesta') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Aliran dan Sekte dalam Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Alloh SWT') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Alqur''an') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Alquran') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Aneka Ragam Sejarah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Aneka Ragam Sejarah Bandung') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Aneka Ragam tentang Ilmu Bahasa') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Anekdot') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Antariksa') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Antologi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Antropologi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Aqaid') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Aqaid dan Ilmu Kalam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Aqidah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Argumentasi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Art') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Art & Architecture') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Arts & Architecture') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Asia Tenggara') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Asmaul Husna') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Aspek Ibadah Lainnya') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Aspek Spesifik tentang Budaya dan Kebudayaan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Astronomi Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Autobiografi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Ayat Semesta') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('BUDAYA') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Babad') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Bacaan Anak') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Bahagia') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Bahasa Al-Quran') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Bahasa Arab') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Bahasa Indonesia') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Bahasa Mandarin') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Bahasa Pemrograman') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Bahasa dan Gender') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Bani israil') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Bank Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Batavia') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Beladiri') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Belanda') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Bersuci') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Biografi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Biografi - Ahli Politik') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Biografi - Catatan Harian') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Biografi - Guru') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Biografi - Tokoh Agama Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Biografi Ahli Militer') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Biografi Ahli Sejarah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Biografi Kepala Negara') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Biografi Pemuka Agama Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Biografi Pendidik') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Biografi Sastrawan Indonesia') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Biografi Sastrawan Indonesia*') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Biografi Sultan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Biografi Tokoh Agama') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Biografi Tokoh Agama Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Biografi Tokoh Khusus Wanita') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Biografi Tokoh-tokoh Pemuka Agama Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Biografi imam syafi''i') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Biography') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Bisnis') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Buda') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Bully') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Business') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Buya Hamka') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Cara Berpikir Kritis') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Catatan Harian') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Cerita') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Cerita Bergambar') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Cerita Muslim') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Cerita anak') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Cerita dan Kisah dari Al-Qur''an') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Cerita-cerita Hadits') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Cerpen') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Character Development/Perkembangan Kepribadian') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Children''s Book') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Children''s Books') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('China') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Chinese Literature') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Cinta') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Ciptaan Tuhan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Class (Fict.)') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Climate Change') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Coaching') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Colonialism') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Colonialsm') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Comedy') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Comic') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Communication/Komunikasi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Crime') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Crime & Mystery') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Critiques on Capitalism') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Cultura Studies') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Dakwah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Dakwah - Komunikasi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Dakwah - Pelaku') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Dakwah - Sejarah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Dakwah Kampus') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Daya Khayal') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Depresi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Deskripsi dan Penilaian Kritis Karya Sast') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Dewasa') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Diary') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Diponegoro') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Disiplin') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Diskusi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Distribusi Marketing') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Doa dan Zikir') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Drama') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Dystopian') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Dystopian & Post-Apocalyptic') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Education') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Edukasi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Ekologi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Ekonomi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Ekonomi Industri') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Ekonomi Internasional') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Ekonomi Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Emosi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Emosi dan Perasaan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Emotions and Feeling/Emosi dan Perasaan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Ensiklopedia') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Ensiklopedia Pernikahan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Esai Indonesia') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Esai Indonesia sunda') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Essay') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Essays') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Etika Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Evolusi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Evolution - Evolusi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('FIKSI') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('FIlsafat Al-Qur''an') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Fakta') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Family') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Fantasi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Fantasy') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Fantasy & Sci-Fi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Fathers/Ayah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Fatimah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Fatwa Ulama') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Feminism') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Fiki - Ijtihad') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Fikih') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Fikih - Aspek Lainnya') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Fikih - Ibadah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Fikih - Mazhab Syafi''i') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Fikih Muslimah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Fikih Perang') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Fikih Wanita') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Fikih dari berbagai faham') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Fiksi Indonesia') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Fiksi Inggris') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Fiksi Perancis') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Filosofi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Filosuf') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Filsafat') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Filsafat Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Filsafat Kehidupan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Filsafat Manusia') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Filsafat Moral') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Filsafat Umum') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Filsafat asia') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Filsafat dan Teori Ka') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Filsafat dan Teori Kesenian') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Filsafat dan Teori Matematika') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Filsafat dan Teori tentang Ilmu Politik') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Filsuf') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Financial Management') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Fiqh') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Fiqih') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Fiqih Keluarga') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Fisika Kuantum') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Fisika modern') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Forensik') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Fuadi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Gambar dan Seni Menggambar') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Games') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Genetika') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Genocide') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Geography and Travel/Geografi dan Perjalanan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Gerakan Pembaharuan Pemikiran dalam Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('German') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Goverment') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Grammar of Standard English/Tata Bahasa Inggris') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Graphic Novel') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Graphic Novels') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Guide') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Guru') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('HAM dalam Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('HAWWA') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('HUbungan Antara Allah dengan Makhluk') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Habits') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Hadis') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Hadits') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Hadits Shahih') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Hamka') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Hanabaliah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Hari Akhir') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Hari Akhir.') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Hasad') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Health and Fitness') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Hewan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Hijab') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Historical Fiction') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('History') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Hobbies') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Horor') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Horror') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Hubungan Individu dengan Anggota Keluarga') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Hukum Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Hukum Islam Tentang Terorisme') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Hukum tata negara') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Humanity') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Humor') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Ibadah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Ibadah - Puasa') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Ibadah - Salat') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Ibn Taimiyyah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Ibnu Rusyd') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Ibu') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Ide') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Ideologi Politik di Indonesia') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Ijazul Quran') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Ilmu Budaya') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Ilmu Ekonomi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Ilmu Hadits') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Ilmu Hayat') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Ilmu Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Ilmu Kalam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Ilmu Politik dan Ilmu Pemerintahan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Ilmu Riwayah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Ilmu Sejarah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Ilmu Tafsir') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Ilmu al-Qur''an') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Ilmu-ilmu Al-Qur''an') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Ilmu-ilmu Sosial') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Ilmuwan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Ilmuwan Muslim') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Imajinasi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Imam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Imam Ahmad Bin Hambal') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Imam Ghazali') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Imam Madzhab') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Imam Malik') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Imam Nawawi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Imam Zarkasyi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Iman Kepada Allah SWT') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Indonesia') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Indonesian Fiction/Fiksi Indonesia') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Indonesian Literature') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Indonesian literature') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Ingatan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Inklusi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Inovasi Sosial') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Inspirasi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Interaksi Sosial dalam Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Internasional') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('International Relations/Hubungan Internasional') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Isa bin Maryam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Islam (Umum)') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Islam - Aspek lainnya') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Islam - Umum') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Islam Indonesia') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Islam Kontemporer') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Islam Liberal') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Islam Umum') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Islam Zaman Daulah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Islam dan Ekologi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Islam dan Gender') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Islam dan Ilmu') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Islam dan Ilmu Murni') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Islam dan Ilmu Sosial') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Islam dan Ilmu Terapan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Islam dan Kedokteran') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Islam dan Kristen') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Islam dan Sains') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Islam dan Teknologi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Islam dan filsafat') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Islam dan perubahan sosial') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Islam dan politik dunia') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Islam indonesia jawa') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Islam tentang Aliran lain') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Israel') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Isteri Nabi Muhammad') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Jagat Raya') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Janji Allah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Japanese Literature') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Japanese literature') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Jepang') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Jihad') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Jiwa') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Journalism') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Jual Beli') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Jusuf Kalla') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Juz ''Amma') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('KAA') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kaidah hukum') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kalimat') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kampus') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kamus al-Quran') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kandungan Al-Qur''an') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kandungan Al-Quran') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Karakter') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Karangan tentang Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Karikatur') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kata') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kata Mutiara') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Keajaiban Al-Qur''an') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Keajaiban As-Sunnah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Keberagaman') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Keberanian') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kebudayaan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kebudayaan Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kecerdasan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kedokteran Forensik') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kedudukan Wanita dalam Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kehidupan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kehidupan Setelah Nabi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kehilangan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Keimanan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Keluarga') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Keluarga Nabi Muhammad SAW') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Keluarga Sakinah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kemampuan Berbahasa untuk Pendidikan Dasar') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kematian') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kematian.') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kemerdekaan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kepemimpinan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kepengarangan dan Teknik Editorial') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kepribadian') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kepribadian Nabi Muhammad SAW') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kesehatan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kesehatan mental') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kesenian Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kesusastraaan Jepang') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kesusastraan Altaik') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kesusastraan Arab') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kesusastraan Arab - Novel') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kesusastraan Aramaik - Novel') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kesusastraan Daerah dari Indonesia') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kesusastraan India') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kesusastraan Inggris') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kesusastraan Jepang') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kesusastraan Lainnya') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Ketidakadilan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Khadijah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Khalifah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Khilafah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Khulafaurrasyidin') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Khulafaurrasyidin - Umar bin Khaththab') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Khutbah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kisah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kisah Al-Quran') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kisah Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kisah Nabi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kisah Perjalanan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kisah Sahabat') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kisah Teladan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Koleksi Statistik Umum') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Komedi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Komik') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Komputer') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Komunikasi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Komunikasi (Kursus)') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kontroversi Al-Qur''an') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Korea') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Korean Literature') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kota dan Tempat Suci dalam Agama Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kreativitas') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kriminal') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kristen') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kriteria Nabi-Nabi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kritik dan Komentar Mengenai Al-quran') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kucing') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kumcer') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kumpulan Ayat-ayat dan Surat-surat Tertentu dalam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kumpulan Cerita') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kumpulan Cerpen') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kumpulan Hadits') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kumpulan Hadits - Hikmah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kumpulan Hadits Bukhari') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Kumpulan Peristiwa Tertentu') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('LPID-UMS') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Latihan Menulis') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Leadership') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Liberal') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Linguistik') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Literary Criticalism') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Literary Criticism') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Literary Fiction') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Literature') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Logika') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Love') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('MTQ') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Magazine & Zine') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Majalah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Majalah Bobo') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Majelis Konstituante') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Makanan dan Minuman Menurut Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Makhluk yang Ingkar') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Manajemen (Filsafat dan Teori)') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Manajemen Keuangan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Manajemen Personalia') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Masa depan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Masalah Pahala dan Dosa') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Masjid') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Masyarakat Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Masyarakat tradisional') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Mati') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Membaca') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Memelihara Anak Menurut Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Memoar') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Memoir') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Memoirs & Biography') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Mengaji') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Mengasuh') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Mengasuh Anak') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Menulis') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Menulis kreatif') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Menyusui') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Metode Dakwah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Metode Penelitian') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Minat Baca') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Mitologi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Mitologi Cina') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Mitologi Mesir') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Motivasi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Motivasi Islami') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Motivasi hidup') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Muallaf') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Muamalah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Muamalat') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Mudharabah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Muhammad Al-Fatih') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Muhammadiyah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Muhasabah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Mukjizat') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Mukjizat al qur''an') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Muslim Cina') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Muslimah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Mystery') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('NABI Ibrahim') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('NLP') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Nabawiyah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Nabi Isa') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Nabi Khidir') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Naquib Al-attas') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Nasionalisme') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Negara Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Negosiasi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Neraka') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Neuro Linguistic') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Ngaji Qur''an') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Norma') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Novel') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Novel Amerika') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Novel Detektif dan Misteri') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Novel Indonesia') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Novel Inggris') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Novel Jepang') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Novel Tasawuf') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Novel Terjemah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Novel Tragedi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Novel denmark') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('On Womanhood') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Orang Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Orde Baru') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Organ tubuh') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Organisasi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Organisasi Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Organisasi Politik Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Otak') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Other') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Otobiografi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Pahlawan Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Pahlawan Nasional') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Pakaian dan Perhiasan menurut Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Palestina') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Palestine') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Pancasila') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Paragraf') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Parenting') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Parenting Skill') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Pasar bebas') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Paulo Coelcho') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Pe') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Pejuang') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Pelajar') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Pelaku Dakwah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Pelatihan untuk Anak-anak') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Pembaharuan Pemikiran Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Pemberdayaan mayarakat') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Pemerintahan Demokrasi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Pemikiran') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Pemikiran Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Pemimpin Agama') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Pemurnian dan Pembaharuan Pemikiran dalam Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Pendidikan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Pendidikan - Alternatif') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Pendidikan - Filsafat') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Pendidikan - Psikologi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Pendidikan Agama Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Pendidikan Formal') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Pendidikan Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Pendidikan Tinggi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Pendidikan anak') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Penerbitan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Pengajaran Bahasa Arab') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Pengasuhan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Pengasuhan Anak - Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Pengendalian diri') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Pengetahuan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Penjelajahan Dunia') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Penuntut Ilmu') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Penyakit hati') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Penyakit pada Pembuluh yang Membawa Darah ke Otak') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Peradaban') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Perbaiki akhlak') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Perbandingan Kepercayaan Aliran') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Pergerakan Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Peribahasa') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Perilaku sosial') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Perjuangan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Perkawinan - Jodoh') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Perkembangan Karakter') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Perkembangan Kepribadian') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Permasalahan Lingkungan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Pernikahan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Persahabatan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Personal  Growth') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Perspektif Al-Qur''an') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Pertarungan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Perundungan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Pets!') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Petualangan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('PhIlosophy') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Philosophy') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Pikiran') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Poetry') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Poetry & Literary Criticism') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Poligami') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Politics') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Politics & Sociology') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Politik') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Politik Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Politik islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Politik''') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Potensi Diri') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Presiden') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Prilaku terpuji') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Produktif') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Prosa Indonesi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Prosa Indonesia') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Prosa Inggris') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Proses Sosial') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Psikologi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Psikologi - Emosi dan Perasaan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Psikologi Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Psikologi Keluarga') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Psikologi Komunikasi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Psikologi Pendidikan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Psikologi Seks') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Psychology') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Psychology & Self Help') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Puasa Wajib') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Public Speaking') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Puisi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Puisi Indonesia') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Puppetry Show/Pertunjukan Wayang Kulit') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Pustaka') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('QARDHAWI') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Quraish Shihab') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Quran) dan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Race') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Rasionalitas') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Relationship') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Religi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Religions') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Remaja') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Revolusi Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Rhymes') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Riba') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Rintik Sedu') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Riwayat hidup') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Roman') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Romance') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Romansa') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Romantis') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Ru') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Rumah Tangga') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Russian Literature') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('SIrah Nabi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('SOEKARNO') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sahabat Nabi Muhammad SAW') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Said.') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sains') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sains - Bumi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sajak Indonesia') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Salaf') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Salafi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Salat Dhuha') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Salat Sunat - Istikharah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sales Management/Manajemen Pemasaran') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Salman') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Samsoe') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Samsoe B') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sas') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sastra') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sastra Cina') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sastra Daerah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sastra Indonesia') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sastra Inggris') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sastra Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sastra Sunda') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Satire') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Science') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Science Fiction') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sedekah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sejarah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sejarah - Arab') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sejarah - Mongol') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sejarah Al-Qur''an') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sejarah Dunia') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sejarah Eropa Tenggara Kuno') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sejarah Hidup Nabi Mu') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sejarah Indonesia') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sejarah Indonesia - Penjajahan Belanda') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sejarah Indonesia Sejarah Indonesia 1960 - 1969') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sejarah Indonesia pada') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sejarah Indonesia pada Masa Kemerdekaan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sejarah Indonesia pada Periode Soekarno') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sejarah Indonesia pada Periode Tahun 1960 - 1969') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sejarah Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sejarah Islam - Biografi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sejarah Islam - Daulah-Daulah Lain') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sejarah Islam - Zaman Daulah Lainnya') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sejarah Islam - Zaman Nabi Muhammad SAW') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sejarah Islam Indonesia') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sejarah Islam di Berbagai Negeri') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sejarah Islam di Berbagai Negeri Setelah Tahun 180') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sejarah Islam di Indonesia') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sejarah Islam pada Zaman Nabi Muhammad SAW') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sejarah Islam zaman Nabi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sejarah Mesopotamia') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sejarah Nabi Muhammad SAW') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sejarah Nabi Muhammad Saw') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sejarah Nabi dan Rasul Sebelum Nabi Muhammad Saw') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sejarah Palestina Modern') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sejarah Republik Indonesia') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sejarah Turki') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sejarah dan Geografi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sejarah filsafat') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sekolah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sekolah Alternatif') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sekularisme') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Self Discovery') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Self Help') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Self Love') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Semiotik') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sendiri') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Seni') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Seni Hidup') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Seni Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Seni Rupa Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sepi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Shadaqah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Shalat') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Shalat Jumat') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Shodaqoh') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sinematografi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sintaksis') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sirah Nabawi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sirah Nabawiyah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sirah Nabi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sistem Ekonomi Kapitalis') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sistem Ekonomi Liberal') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sistem Pemerintahan Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Situasi dan Kondisi Politik di Indonesia') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Skill') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Social') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Social Interactions within Groups/Interaksi Sosial') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Social Issue') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Social Science/Ilmu-ilmu Sosial') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sosial Pendidikan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sosial Sciences - Ilmu Sosial') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sosial dan Budaya Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sosiologi dan Antropolgi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sosiologi dan Antropologi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Spanyol') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Spiritual') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Story') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Struktur Masyarakat Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sufi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sukses Pribadi dalam Bisnis') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Suku Sunda') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sunnah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Sunni') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Superhero') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Surah Yasin') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Surat Al-Fatihah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Surat-surat Indonesia') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Surga') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Syair Indonesia') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Syariat Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Syirik') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('TAFSIR') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('TEORI PENCIPTAAN ALAM') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Tafsir Al-Quran') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Tajwid') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Tarbiyah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Tasawuf') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Tata Bahasa') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Tata Bahasa Arab') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Tata Bahasa Indonesia') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Tata Krama dan Kebiasaan - Aceh') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Tauhid') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Teknik Menggambar Kartun') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Tenaga Pengajar') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Teologi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Teologi Agama Kristen Lainnya') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Teori Filsafat') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Tere Liye') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Terjemah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Terorisme') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Thaharah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Thomas Jefferson') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Thriller') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Tokoh') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Tokoh Politik') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Topik terkait  filsafat') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Traavel') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Transportasi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Travel') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Ulama') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Umar ibn Abdul Aziz') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Ural dan Sekitarnya') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Ushul Fikih') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Usul Fikih') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Utsman bin ''Affan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Visual') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Wanita') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Wanita Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Wanita dalam Pandangan Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Warisan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Wawasan Al-Qur''an') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Western Classic') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Western Classic Lit.') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Western Classics') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Western Contemporary Lit.') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('World Literature') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Yahudi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Yusuf.') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('ZAKARIA') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Zakir Naik') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Zaman Daulah Abbasiyah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Zaman Edan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('Zionisme') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('adab dalam Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('al-Qur''an') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('al-Qur''an - Hafalan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('al-Quran') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('al-quranAl-Qur''an (Al Qur''an') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('amal shaleh') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('amalan harian') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('anak') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('anak-anak') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('belajar') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('budaya') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('budaya politik') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('buku') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('dosa') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('eDUCATION') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('ekonomi pesantren') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('eksisitensialisme') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('essai') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('etika') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('feminisme') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('fikih mazhab') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('fikih sunnah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('filsafat barat') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('filsafat islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('filsafat jepang') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('filsafat modern') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('finansial') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('fisikawan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('hadits mengenai ibadah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('home sweet loan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('hukum islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('humaniora dan islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('ideologi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('ideologi khawarij') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('inspirasi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('isi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('islam dan bidang lain') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('islam dan kebudayaan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('islam dan sekularisme') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('islam moderat') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('jurnalisme') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('kajian') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('kemanusiaan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('kepenulisan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('kerajaan islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('khawarij') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('kisah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('kisah teladan keluarga Nabi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('komunikasi massa') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('konflik') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('kreatif') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('kreativitas') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('kumpulan hadis') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('literasi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('makhluk') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('marketing') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('masyarakat') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('matematika') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('mazhab syafi''i') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('memoirs & Biography') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('menthal health') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('metode belajar dan mengajar') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('metode dan sistem pendidikan islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('metode membaca al-quran') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('misteri') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('muslim') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('nikah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('non fiksi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('novel filsafat') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('novel populer') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('nusantara') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('orang tua') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('pahlawan') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('patriaki') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('pemasaran') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('pembelajaran') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('pemuda') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('pendidikan Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('pengembangan diri') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('perbandingan mahzab') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('peristiwa') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('perjalanan spiritual') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('perkembangan Islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('pernikahan islami') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('perubahan hukum') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('pondok pesantren') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('psikoanalisis') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('puis') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('ras') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('refleksi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('sains dan agama') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('sandwich generation') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('sejarah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('sejarah masjid') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('sejarah nabi') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('self healing') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('self improvement') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('statistika') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('syahabiyah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('syiah') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('tafsir') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('teknologi dan islam') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('teori') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('tips marketing') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('uang') ON CONFLICT (name) DO NOTHING;
INSERT INTO categories (name) VALUES ('writing skill') ON CONFLICT (name) DO NOTHING;

-- =====================================================
-- INSERT GENERAL CATEGORIES
-- =====================================================

INSERT INTO general_categories (name) VALUES ('Agama') ON CONFLICT (name) DO NOTHING;
INSERT INTO general_categories (name) VALUES ('Bisnis & Manajemen') ON CONFLICT (name) DO NOTHING;
INSERT INTO general_categories (name) VALUES ('Ekonomi') ON CONFLICT (name) DO NOTHING;
INSERT INTO general_categories (name) VALUES ('Fiksi Genre Spesifik') ON CONFLICT (name) DO NOTHING;
INSERT INTO general_categories (name) VALUES ('Fiksi Kontemporer & Klasik') ON CONFLICT (name) DO NOTHING;
INSERT INTO general_categories (name) VALUES ('Fiksi Sejarah') ON CONFLICT (name) DO NOTHING;
INSERT INTO general_categories (name) VALUES ('Filsafat & Etika') ON CONFLICT (name) DO NOTHING;
INSERT INTO general_categories (name) VALUES ('Ilmu Pengetahuan Alam & Teknologi') ON CONFLICT (name) DO NOTHING;
INSERT INTO general_categories (name) VALUES ('Ilmu Sosial & Politik') ON CONFLICT (name) DO NOTHING;
INSERT INTO general_categories (name) VALUES ('Nonfiksi Naratif') ON CONFLICT (name) DO NOTHING;
INSERT INTO general_categories (name) VALUES ('Pengembangan Diri') ON CONFLICT (name) DO NOTHING;
INSERT INTO general_categories (name) VALUES ('Psikologi & Kesehatan Mental') ON CONFLICT (name) DO NOTHING;
INSERT INTO general_categories (name) VALUES ('Sastra & Puisi') ON CONFLICT (name) DO NOTHING;
INSERT INTO general_categories (name) VALUES ('Sejarah & Biografi') ON CONFLICT (name) DO NOTHING;
INSERT INTO general_categories (name) VALUES ('Seni') ON CONFLICT (name) DO NOTHING;

-- =====================================================
-- INSERT BOOKS
-- Total: 3592 books
-- =====================================================

-- Batch 1/8 (Records 1-500)
INSERT INTO books (title, author, category, general_category, library_id) VALUES
    ('Muhammad: Sang Yatim', 'SAID, Muhammad  Sameh', 'Sirah Nabi, Sirah Nabawiyah, Sejarah Hidup Nabi Mu', 'Sejarah & Biografi, Agama', 1),
    ('Membentuk Fikrah dan Visi Gerakan Islam', 'YAKAN, Fathi.', 'Dakwah', 'Agama', 1),
    ('Muslim tanpa Masjid: mencari metode aplikasi nilai nilai al Qur''an masa kini', 'KUNTOWIJOYO', 'Islam dan Ilmu', 'Agama, Ilmu Pengetahuan Alam & Teknologi', 1),
    ('Semua Ada Saatnya', 'AL-MISHRI, Syaikh Mahmud', 'Akhlak, Akhlaq', 'Agama, Pengembangan Diri', 1),
    ('Fiqhud Da''wah: Jejak risalah dan dasar dasar da''wah', 'NATSIR, M.', 'Dakwah - Sejarah', 'Sejarah & Biografi, Agama', 1),
    ('Bekerja Karena Allah; Tips Menjadi Karyawan Produktif, Bahagia, Bergaji Berkah, dan Berpahala Melimpah', 'Cecep Hasanuddin, MUSTARI, Idat.', 'Akhlak, Akhlaq', 'Agama, Pengembangan Diri', 1),
    ('Kitab Leadership: Surat Imam Ghazali Untuk Para Pemimpin', 'Furqan, Aminullah, GHAZALI, al.', 'Kepemimpinan, Leadership, muslim, Pemimpin Agama', 'Ilmu Sosial & Politik, Agama, Pengembangan Diri', 1),
    ('Manajemen Masjid', 'HARAHAP, Sofyan Syafri.', 'Masjid', 'Agama', 1),
    ('Memelihara Lingkungan dalam Ajaran Islam', 'ABDURRAHMAN, Maman.', 'Ekologi, Islam dan Ekologi', 'Agama, Ilmu Pengetahuan Alam & Teknologi', 1),
    ('Membina Lingkungan Lewat Inovasi Sosial: Tradisi Santri untuk Inovasi Imahnoong dan Pasar Purnama', 'ADDINI, Zahra Fulli Fauzia, ADITRA, Rakhmat F, Ekomadyo, Agus S., MAULANA, Annas T., PRASETIO, Eko Agus, SANTRI, Tyas, SILMI, Hasna', 'Inovasi Sosial, Pemberdayaan mayarakat', 'Ilmu Sosial & Politik', 1),
    ('JK Ensiklopedia', 'ABDULLAH, Husain.', 'Jusuf Kalla', 'Sejarah & Biografi', 1),
    ('Jalan Kalla Versi Komik', 'SYAMRIL', 'Jusuf Kalla, Tokoh Politik, Biografi', 'Ilmu Sosial & Politik, Sejarah & Biografi', 1),
    ('Orang Aneh', 'CAMUS, Albert', 'Fiksi Perancis', 'Fiksi Kontemporer & Klasik', 1),
    ('Filosofi Teras', 'Manampiring, Henry, Wibowo, Dr. A. Setyo', 'Filsafat Kehidupan, self improvement, Teori Filsafat', 'Filsafat & Etika, Pengembangan Diri', 1),
    ('Pergi', 'LIYE, Tere.', 'Fiksi Indonesia, Prosa Indonesia', 'Fiksi Kontemporer & Klasik', 1),
    ('Sagaras', 'LIYE, Tere.', 'Fiksi Indonesia, Novel', 'Fiksi Kontemporer & Klasik', 1),
    ('Bedebah Di Ujung Tanduk', 'LIYE, Tere.', 'Fiksi Indonesia, Kriminal, Novel, Novel Detektif dan Misteri, perubahan hukum, Politik, Sastra Indonesia', 'Fiksi Kontemporer & Klasik, Fiksi Genre Spesifik, Ilmu Sosial & Politik', 1),
    ('Si Putih', 'LIYE, Tere.', 'Fiksi Indonesia, Novel Detektif dan Misteri, Novel Indonesia, Remaja', 'Fiksi Genre Spesifik', 1),
    ('Lumpu', 'LIYE, Tere.', 'FIKSI, Indonesian Fiction/Fiksi Indonesia, Prosa Indonesi, Novel Detektif dan Misteri, Novel Indonesia, Remaja', 'Fiksi Kontemporer & Klasik, Fiksi Genre Spesifik', 1),
    ('Bibi Gill', 'LIYE, Tere.', 'Fantasi, Fiksi Indonesia, Novel Detektif dan Misteri, Novel Indonesia', 'Fiksi Genre Spesifik', 1),
    ('Matahari Minor', 'LIYE, Tere.', 'Fantasi, Fiksi Indonesia, Novel, Novel Detektif dan Misteri, Novel Indonesia', 'Fiksi Genre Spesifik', 1),
    ('Yang Telah Lama Pergi', 'LIYE, Tere.', 'Fiksi Indonesia, Kisah Perjalanan, Novel Indonesia', 'Fiksi Kontemporer & Klasik, Nonfiksi Naratif', 1),
    ('Seri Bumi: ILY', 'LIYe, Tere', 'Daya Khayal, Imajinasi, Kreativitas, FIKSI, Fiksi Indonesia, Ide, Inspirasi', 'Fiksi Kontemporer & Klasik, Pengembangan Diri', 1),
    ('Rihlah Ibnu Bathuthah; Memorial Perjalanan Kelililng Dunia di Abad Pertengahan', 'BATHUTHAH, Muhammad Bin Abdullah, Muhammad Muchson Anasy', 'Kisah Perjalanan', 'Nonfiksi Naratif', 1),
    ('Muhammad Al-Fatih: Perang Varna', 'Satria, Handri', 'Muhammad Al-Fatih, Pahlawan Islam', 'Sejarah & Biografi, Agama', 1),
    ('Al-Fatih vs Vlad Dracula #2; Harapan', 'Aminah Mustari, Isa, Sayf Muhammad, Satria, Handri', 'Biografi Tokoh-tokoh Pemuka Agama Islam', 'Sejarah & Biografi, Agama', 1),
    ('Seni Menertawakan (Beban) Hidup', 'Raymond', 'Ide, Inspirasi, Motivasi, Motivasi hidup, self healing, self improvement', 'Pengembangan Diri', 1),
    ('Kehidupan Setelah Jam 5 Sore', 'Farhana, Alifah', 'Dewasa, essai, Fiksi Indonesia, Perkembangan Kepribadian, Perkembangan Karakter, self improvement', 'Pengembangan Diri', 1),
    ('Parable', 'Khrisna, Brian', 'FIKSI, Fiksi Indonesia, Novel Indonesia, Sastra', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 1),
    ('Khutbah Jumat Salman ITB 2018', 'SALMAN, Tim Khatib', 'Islam, Khutbah, Salman, Shalat Jumat', 'Agama', 1),
    ('Seribu Wajah Ayah', 'Ala, Azhar Nurun', 'Fathers/Ayah, Fiksi Indonesia, Kehidupan, Novel', 'Fiksi Kontemporer & Klasik', 1),
    ('Melejitkan Kepekaan Emosional', 'SEGAL, Jeanne.', 'Psikologi', 'Psikologi & Kesehatan Mental', 1),
    ('Menjadi Lelaki Luqmanul Hakim Buku 2', 'RUSFi,Adriano.', 'Menyusui, Mengasuh, Memelihara Anak Menurut Islam', 'Agama, Pengembangan Diri', 1),
    ('Awe Inspiring Us', 'Aisyah, Nur Dewi', 'Ide, Inspirasi, Motivasi Islami, Parenting Skill, Psikologi Islam', 'Agama, Psikologi & Kesehatan Mental, Pengembangan Diri', 1),
    ('Hidup Satu Kali Lagi', 'QOONITA, Farah', 'Ide, Inspirasi, Motivasi Islami, Psikologi, Sastra Indonesia, self improvement', 'Sastra & Puisi, Psikologi & Kesehatan Mental, Pengembangan Diri', 1),
    ('Bertemu Dewasa', 'QOONITA, Farah', 'Ide, Inspirasi, Kumpulan Cerpen, Muhasabah, Novel, self improvement', 'Fiksi Kontemporer & Klasik, Pengembangan Diri', 1),
    ('Kuliah Al-Islam Pendidikan agama Islam Di Perguruan Tinggi', 'ANSHARI, Endang Saifuddin.', 'Pendidikan Agama Islam', 'Agama', 1),
    ('Muhammad al-Fatih 1453', 'SIAUW, Felix Y.', 'Biografi - Tokoh Agama Islam', 'Sejarah & Biografi, Agama', 1),
    ('Islam Untuk Disiplin Ilmu Filsafat', 'RASJIDI Prof. Dr. H.M', 'Islam dan filsafat, Samsoe B', 'Filsafat & Etika, Agama', 1),
    ('Propethic Parenting for Girls: cara nabi  SAW mendidik anak perempuan', 'ARMANSYAH, JUSAN, Misran', 'Parenting Skill, Pendidikan Agama Islam', 'Agama, Pengembangan Diri', 1),
    ('Kenal, Dekat, AKhirnya Jatuh Cinta Pada al-Quran', 'Hanifah, Hana', 'al-Quran, Ide, Inspirasi, Motivasi Islami', 'Agama, Pengembangan Diri', 1),
    ('Menua Dengan Gembira', 'Dwifatma, Andina', 'Cinta, Dewasa, essai, Kehidupan, self improvement', 'Pengembangan Diri', 1),
    ('Shalahuddin Al-Ayyubi: Melawan Bayangan', 'ISA, Muhammad Sayf., Satria, Handri', 'Cerita anak, Islam, Komik, Perjuangan, Sejarah Islam', 'Sejarah & Biografi, Agama, Seni', 1),
    ('Shalahuddin Al-Ayyubi: Kegemilangan', 'ISA Muhamad Sayf, Satria, Handri', 'anak-anak, Cerita anak, FIKSI, Komik, Perjuangan, Sejarah Islam', 'Sejarah & Biografi, Seni', 1),
    ('Meeting Muhammad: Merasakan Hidup Bersama Nabi Saw.', 'Ardiyanto, Herman, Suleiman, Omar', 'Islam, Kisah, Sejarah Nabi Muhammad Saw, Sirah Nabi, Nabawiyah, Sejarah Nabi Muhammad SAW, Terjemah', 'Sejarah & Biografi, Agama', 1),
    ('Shalahuddin Al-Ayyubi: Pertempuran', 'ISA, Muhammad Sayf., Satria, Handri', 'Islam, Komik', 'Agama, Seni', 1),
    ('Peri Kehidupan Generasi Tabiin', 'Agus Wahid Rahman Abu Ibrahim, BAASYA, Abdur Rahman Rafai', 'Kehidupan Setelah Nabi, Samsoe B', 'Sejarah & Biografi, Agama', 1),
    ('Hukum Ekonomi Syariah', 'ALI, zainuddin', 'Ekonomi Islam', 'Agama, Ekonomi', 1),
    ('Maaf Tuhan, Aku Hampir Menyerah', 'ALFIALGHAZI', 'Motivasi Islami, Perkembangan Kepribadian, Perkembangan Karakter', 'Agama, Pengembangan Diri', 1),
    ('Ya Allah, Aku Pulang', 'ALFIALGHAZI', 'Motivasi Islami, Perkembangan Kepribadian, Perkembangan Karakter, self improvement', 'Agama, Pengembangan Diri', 1),
    ('Kami (Bukan) Sarjana Kertas', 'Khairen, J.S', 'Kampus, Sastra', 'Sastra & Puisi', 1),
    ('Karena Menikah Tak Sebercanda Itu', 'Ar-Risalah, Amar', 'Motivasi Islami, Parenting, Parenting Skill, Pernikahan, pernikahan islami', 'Agama, Pengembangan Diri', 1),
    ('Hidup Apa Adanya', 'Prihastuti, Presilia, Suhyun, Kim', 'Kesehatan mental, Motivasi, Motivasi hidup, pengembangan diri, Psikologi, self improvement', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 1),
    ('Teman yang Tepat untuk Perjalanan yang Lambat', 'Kitairae', 'Kehidupan, Motivasi hidup, self improvement, Self Love', 'Pengembangan Diri', 1),
    ('Save The Cat! Writes a Novel', 'Brody, Jessica, LESTARI, dee, Mastura, Nuraini', 'Kepengarangan dan Teknik Editorial, Menulis, Novel, writing skill', 'Sastra & Puisi, Pengembangan Diri', 1),
    ('Good Vibes, Good Life', 'King, Vex', 'inspirasi, Motivasi hidup, self improvement', 'Pengembangan Diri', 1),
    ('Three Qul: Al Ikhlas, Al Falaq, An Nas', 'Nurdianto, Buya Talqis', 'anak-anak, Ilmu al-Qur''an, Ilmu Tafsir, Komik, Tafsir Al-Quran', 'Agama, Seni', 1),
    ('Insecurity Is My Middle Name', 'SYAHRIN, alvi', 'inspirasi, Motivasi Islami, self improvement', 'Agama, Pengembangan Diri', 1),
    ('Kisah Seekor Camar dan Kucing yang Mengajarinya Terbang', 'Agustinus, Ronny, Spulveda, Luis', 'FIKSI, Novel, Spanyol', 'Fiksi Kontemporer & Klasik', 1),
    ('Rahasia Agar Tak Mudah Dilupakan', 'Astuti, Kartini F', 'Ide, Inspirasi, Motivasi Islami, Muslimah, self improvement', 'Agama, Pengembangan Diri', 1),
    ('Pukul Setengah Lima', 'Sedu, Rintik', 'Cinta, FIKSI, Fiksi Indonesia, Novel Indonesia, Rintik Sedu', 'Fiksi Kontemporer & Klasik', 1),
    ('Absurditas Cinta: Perjalanan Mengutuhkan Hati yang Sepi', 'Ayub, Sholah', 'Agama, Cerita, Cinta, muslim, Story, Visual', 'Agama, Seni', 1),
    ('Aura Wanita-wanita Sufi', 'SULAMI, Abu Abdurrahman.', 'Tasawuf', 'Agama', 1),
    ('Dimensi Mistik Islam', 'Sapardi Djoko Damono, SCHIMMEL, Annemarie', 'Samsoe B, Sufi', 'Agama', 1),
    ('Jurnal salman: sains, teknologi dan kemanusiaan', 'ALDIN, alfathri, KARTAWIJAYA,budhiana', 'kemanusiaan, sains dan agama, teknologi dan islam', 'Agama, Ilmu Pengetahuan Alam & Teknologi', 1),
    ('Jurnal Salman: sains teknologi dan kemanusiaan [mencari titik temu sains-teknologi, realitas sosial dan agama]', 'ALDIN, alfathri, KARTAWIJAYA,budhiana', 'humaniora dan islam, sains dan agama, teknologi dan islam', 'Ilmu Sosial & Politik, Agama, Ilmu Pengetahuan Alam & Teknologi', 1),
    ('The Tao Of Islam', 'MURATA, Sachiko.', 'Islam', 'Agama', 1),
    ('Muslim Produktif; Ketika Keimanan Menyatu dengan Produktivitas', 'ALI, Marlina., FARIS, Mohammed., KUSNANDAR', 'Motivasi Islami', 'Agama, Pengembangan Diri', 1),
    ('Mengajar Seperti Finlandia', 'fransiskus Wicakso, WALKER , Timothy', 'metode belajar dan mengajar', 'Pengembangan Diri', 1),
    ('Talk like TED: the 9 public speaking secret of the world''s top minds', 'GALLO, carmine', 'Public Speaking', 'Pengembangan Diri', 1),
    ('communication Made Easy: Kata Siapa Berbicara dan Melobi itu Susah?', 'PRANATA, David.', 'Communication/Komunikasi', 'Ilmu Sosial & Politik', 1),
    ('Bidayatul Mujtahid wa Nihayatul Muqtashid; Jilid I', 'RUSYD, Ibnu., SHIDDIQ, Abdur Rosyad.', 'Fikih, Fiqih, Fiqh, Hukum Islam, perbandingan mahzab', 'Agama', 1),
    ('Shahih Sirah Nabawiyah', 'MUBARAKFURY, Shafiyurrahman.', 'Sirah Nabi, Nabawiyah, Sejarah Nabi Muhammad SAW', 'Sejarah & Biografi, Agama', 1),
    ('Etika al-Ghazali', 'Pustaka, QUASEM, M. Abul.', 'etika, Etika Islam', 'Filsafat & Etika, Agama', 1),
    ('Fiqih Muamalah', 'SYAFE''I, Rachmat', 'Muamalah, Samsoe B', 'Agama, Ekonomi', 1),
    ('Pengantar Kajian Islam : Studi Analistik Komprehensif  tentang Pilar-pilar Substansial , Karakteristik , Tujuan dan Sumber Acuan Islam', 'QARDHAWY, Yusuf, Setiawan Budi Utomo', 'Karangan tentang Islam, Samsoe B', 'Agama', 1),
    ('Psikologi Komunikasi', 'RAKHMAT, Jalaluddin.', 'Psikologi Komunikasi', 'Ilmu Sosial & Politik, Psikologi & Kesehatan Mental', 1),
    ('Rapijali 1: Mencari', 'LESTARI, Dewi.', 'Fiksi Indonesia, Novel Indonesia', 'Fiksi Kontemporer & Klasik', 1),
    ('Atomic Habits', 'Clear, James', 'Habits, Ide, Inspirasi, Motivasi hidup, self improvement', 'Pengembangan Diri', 1),
    ('Buya Hamka', 'FUADI, A.', 'Biografi - Tokoh Agama Islam, Fiksi Indonesia, Fuadi', 'Fiksi Kontemporer & Klasik, Sejarah & Biografi, Agama', 1),
    ('Haji; Falsafah, Syariah dan Rihlah', 'AUSOP, Asep Zaenal.', 'Samsoe B', 'Agama', 1),
    ('Retorika Islam', 'QARADHAWI, Yusuf al.', 'Dakwah - Komunikasi', 'Agama', 1),
    ('Jati Diri Wanita Menurut al-Quran dan Hadis', 'SYUQQAH, Abu.', 'Wanita dalam Pandangan Islam', 'Ilmu Sosial & Politik, Agama', 1),
    ('Studi Kemuhammadiyahan', 'HIDAYAT , Syamsul', 'LPID-UMS, Muhammadiyah', 'Agama', 1),
    ('Natsir: Politik santun di antara dua rezim', 'DEWANTO, Nugroho', 'Biografi', 'Sejarah & Biografi', 1),
    ('Ilmu, Teori dan Filsafat Komunikasi', 'EFFENDY, Onong Uchjana', 'Komunikasi', 'Ilmu Sosial & Politik', 1),
    ('Gila Baca Ala Ulama: Potret Keteladanan Ulama Dalam Menuntut Ilmu', 'FAUZI, Arif.', 'adab dalam Islam', 'Agama, Pengembangan Diri', 1),
    ('Poligami', 'FARIDL, Miftah., Pustaka', 'Poligami', 'Ilmu Sosial & Politik, Agama', 1),
    ('Filsafat Ilmu', 'HUSAINI, Adian.', 'Filsafat, Filsafat Islam', 'Filsafat & Etika, Agama', 1),
    ('Kitab Anti Bodoh', 'BENNET, Bo, NUGRAHA, Sidik', 'Pikiran', 'Psikologi & Kesehatan Mental', 1),
    ('Supernova 6: Inteligensi Embun Pagi', 'LESTARI, Dewi.', 'Novel', 'Fiksi Kontemporer & Klasik', 1),
    ('Pengantar Filsafat', 'WIRAMIHARDJA, A. Sutardjo', 'Samsoe B, Teori Filsafat', 'Filsafat & Etika', 1),
    ('Agama Dan Filsafat', 'MAQSUD , Abdul Maqsud Abdul Ghani Abdul, Saifullah', 'Filsafat Islam, Samsoe B', 'Filsafat & Etika, Agama', 1),
    ('al-Qur''an Sumber Hukum Islam yang Pertama', 'Agus Syihabudin, FARIDL, Miftah., Pustaka', 'al-Quran, Samsoe B', 'Agama', 1),
    ('Masjid; Sarana Pembina Masa Depan', 'FARIDL, Miftah., Pustaka', 'Masjid', 'Agama', 1),
    ('Masjid', 'FARIDL, Miftah., Pustaka', 'Masjid', 'Agama', 1),
    ('Aroma Karsa', 'LESTARI, dee', 'Novel Indonesia', 'Fiksi Kontemporer & Klasik', 1),
    ('Jalan Menuju Tuhan', 'PURWANTO, Yedi', 'Tasawuf', 'Agama', 1),
    ('Minhajul Abidin', 'IRAWAN, Aguk', 'Tasawuf', 'Agama', 1),
    ('Hermawan Kartajaya on Marketing Mix', 'SALAHUDDIEN', 'pemasaran, tips marketing', 'Bisnis & Manajemen', 1),
    ('Tan Malaka; Bapak Republik yang Dilupakan', 'ZULKIFLI, Arif.', 'Biografi - Ahli Politik', 'Ilmu Sosial & Politik, Sejarah & Biografi', 1),
    ('Perawan Remaja dalam Cengkraman Militer', 'TOER, Pramoedya Ananta.', 'Catatan Harian', 'Nonfiksi Naratif', 1),
    ('Keajaiban Toko Kelontong Namiya', 'HIGASHINO, Keigo.', 'misteri, Novel Detektif dan Misteri, Novel Jepang, Sastra', 'Fiksi Genre Spesifik, Sastra & Puisi', 1),
    ('Filsafat Moral', 'Faiz, Fahruddin', 'Filsafat, Filsafat Moral, Filsuf', 'Filsafat & Etika', 1),
    ('Pasukan Al-Qur''an', 'Nurimannisa, Melinda, Nuriza, Nazri, Sriwulan M., Ambar, Widyastuti, Anggi', 'Al-Aqsa, anak, Cerita Bergambar, Palestina, Pejuang', 'Sejarah & Biografi, Seni', 1),
    ('Elipsis', 'ANNESYA, Devania.', 'Fiksi Indonesia', 'Fiksi Kontemporer & Klasik', 1),
    ('Origin', 'BROWN, Dan., NIMPOENO, Ingrid Dwijani.', 'Fiksi Inggris', 'Fiksi Kontemporer & Klasik', 1),
    ('Sapiens: Riwayat Singkat Umat Manusia', 'HARARI, Yuval Noah', 'Sosiologi dan Antropolgi', 'Ilmu Sosial & Politik', 1),
    ('Homo Deus; Masa Depan Umat Manusia', 'HARARI, Yuval Noah, Yanto Musthofa', 'Sosiologi dan Antropologi', 'Ilmu Sosial & Politik', 1),
    ('Fiqh Prioritas', 'QARADHAWI, Yusuf al.', 'Fiqih', 'Agama', 1),
    ('Minhajul Muslim; Panduan Hidup Menjadi Muslim Kaffah', 'JAZAIRI, Abu Bakar Jabir., Salafudin Abu Sayyid', 'Akhlak, Akhlaq', 'Agama, Pengembangan Diri', 1),
    ('Jejak bisnis Rasul', 'Aizuddinnur Zakaria, Gita Romadhona, SULAIMAN, Muhammad', 'Sejarah Nabi Muhammad Saw', 'Sejarah & Biografi, Agama', 1),
    ('Chicken Soup of Asmaul Husna', 'PRASETYO, Wiwid.', 'Asmaul Husna', 'Agama', 1),
    ('Sifat Shalat Nabi SAW', 'ALBANI, M. Nashiruddin al., Muhammad Thalib', 'Ibadah - Salat', 'Agama', 1),
    ('Perempuan di Hati Nabi SAW', 'Fedrian Hasmand, MUKANISI, Utsman Qadri.', 'Sirah Nabawi', 'Sejarah & Biografi, Agama', 1),
    ('Sherlock Holmes Short Stories #2', 'DOYLE, Arthur Conan.', 'Novel Inggris', 'Fiksi Kontemporer & Klasik', 1),
    ('The Magic Library; Perpustakaan Ajaib Bibbi Bokken', 'GAARDER, Jostein., Klaus Hagerup, PRABANTORO, Andityas., SALEH, Ridwana.', 'Novel Detektif dan Misteri', 'Fiksi Genre Spesifik', 1),
    ('Hajar: Rahasia hati sang ratu zamzam', 'Aminahyu Fitriani, Bunda Ina, ERASLAN, Sibel', 'Kesusastraan Altaik, Ural dan Sekitarnya', 'Sastra & Puisi', 1),
    ('Sebuah Seni Untuk Bersikap Bodo Amat', 'MANSON, Mark', 'Perkembangan Kepribadian, Perkembangan Karakter', 'Pengembangan Diri', 1),
    ('Lembaga Hidup', 'HAMKA, Muh. Iqbal Santosa', 'Filsafat Islam', 'Filsafat & Etika, Agama', 1),
    ('Falsafah Hidup', 'HAMKA', 'Filsafat Islam', 'Filsafat & Etika, Agama', 1),
    ('Tasawuf Modern', 'HAMKA, Muh. Iqbal Santosa', 'Filsafat Islam', 'Filsafat & Etika, Agama', 1),
    ('Wawasan al-Quran', 'SHIHAB, M. Quraish.', 'Quraish Shihab, Wawasan Al-Qur''an', 'Agama', 1),
    ('Ijtihad dalam Syari''at Islam', 'QARADHAWI, Yusuf al.', 'Fiki - Ijtihad', 'Agama', 1),
    ('Demokrasi Kita', 'HATTA, Mohammad.', 'Pemerintahan Demokrasi', 'Ilmu Sosial & Politik', 1),
    ('Demokrasi Ekonomi dan Pembangunan', 'PAMUNGKAS, Sri Bintang.', 'Ilmu Ekonomi', 'Ekonomi', 1),
    ('Tafsir Al-Azhar Juz IV', 'AMRULLAH, Haji Abdulmalik Abdulkarim.', 'Samsoe B', 'Agama', 1),
    ('Tafsir al-Azhar Juz XIX', 'AMRULLAH, Haji Abdulmalik Abdulkarim.', 'Samsoe B', 'Agama', 1),
    ('Tafsir al-Azhar Juz I', 'AMRULLAH, Haji Abdulmalik Abdulkarim.', 'Samsoe B', 'Agama', 1),
    ('Pendidikan Kritis; Kritik Atas Praktis Neo-Liberalisasi dan Standarisasi Pendidikan', 'SUBKHAN, Edi.', 'Pendidikan', 'Pengembangan Diri', 1),
    ('Kaidah-kaidah Penafsiran al-Quran', 'DAHLAN, Abd. Rahman.', 'Ilmu Tafsir, Samsoe B', 'Agama', 1),
    ('Pengantar Analisa Politik', 'APTER, David E.', 'Filsafat dan Teori tentang Ilmu Politik, Samsoe B', 'Filsafat & Etika, Ilmu Sosial & Politik', 1),
    ('Jalan Pendek Untuk Mengenal Dasar Ilmu Ushul Fikih', 'Kahar Masyhur, YASIN, Jasim bin Muhammad Muhalhil', 'Samsoe B, Usul Fikih', 'Agama', 1),
    ('Bank Islam', 'Pustaka, SIDDIQI, M. Nejatullah.', 'Bank Islam', 'Agama, Ekonomi', 1),
    ('Fiqih Keluarga: petunjuk praktis hidup sehari-hari', 'IZZAN, ahmad, SAEHUDIN', 'Fiqih, Fiqih Keluarga', 'Agama', 1),
    ('The Kite Runner', 'HOSSEINI, Khaled', 'Fiksi Inggris', 'Fiksi Kontemporer & Klasik', 1),
    ('Layla; Seribu Malam Tanpamu', 'MALIK, Candra.', 'Novel Tasawuf', 'Fiksi Kontemporer & Klasik, Agama', 1),
    ('Begitu Ya Begitu Tapi Mbok Jangan Begitu', 'DANARTO', 'Esai Indonesia', 'Sastra & Puisi, Nonfiksi Naratif', 1),
    ('Wanita Ahli Surga; Kisah-kisah Teladan Sepanjang Masa', 'MURAD, Musthafa.', 'Sejarah Islam - Biografi', 'Sejarah & Biografi, Agama', 1),
    ('Dunia Sophie', 'GAARDER, Jostein.', 'Novel denmark, novel filsafat', 'Fiksi Kontemporer & Klasik, Filsafat & Etika', 1),
    ('Catatan Seorang Demonstran', 'Daniel Dhakidae, GIE, Soe Hok.', 'Biografi, Catatan Harian', 'Sejarah & Biografi, Nonfiksi Naratif', 1),
    ('Kitab Tauhid', 'FAUZAN, Shalil bin Fauzan., Syahirul Alim', 'Tauhid', 'Agama', 1),
    ('Menulis untuk Dibaca : Feature dan kolom', 'NASRIL, Zulhasril', 'jurnalisme', 'Ilmu Sosial & Politik', 1),
    ('Revolusi pancasila', 'LATIF, Yudi.', 'Indonesia, ideologi, Pancasila', 'Ilmu Sosial & Politik', 1),
    ('Di Balik Runtuhnya Turki Utsmani', 'HERDIANSYAH, Deden A.', 'Sejarah Islam', 'Sejarah & Biografi, Agama', 1),
    ('Ayat-ayat Semesta Sisi-sisi al-Quran yang Terlupakan', 'PURWANTO, Agus.', 'Ayat Semesta, Islam dan Sains, Sains', 'Agama, Ilmu Pengetahuan Alam & Teknologi', 1),
    ('The Kill Order', 'CANDAR, yunita, DASHNER, james', 'Novel Inggris', 'Fiksi Kontemporer & Klasik', 1),
    ('The Power of Habit; Dahsyatnya Kebiasaan', 'DUHIGG, Charles.', 'Motivasi', 'Pengembangan Diri', 1),
    ('Totto-chan''s Children', 'KUROYANAGI, Tetsuko.', 'Indonesian Fiction/Fiksi Indonesia, Prosa Indonesi', 'Fiksi Kontemporer & Klasik', 1),
    ('Shalahuddin Al-Ayyubi: Riwayat hidup, legenda, dan imperium Islam', 'Adi Toha, Indi Aunullah, MAN, John', 'Biografi Tokoh-tokoh Pemuka Agama Islam', 'Sejarah & Biografi, Agama', 1),
    ('Ki Hadjar: Sebuah Memoar', 'Faried Wijdan, MUSYAFA, Haidar', 'Biografi Pendidik', 'Sejarah & Biografi, Pengembangan Diri', 1),
    ('Muhammad Al-Fatih #2: Kebangkitan', 'Satria, Handri', 'Muhammad Al-Fatih, Pahlawan Islam', 'Sejarah & Biografi, Agama', 1),
    ('Dosa-dosa Besar', 'ADZ-DZAHABY, Imam Hafidh Syamsuddin, Fatchul Umam', 'dosa', 'Agama', 1),
    ('Surga Yang Tak Dirindukan', 'NADIA, Asma.', 'Novel Indonesia', 'Fiksi Kontemporer & Klasik', 1),
    ('Bukan Pasar Malam', 'TOER, Pramoedya Ananta.', 'Prosa Indonesia', 'Sastra & Puisi', 1),
    ('La Tahzan : Jangan Bersedih!', 'AL-QARNI, Aidh Abdullah, Samson Rahman', 'Akhlak, Samsoe B', 'Agama, Pengembangan Diri', 1),
    ('The Man from Archangel and Other Tales of Adventures: Tentang lelaki, harapan, dan petualangan', 'Airien Kusumawardani, DOYLE, Sir Arthur Conan, Resita Wahyu Febiratri, Yohanna Yuni', 'Fiksi Inggris', 'Fiksi Kontemporer & Klasik', 1),
    ('Hercule Poitrot And The Greenshore Folly', 'CHRISTIE, Agatha, Nadya Andwiani', 'Fiksi Indonesia, Prosa Indonesia', 'Fiksi Kontemporer & Klasik', 1),
    ('The 100-Year-Old Man Who Climbed Out of The Window and Disappeared', 'JONASSON, Jonas', 'Fiksi Inggris, Prosa Inggris', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 1),
    ('Murder in the Crooked House; Pembunuhan di Rumah Miring', 'Barokah Ruziati, SHIMADA, Soji.', 'Kesusastraan Jepang', 'Sastra & Puisi', 1),
    ('The Tokyo Zodiac Murder; Pembunuhan Zodiak Tokyo', 'Barokah Ruziati, SHIMADA, Soji.', 'Kesusastraaan Jepang', 'Sastra & Puisi', 1),
    ('Teladan Muhammad; Belajar Langsung Dari Rasulullah SAW Seakan Anda Melihatnya', 'HATTA, Ahmad.', 'Sejarah Nabi Muhammad Saw', 'Sejarah & Biografi, Agama', 1),
    ('Ungkapan Hikmah', 'HIDAYAT, Komaruddin.', 'Filsafat', 'Filsafat & Etika', 1),
    ('Berajalan menembus batas', 'FUADI, A.', 'Cerpen, Antologi', 'Sastra & Puisi', 1),
    ('Rudy: Kisah masa muda sang visioner', 'Amelya Oktavia, Arief Ash Shiddiq, NOER, Gina S., Zen R.S.', 'Biografi', 'Sejarah & Biografi', 1),
    ('Bung Karno: Menerjemahkan Al-Qur''an', 'ARIFIN, Mochamad Nur, Moh. Sidik Nugraha', 'Biografi Kepala Negara', 'Ilmu Sosial & Politik, Sejarah & Biografi', 1),
    ('Ikhwanul Muslimin yang Sayaaya Kenal', 'JAM\''I, Mahmud.', 'Organisasi Politik Islam', 'Ilmu Sosial & Politik, Agama', 1),
    ('Istikharah ala Rasulullah', 'KHAERUDI, Dadang.', 'Salat Sunat - Istikharah', 'Agama', 1),
    ('The Mysteri of Historical Jesus; Sang Mesia Menurut al-Quran, Alkitab, dan Sumber-sumber Sejarah', 'FATOOHI, Louay., LIPUTO, Yuliani.', 'Isa bin Maryam', 'Agama', 1),
    ('Bencana & Peperangan Akhir Zaman Sebagaimana Rasulullah Kabarkan', 'KATSIR, Ibnu., Umar Mujtahid', 'Akhirat, Hari Akhir.', 'Agama', 1),
    ('Al-Quran Kitab Sains & Medis', 'AHmad, Yusuf al-Hajj', 'Islam dan Ilmu Murni, Samsoe B', 'Agama, Ilmu Pengetahuan Alam & Teknologi', 1),
    ('The International JEW : Membongkar Makar Zionisme Internasional', 'FORD, H, Shalahuddien GZ', 'Samsoe B, Zionisme', 'Ilmu Sosial & Politik', 1),
    ('Bagaimana Menyentuh Hati', 'SIISIY, Abbas as.', 'Akhlaq dan Tasawuf', 'Agama', 1),
    ('Risalah Pergerakan Ikhwanul Muslimin 1', 'BANNA, Hasan al., MATTA, M. Anis.', 'Politik Islam', 'Ilmu Sosial & Politik, Agama', 1),
    ('Keterangan Filsafat tentang Tauhid, Takdir, dan Tawakal', 'SALIM, Agus.', 'Samsoe B, Tauhid', 'Agama', 1),
    ('Sirah Nabawiyah', 'Aunur Rafiq Shaleh Tamhid, BUTHY, Muhammad Sa''id Ramadhan.', 'Sejarah Nabi Muhammad Saw, Sirah Nabi, Nabawiyah, Sejarah Nabi Muhammad SAW', 'Sejarah & Biografi, Agama', 1),
    ('Islam dan Sains Modern', 'GUESSOUM, Nidhal., MAURUF', 'Ilmu Islam, Islam dan Sains', 'Agama, Ilmu Pengetahuan Alam & Teknologi', 1),
    ('Ayah; Kisah Buya Hamka', 'HAMKA, Irfan.', 'Biografi - Tokoh Agama Islam', 'Sejarah & Biografi, Agama', 1),
    ('Sains dan Peradaban di Dalam Islam', 'NASR, Hossein., Pustaka', 'Islam dan Ilmu Murni', 'Agama, Ilmu Pengetahuan Alam & Teknologi', 1),
    ('Dunia Sukab', 'AJIDARMA, Seno Gumira.', 'Fiksi Indonesia', 'Fiksi Kontemporer & Klasik', 1),
    ('Norwegian Wood', 'MURAKAMI, Haruki', 'Kesusastraaan Jepang', 'Sastra & Puisi', 1),
    ('Nalar Ayat-Ayat Semesta', 'PURWANTO, Agus.', 'Islam dan Ilmu Murni', 'Agama, Ilmu Pengetahuan Alam & Teknologi', 1),
    ('Syarah Hadits Arba''in: Menyelami Keagungan Islam melalui Hadist Nabi', 'NAWAWI, Imam', 'Imam Nawawi, Kumpulan Hadits', 'Agama', 1),
    ('Kosmologi Islam dan Dunia Modern', 'CHITTICK, William C.', 'Filsafat Islam', 'Filsafat & Etika, Agama', 1),
    ('Ta''limul Muta''alim: Pentingnya Adab Sebelum Ilmu', 'Amri, Yasir, Az-Zarnuji, Azzam, Abdurrahman, Mahmudi, Arif', 'Adab, adab dalam Islam, Akhlak, Akhlaq, HUbungan Antara Allah dengan Makhluk, Ilmu al-Qur''an, Islam dan Ilmu Sosial', 'Ilmu Sosial & Politik, Agama, Pengembangan Diri', 1),
    ('Tanah Para Bandit', 'LIYE, Tere.', 'FIKSI, Novel, Novel Detektif dan Misteri, Pertarungan, Politik''', 'Fiksi Genre Spesifik, Ilmu Sosial & Politik', 1),
    ('Komik Hadist Anak 1', 'Al-Hazazim, Dihyah', 'Adab, Akhlak, anak-anak, Cerita anak, Islam, Komik', 'Agama, Pengembangan Diri, Seni', 1),
    ('Komik Hadist Anak 2: Mengubah Diri Sendiri', 'Al-Hazazim, Dihyah', 'Akhlak, anak-anak, Cerita-cerita Hadits, Islam, Komik, muslim', 'Agama, Pengembangan Diri, Seni', 1),
    ('Komik Hadist Anak 3: Keseharian di Pesantren', 'Al-Hazazim, Dihyah', 'Akhlak, Cerita anak, Cerita-cerita Hadits, Islam, Komik, muslim', 'Agama, Pengembangan Diri, Seni', 1),
    ('Rembulan Tenggelam Di Wajahmu', 'LIYE, Tere.', 'FIKSI, Fiksi Indonesia, Novel, Romansa, Tere Liye', 'Fiksi Kontemporer & Klasik', 1),
    ('Teruslah Bodoh Jangan Pintar', 'LIYe, Tere', 'Dewasa, Fantasi, Fiksi Indonesia, Novel, Politik', 'Fiksi Genre Spesifik, Ilmu Sosial & Politik', 1),
    ('Jika Kucing Lenyap Dari Dunia', 'Kawamura, Genki, Ota, Ribeka', 'FIKSI, Hewan, Jepang, Kucing, Novel Jepang, Novel Terjemah', 'Fiksi Kontemporer & Klasik', 1),
    ('Bandit-Bandit Berkelas', 'LIYE, Tere.', 'Fiksi Indonesia, misteri, Novel Detektif dan Misteri, Novel Indonesia, Tere Liye', 'Fiksi Genre Spesifik', 1),
    ('The Great Salafusshalih Komik Kisah Teladan 6 : Imam Ahmad Sang Pelayan Hadis', 'DJENGGOTTEN, Vbi.', 'Hadis, Imam, Islam, Kisah Teladan, Komik', 'Agama, Seni', 1),
    ('The Great Salafusshalih Komik Kisah Teladan 5 : Imam Syafi''i Sang Pembela Hadis', 'DJENGGOTTEN, Vbi.', 'Imam, Islam, Kisah Teladan, Komik, kumpulan hadis', 'Agama, Seni', 1),
    ('Khilafah & Ketakutan Penjajah Belanda', 'Pandawa, Nicko', 'Batavia, Belanda, Indonesia, Khilafah, Sejarah', 'Sejarah & Biografi', 1),
    ('Pendidikan Anak dalam Islam', 'ULWAN, Abdullah Nashih.', 'pendidikan Islam', 'Agama, Pengembangan Diri', 1),
    ('Meledakkan IESQ dengan Langkah Takwa & Tawakal', 'ABDULLAH, Mas Udik.', 'Akhlak', 'Agama, Pengembangan Diri', 1),
    ('Pandangan Ibnu Khaldun tentang Ilmu dan Pendidikan', 'H.M.D. Dahlan, Henry Noer Ali, SULAIMAN, Fathiyyah Hasan', 'Islam dan filsafat, Samsoe B', 'Filsafat & Etika, Agama', 1),
    ('Hitam di Balik Putih', 'MUCHTAR, Amin.', 'syiah', 'Agama', 1),
    ('Belajar Mudah Membaca al-Qur''an; Metode BBQ-99', 'SOFIE, Abdul Madjid.', 'al-Quran, metode membaca al-quran', 'Agama', 1),
    ('Menuju  Kesempurnaan Akhlak', 'Helmi Hidayat, Ilyas Hasan, MISKAWAIH, Abu Ali Ahmad Ibn', 'Akhlak, Samsoe B', 'Agama, Pengembangan Diri', 1),
    ('Dahsyatnya Kekuatan Masjid', 'MAULANY', 'Masjid', 'Agama', 1),
    ('Tipologi Masjid', 'AGAMA, Departemen.', 'Masjid', 'Agama', 1),
    ('Principle-Centered Leadership', 'COVEY, Stephen R.', 'Kepemimpinan, Samsoe B', 'Ilmu Sosial & Politik, Pengembangan Diri', 1),
    ('Visualisasi Kepribadian Muhammad saw.', 'Bahrun Abubakar IhsanZubaidi, QARNI, Aidh bin Abdullah al.', 'Kepribadian Nabi Muhammad SAW', 'Sejarah & Biografi, Agama', 1),
    ('Sejarah Hidup Muhammad SAW', 'LINGS, Martin.', 'Sirah Nabi, Nabawiyah, Sejarah Nabi Muhammad SAW', 'Sejarah & Biografi, Agama', 1),
    ('Ignite Me', 'MAFI, Tahereh.', 'Kesusastraan Inggris', 'Sastra & Puisi', 1),
    ('60 orang besar di sekitar Rasulullah saw', 'KHALID, Khalid Muh., Rasyid Satari', 'Sahabat Nabi Muhammad SAW', 'Sejarah & Biografi, Agama', 1),
    ('Art in The Blood; Petualangan Sherlock Holmes', 'ANGELA, Primadonna., DHYANINGRUM, Ambhita., MACBIRD, Bonnie.', 'Novel', 'Fiksi Kontemporer & Klasik', 1),
    ('The Raven: Stories & Poems', 'EFFENDIE, Jia., POE, Edgar Allan.', 'Cerpen, Puisi', 'Sastra & Puisi', 1),
    ('Alcatraz vs. The Evil Librarians: Buku satu', 'Dyah Agustine, SANDERSON, Brandon', 'Fiksi Inggris', 'Fiksi Kontemporer & Klasik', 1),
    ('Alcatraz vs. The Evil Librarians: Buku dua the scrivener''s bones', 'Dyah Agustine, Nadya Andwiani, SANDERSON, Brandon', 'Fiksi Inggris', 'Fiksi Kontemporer & Klasik', 1),
    ('Murder on the Orient Express: Pembunuhan di Orient Express', 'CHRISTIE, Agatha, Gianny Buditjahja', 'Fiksi Inggris', 'Fiksi Kontemporer & Klasik', 1),
    ('Sherlock Holmes: The Crime Trick', 'DOYLE, Sir Arthur Conan', 'Novel Inggris', 'Fiksi Kontemporer & Klasik', 1),
    ('Seksualitas di Indonesia', 'BENNETT, Linda Rae, DAVIES, Sharyn Graham', 'Ilmu-ilmu Sosial', 'Ilmu Sosial & Politik', 1),
    ('Aku Beriman, maka Aku Bertanya', 'LANG, Jeffrey.', 'HUbungan Antara Allah dengan Makhluk, Iman Kepada Allah SWT, Alloh SWT', 'Agama', 1),
    ('30 Tokoh Penemu Indonesia', 'PRANOWO, Lilih Prilian Ari.', 'Biografi', 'Sejarah & Biografi', 1),
    ('The Miracle of Vegan', 'SUSIANTO, Drs.', 'Kesehatan', 'Ilmu Pengetahuan Alam & Teknologi', 1),
    ('Mind Power', 'Aisyah, KEHOE, John.', 'Pikiran', 'Psikologi & Kesehatan Mental', 1),
    ('Cinta Laki-laki Biasa', 'NADIA, Asma.', 'Kumcer', 'Sastra & Puisi', 1),
    ('Perjuangan Yang Dilupakan', 'LESUS, Rizki., SAPUTRO, Z.', 'Sejarah Islam Indonesia', 'Sejarah & Biografi, Agama', 1),
    ('Namaku Merah', 'Atta Verin, PAMUK, Orhan.', 'Novel Inggris', 'Fiksi Kontemporer & Klasik', 1),
    ('Jenghis Khan; Legenda Sang Penakluk dari Mongolia', 'Kunti Saptoworini, MAN, John.', 'Sejarah - Mongol', 'Sejarah & Biografi', 1),
    ('Sjahrir; Peran Besar Bung Kecil', 'ZULKIFLI, Arif.', 'Biografi - Ahli Politik', 'Ilmu Sosial & Politik, Sejarah & Biografi', 1),
    ('Kekuasaan dan Hiburan', 'NUGROHO, Garin.', 'komunikasi massa', 'Ilmu Sosial & Politik', 1),
    ('Dunia Kafka', 'MURAKAMI, Haruki, WULANSARI, Dewi', 'Novel Tragedi', 'Fiksi Kontemporer & Klasik', 1),
    ('Islam Tuhan Islam Manusia', 'BAGIR, Haidar.', 'Pemikiran Islam', 'Agama', 1),
    ('Islam Doktrin dan Peradaban', 'MAJID, Nurkholis', 'Islam dan politik dunia', 'Ilmu Sosial & Politik, Agama', 1),
    ('The Storied Life of A.J. Fikry: Kisah hidup A.J. Fikry', 'Eka Budiarti, Rosi L. Simamora, ZEVIN, Gabrielle', 'Fiksi Inggris', 'Fiksi Kontemporer & Klasik', 1),
    ('Budaya dan Masyarakat', 'KUNTOWIJOYO', 'Ilmu Budaya, Samsoe B', 'Ilmu Sosial & Politik', 1),
    ('Membaca Sapardi', 'Melani Budianta, SARUMPAET, Riris K.Toha', 'Sejarah, Deskripsi dan Penilaian Kritis Karya Sast', 'Sastra & Puisi, Sejarah & Biografi', 1),
    ('Rekonstruksi Pemikiran dalam Agama Islam', 'IQBAL, Muhammad.', 'Filsafat Islam, Pemikiran Islam', 'Filsafat & Etika, Agama', 1),
    ('Pirates and emperor: perilaku terorisme internasional yang sesungguhnya', 'CHOMSKY, Noam.', 'Internasional, Terorisme', 'Ilmu Sosial & Politik', 1),
    ('Arok dedes', 'TOER, Pramoedya Ananta.', 'Novel Indonesia, Roman', 'Fiksi Kontemporer & Klasik', 1),
    ('Intelektual Inteligensia dan Perilaku Politik Bangsa', 'RAHARDJO, M. Dawam.', 'Islam dan Ilmu Sosial', 'Ilmu Sosial & Politik, Agama', 1),
    ('Dunia Hingga Kemarin', 'DIAMOND, Jared.', 'Masyarakat tradisional', 'Ilmu Sosial & Politik', 1),
    ('Batas Nalar: Rasionalitas dan perilaku manusia', 'CALNE, donald B', 'Perilaku sosial, Rasionalitas', 'Ilmu Sosial & Politik, Psikologi & Kesehatan Mental', 1),
    ('Kierkegaard dan pergulatan menjadi diri sendiri', 'TJAYA, hidya thomas', 'eksisitensialisme, filsafat modern', 'Filsafat & Etika', 1),
    ('Menulis itu indah: pengalaman para penulis dunia', 'ADHE', 'kepenulisan', 'Sastra & Puisi, Pengembangan Diri', 1),
    ('Konferensi Asia-Afrika 1955', 'UTAMA, Wildan Sena.', 'KAA, Sejarah Indonesia pada Periode Soekarno', 'Ilmu Sosial & Politik, Sejarah & Biografi', 1),
    ('Tanah air Baru Indonesia', 'JANSSEN, Hilde, Meggy Soedjatmiko', 'Biografi Ahli Sejarah', 'Sejarah & Biografi', 1),
    ('Titik Nol Makna Sebuah Perjalanan', 'WIBOWO, Agustinus', 'Kisah Perjalanan', 'Nonfiksi Naratif', 1),
    ('Pohon Buku di Bandung: Sejarah Kecil Komunitas Buku di Bandung 2000-2009', 'RACHMAN, Deni', 'Aneka Ragam Sejarah Bandung', 'Sejarah & Biografi', 1),
    ('People of the Book', 'BROOK, Geraldine', 'Fiksi Inggris, Prosa Inggris', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 1),
    ('Astrofisika untuk Orang Sibuk', 'TYSON, Neil deGrasse', 'Alam Semesta, Jagat Raya, Alam Raya, Antariksa, Ru', 'Ilmu Pengetahuan Alam & Teknologi', 1),
    ('Menanamkan Iman Kepada Anak', 'RAMADI, Amani ar-.', 'Aqaid, Aqidah, Akidah, Ilmu Kalam', 'Agama', 1),
    ('Cerita 25 Nabi & Rasul untuk Anak-anak', 'YUDHO, P. Kak.', 'Kisah Nabi', 'Sejarah & Biografi, Agama', 1),
    ('Etika Hidup Seorang Muslim', 'ZAKARIA, A.', 'Akhlaq dan Tasawuf, ZAKARIA', 'Agama', 1),
    ('The Prophets; Kisah Hikmah 25 Nabi Allah', 'NOVIYANTI, Dian.', 'Kisah Nabi', 'Sejarah & Biografi, Agama', 1),
    ('The Great of Two Umars: Kisah Hidup Dua Khilafah Paling Legendaris, Umar ibn al-Khathab dan Umar ibn Abdul Aziz', 'ABDURRAHMAN, Fuad.', 'Khulafaurrasyidin - Umar bin Khaththab, Umar ibn Abdul Aziz', 'Sejarah & Biografi, Agama', 1),
    ('Umar Yang Agung; Sejarah dan Analisa Kepemimpinan Khilafah II', 'NU''MANI, Syibli., Pustaka', 'Khulafaurrasyidin - Umar bin Khaththab', 'Sejarah & Biografi, Agama', 1),
    ('Isildur', 'CRAWFORD, Brian K., SOEKOTO, Isma B.', 'Novel', 'Fiksi Kontemporer & Klasik', 1),
    ('The Lost World; Teror dari Negeri Yang Hilang', 'ANGGRIANI, Tisa., DOYLE, Arthur Conan.', 'Novel', 'Fiksi Kontemporer & Klasik', 1),
    ('Anak Rantau', 'FUADI, a', 'Fiksi Indonesia', 'Fiksi Kontemporer & Klasik', 1),
    ('Who Stole the News?', 'ROSENBLUM, Mort.', 'jurnalisme', 'Ilmu Sosial & Politik', 1),
    ('Positive Parenting', 'ADHIM, Mohammad Fauzil.', 'Rumah Tangga', 'Ilmu Sosial & Politik, Pengembangan Diri', 1),
    ('Pernak-pernik Rumah Tangga Islami', 'TAKARIAWAN, Cahyadi.', 'Rumah Tangga', 'Ilmu Sosial & Politik, Pengembangan Diri', 1),
    ('Virus Entrepreneurship Kyai; 72 Prinsip dan Wejangan KH. Imam Zarkasyi', 'ZARKASYI, Muhammad Ridlo.', 'Imam Zarkasyi', 'Sejarah & Biografi, Agama', 1),
    ('Air Mata Nayla', 'ZHEMARY, Muhammad Ardiansha El,', 'Cinta, Kehilangan, Romantis, Sendiri, Sepi', 'Fiksi Kontemporer & Klasik', 1),
    ('Terjemah Lengkap Bulughul Maram; Petunjuk Rasulullah dalam Ibadah, Muamalah, dan Akhlak', 'ASQALANI, Ibnu Hajar al., SIDDIQ, Abdul Rosyad.', 'Fikih, Fiqih, Fiqh, Hukum Islam', 'Agama', 1),
    ('Malcolm X; Sebuah Otobiografi Sebagaimana Penuturannya kepada Alex Haley', 'HALEY, Alex., MALCOLM, X.', 'Autobiografi, Otobiografi', 'Sejarah & Biografi, Nonfiksi Naratif', 1),
    ('Shalat Tapi Keliru', 'SA\''ID, Shalahuddin as.', 'Ibadah - Salat', 'Agama', 1),
    ('Bung Karno Sang Singa Podium', 'SOEMOHADIWIDJOJO, Rhien.', 'Biografi Kepala Negara', 'Ilmu Sosial & Politik, Sejarah & Biografi', 1),
    ('Keajaiban Motivaksi', 'KUSUMAH, Indra., Teguh Hudaya', 'Akhlak', 'Agama, Pengembangan Diri', 1),
    ('The SecretCita-cita Power within', 'DAWAMI, M. Iqbal.', 'Motivasi', 'Pengembangan Diri', 1),
    ('Analisis Instan Problematika Dakwah Kampus', 'ACHMAD, Ridwansyah Yusuf.', 'Dakwah Kampus, Samsoe B', 'Agama', 1),
    ('Hadits Hadits Pilihan : Riwayat Imam Bukhari, Imam Muslim dan lain lain', 'AASYUR , Toha, M.K Chizbulloh', 'Kumpulan Hadits, Samsoe B', 'Agama', 1),
    ('At-Tibyan : Adab Penghafal Alquran', 'NAWAWI', 'Islam Umum', 'Agama', 1),
    ('Tafsir Juz ''Amma Universitas Islam Bandung', 'PANITIA PENYUSUN TAFSIR jUZ ''AMMA', 'Juz ''Amma,  tafsir, Tafsir Al-Quran', 'Agama', 1),
    ('My Brief History: Sejarah Singkat Saya', 'HAWKING, sthepen', 'Autobiografi, fisikawan', 'Sejarah & Biografi, Ilmu Pengetahuan Alam & Teknologi, Nonfiksi Naratif', 1),
    ('Ketika Baca al-Qur''an Begitu Mencerdaskan', 'HASANAIN, Muhammad Said al., MAHMOUD, Mustafa', 'al-Quran, Ilmu al-Qur''an', 'Agama', 1),
    ('Character Matters', 'Lickona, Thomas', 'Mengasuh Anak', 'Pengembangan Diri', 1),
    ('Wanita Berkarir Surga', 'SIAUW, Felix Y', 'Akhlak, Akhlaq', 'Agama, Pengembangan Diri', 1),
    ('Kartini', 'AFANDI, Teguh., KHALIEQY, Abidah El.', 'Fiksi Indonesia', 'Fiksi Kontemporer & Klasik', 1),
    ('Sebuah Novel Petualangan Arsene Lupin: Pencuri Terhebat dalam Sejarah', 'Dewi Fita, JEPSON, Edgar, Maurice Leblanc, Sissy Jaslim', 'Fiksi Inggris', 'Fiksi Kontemporer & Klasik', 1),
    ('Bangkit dan Runtuhnya Daulah Abbasiyyah', 'IRHAM, Masturi., KHUDHARI, Muhammad al., M. Abidun Zuhri.', 'Abbasiyah', 'Sejarah & Biografi, Agama', 1),
    ('Fatwa-fatwa Imam Asy-Syafi''i Masalah Ibadah', 'MUCHTAR, Asmaji.', 'Fikih - Mazhab Syafi''i', 'Agama', 1),
    ('Humaira; Ibunda Orang Beriman', 'PASHA, Kamran.', 'Novel Inggris', 'Fiksi Kontemporer & Klasik', 1),
    ('Menjadi Ahli Tauhid di Akhir Zaman', 'AMMAR, Abu.', 'Akhir Zaman, Tauhid', 'Agama', 1),
    ('Halal dan Haram dalam Islam', 'Abu Sa''id al-Falahi, QARDHAWI, Yusuf.', 'Fikih', 'Agama', 1),
    ('Kehidupan Setelah Mati', 'Musa Kazhim, THABATHABA''I Muhammad Husein.', 'Kematian', 'Filsafat & Etika, Agama', 1),
    ('Kerajaan-kerajaan Islam di Jawa', 'GRAAF, D.J. De.', 'kerajaan islam', 'Sejarah & Biografi, Agama', 1),
    ('Bulughul Maram; Pesan-pesan Nabi Untuk Perbaikan Akhlak, Ibadah, dan Kebahagiaan Dunia Akhirat', 'ASQALANI, Ibnu Hajar al., ZEN, Harun.', 'Fikih, Fiqih, Fiqh, Hukum Islam', 'Agama', 1),
    ('Filosofi Kopi', 'LESTARI, Dewi.', 'Novel', 'Fiksi Kontemporer & Klasik', 1),
    ('La Tahzan for Smart Muslimah', 'QARNI, Aidh Abdullah al., Tim Mumtaz Arabia', 'Fikih Wanita', 'Agama', 1),
    ('Ringkasan Shahih Bukhari', 'ALBANI, M. Nashiruddin al.', 'Kumpulan Hadits, Kumpulan Hadits Bukhari', 'Agama', 1),
    ('The Great Story of Muhammad', 'HATTA, Ahmad. dkk', 'Sejarah Nabi Muhammad Saw', 'Sejarah & Biografi, Agama', 1),
    ('Azazil; Godaan Raja Iblis', 'ZIEDAN, Youssef.', 'Kesusastraan Arab, Kesusastraan Aramaik - Novel', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 1),
    ('Catatan Sang Mantan Jomblo', 'FITRIANI, Fathonah.', 'Pernikahan', 'Ilmu Sosial & Politik, Agama, Pengembangan Diri', 1),
    ('Sejarah Dunia yang Disembunyikan', 'BLACK, Jonathan., Isma B. Soekato', 'Sejarah Dunia', 'Sejarah & Biografi', 1),
    ('Jangan Jadi Muslimah Nyebelin', 'Biru Laut, NADIA, Asma.', 'Fikih Wanita', 'Agama', 1),
    ('Dekapan Kematian', 'DEWI, Oki Setiana.', 'Kematian', 'Filsafat & Etika, Agama', 1),
    ('Logika Agama; Kedudukan Wahyu & Batas-batas Akal dalam Islam', 'SHIHAB, M. Quraish.', 'Filsafat Islam', 'Filsafat & Etika, Agama', 1),
    ('Slilit Sang Kiai', 'NADJIB, Emha Ainun.', 'Esai Indonesia', 'Sastra & Puisi, Nonfiksi Naratif', 1),
    ('Mencari Tuhan Yang Hilang', 'MANSUR, Yusuf.', 'Iman Kepada Allah SWT', 'Agama', 1),
    ('Agar Shalat tak Sia-sia', 'JIFARI, M bin Qusri.', 'Ibadah - Salat', 'Agama', 1),
    ('Labirin Lazuardi; Langit Merah Saga', 'GONG, Gola.', 'Fiksi Indonesia', 'Fiksi Kontemporer & Klasik', 1),
    ('Sejarah Perjalanan Hidup Muhammad', 'GHAZALI, Muhammad al., Imam Muttaqien', 'Sejarah Nabi Muhammad Saw', 'Sejarah & Biografi, Agama', 1),
    ('Kun Fayakuun; Selalu Ada Harapan di Tengah Kesulitan', 'MANSUR, Yusuf.', 'Iman Kepada Allah SWT', 'Agama', 1),
    ('Amr bin Ash: Panglima pembebas Mesir dari belenggu Romawi', 'Fatria Ananda, HASAN, Hasan Ibrahim, M. Roichan Firdaus', 'Sahabat Nabi Muhammad SAW', 'Sejarah & Biografi, Agama', 1),
    ('Muhammad Sebagai Seorang Pedagang', 'Afzalurahman, Dewi Nurjulianti', 'Jual Beli, Sirah Nabi, Nabawiyah, Sejarah Nabi Muhammad SAW', 'Sejarah & Biografi, Agama, Ekonomi', 1),
    ('PITUNG (pituan pitulung):  jihad fi sabilillah para pejuang menyelamatkan jayakarta', 'AL-FATTAH, iwan mahmoed', 'Pahlawan Nasional', 'Sejarah & Biografi', 1),
    ('Masalah Negara Berkembang', 'RUDY, Teuku May.', 'Ekonomi Internasional', 'Ekonomi', 1),
    ('Konstruksi Masyarakat Tangguh Bencana', 'INDIYANTO, agus, KUSWANJONO, arqom', 'masyarakat, sains dan agama', 'Ilmu Sosial & Politik, Agama, Ilmu Pengetahuan Alam & Teknologi', 1),
    ('Setangkai Melati di Sayap Jibril', 'DANARTO', 'Novel Indonesia', 'Fiksi Kontemporer & Klasik', 1),
    ('Mayarakat Madani', 'UMARI, Akram Hdiyauddin.', 'Sejarah Islam - Zaman Nabi Muhammad SAW', 'Sejarah & Biografi, Agama', 1),
    ('Mensucikan Jiwa; Intisari Ihya'' Ulumuddin al-Ghazali', 'Aunur Rafiq Shaleh Tamhid, HAWA, Sa''id.', 'Akhlaq dan Tasawuf, Samsoe B', 'Agama', 1),
    ('How to Enjoy Your Life', 'MANSUR, Yusuf.', 'Akhlak', 'Agama, Pengembangan Diri', 1),
    ('Buku Babon Psikotes', 'ESFANDIARI, Muthia., Tim Psikologi', 'Psikologi', 'Psikologi & Kesehatan Mental', 1),
    ('Menjadi Ayah Pendidik Peradaban', 'RUSFI,Adriano', 'Fathers/Ayah', 'Ilmu Sosial & Politik, Pengembangan Diri', 1),
    ('Dunia Sophie', 'GAARDER, Jostein., Rahmani Astuti', 'Fiksi Inggris, Prosa Inggris', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 1),
    ('Islam dan Modernitas; Respon Intelektual Muslim', 'COOPER, John., Mohamed Mahmoud, Pustaka, Ronald Nettler', 'Pustaka', 'Pengembangan Diri', 1),
    ('Metodologi Pengajaran Agama dan Bahasa Arab', 'YUSUF, Tayar', 'Pengajaran Bahasa Arab, Samsoe B', 'Sastra & Puisi, Agama', 1),
    ('Cultural Studies for Beginner', 'Alfathri Aldin, Borin Van Loon, Idi Subandy Ibrahim, SARDAR, Ziauddin', 'Aspek Spesifik tentang Budaya dan Kebudayaan, Samsoe B', 'Ilmu Sosial & Politik', 1),
    ('Miracles of Al-Qur''an & As-Sunnah', 'NAIK, Zakir.', 'Keajaiban Al-Qur''an, Keajaiban As-Sunnah, Zakir Naik', 'Agama, Ilmu Pengetahuan Alam & Teknologi', 1),
    ('Ensiklopedi Shalat', 'Jazari, Ibn Al-Atsir al.', 'Ibadah - Salat', 'Agama', 1),
    ('The Muqaddimah Volume 2', 'KHALDUN, Ibn., ROSENTHAL, Franz.', 'Aneka Ragam Sejarah', 'Sejarah & Biografi', 1),
    ('Jaringan Ulama Timur Tengah dan Kepulauan Nusantara Abad XVII dan XVIII : Melacak Akar-Akar Pembaruan Pemikiran Islam di Indonesia', 'AZRA, Azyumardi.', 'Pelaku Dakwah, Samsoe B', 'Agama', 1),
    ('Sejarah Umat Islam', 'HAMKA, Mardiati', 'Samsoe, Sejarah Islam', 'Sejarah & Biografi, Agama', 1),
    ('Habis Gelap Terbitlah Terang; Kumpulan Surat R.A. Kartini', 'Ari P., KARTINI, R.A.', 'Surat-surat Indonesia', 'Sastra & Puisi, Nonfiksi Naratif', 1),
    ('History of The Arabs', 'HITTI, Philip K., R. Cecep Lukman Yasin', 'Sejarah - Arab', 'Sejarah & Biografi', 1),
    ('Islam dan Sekularisme', 'ATTAS, Muhammad Naquib', 'islam dan sekularisme', 'Ilmu Sosial & Politik, Agama', 1),
    ('Hukum Islam & Perubahan Sosial : Studi Komperatif Depalan Mazhab Fiqh', 'Ade Dedi Rohayana, ZARQA, Musthafa Ahmad', 'Fikih dari berbagai faham, Samsoe B', 'Agama', 1),
    ('Pengantar Perbandingan Mazhab', 'YANGGO, Huzaemah Tahido', 'Fikih dari berbagai faham, Samsoe B', 'Agama', 1),
    ('Sistematik Filsafat', 'BAKRY, Hasbullah', 'Samsoe B, Teori Filsafat', 'Filsafat & Etika', 1),
    ('Rekayasa Masa Depan Peradaban Muslim', 'SARDAR, Ziauddin.', 'Pembaharuan Pemikiran Islam', 'Agama', 1),
    ('Invasi Pemikiran dan Pengaruhnya Terhadap Masyarakat Islam Masa Kini', 'MAHMUD, Ali Abdul Halim, Mohsir', 'Pemurnian dan Pembaharuan Pemikiran dalam Islam, Samsoe B', 'Agama', 1),
    ('Locked Room; Misteri Masa Lalu Berdarah', 'AGUSTINE, Dyah., KING, Laurie R., LUBIS, Maria.', 'Novel', 'Fiksi Kontemporer & Klasik', 1),
    ('Indonesia Bagian dari Desa Saya', 'NADJIB, Emha Ainun.', 'Esai Indonesia', 'Sastra & Puisi, Nonfiksi Naratif', 1),
    ('''Umar bin Khaththab yang Agung; Sejarah dan Analisis Kepemimpinannya', 'Ammar Haryono, Karsijo Djojosuwarno, NU''MANI, Syabli., Pustaka', 'Khulafaurrasyidin - Umar bin Khaththab', 'Sejarah & Biografi, Agama', 1),
    ('Lembaga Budi', 'HAMKA', 'Filsafat Islam', 'Filsafat & Etika, Agama', 1),
    ('Mutiara Akhlak Rasulullah Saw.', 'USMANI, Ahmad Rofi\''', 'Akhlaq dan Tasawuf, Sirah Nabi, Nabawiyah, Sejarah Nabi Muhammad SAW', 'Sejarah & Biografi, Agama', 1),
    ('Pengantar Filsafat', 'RAPAR, Jan Hendrik', 'Samsoe B, Teori Filsafat', 'Filsafat & Etika', 1),
    ('Agar Orang Sibuk Bisa Menghafal al-Qur''an', 'HERRY, Bahirul Amali.', 'MTQ', 'Agama', 1),
    ('Padang Bulan', 'HIRATA, Andrea.', 'Fiksi Indonesia, Prosa Indonesia', 'Fiksi Kontemporer & Klasik', 1),
    ('Laskar Pelangi', 'HIRATA, Andrea.', 'Novel', 'Fiksi Kontemporer & Klasik', 1),
    ('The Iliad of Homer', 'A. Rachmatullah, BUTLER, Samuel, Fleur de Nufus', 'Fiksi Inggris, Samsoe B', 'Fiksi Kontemporer & Klasik', 1),
    ('American Gods; Dewa Dewa Amerika', 'GAIMAN, Neil.', 'Novel Amerika', 'Fiksi Kontemporer & Klasik', 1),
    ('Gerakan Dakwah Islam 2000', 'JUWAINI, Ahmad.', 'Dakwah', 'Agama', 1),
    ('Menembus Langit; Memoar Spiritual Seorang Muslimah Australia', 'ARMSTRONG, Amatullah.', 'Biografi - Catatan Harian', 'Sejarah & Biografi, Nonfiksi Naratif', 1),
    ('Mengapa Ibadat Puasa Diwajibkan', 'HASJMY, A., SHAHATAH, Abdullah.', 'Ibadah - Puasa', 'Agama', 1),
    ('Panduan Lengkap Home Schooling', 'KEMBARA, Maulia D., Topik Mulyana', 'Sekolah Alternatif', 'Pengembangan Diri', 1),
    ('Pokoknya Kualitatif', 'ALWASILAH, A. Chaedar.', 'Metode Penelitian, Samsoe B', 'Ilmu Sosial & Politik, Ilmu Pengetahuan Alam & Teknologi', 1),
    ('Dahlan Iskan Sang Pendobrak', 'HIDAYAT, Sholihin.', 'Biografi - Ahli Politik', 'Ilmu Sosial & Politik, Sejarah & Biografi', 1),
    ('Pendidikan Kaum Tertindas', 'FREIRE, Paulo., Tim Redaksi', 'Pendidikan - Filsafat', 'Filsafat & Etika, Pengembangan Diri', 1),
    ('3m Magic Memory for Muslim', 'WIJAYA, Erwin Kurnia.', 'Islam - Aspek lainnya', 'Agama', 1),
    ('Muhammad Al-Fatih: Penaklukan', 'Satria, Handri', 'Muhammad Al-Fatih, Pahlawan Islam', 'Sejarah & Biografi, Agama', 1),
    ('101 Kiat Menjual (Selling 101)', 'ZIGLAR, Zig.', 'Bisnis', 'Bisnis & Manajemen', 1),
    ('Maria al-Qibthiyah', 'HAJJAJ, Abdullah.', 'Keluarga Nabi Muhammad SAW', 'Sejarah & Biografi, Agama', 1),
    ('Fikih Kontroversi 1', 'MUBARAK, Saiful Islam., TOPIK, Mulyana.', 'Samsoe B', 'Agama', 1),
    ('A Monstrous Regiment of Women:Misteri Pembunuhan di Bait Allah', 'KING, Laurie R., Nur Aini', 'Novel Inggris', 'Fiksi Kontemporer & Klasik', 1),
    ('Steve Jobs; Otak Jenius di Balik Kesuksesan Apple', 'AKSAN, Hermawan.', 'Sukses Pribadi dalam Bisnis', 'Pengembangan Diri, Bisnis & Manajemen', 1),
    ('Metode Penelitian Bisnis', 'SUGIYONO', 'Manajemen (Filsafat dan Teori)', 'Filsafat & Etika, Bisnis & Manajemen', 1),
    ('The art of communication', 'HOGAN, kevin', 'Komunikasi', 'Ilmu Sosial & Politik', 1),
    ('Speak With Confidence: Presentasi Luar Biasa yang Informatif, Inspirasional, dan Penuh Daya Bujuk', 'Bambang Soemantri, BOOHER, Dianna.', 'Social Interactions within Groups/Interaksi Sosial', 'Ilmu Sosial & Politik', 1),
    ('Sukarno Muda; Biografi Pemikiran 1926-1933', 'KASENDA, PEter.', 'Biografi Kepala Negara', 'Ilmu Sosial & Politik, Sejarah & Biografi', 1),
    ('Fikih Politik Kaum Perempuan', 'TAKARIAWAN, Cahyadi.', 'Wanita dalam Pandangan Islam', 'Ilmu Sosial & Politik, Agama', 1),
    ('Dienul Islam', 'RAZAK, Nasruddin.', 'Islam Umum, Samsoe B', 'Agama', 1),
    ('TOEFL Grammar: Guide Book For Beginnners 2', 'GORIDUS SUKUR, Silvester.', 'Grammar of Standard English/Tata Bahasa Inggris', 'Sastra & Puisi', 1),
    ('Segarkan Imanmu', 'Abad Badruzzaman, GHAZALI, Muhammad al.', 'Akidah, Keimanan', 'Agama', 1),
    ('Untold Stories; Kisah-kisah yang Jarang Diungkap Tentang Istri-Istri Rasulullah', 'KHAN, Tamam.', 'Isteri Nabi Muhammad', 'Sejarah & Biografi, Agama', 1),
    ('Ajaran dan Gerakan NII Kartosoewiryo NII KW IX dan Ma''had al-Zaytun', 'AUSOP, Asep Zaenal.', 'Aliran dan Sekte dalam Islam', 'Agama', 1),
    ('Tarbiyah an-Nisa Panduan Lengkap Wanita Shalehah', 'ZAKARIA, A.', 'Akhlaq dan Tasawuf, Fikih Wanita', 'Agama', 1),
    ('Belajar Mudah Bahasa al-Quran', 'Pustaka, WIRYONO', 'Bahasa Al-Quran', 'Agama', 1),
    ('Parasit Akidah', 'MARZDEDEQ, AD. El.', 'Islam tentang Aliran lain', 'Agama', 1),
    ('Fikih Islam', 'Pasha , Mustafa Kamal', 'Fikih, Samsoe B', 'Agama', 1),
    ('200 Tanya-Jawab Akidah Islam', 'As''ad Yasin, HAKAMI, Syeikh Hafizh, M. Solihat', 'Aqaid dan Ilmu Kalam, Aqidah, Samsoe B', 'Agama', 1),
    ('Dinamika Islam Kultural : Pemetaan atas Wacana Keislaman Kontemporer', 'ABDULLAH, M. Amin', 'Pemurnian dan Pembaharuan Pemikiran dalam Islam, Samsoe B', 'Agama', 1),
    ('Empat Sendi Agama Islam', 'NADWI, Abulhasan Ali ABdul Hayyi Al-Hasani', 'Ibadah, Samsoe B', 'Agama', 1),
    ('Fatwa Kontemporer Ulama Besar Tanah Suci', 'JURAISY, Khalid Al, Muhammad Thalib', 'Fatwa Ulama, Samsoe B', 'Agama', 1),
    ('Islam Untuk Disiplin Ilmu Psikologi', 'DJUMHANA, Hanna', 'Psikologi Islam, Samsoe B', 'Agama, Psikologi & Kesehatan Mental', 1),
    ('Kunci-Kunci Menyingkap Isi Al-quran', 'DAHLAN', 'Kandungan Al-Quran, Samsoe B', 'Agama', 1),
    ('Politik Islam Anti Komunis: Pergumulan Masyumi dan PKI di arena demokrasi liberal', 'SAMSURI, Suyanto', 'Politik Islam, Samsoe B', 'Ilmu Sosial & Politik, Agama', 1),
    ('Fiqih Peradaban: Sunnah Sebagai Paradigma Ilmu Pengetahuan', 'AL-QARADLAWI, Yusuf, Faizah Firdaus', 'Al-Hadits dan yang berkaitan, Samsoe B', 'Agama', 1),
    ('Tata Bahasa Arab', 'BAWANI, Imam', 'Bahasa Arab, Samsoe B', 'Sastra & Puisi, Agama', 1),
    ('Kifayatul Akhyar : Terjemahan Ringkas Fiqih Islam Lengkap', 'Abu Ahmadi, IDRIS, Abdul Fatah', 'Fikih, Samsoe B', 'Agama', 1),
    ('Sahabat Bertanya Rasul Menjawab', 'Achmad Sunarto, JAUZIYYAH , Ibnul Qayyim', 'Kumpulan Hadits, Samsoe B', 'Agama', 1),
    ('Pokok-pokok Ulumul Quran', 'MASYHUR, Kahar', 'Ilmu-ilmu Al-Qur''an, Samsoe B', 'Agama', 1),
    ('Tazkiyatun Nafs', 'Muqimuddin Sholeh, THAKISI, Abdul Barro Saad bin Muhammad', 'Akhlak, Samsoe B', 'Agama, Pengembangan Diri', 1),
    ('Filsafat islam: dari Klasik hingga Kontemporer', 'SOLEH, khudori', 'Filsafat Islam', 'Filsafat & Etika, Agama', 1),
    ('Fiqih Perbedaan Pendapat Antar Sesama Muslim', 'AL-QARADHAWI, Yusuf, Aunur Rafiq Shaleh', 'Fiqih, perbandingan mahzab', 'Agama', 1),
    ('Kaidah- Kaidah Hukum Islam (Ushul al FIqh)', 'KHALLAF , Abdul Wahhab', 'Ushul Fikih', 'Agama', 1),
    ('Kaidah- Kaidah Hukum Islam (Ushul al FIqh)', 'KHALLAF , Abdul Wahhab', 'hukum islam, Kaidah hukum', 'Agama', 1),
    ('Satu Negeri Tiga Proklamasi', 'CHAIDAR, al, HAMIJAYA, Nunu A.', 'Sejarah Islam Indonesia', 'Sejarah & Biografi, Agama', 1),
    ('H.O.S Tjokroaminoto', 'MARASABESSY, Mikael.', 'Biografi Tokoh Agama Islam', 'Sejarah & Biografi, Agama', 1),
    ('Agar Al-Quran Menjadi Teman', 'Dr. Majdi al Hilali', 'al-Quran', 'Agama', 1),
    ('Kisah-Kisah Sunnah: Rampai Cerita dari Rasulullah saw. dan Pelajaran Hidup Bagi Kita Hari ini', 'Hasyim, Dr. Ahmad Umar, Shidiq, Abdul Rosyad', 'Kisah Nabi, Kisah Perjalanan, Sahabat Nabi Muhammad SAW, Sunnah', 'Sejarah & Biografi, Agama, Nonfiksi Naratif', 1),
    ('Banyak Dosa Tapi Kok Hidup Tenang-Tenang Saja', 'Wafa, Muhammad Khoirul', 'Akhlak, dosa, Islam, Perbaiki akhlak, Religi, self improvement', 'Agama, Pengembangan Diri', 1),
    ('30 Hari Mengaji Islam dan Indonesia: Menapak Jejak Keislaman, Membentuk Watak KeIndonesiaan', 'Wahyudi, W. Eka', 'budaya, Islam, Mengaji, Sejarah Indonesia', 'Ilmu Sosial & Politik, Sejarah & Biografi, Agama', 1),
    ('Tarikh Khulafa: Sejarah Penguasa Islam Khulafaurrasyidin, Bani Umayyah, Bani Abbasiyyah.', 'RAHMAN, Samson., SUYUTHI, Imam.', 'Khulafaurrasyidin', 'Sejarah & Biografi, Agama', 1),
    ('Kemi 3: Tumbal Liberalisme', 'HUSAINI, Adian, Shabira Ika', 'Fiksi Indonesia', 'Fiksi Kontemporer & Klasik', 1),
    ('Basa Bandung Halimunan', 'TIARSA R, Us.', 'Biografi - Catatan Harian', 'Sejarah & Biografi, Nonfiksi Naratif', 1),
    ('Seribu Masjid Satu Jumlahnya', 'NADJIB, Emha Ainun.', 'Puisi', 'Sastra & Puisi', 1),
    ('Dari Buku ke Buku; Sambung Menyambung Menjadi Satu', 'SWANTORO, P', 'buku', 'Pengembangan Diri', 1),
    ('Tirulah Shalat Nabi; Jangan Asal Shalat', 'SYA\''RAWI, Mutawalli al.', 'Ibadah - Salat', 'Agama', 1),
    ('Fiqh Empat Mazhab 4', 'Abu Hurairah, AL-JAZIRI, Syekh Abdurrahman, Chatibul Umam', 'Fikih dari berbagai faham, Samsoe B', 'Agama', 1),
    ('Fiqih Menurut Mazhab Syafi''i', 'BHIGA, Musthafa Diibu, Moh. Rifa''i', 'mazhab syafi''i, Samsoe B', 'Agama', 1),
    ('Mukjizat Ilmiah di Lautan dan Dunia Binatang', 'AHmad, Yusuf al-Hajj, Putri Aria Miranda', 'Islam dan Ilmu Murni', 'Agama, Ilmu Pengetahuan Alam & Teknologi', 1),
    ('Al-Qur''an dan Pembangunan Nasional: Koleksi ayat-ayat Al-Qur''an sebagai motivator & dinamisator pembangunan', 'UMAR, Ali Chasan', 'Samsoe B', 'Agama', 1),
    ('Misteri Segitiga Bermuda', 'QUASAR, Gian J.', 'misteri, Novel', 'Fiksi Genre Spesifik', 1),
    ('The Children of War', 'ANAK BANGSA, Forum Silaturahmi.', 'konflik, peristiwa', 'Ilmu Sosial & Politik', 1),
    ('Fiqh Ibadah', 'RITONGA, A. Rahman, Zainuddin', 'Ibadah, Samsoe B', 'Agama', 1),
    ('Warisan Sejarah Arianisme', 'WILES, Maurice, Zaenal Muttaqin', 'Teologi Agama Kristen Lainnya', 'Agama', 1),
    ('Satu Kota Tiga Tuhan : Deskripsi Jurnalistik di Yerusalem', 'FACHRY , ali', 'Sejarah Palestina Modern', 'Ilmu Sosial & Politik, Sejarah & Biografi', 1),
    ('Bagaimana Alam Semesta Diciptakan', 'MARCONI, Achmad.', 'Ilmu al-Qur''an', 'Agama', 1),
    ('Bukan Big Bang: Penciptaan Alam Semesta Dari Peniadaan', 'NURISAH', 'Astronomi Islam, TEORI PENCIPTAAN ALAM', 'Agama, Ilmu Pengetahuan Alam & Teknologi', 1),
    ('50 Pedoman Mendidik Anak Menjadi Shalih', 'THALIB, Muhammad.', 'pendidikan Islam', 'Agama, Pengembangan Diri', 1),
    ('Udah Putusin Aja!', 'SIAUW, Felix Y.', 'Perkawinan - Jodoh', 'Ilmu Sosial & Politik, Agama', 1),
    ('Bimbingan Islam Untuk Hidup Muslim', 'HATTA, Ahmad.', 'Islam - Umum', 'Agama', 1),
    ('Yoyoh Yusroh; Mutiara yang telah tiada', 'RATORY, Firtra.', 'Biografi - Tokoh Agama Islam', 'Sejarah & Biografi, Agama', 1),
    ('Fitrah', 'MUTHAHHARI, Murtadha.', 'Akhlaq dan Tasawuf', 'Agama', 1),
    ('Anak Golda Meir-pun Memeluk Islam', 'ISA, Abdullah., Pustaka', 'Kesusastraan Arab - Novel', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 1),
    ('Sang Juara (Catatan hati seorang dokter muda)', 'ASYI, shanan', 'Novel Indonesia', 'Fiksi Kontemporer & Klasik', 1),
    ('Ensiklopedi Yahudi Bergambar', 'MUNANDAR, Arif., SUWAIDAN, Thariq.', 'Yahudi', 'Agama', 1),
    ('Islam dan Akal Merdeka', 'NATSIR, M.', 'Pemikiran Islam', 'Agama', 1),
    ('Syarah Arba''in an-Nawawi', 'MUHAMMAD, Fathoni., UTSAIMIN, Muhammad bin Shalih.', 'Imam Nawawi, Kumpulan Hadits', 'Agama', 1),
    ('Nikmatnya Pacaran Setelah Pernikahan', 'FILLAH, Salim A.', 'Pernikahan', 'Ilmu Sosial & Politik, Agama, Pengembangan Diri', 1),
    ('Fiqh Munakahat', 'GHAZALY, Abd. Rahman.', 'Samsoe B', 'Agama', 1),
    ('#MNCRGKNSKL', 'FILLAH, Salim A., RIVAI, Zaky A.', 'Akhlak, Akhlaq', 'Agama, Pengembangan Diri', 1),
    ('Jejak Kekhalifahan Turki Utsmani Di Nusantara', 'HERDIANSYAH, Deden A.', 'Sejarah Islam di Indonesia', 'Sejarah & Biografi, Agama', 1),
    ('Inilah politiku', 'ELVANDI, muhammad', 'Politik Islam', 'Ilmu Sosial & Politik, Agama', 1),
    ('Indonesia X-Files; Mengungkap fakta dari Kematian Bung Karno Sampai Kematian Munir', 'IDRIES, Abdul Mun\''im.', 'Kedokteran Forensik', 'Ilmu Pengetahuan Alam & Teknologi', 1),
    ('Jurnalistik Dakwah; Visi dan Misi Dakwah bil Qalam', 'ROMLI, Asep Syamsul M.', 'Metode Dakwah', 'Agama', 1),
    ('Sultan Mehmet II Sang Penakluk', 'FREELY, John.', 'Biografi Pemuka Agama Islam', 'Sejarah & Biografi, Agama', 1),
    ('Generasi phi Memahami Milenial Pengubah Indonesia', 'FAISAL, Muhammad', 'Perkembangan Kepribadian, Perkembangan Karakter', 'Pengembangan Diri', 1),
    ('Pingkan Melipat Jarak', 'Sapardi Djoko Damono', 'Fiksi Indonesia', 'Fiksi Kontemporer & Klasik', 1),
    ('Pertarungan Pemikiran Islam di Indonesia', 'BACHTIAR, Tiar Anwar.', 'Perbandingan Kepercayaan Aliran', 'Agama', 1),
    ('Islam Liberal 101', 'SJAFRIL, Akmal.', 'Liberal, Samsoe B', 'Ilmu Sosial & Politik, Agama', 1),
    ('Islam Liberal : Sejarah , Konsepsi, Penyimpangan dan Jawabanya', 'Harlis Kurniawan, HUSAINI, Adian', 'Islam Liberal, Samsoe B', 'Ilmu Sosial & Politik, Agama', 1),
    ('Peran dewan da''wah dalam membendung arus sekularisme', 'SUIDAT, muhammad', 'islam dan sekularisme, Sekularisme', 'Ilmu Sosial & Politik, Agama', 1),
    ('Buya Hamka Berbicara Tentang Perempuan', 'HAMKA', 'Kedudukan Wanita dalam Islam', 'Ilmu Sosial & Politik, Agama', 1),
    ('Ikhwanul Muslimin; Konsep Gerakan Terpadu Jilid 1', 'MAHMUD, Ali Abdul Halim.', 'Organisasi Islam', 'Agama', 1),
    ('Brain-Based Teaching', 'DHARMA, Lala Herawati., GIVEN, Barbara K.', 'metode belajar dan mengajar, Otak', 'Ilmu Pengetahuan Alam & Teknologi, Pengembangan Diri', 1),
    ('Masalah- masalah Pembangunan : Bunga Rampai Antropologi Terapan', 'KOENTJARANINGRAT', 'Antropologi, Samsoe B', 'Ilmu Sosial & Politik', 1),
    ('Anak-Anak Kita Pengukir Peradaban', 'NOVIYANTI, Dian', 'Mengasuh Anak', 'Pengembangan Diri', 1),
    ('Islam and Secularism', 'ATTAS, M. al-Naquib al-.', 'islam dan sekularisme', 'Ilmu Sosial & Politik, Agama', 1),
    ('Islam dalam Sejarah dan Kebudayaan Melayu', 'ATTAS, Muhammad Naquib', 'islam dan kebudayaan, Samsoe B', 'Ilmu Sosial & Politik, Agama', 1),
    ('Gapleh: gaul tapi soleh', 'EFFENDI, evie, Rohim', 'Dakwah, Motivasi Islami', 'Agama, Pengembangan Diri', 1),
    ('Bilik-Bilik CInta Muhammad; Kisah Sehari-hari Rumah Tangga Nabi', 'ABAZHAH, Nizar., Asy''ari Khatib', 'Sirah Nabi, Nabawiyah, Sejarah Nabi Muhammad SAW', 'Sejarah & Biografi, Agama', 1),
    ('Jilbab dan Hijab', 'ALBANY, Nasaruddin', 'Hijab, Samsoe B', 'Agama', 1),
    ('Kubik Leadership', 'PONIMAN, Farid.', 'Kepemimpinan', 'Ilmu Sosial & Politik, Pengembangan Diri', 1),
    ('Kekuatan Data Saing Indonesia; Mempersiapkan Masyarakat Berbasis Pengetahuan', 'ZUHAL', 'Samsoe B, Sosial Pendidikan', 'Ilmu Sosial & Politik, Pengembangan Diri', 1),
    ('Kisah-kisah Membangun Industri di Indonesia', 'PT ARCHIPELAGO RESOURCES KOMUNIKASI, SOESILO, triharyo i', 'Ekonomi Industri', 'Ekonomi', 1),
    ('Fight Like A Tiger, Win Like A Champion', 'DARMAWANGSA, Darmadi., Imam Munadhi', 'Character Development/Perkembangan Kepribadian, Pe', 'Pengembangan Diri', 1),
    ('Menjadi manusia pembelajar  (on becoming leadre): pemberdayaan diri, transformasi organisasi dan masyarakat lewat proses pembelajaran', 'HAREVA, andreas', 'belajar, pembelajaran', 'Pengembangan Diri', 1),
    ('Soekarno: bapak indonesia merdeka', 'HERING, bob', 'SOEKARNO', 'Sejarah & Biografi', 1),
    ('The Jungle Book', 'KIPLING, Rudyard.', 'Sastra Inggris', 'Sastra & Puisi', 1),
    ('How to Master Your Habits', 'SIAUW, Felix Y.', 'Pelaku Dakwah', 'Agama', 1),
    ('Pelembut Hati', 'RASYID, Muhammad Ahmad ar.', 'Akhlak', 'Agama, Pengembangan Diri', 1),
    ('Moralitas Islam Dalam Ekonomi dan Bisnis', 'ORGIANUS, Yan.', 'Ekonomi Islam, Samsoe B', 'Agama, Ekonomi', 1),
    ('Riba dalam Bank, Koperasi, Perseroan, dan Assuransi', 'FACHRUDDIN, Fuad Mohd', 'Riba, Samsoe B', 'Agama, Ekonomi', 1),
    ('Krisis Peradaban Islam', 'ALLAWI, Ali A., Pilar Muhammad Mochtar', 'Kebudayaan Islam', 'Ilmu Sosial & Politik, Agama', 1),
    ('Larangan Riba: dalam al qur''an dan sunnah', 'HOSEIN, Imran Nazar.', 'Ekonomi Islam, Riba', 'Agama, Ekonomi', 1),
    ('Raih Surga dengan Beberapa Menit', 'Misbah Sholihin, SITAR, Abu Thalhah Muhammad Yunus bin Abdu.', 'Akhlaq dan Tasawuf, Surga', 'Agama', 1),
    ('Amal Harian Muslim', 'SHALEH, Muhammad Thariq Muhammad.', 'amalan harian', 'Agama, Pengembangan Diri', 1),
    ('Kemuliaan Sabar dan Keagungan Syukur', 'JAUZIYAH, Ibn al-Qayyim al.', 'Akhlak, Akhlaq', 'Agama, Pengembangan Diri', 1),
    ('Pembersih Jiwa; Imam Al-Ghazali, Imam Ibnu Rajab Al-Hambali, Ibnu Qayyim Al-Jauziyah', 'FARIDH, Ahmad., Pustaka', 'Samsoe B', 'Agama', 1),
    ('Malam Pertama di Alam Kubur', 'URAIFY, muhammad bin abdurahman', 'Alam Barzah, Alam Kubur', 'Agama', 1),
    ('Dasar-dasar Islam', 'MAUDUDI, Abul Ala., Pustaka', 'Islam', 'Agama', 1),
    ('Melihat Allah', 'MAHMOUD, Mustafa., MANSUR, Abubakar Basymeleh Ibrahim.', 'Tasawuf', 'Agama', 1),
    ('Trilogi Kepemimpinan Negara Islam Indonesia: Menguak Perjuangan Umat Islam dan Pengkhianatan Kaum Nasionalis- Sekuler', 'AWWAS, Irfan S.', 'Negara Islam, Sejarah Indonesia', 'Ilmu Sosial & Politik, Sejarah & Biografi, Agama', 1),
    ('Sejarah dan Metode Dakwah Nabi', 'YAQUB , Ali Mustafa', 'Metode Dakwah, Sejarah Nabi Muhammad Saw', 'Sejarah & Biografi, Agama', 1),
    ('Menjadi Muslim Sejati', 'MAUDUDI, Abul Ala.', 'muslim', 'Agama', 1),
    ('Biografi Imam Syafi''i: kehidupan, sikap dan pendapatnya', 'ASY-SYINAWI, abdul aziz', 'Biografi imam syafi''i', 'Sejarah & Biografi, Agama', 1),
    ('Akar Pendidikan Islam', 'SUFI, Abdalqadir as., Zaim Saidi', 'pendidikan Islam', 'Agama, Pengembangan Diri', 1),
    ('Pesantren Agribisnis', 'MANSHUR, faiz', 'Islam dan perubahan sosial', 'Ilmu Sosial & Politik, Agama', 1),
    ('Ayat Ayat Api', 'DAMONO, Sapardi Djoko.', 'Puisi', 'Sastra & Puisi', 1),
    ('Duka-Mu Abadi', 'DAMONO, Sapardi Djoko.', 'Puisi', 'Sastra & Puisi', 1),
    ('Kolam', 'DAMONO, Sapardi Djoko.', 'Puisi', 'Sastra & Puisi', 1),
    ('The wizard of ideas: menjadi kreatif dengan ide-ide inovasi', 'GRUMPHY, jonathan', 'kreatif', 'Pengembangan Diri', 1),
    ('Revolusi IQ/EQ/SQ antara Neurosains dan al-Quran', 'PASIAK, Taufiq.', 'Islam dan Sains', 'Agama, Ilmu Pengetahuan Alam & Teknologi', 1),
    ('Dunia Tanpa Sekolah', 'AHSIN, M. Izza.', 'Pendidikan - Psikologi', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 1),
    ('Gerbang Dialog Danur', 'RUSTAMA, syafial, SARASWATI, risa', 'Novel Indonesia', 'Fiksi Kontemporer & Klasik', 1),
    ('BARACAS Barisan Anti Cinta Asrama', 'BAIQ, Pidi. dan Yuda Nurul', 'Fiksi Indonesia', 'Fiksi Kontemporer & Klasik', 1),
    ('Bersamamu, di Jalan Dakwah Berliku', 'FILLAH, Salim A., SIAUW, Felix Y.', 'Akhlak', 'Agama, Pengembangan Diri', 1),
    ('Orang-orang Biasa', 'Dhewiberta, HIRATA, Andrea.', 'Fiksi Indonesia, Prosa Indonesia', 'Fiksi Kontemporer & Klasik', 1),
    ('Guru Aini: Prekuel Novel Orang-orang Biasa', 'Dhewiberta, HIRATA, Andrea.', 'Fiksi Indonesia, Prosa Indonesia', 'Fiksi Kontemporer & Klasik', 1),
    ('OTW Nikah', 'NADIA, Asma.', 'Fiksi Indonesia, Prosa Indonesia', 'Fiksi Kontemporer & Klasik', 1),
    ('Sembilu Pengembaraan Rasa', 'TASARO, GK.', 'Cinta, FIKSI, Fiksi Indonesia, Prosa Indonesia, Novel, Novel Indonesia', 'Fiksi Kontemporer & Klasik', 1),
    ('Patah Hati Di Tanah Suci', 'TASARO, GK.', 'Cinta, HUbungan Antara Allah dengan Makhluk, Ide, Inspirasi, Kisah Perjalanan, perjalanan spiritual', 'Agama, Pengembangan Diri, Nonfiksi Naratif', 1),
    ('Laut Bercerita', 'CHUDORI, Leila S.', 'Cinta, Keluarga, Novel, Novel Detektif dan Misteri', 'Fiksi Genre Spesifik', 1),
    ('Start With Why', 'Purwoko, Susi, Sinek, Simon', 'Ide, Inspirasi, Kepemimpinan, Leadership, Psikologi, self improvement', 'Ilmu Sosial & Politik, Psikologi & Kesehatan Mental, Pengembangan Diri', 1),
    ('Cantik Itu Luka', 'KURNIAWAN, Eka.', 'Cinta, Dewasa, Horor, Novel, Novel Detektif dan Misteri, Sejarah Indonesia', 'Fiksi Genre Spesifik, Fiksi Sejarah, Sejarah & Biografi', 1),
    ('Sepotong Kisah Di Balik 98: Cerita Pilihan: Dee Lestari', 'A. Aldi, Aliurridha, Patricia, Shan, Sadono, Dewanto Amin', 'Fiksi Indonesia, Novel, Novel Detektif dan Misteri, Novel Indonesia, Sejarah Indonesia', 'Fiksi Genre Spesifik, Fiksi Sejarah, Sejarah & Biografi', 1),
    ('Nashaihul ''Ibad; Kumpulan Nasihat PIlihan Syeikh Nawawi Al-Bantani', 'BANTANI, Syeikh Nawawi, Fuad Saifudin Nur', 'Akhlak, Akhlaq', 'Agama, Pengembangan Diri', 1),
    ('9 Langkah Mudah Menghafal Al-Qur''an', 'UBAID, Majdi.', 'al-Qur''an - Hafalan', 'Agama', 1),
    ('Kitab Al-Hikam', 'A''THA''ILLAH, ibnu, bA''ADILLAH, ismail', 'Akhlaq dan Tasawuf', 'Agama', 1),
    ('Agama untuk Peradaban', 'HIDAYAT, Komaruddin.', 'Filsafat, Pengetahuan, Peradaban, perkembangan Islam, Revolusi Islam', 'Filsafat & Etika, Ilmu Sosial & Politik, Agama', 1),
    ('Generasi Empati', 'Rifan, Ahmad Rifai', 'Character Development/Perkembangan Kepribadian, Pe, Emosi, Karakter, Pengendalian diri, Perkembangan Kepribadian, Perkembangan Karakter, Prilaku terpuji', 'Pengembangan Diri', 1),
    ('No-Drama Discipline: Disiplin tanpa drama', 'Bryson, Tina Payne, Siegel, Daniel J', 'Disiplin, Kepribadian, Norma, Psikologi Pendidikan', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 1),
    ('Kumpulan Cerita Detektif', 'FADLI, dkk.', 'FIKSI', 'Fiksi Kontemporer & Klasik', 1),
    ('New Wave Marketing: The World is Still Round, The Market is Already Flat', 'KARTAJAYA, Hermawan', 'Distribusi Marketing, Samsoe B', 'Bisnis & Manajemen', 1),
    ('Bargaining games: a new approach to strategic thinking in negotiations', 'MURNIGHAN, jhon keith', 'Negosiasi', 'Pengembangan Diri, Bisnis & Manajemen', 1),
    ('Bisakah orang asia berpikir?', 'MAHBUBANI, kishore', 'Filsafat asia', 'Filsafat & Etika', 1),
    ('Lingkungan Hidup Dan Kapitalisme', 'MAGDOFF, fred, Pius Ginting', 'Sistem Ekonomi Kapitalis, Sistem Ekonomi Liberal', 'Ekonomi', 1),
    ('Leveraging Global Talent', 'RUDITO, Priyanto', 'Kepemimpinan', 'Ilmu Sosial & Politik, Pengembangan Diri', 1),
    ('Sukses dengan Soft Skill', 'PUTRA, ichsan s', 'Kampus', 'Ilmu Sosial & Politik', 1),
    ('Makrifat Cinta', 'MALIK, Candra.', 'Tasawuf, Tauhid', 'Agama', 1),
    ('Tafsir Juz ''Amma', 'Bahrun Abu Bakar, Harry Suryana, Ii Sufyana, THABBARAH, Afif Abdul Fattah', 'Samsoe B, Tafsir Al-Quran', 'Agama', 1);

-- Batch 2/8 (Records 501-1000)
INSERT INTO books (title, author, category, general_category, library_id) VALUES
    ('Pasar', 'KUNTOWIJOYO', 'Fiksi Indonesia', 'Fiksi Kontemporer & Klasik', 1),
    ('Tujuh pelajaran singkat fisika', 'ROVELI, carlo', 'Fisika Kuantum, Fisika modern', 'Ilmu Pengetahuan Alam & Teknologi', 1),
    ('Bilang begini, maksudnya begitu', 'DAMONO, Sapardi Djoko.', 'Menulis', 'Sastra & Puisi, Pengembangan Diri', 1),
    ('Mengoptimalkan Daya Pikir: Meningkatkan daya ingat dengan mengerahkan seluruh kemampuan otak', 'Dian Paramesti Bahar, STINE, Jean Marie', 'Ingatan, Samsoe B', 'Ilmu Pengetahuan Alam & Teknologi, Psikologi & Kesehatan Mental', 1),
    ('Rahasia Selalu Menang Berargumentasi: Penggunaan dan Penyalahgunaan Logika', 'PIRIE, madsen', 'Argumentasi, Logika', 'Filsafat & Etika, Pengembangan Diri', 1),
    ('NGI, Desember 2018', 'NGI', 'Majalah', 'Ilmu Sosial & Politik', 1),
    ('NGI, September	2013', 'NGI', 'Majalah', 'Ilmu Sosial & Politik', 1),
    ('Saifuddin Quthuz', 'M. Isa Anshori, QASIM, Qasim Abduh', 'Zaman Daulah Abbasiyah', 'Sejarah & Biografi, Agama', 1),
    ('Muhammad Al-Fatih: Sang Penakluk yang Diramalkan', 'MUHAMMAD, Ali Ash-Shalabi', 'Sejarah Islam - Daulah-Daulah Lain', 'Sejarah & Biografi, Agama', 1),
    ('The Magnificent Sulaiman Al-Qanuni', 'ABDULLAH, Rachmad', 'Sejarah Islam - Zaman Daulah Lainnya', 'Sejarah & Biografi, Agama', 1),
    ('Ensiklopedia Peperangan Rasulullah SAW', 'SYAKIR, Mahmud.', 'Fikih Perang, Sirah Nabi, Nabawiyah, Sejarah Nabi Muhammad SAW', 'Sejarah & Biografi, Agama', 1),
    ('Menjaga Citra Wanita Islam', 'ZAID, Bakar bin Abdullah Abu.', 'Fikih Wanita, Wanita dalam Pandangan Islam', 'Ilmu Sosial & Politik, Agama', 1),
    ('AKAD MUDHARABAH', 'MUBAROK, Jaih', 'Mudharabah', 'Agama, Ekonomi', 1),
    ('Crazy Rich Asian', 'Cindy Kristanto, KWAN, Kevin', 'Fiksi Indonesia, Prosa Indonesia', 'Fiksi Kontemporer & Klasik', 1),
    ('1Q84 Jilid 3', 'MURAKAMI, Haruki', 'Kesusastraan Jepang', 'Sastra & Puisi', 1),
    ('Pendidikan Cinta untuk Anak; Bagaimana Menanamkan Kecintaan kepada Allah, Rasul, Islam, dan Hijab', 'RAMADI, Amani Ar.', 'Menyusui, Mengasuh, Memelihara Anak Menurut Islam, pendidikan Islam', 'Agama, Pengembangan Diri', 1),
    ('Pemimpin yang Tuhan', 'NADJIB, Emha Ainun.', 'Esai Indonesia', 'Sastra & Puisi, Nonfiksi Naratif', 1),
    ('Stop Talking and start Hijrah', 'ANDAARA, Mahestha Rastha', 'Akhlak, Akhlaq', 'Agama, Pengembangan Diri', 1),
    ('Loving the Wounded Soul', 'Machdy, Regis', 'Depresi, Filsafat Manusia, Jiwa, Love, Motivasi hidup', 'Filsafat & Etika, Psikologi & Kesehatan Mental, Pengembangan Diri', 1),
    ('Jejak-jejak Surga Sang Nabi', 'BAHTIAR, HS.', 'Sirah Nabi, Nabawiyah, Sejarah Nabi Muhammad SAW', 'Sejarah & Biografi, Agama', 1),
    ('50 Kisah tentang Buku, Cinta, dan Cerita-Cerita di Antara Kita', 'FARIDI, Salman', 'Penerbitan', 'Bisnis & Manajemen', 1),
    ('The Business School: For People Who Like Helping People = Delapan Nilai Tersembunyi dari Bisnis', 'KIYOSAKI, Robert T., LECHTER, sharon p', 'Bisnis', 'Bisnis & Manajemen', 1),
    ('Bagaimana Mengatasi Terorisme', 'Fauzi Fauzan, HAMMAD. Suhailah Zain Al-Abidin, Nasruddin Atha''', 'Hukum Islam Tentang Terorisme, Samsoe B', 'Ilmu Sosial & Politik, Agama', 1),
    ('Fiqh Empat Mazhab 1', 'Abu Hurairah, AL-JAZIRI, Syekh Abdurrahman, Chatibul Umam', 'Fikih dari berbagai faham, Samsoe B', 'Agama', 1),
    ('Perbandingan Mazhab Dalam Masalah Fiqih', 'Ismuha, SYALTOUT, Mahmoud.', 'fikih mazhab, Samsoe B', 'Agama', 1),
    ('Thank You Problem 3 Masalah Berakhir pada Kekuatan Iman', 'EFFENDY, Yudy.', 'Keimanan', 'Agama', 1),
    ('Sirkus Pohon', 'HIRATA, Andrea.', 'Sastra Indonesia', 'Sastra & Puisi', 1),
    ('Dewasa Cinta dan Bahagia', 'SAPUTRA, Robi Afrizan', 'Psikologi Islam', 'Agama, Psikologi & Kesehatan Mental', 1),
    ('Belajar Sabar dari Manusia Pilihan', 'Al-ADAWI, Musthafa', 'Akhlak', 'Agama, Pengembangan Diri', 1),
    ('Isa putra maria', 'HALIM, amanullah', 'Nabi Isa', 'Agama', 1),
    ('Seribu Warna Turkiye: potret lain besiswa, pendidikan sastra dan kesenian', 'ELGA, A Yusrianto', 'Biografi - Catatan Harian', 'Sejarah & Biografi, Nonfiksi Naratif', 1),
    ('Bikin Film Yuk!', 'MUSLIMIN. Nurul', 'Sinematografi', 'Seni', 1),
    ('Bilik-Bilik Pesantren : Sebuah Potret Perjalanan', 'MADJID , Nurcholis', 'pondok pesantren, Samsoe B', 'Agama', 1),
    ('Rasia Bandoeng', 'HUTAGALUNG, Ridwan, Komunitas Aleut', 'Fiksi Indonesia', 'Fiksi Kontemporer & Klasik', 1),
    ('Sahabat Remaja Nabi SAW', 'Asy''ari Khatib, MUTHI, Fathi Fawzi Abd al.', 'Sahabat Nabi Muhammad SAW', 'Sejarah & Biografi, Agama', 1),
    ('Mukjizat al-Quran', 'SHIHAB, M. Quraish.', 'Ijazul Quran, Mukjizat', 'Agama, Ilmu Pengetahuan Alam & Teknologi', 1),
    ('Kitab Tauhid', 'Pustaka, WAHHAB, ''Abdul', 'Tauhid', 'Agama', 1),
    ('Muhammad SAW Pemimpin Kita', 'SARDAR, Ziauddin.', 'Sejarah Nabi Muhammad Saw', 'Sejarah & Biografi, Agama', 1),
    ('Kaya Hati Kaya Harta', 'ADZIM, Sa''id Abdul.', 'Akhlak, Akhlaq', 'Agama, Pengembangan Diri', 1),
    ('Islam Indonesia Menatap Masa Depan', 'Abdul Mun''im Shaleh, AZHARI, Muntaha.', 'Islam Indonesia, Samsoe B', 'Ilmu Sosial & Politik, Agama', 1),
    ('Nahwu Kontemporer: Model baru belajar cepat tata bahasa Arab', 'Agus Karim, BUSTOMI, Jenal', 'Samsoe B, Tata Bahasa Arab', 'Sastra & Puisi, Agama', 1),
    ('Nurcholis Madjid : Kontroversi Kematian dan Pemikiranya', 'HUSAINI, Adian', 'Biografi, Samsoe B', 'Sejarah & Biografi', 1),
    ('Al-Mursyid : Pengajaran Bahasa Arab Sistim Modern', 'ALI, Abu Khalid Takdir Syamsudin', 'Bahasa Arab, Samsoe B', 'Sastra & Puisi, Agama', 1),
    ('Mantan Kiai NU Menggugat Sholawat & Dzikir Syirik: Nariyah, Al-Fatih, Munjiyat, Thibbul Qulub', 'ALI, Mahrus, Arif Mustaqim', 'Makhluk yang Ingkar, Samsoe B, Syirik', 'Agama', 1),
    ('Rahasia Makrifat Jawa', 'WAHYUDI , Agus', 'Islam indonesia jawa, Samsoe B', 'Ilmu Sosial & Politik, Agama', 1),
    ('Gramatika Bahasa Arab', 'Hasyim Utsman, M. Masyhur Amin, SALABI, Ahmad', 'Bahasa Arab, Samsoe B', 'Sastra & Puisi, Agama', 1),
    ('Wawacan', 'ROSIDI, Ajip', 'Kesusastraan Daerah dari Indonesia, Sastra Daerah , Sastra Sunda', 'Sastra & Puisi', 1),
    ('The Pocket Fiqh: Cara baru memahami fiqih dengan praktis dan cepat', 'SYAKUR, Ahmad Bisyri, Teguh Hudaya', 'Ibadah, Samsoe B', 'Agama', 1),
    ('JL. " Asmarandana": Cerpen Pilihan Kompas 2005', 'NURHAN, Kenedi., PENERBIT BUKU KOMPAS', 'Cerpen, Antologi', 'Sastra & Puisi', 1),
    ('Enterpreuner Organik: rahasia sukses K.H. fuad affandi bersama pesantren dan tarekat "sayuriah"-nya', 'MANSHUR, faiz', 'ekonomi pesantren', 'Agama, Ekonomi', 1),
    ('Sunni yang sunni: tinjauan dialog sunnah-syiah-nya al-musawi', 'AZ-ZA''BI, mahmud, Pustaka', 'Sunni, Ahli Sunnah, Ahlussunnah wal Jamaah', 'Agama', 1),
    ('Cerita Terhebat yang Pernah Ada', 'NURLATIFAH, Aikhalid.', 'Kumpulan Cerpen', 'Sastra & Puisi', 1),
    ('Hadits Penting Pelita Hati', 'HASIM, Moh., Pustaka', 'hadits mengenai ibadah', 'Agama', 1),
    ('Khadijah: Cinta Sejati Rasulullah', 'UMAR, Abdul Mun''im Muhammad', 'Keluarga Nabi Muhammad SAW', 'Sejarah & Biografi, Agama', 1),
    ('Hak Asasi Manusia dalam Islam', 'MAUDUDI, Abul Ala., Pustaka', 'HAM dalam Islam', 'Ilmu Sosial & Politik, Agama', 1),
    ('Taushiyah untuk Aktivis Islam', 'IBRAHIM, Najih.', 'Dakwah', 'Agama', 1),
    ('Moderat dan Prinsip Kemudahan: ikhtiar dalam meluruskan terorisme dan faham takfir', 'ASOFA, sangidu, DAWOOD, Mohammed m e, HADI, syamsul', 'Hukum Islam Tentang Terorisme, islam moderat', 'Ilmu Sosial & Politik, Agama', 1),
    ('Ayat-Ayat semesta', 'PURWANTO, Agus.', 'Islam dan filsafat', 'Filsafat & Etika, Agama', 1),
    ('Islam dan Sains Industri', 'ORGIANUS, Yan.', 'Akhlak, Akhlaq', 'Agama, Pengembangan Diri', 1),
    ('Kitab Rahasia Tidur: Menurut al-Quran, Sunnah Nabi dan Sains Modern', 'IBRAHIM, Ahmad Syauqi', 'Islam dan Ilmu Terapan, Islam dan Teknologi', 'Agama, Ilmu Pengetahuan Alam & Teknologi', 1),
    ('Yang Teristimewa', 'Indonesia Juara Foundation, Rumah Zakat', 'Psikologi Pendidikan', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 1),
    ('Sanad Ulama Nusantara', 'MAFTUHIN, Adhi', 'Biografi Tokoh-tokoh Pemuka Agama Islam', 'Sejarah & Biografi, Agama', 1),
    ('Islamic Montessori Inspired Activity: Mengenalkan Nilai-Nilai Islam dengan Cara Menyenangkan', 'ZAHIRA, Zahra', 'metode dan sistem pendidikan islam', 'Agama, Pengembangan Diri', 1),
    ('Psikologi Agama; Sebuah Pengantar', 'RAKHMAT, Jalaluddin.', 'Psikologi, Psikologi Islam', 'Agama, Psikologi & Kesehatan Mental', 1),
    ('Ngapain Kerja Kalau Terpaksa', 'SHAFFAR, Rivaliono.', 'Sukses Pribadi dalam Bisnis', 'Pengembangan Diri, Bisnis & Manajemen', 1),
    ('Cahaya Kemuliaan di Wajah Mereka', 'QARNI, Aidh bin Abdullah al.', 'Jihad', 'Agama, Sejarah & Biografi', 1),
    ('Tanggung Jawab Ayah Terhadap Anak Laki-laki', 'BAHARITS, Adnan Hasan Shalih.', 'Samsoe B', 'Agama', 1),
    ('SIrah Nabawiyah : Analisis Ilmiah Manhajiah Terhadap Sejarah Pergerakan Islam di Masa Rasulullah', 'BUTHY, Muhammad Sa''id Ramadhan.', 'Samsoe B, SIrah Nabi', 'Agama, Sejarah & Biografi', 1),
    ('The Book of Five Ring', 'MUSASHI, miyamoto', 'Beladiri', 'Nonfiksi Naratif', 1),
    ('Pedoman Dasar Ilmu Nahwu : Terjemah Mukhtashar Jiddan', 'Chatibul Umam, Dahlan, Ahmad Zaini', 'Bahasa Arab, Samsoe B', 'Agama, Nonfiksi Naratif', 1),
    ('Sunnah Sedirham Surga', 'FILLAH, Salim A.', 'Akhlak, Akhlaq', 'Agama, Filsafat & Etika', 1),
    ('Bandung Patah(an)', 'MISBAHUDIN', 'Fiksi Indonesia, Prosa Indonesia', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 1),
    ('Serdadu Belanda di Indonesia 1945-1950', 'OOSTINDIE, Gert., Susi Moeiman', 'Sejarah Indonesia', 'Sejarah & Biografi', 1),
    ('Masa Depan Pesantren: Eksistensi di Tengah Gelombang Modernisasi', 'Sulaiman, in''am', 'pondok pesantren, Samsoe B', 'Agama', 1),
    ('Fitnah Kubra: Tragedi Pembunuhan Khalifah Ustman bin Affan', 'HUSEIN, Taha', 'Utsman bin ''Affan', 'Sejarah & Biografi, Agama', 1),
    ('ASSASSIN: Sejarah Sebuah Sekte Radikal dalam Islam', 'LEWIS, Bernard.', 'Sejarah Islam di Berbagai Negeri Setelah Tahun 180', 'Sejarah & Biografi, Agama', 1),
    ('Studi Dan Teori Hubungan Internasional', 'HADIWINATA, Bob Sugeng', 'International Relations/Hubungan Internasional', 'Ilmu Sosial & Politik', 1),
    ('Meretas Jalan Dakwah Gerakan Ormas Islam', 'FARIDL, Miftah.', 'Organisasi Islam', 'Agama, Ilmu Sosial & Politik', 1),
    ('Kezaliman Media Masa Terhadap Umat Islam', 'ZEIN, Mohanad Fadhilah', 'Politik Islam', 'Ilmu Sosial & Politik, Agama', 1),
    ('Wawasan Pancasila', 'LATIF, yudi', 'Ideologi Politik di Indonesia', 'Ilmu Sosial & Politik', 1),
    ('Sebuah Masjid Seribu Kisah', 'RIYANINGTIYAS, Mifta Damai', 'Masjid', 'Agama, Sejarah & Biografi', 1),
    ('Akhlak & Etos Kerja Islam', 'ORGIANUS, Yan.', 'Akhlak, Akhlaq', 'Agama, Filsafat & Etika', 1),
    ('Walisongo The Wisdom: Syiar 9 Wali Selama 1 Abad', 'NOVIYANTI, Dian', 'Pelaku Dakwah', 'Agama, Ilmu Sosial & Politik', 1),
    ('Matematika Detik: Inspirasi, Fondasi, dan Garis Besar', 'FAZ, Ahmad Thoha.', 'Filsafat dan Teori Matematika', 'Filsafat & Etika, Ilmu Pengetahuan Alam & Teknologi', 1),
    ('10 Tema Fenomenal dalam Ilmu Al-Qur''an', 'ARIFIN, Mochamad', 'Ilmu-ilmu Al-Qur''an', 'Agama', 1),
    ('Genealogi Hadis Politis', 'ULUM, Muhammad Babul', 'Hadits, Ilmu Hadits', 'Agama', 1),
    ('Khilafah: Sorotan dan Dukungan', 'IBRAHIM, Farid Wajdi', 'Politik Islam', 'Ilmu Sosial & Politik, Agama', 1),
    ('Top 10 Masalah Islam Kontemporer', 'SOMAD, Abdul.', 'Islam Kontemporer', 'Agama, Ilmu Sosial & Politik', 1),
    ('Menuju Republik Indonesia berdasarkan Islam', 'ANSHARI, M. Isa., Muzakkir, Kahhar, Singodimedjo, Kasman', 'Islam, Kemerdekaan, Majelis Konstituante, Revolusi Islam, Sejarah Republik Indonesia, Sejarah Indonesia pada', 'Sejarah & Biografi, Ilmu Sosial & Politik, Agama', 1),
    ('Membumikan al-Qur''an', 'SHIHAB, Qurais.', 'al-Qur''an', 'Agama', 1),
    ('Menelusuri Metode Pendidikan dalam Al-quran', 'Syahidin', 'metode dan sistem pendidikan islam, Samsoe B', 'Agama, Ilmu Sosial & Politik', 1),
    ('Etika Islam : Pembinaan Akhlaqulkarimah', 'YAQUB, Hamzah', 'Akhlak, Samsoe B', 'Agama, Filsafat & Etika', 1),
    ('Menabur Pesan Ilahi: Al-Qur''an dan Dinamika Kehidupan Masyarakat', 'SHIHAB, M. Quraish.', 'Alqur''an, isi', 'Agama', 1),
    ('Total Habibie', 'MAKKA, A. Makmur.', 'Biografi Kepala Negara', 'Sejarah & Biografi, Ilmu Sosial & Politik', 1),
    ('Anda Pun BIsa Menjadi Hafidz al-Qur''an', 'RAUF, Abdul Aziz Abdur.', 'al-Qur''an - Hafalan, Mukjizat al qur''an', 'Agama', 1),
    ('Jadi Pelajar Harus Sukses', 'ABI, Rian Hidayat', 'muslim, Pelajar', 'Agama, Pengembangan Diri', 1),
    ('Kupinang Engkau dengan Hamdalah', 'ADHIM, Mohammad Fauzil.', 'Pernikahan', 'Ilmu Sosial & Politik, Agama', 1),
    ('Kitab Nasihat', 'AL-JAILANI, Syekh Abdul Qadir', 'Tasawuf', 'Agama, Filsafat & Etika', 1),
    ('Finansial Keluarga Islami', 'HAKIM, Aditya Akbar', 'Struktur Masyarakat Islam', 'Ilmu Sosial & Politik, Agama', 1),
    ('The Essential Rumi', 'BARKS, Coleman., RUMI, Jalaluddin.', 'Kesusastraan Lainnya', 'Sastra & Puisi', 1),
    ('Nabi Adam & Peradaban Nusantara', 'RAFIQI, Yusep.', 'Kisah Nabi', 'Agama, Sejarah & Biografi', 1),
    ('Fikih Shalat Kajian Berbagai Mazhab', 'Masdar Helmy, ZUHAILY, Wahbah al.', 'fikih mazhab, Samsoe B', 'Agama', 1),
    ('Sejarah Masuknya Islam di Timur Jauh', 'Dhiya Shahab, HADDAD, Al habib Alwi Bin Thahir', 'Islam Zaman Daulah, Samsoe B', 'Sejarah & Biografi, Agama', 1),
    ('Ash-Shuffah; Pusat Pendidikan Islam Pertama yang Didirikan dan Diasuh Nabi Muhammad Saw', 'MANSUR, Yakhstallah., Muh. Iqbal S', 'Sejarah Islam - Zaman Nabi Muhammad SAW', 'Sejarah & Biografi, Agama', 1),
    ('Rahasia al-Fatihah: Tuntas Memahami Makna Pembuka Berdasarkan Kitab-kitab Klasik Terpercaya', 'Muhammad Said Al-Hasanain, SALIM, Ibnu Muhammad.', 'Surat Al-Fatihah, TAFSIR', 'Agama', 1),
    ('Kontroversi Al-Quran Thomas Jeffersen', 'SPELLBERG,denisea', 'Kontroversi Al-Qur''an, Sejarah Islam, Thomas Jefferson', 'Sejarah & Biografi, Agama, Ilmu Sosial & Politik', 1),
    ('Fikih Sunnah 1', 'SABIQ, Sayid.', 'fikih sunnah, Samsoe B', 'Agama', 1),
    ('Pengantar Studi Ilmu Hadits', 'ABDURRAHMAN, Mifdhol., QATHTHAN, Manna\'' al.', 'Hadits, Ilmu Hadits', 'Agama', 1),
    ('Dasar-Dasar Ilmu Hadis', 'NAWAWI, Imam., Syarif Hade Masyah', 'Ilmu Hadits, Samsoe B', 'Agama', 1),
    ('Misteri Nabi Khidir', 'HAJAR, Ibnu Al=Asqalani', 'Kriteria Nabi-Nabi, Nabi Khidir', 'Agama', 1),
    ('Firebelly', 'MICHAELS, J.C.', 'Kesusastraan Inggris', 'Sastra & Puisi', 1),
    ('Keesaan Ilahi', 'SOEDEWO, R.', 'Aqaid, Aqidah, Akidah, Ilmu Kalam', 'Agama, Filsafat & Etika', 1),
    ('Chairil Anwar Pelopor Angkatan ''45', 'JASSIN, H.B.', 'Biografi Sastrawan Indonesia*', 'Sejarah & Biografi, Sastra & Puisi', 1),
    ('Menuju Kesempurnaan Akhlak', 'MISKAWAIH, Ibn.', 'Akhlaq dan Tasawuf', 'Agama, Filsafat & Etika', 1),
    ('Wanita yang Dirindukan Surga', 'RACHMAN, M. Fauzi.', 'Wanita dalam Pandangan Islam', 'Agama, Ilmu Sosial & Politik', 1),
    ('Deep Thinking; Bagaimana Seorang Muslim Berfikir', 'YAHYA, Harun.', 'Psikologi Islam', 'Psikologi & Kesehatan Mental, Agama', 1),
    ('Bersetia', 'ARNAS, Benny.', 'Fiksi Indonesia', 'Fiksi Kontemporer & Klasik', 1),
    ('Muhammad Rasul Allah Sepanjang Zaman', 'ARMSTRONG, Karen., Liputo, Yuliani', 'Biografi, Biografi Tokoh Agama, Biografi Tokoh-tokoh Pemuka Agama Islam, Sejarah Islam, Sejarah Nabi Muhammad Saw', 'Sejarah & Biografi, Agama', 1),
    ('Jalan Politik Muhammad Mewujudkan Daulah Rasul', 'Al-Qimni, Sayyid, Nugroho, Rony', 'Islam dan politik dunia, Islam Zaman Daulah, Sejarah Islam, Sejarah Islam zaman Nabi', 'Sejarah & Biografi, Agama, Ilmu Sosial & Politik', 1),
    ('Suliminal Assassin: pembunuh sunyi', 'FINN R', 'Novel', 'Fiksi Kontemporer & Klasik', 1),
    ('Pesan-pesan Nabi Untuk Wanita', 'M. Khoiron Doruri, SYAIKH, Badwi Mahmud.', 'Fikih Wanita', 'Agama, Ilmu Sosial & Politik', 1),
    ('Mahfuzhat', 'TIM TUROS PUSTAKA', 'Kata Mutiara, Sastra Islam', 'Sastra & Puisi, Agama', 1),
    ('Hikmah Olah Raga Memanah dan Berkuda', 'ABDULLAHH, Gymnastiar', 'Akhlak, Akhlaq', 'Agama, Filsafat & Etika', 1),
    ('Islam Idealitas Islam Realitas', 'BAHARUN, Mohammad.', 'Islam - Umum', 'Agama', 1),
    ('Manajemen Lisan Saat Diam Saat Bicara', 'AWAYISYAH, Husain al.', 'Akhlak', 'Agama, Filsafat & Etika', 1),
    ('Biografi 4 Serangkai Imam Madzhab', 'CHALIL, Munawar., DHARMADI', 'Imam Madzhab', 'Agama, Sejarah & Biografi', 1),
    ('38 Shahabat yang Dijamin Masuk Surga', 'AS-SAID, Syaikh Shalahuddin Mahmud', 'Sahabat Nabi Muhammad SAW', 'Agama, Sejarah & Biografi', 1),
    ('Ketika Tuhan Ditidurkan', 'DJALIL, Moelyonov Abdul', 'Novel', 'Fiksi Kontemporer & Klasik', 1),
    ('Dokter yang Dirindukan', 'FAZAL,Anwar, NADIA,Asma', 'novel populer', 'Fiksi Kontemporer & Klasik', 1),
    ('Kappa: Sebuah Novel', 'AKUTAGAWA, Ryunosuke.', 'Kesusastraan Jepang', 'Sastra & Puisi', 1),
    ('Soedirman dan Alfiah', 'ASURA, E. Rokajat., Tantrina Dwi Aprianti', 'Fiksi Indonesia', 'Fiksi Kontemporer & Klasik', 1),
    ('Bung Tomo: Soerabaja di tahun 45', 'SETYARSO, Budi.', 'Biografi Ahli Militer, Pahlawan Nasional', 'Sejarah & Biografi', 1),
    ('Dunia Pasca-Manusia', 'HARTANTO, Budi.', 'Filsafat Manusia', 'Filsafat & Etika', 1),
    ('Fundamentals of Human Learning and Cognition', 'ELLIS, Henry C.', 'Pendidikan', 'Ilmu Sosial & Politik, Pengembangan Diri', 1),
    ('Akhir Pasar Bebas', 'BREMMER, Ian.', 'Pasar bebas', 'Ekonomi, Ilmu Sosial & Politik', 1),
    ('Baca Kilat 3.0; Hacks The Way Tou Read', 'SETIAWAN, Agus.', 'Membaca', 'Pengembangan Diri, Sastra & Puisi', 1),
    ('Mengenal Pribadi Agung Nabi Muhammad', 'Nila Noer Fajariyah, TIRMIDZI, Abu Isa Muhammad bin.', 'Sirah Nabi, Nabawiyah, Sejarah Nabi Muhammad SAW', 'Sejarah & Biografi, Agama', 1),
    ('Jangan Bikin Rasul Marah', 'AL-MUJAHID, Muhammad', 'SIrah Nabi', 'Sejarah & Biografi, Agama', 1),
    ('SALMAN ITB Melintas Sejarah Menuju Peradaban Islam Terpadu', 'BASAROEDIN, Samsoe., MAHZAR, Armahedi.', 'Sejarah Islam', 'Sejarah & Biografi, Agama', 1),
    ('Indeks Al-Quran', 'Afzalurahman, Ahsin W. Al-Hafidz', 'Kumpulan Ayat-ayat dan Surat-surat Tertentu dalam , Samsoe B', 'Agama', 1),
    ('70 Kaidah Penafsiran Al-Quran', 'Marsuni Sasaky, SA''DI , Syaikh Abdurrahman Nashir', 'Ilmu Tafsir, Samsoe B', 'Agama', 1),
    ('Dibawah Lindungan Ka''bah', 'HAMKA', 'Fiksi Indonesia, Prosa Indonesia', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 1),
    ('Sejarah Kebudayaan Islam', 'MAJID, ''Abdul Mun''im., Pustaka', 'Sosial dan Budaya Islam', 'Ilmu Sosial & Politik, Agama', 1),
    ('Fihi Ma Fihi', 'RUMI, Jalaluddin.', 'Tasawuf', 'Agama, Filsafat & Etika', 1),
    ('Malcolm X; Sebuah Otobiografi Sebagaimana Penuturannya kepada Alez Haley', 'HALEY, Alex., MALCOLM, X.', 'Autobiografi, Otobiografi', 'Sejarah & Biografi, Nonfiksi Naratif', 1),
    ('Shifting', 'KASALI, Rhenald.', 'Sukses Pribadi dalam Bisnis', 'Bisnis & Manajemen, Pengembangan Diri', 1),
    ('Sultan Abdul Hamid II; The Last Khalifa', 'Imam Fauzi, SHALABI, Ali Muhammad ash.', 'Biografi Sultan', 'Sejarah & Biografi', 1),
    ('Model Kebangkitan Umat Islam', 'AL KILANI, Majid Isran', 'Islam dan Ilmu', 'Agama, Ilmu Pengetahuan Alam & Teknologi', 1),
    ('Filosofi Kopi: kumpulan cerita dan prosa satu dekade', 'ILMANSYAH, FAHMI, LESTARI, Dewi.', 'Novel Indonesia', 'Fiksi Kontemporer & Klasik', 1),
    ('Menuju Jama''atul Muslimin: Telaah sistem jama''ah dalam gerakan Islam', 'Abu Rodhi, Annur Rafiq Shaleh Tamhid, JABIR, Hussain bin Muhammad bin Ali, M. Fatchullah', 'Organisasi, Samsoe B', 'Ilmu Sosial & Politik, Bisnis & Manajemen', 1),
    ('Quran Mapping: Mudah Belajar Kandungan 114 Surah Al-Quran', 'KHALIL, Syaikh Adil Muhammad., Muhammad Farid Fahruddin, Yasir Amri', 'al-quranAl-Qur''an (Al Qur''an, Alquran, Quran) dan ', 'Agama', 1),
    ('Sejarah Nusantara', 'PANE, Sanusi.', 'Sejarah Indonesia - Penjajahan Belanda', 'Sejarah & Biografi', 1),
    ('Sang Alkemis', 'COELHO, Paulo., LESMANA, Tanti', 'Fiksi Indonesia, Fiksi Inggris, misteri, Novel Detektif dan Misteri', 'Fiksi Genre Spesifik', 1),
    ('Kerudungmu Tak Sekedar Cantik', 'SANG, Ratih.', 'Pakaian dan Perhiasan menurut Islam', 'Agama', 1),
    ('Wanita di Dalam al-Qur''an', 'MUHSIN, Amina Wadud., Pustaka', 'Wanita dalam Pandangan Islam', 'Agama, Ilmu Sosial & Politik', 1),
    ('Manajemen Waktu', 'Pustaka, QARDHAWI, Yusuf.', 'Pustaka', 'Nonfiksi Naratif, Sastra & Puisi', 1),
    ('Curug Bidadari', 'JAGAD, Puji.', 'Puisi', 'Sastra & Puisi', 1),
    ('Dahsyatnya Ikhlas Bahayanya Riya''', 'ABDURRAHMAN, AL-AMRI, Ubaid bin Salim', 'Masalah Pahala dan Dosa, Samsoe B', 'Agama', 1),
    ('Biblioterapi untuk Pengasuhan', 'AGUSTINA, Susanti., SUSAN, Bunda., Topik Pram', 'Mengasuh Anak', 'Ilmu Sosial & Politik, Pengembangan Diri', 1),
    ('How to do Media and Cultural  Studies: Panduan untuk Melaksanakan Penelitian dalam Kajian Media dan Budaya', 'ASTUTI, santi indra, STAKES, jane', 'BUDAYA, kajian, Cultura Studies', 'Ilmu Sosial & Politik', 1),
    ('Ada Berita Apa Hari Ini, Den Sastro?', 'DAMONO, Sapardi Djoko.', 'puis, Puisi', 'Sastra & Puisi', 1),
    ('Sutradara Itu Menghapus Dialog Kita', 'DAMONO, Sapardi Djoko.', 'Puisi', 'Sastra & Puisi', 1),
    ('Namaku Sita', 'DAMONO, Sapardi Djoko.', 'Puisi', 'Sastra & Puisi', 1),
    ('Gergasi', 'DANARTO', 'Kumpulan Cerpen', 'Fiksi Kontemporer & Klasik', 1),
    ('Mukjizat Penciptaan Manusia; Tinjauan al-Qur''an dan Medis', 'UTSMAN, nabih abdurrahman', 'Mukjizat al qur''an', 'Agama', 1),
    ('Islam tentang kebersihan dan kesehatan', 'FARIDL, Miftah., Pustaka', 'Bersuci, Thaharah', 'Agama', 1),
    ('Free Writing', 'HASIM, Hernowo', 'kepenulisan', 'Sastra & Puisi, Pengembangan Diri', 1),
    ('Selamat Menunaikan Ibadah Puisi', 'PINURBO, Joko', 'Puisi Indonesia, Sajak Indonesia, Syair Indonesia', 'Sastra & Puisi', 1),
    ('Air Mata Kopi', 'GONG, Gol A.', 'Sastra Indonesia', 'Sastra & Puisi', 1),
    ('Khilafah dan Pemerintahan dalam Islam', 'Pustaka, RAZIQ, ''Ali ''Abdur.', 'Islam dan Ilmu Sosial, Khilafah, Sistem Pemerintahan Islam', 'Ilmu Sosial & Politik, Agama', 1),
    ('Xenoglosofilia; Kenapa Harus Nginggris?', 'LANIN, ivan', 'Tata Bahasa, Kalimat, Sintaksis, Kata', 'Sastra & Puisi, Nonfiksi Naratif', 1),
    ('Ayana: Journey to Islam', 'Mirna Yulistianti, MOON, Ayana.', 'Autobiografi, Otobiografi, Muallaf', 'Sejarah & Biografi, Agama', 1),
    ('Muslimah yang Diperdebatkan', 'MARDIASIH, Kalis.', 'Wanita dalam Pandangan Islam', 'Agama, Ilmu Sosial & Politik', 1),
    ('Catatan Najwa 2', 'SHIHAB, Najwa, Zen RS', 'Situasi dan Kondisi Politik di Indonesia', 'Ilmu Sosial & Politik', 1),
    ('Laki-Laki yang Tak Berhenti Menangis; Kumpulan Kisah Islami Penyejuk Hati', 'MATHARI, Rusdi, Syafawi Ahmad Qadzafi', 'Fiksi Indonesia, Prosa Indonesia', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 1),
    ('Hijrah Jangan Jauh-Jauh, Nanti Nyasar!', 'MARDIASIH, Kalis., Rifai Asyhari', 'Masyarakat Islam', 'Ilmu Sosial & Politik, Agama', 1),
    ('Kartini dan Muslimah dalam Rahim Sejarah; Menyingkap Peran Muslimah dalam Rentang Sejarah Kemerdekaan', 'AMATULLAH, Rahayu, Muridatun Ni''mah', 'Biografi Tokoh Khusus Wanita', 'Sejarah & Biografi, Ilmu Sosial & Politik', 1),
    ('Cinta Tak Pernah Tepat Waktu', 'EA, Puthut., Eka Kurniawan', 'Fiksi Indonesia, Prosa Indonesia', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 1),
    ('Muamalah dengan Harta', 'PURWANTO, Yedi, UMAM, fatchul', 'Jual Beli, Muamalat, Muamalah', 'Ekonomi, Agama', 1),
    ('Rapijali 2: Menjadi', 'LESTARI, Dewi.', 'Fiksi Indonesia, Novel Indonesia', 'Fiksi Kontemporer & Klasik', 1),
    ('Rapijali 3: Kembali', 'LESTARI, Dewi.', 'Fiksi Indonesia, Novel Indonesia', 'Fiksi Kontemporer & Klasik', 1),
    ('Ada Nama Yang Abadi Di Hati Tapi Tak Bisa Dinikahi', 'Suherman, Maman', 'Cinta, Prosa Indonesia, Puisi Indonesia, Sajak Indonesia, Syair Indonesia', 'Sastra & Puisi, Fiksi Kontemporer & Klasik', 1),
    ('Ada Serigala Betina Dalam Diri Setiap Perempuan', 'Lianawati, Ester', 'feminisme, Islam dan Gender, Kesehatan, patriaki, Pengendalian diri, Psikologi, Psikologi Keluarga', 'Ilmu Sosial & Politik, Psikologi & Kesehatan Mental, Agama', 1),
    ('Creative Writing', 'Laksana, A.S', 'Menulis, Sastra, Skill, writing skill', 'Sastra & Puisi, Pengembangan Diri', 1),
    ('Posskriptum: Para Pembuat Mitos', 'Machyuzaar, Nizar', 'Esai Indonesia, Kemampuan Berbahasa untuk Pendidikan Dasar, Sastra Indonesia, Tata Bahasa Indonesia, Tata Bahasa, Kalimat, Sintaksis, Kata', 'Sastra & Puisi, Nonfiksi Naratif', 1),
    ('Suara Dari Marjin', 'Dewayani, Sofie, Retnaningstah, Pratiwi', 'essai, Ilmu-ilmu Sosial, literasi', 'Ilmu Sosial & Politik, Sastra & Puisi, Nonfiksi Naratif', 1),
    ('Akhlakul Karimah', 'Hamka, Buya', 'adab dalam Islam, Akhlak, Buya Hamka, Islam (Umum)', 'Agama, Filsafat & Etika, Sejarah & Biografi', 1),
    ('Semua Lelah yang Perlu Kita Rasakan Saat Dewasa', 'Alkhansah, Mila', 'Dewasa, Motivasi, Motivasi hidup, Perkembangan Kepribadian, Perkembangan Karakter, self improvement', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 1),
    ('Menjadi Manusia Menjadi Hamba', 'Faiz, Fahruddin', 'Filsafat, Filsafat Islam, Islam, Motivasi hidup', 'Filsafat & Etika, Agama, Pengembangan Diri', 1),
    ('Dilarang Membaca', 'KURNIA, Anton.', 'essai, Sastra, Sastra Indonesia', 'Sastra & Puisi, Nonfiksi Naratif', 1),
    ('Refleksi Pemikiran Hamka dalam Novel-Novelnya', 'Arbain, Armini', 'Buya Hamka, Hamka, non fiksi, Pemikiran, Tokoh', 'Sejarah & Biografi, Agama, Nonfiksi Naratif', 1),
    ('Malam Ini Aku Akan Tidur di Matamu', 'PINURBO, Joko', 'FIKSI, Puisi, Puisi Indonesia, Sajak Indonesia, Syair Indonesia', 'Sastra & Puisi, Fiksi Kontemporer & Klasik', 1),
    ('Seni Interaksi Rasulullah Saw.', 'MUNAJID, Syekh Shalih Al., Noor Cholish, Rahmadi Danang', 'Sirah Nabi, Nabawiyah, Sejarah Nabi Muhammad SAW', 'Sejarah & Biografi, Agama', 1),
    ('Pola Makan Rasulullah: Makanan sehat berkualitas menurut Al-Qur''an dan as-Sunnah', 'AS-SAYYID, Abdul Basith Muhammad, M. Abdul Ghoffar, M. Iqbal Haetami, M. Yasir Abdul Muthalib', 'Makanan dan Minuman Menurut Islam', 'Agama', 1),
    ('Sejarah Madinah', 'ABAZHAH, Nizar.', 'Kota dan Tempat Suci dalam Agama Islam', 'Agama, Sejarah & Biografi', 1),
    ('Kejeniusan Strategi Rasulullah Saw', 'KHAYYAM, Syeik Omar', 'Sejarah Islam pada Zaman Nabi Muhammad SAW', 'Sejarah & Biografi, Agama', 1),
    ('Ilmu Sharaf', 'ANWAR, Moch', 'Bahasa Arab, Samsoe B', 'Agama, Nonfiksi Naratif', 1),
    ('Search for serenity', 'SOLAIMAN, gamal M', 'Dakwah', 'Agama', 1),
    ('Sains dan dunia modern', 'WHITEHEAD, Alfred North.', 'Sains', 'Ilmu Pengetahuan Alam & Teknologi', 1),
    ('Qasidah Cinta', 'Pustaka, ZUHRI, Muhammad.', 'Puisi', 'Sastra & Puisi', 1),
    ('Building the Internet of Things', 'KRANZ, Maciej', 'Bisnis', 'Bisnis & Manajemen', 1),
    ('Apa yang Benar, Bukan Siapa yang Benar', 'Arief Koes Hernawan, NADJIB, Emha Ainun.', 'Esai Indonesia', 'Nonfiksi Naratif, Sastra & Puisi', 1),
    ('Melihat Diri Sendiri; Refleksi dan Inspirasi', 'Anwar, BISRI, A. Mustofa.', 'Karangan tentang Islam', 'Agama', 1),
    ('Tafsir-tafsir al-Qur''an; Perkenalan dengan Metodologi Tafsir', 'Achsin Mohammad, FAUDAH, Mahmud Basuni., M. Mochtar Zoerni, Pustaka', 'Ilmu Tafsir, Samsoe B', 'Agama', 1),
    ('Abangan, Santri , Priyayi Dalam Masyarakat Jawa', 'GEERTZ,Clifford, MAHASIN, Aswab.', 'Masyarakat Islam, Samsoe B', 'Ilmu Sosial & Politik, Agama', 1),
    ('Muslim di Tengah Pergumulan', 'WAHID, Abdurrahman', 'Pemurnian dan Pembaharuan Pemikiran dalam Islam, Samsoe B', 'Agama, Filsafat & Etika', 1),
    ('Islam di Indonesia : Suatu Ikhtiar Mengaca Diri', 'RAIS, M. Amien.', 'Islam Indonesia', 'Agama, Ilmu Sosial & Politik', 1),
    ('What I Talk about When I Talk about Running', 'MURAKAMI, Haruki', 'Kesusastraaan Jepang', 'Sastra & Puisi', 1),
    ('Cinta di Dalam Gelas', 'HIRATA, Andrea', 'Fiksi Indonesia, Prosa Indonesia', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 1),
    ('Mensucikan Jiwa; Intisari Ihya Ulumuddin Al-Ghazali', 'Aunur Rafiq Shaleh Tamhid, HAWWA, Said bin Muhammad Daib.', 'HAWWA, Said.', 'Sejarah & Biografi', 1),
    ('40 Kisah Pengantar Anak Tidur', 'AZIZ, Najwa Husein Abdul.', 'Akhlak', 'Agama, Filsafat & Etika', 1),
    ('Bersatu dengan Allah', 'MUSTOFA, Agus.', 'Akhlaq dan Tasawuf', 'Agama, Filsafat & Etika', 1),
    ('Metode Menjemput Maut', 'Ahsin Mohamad, GHAZALI, al.', 'Akhlaq dan Tasawuf, Kematian', 'Agama, Filsafat & Etika, Psikologi & Kesehatan Mental', 1),
    ('al-Adzkar; Bimbingan Do''a dan Dzikir Menurut al-Qur''an dan Sunnah', 'ADAM, Muchtar.', 'Akhlaq dan Tasawuf', 'Agama, Filsafat & Etika', 1),
    ('Terapi Menyucikan Hati', 'DARINI, Abd al-Aziz.', 'Akhlaq dan Tasawuf', 'Agama, Filsafat & Etika', 1),
    ('Jalan Ruhani', 'HAWWA, Said.', 'Akhlaq dan Tasawuf', 'Agama, Filsafat & Etika', 1),
    ('Terapi Penyakit Hati', 'JAUZI, Ibul Qoyyim al-, Salim Bazemool', 'Akhlak, Akhlaq', 'Agama, Filsafat & Etika', 1),
    ('Shaid Al-Khatir Nasihat Bijak Penyegar Iman', 'JAUZI Ibnu Al', 'Akhlak, Akhlaq', 'Agama, Filsafat & Etika', 1),
    ('Mukjizat Gerakan Shalat', 'WRATSONGKO, Madyo.', 'Samsoe B, Shalat', 'Agama', 1),
    ('Pelajaran Tata Bahasa Arab', 'SOU''YB, Joesoef', 'Bahasa Arab, Samsoe B', 'Agama, Nonfiksi Naratif', 1),
    ('Awamil Jurjani', 'ALJURJANI, Abdul Gahir, Bahrun Abu Bakar', 'Bahasa Arab, Samsoe B', 'Agama, Nonfiksi Naratif', 1),
    ('Simbol-Simbol Shalat: anda tahu maka cinta shalat', 'AZHAR, nur, SULAIMAN, eman', 'Shalat', 'Agama', 1),
    ('Al-Qur''an The Healing Book', 'AL-KAHEEL, Abdulaem', 'Al-Qur''an dan Ilmu yang Berkaitan', 'Agama', 1),
    ('Al-Bayan; Kamus Kosakata Al-Quran.', 'AL-''ADAWI, Syaikh Musthafa, Umar Mujtahid', 'Kamus al-Quran', 'Agama, Nonfiksi Naratif', 1),
    ('Menjelang Hidayah: Metode Praktis menjadi Sufi Sehari-hari', 'GHAZALI, Abu Hamid Muhammad.', 'Tasawuf', 'Agama, Filsafat & Etika', 1),
    ('Khutbah dan Nasihat 4 Sahabat Rasulullah Saw', 'AFIFI, Thaha Abdullah', 'Khutbah', 'Agama, Sastra & Puisi', 1),
    ('Kisah Kaum Salaf Bersama Al-Qur''an', 'Albadar, Badar Bin Nashir', 'Salaf, Sejarah Islam', 'Sejarah & Biografi, Agama', 1),
    ('Kebiasaan-kebiasaan dan Karakter-karakter hebat para imam Salaf', 'Achyar, Moh Zainul', 'Salaf', 'Agama', 1),
    ('Adabul Mufrad: kumpulan hadits hadits akhlak', 'BUKHARY , Al imam', 'Akhlak, Akhlaq', 'Agama, Filsafat & Etika', 1),
    ('Keagungan Doa', 'Bidang Dakwah Salman ITB, ISMAIL, Junaid Thahir., Salim Rusli', 'Doa dan Zikir', 'Agama', 1),
    ('Sang Pangeran dan Janissary Terakhir', 'FILLAH, Salim A., Irin Hidayat', 'Fiksi Indonesia, Prosa Indonesia', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 1),
    ('Ukuran Sampel: Formula Generik bagi Praktisi Sains Sosial', 'DJAUHARI, Maman A., Edi Warsidi', 'Koleksi Statistik Umum, Sosial Sciences - Ilmu Sosial', 'Ilmu Sosial & Politik, Nonfiksi Naratif', 1),
    ('KonMari Mengubah Hidupku', 'NIKMAH, Khoirun., Pratiwi Utami', 'Ide, Inspirasi', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 1),
    ('Ibrahim As : bapak semua agama', 'HARAHAP, Iqbal', 'NABI Ibrahim', 'Agama, Sejarah & Biografi', 1),
    ('Segala-galanya Ambyar; Sebuah Buku tentang Harapan', 'Adinto F. Susanto, MANSON, Mark', 'Perkembangan Kepribadian, Perkembangan Karakter', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 1),
    ('Berdamai Dengan Diri Sendiri', 'Nurti Lestari, SAYEKTI, Muthia.', 'Perkembangan Kepribadian, Perkembangan Karakter', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 1),
    ('Semua Murid Semua Guru 1', 'SHIHAB, Najelaa., Siti Nur Andini', 'Pendidikan', 'Ilmu Sosial & Politik, Pengembangan Diri', 1),
    ('The 9 Golden Habits for Brighter Muslim', 'Abdul Koliq, SUKACA, Agus.', 'Akhlak, Akhlaq', 'Agama, Filsafat & Etika', 1),
    ('Al-Masih Putra Sang Perawan', 'Dhewiberta Hardjono, TASARO, GK.', 'Fiksi Indonesia, Prosa Indonesia', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 1),
    ('Man''s Search for Meaning', 'Aswita Fitriani, FRANKL, Viktor E., Haris Priyatna', 'Psikologi - Emosi dan Perasaan', 'Psikologi & Kesehatan Mental', 1),
    ('How to Master Your Habits', 'Ramadhi, SIAUW, Felix Y.', 'Pelaku Dakwah', 'Agama, Ilmu Sosial & Politik', 1),
    ('Gentle Discipline', 'Ade Kumalasari, Noni Rosliyani, SMITH, Sarah Ockwell-', 'Pelatihan untuk Anak-anak, Pendidikan anak', 'Ilmu Sosial & Politik, Pengembangan Diri', 1),
    ('Baca Buku ini Saat Engkau Lelah', 'Herman Adamson, YENI, Munita.', 'Psikologi - Emosi dan Perasaan', 'Psikologi & Kesehatan Mental', 1),
    ('Membangun Masyarakat Indonesia Abad XXI', '[et.al], HABIBIE, Bacharuddin Jusuf.', 'Pemurnian dan Pembaharuan Pemikiran dalam Islam', 'Agama, Filsafat & Etika', 1),
    ('Suteru! Gijutsu; Seni Membuang Barang', 'Reni Indardini, TATSUMI, Nagisa.', 'Ide, Inspirasi', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 1),
    ('Buku Khutbah Jumat', 'HAQ, Nurul Dkk.', 'Aspek Ibadah Lainnya', 'Agama', 1),
    ('Materi Khutbah Jum''at', 'Yudi Wildan Rosid, ZAKARIA, A.', 'Aspek Ibadah Lainnya', 'Agama', 1),
    ('Tiya', 'SAMARPAN', 'Kesusastraan India', 'Sastra & Puisi', 1),
    ('Kesetiaan Mr. X', 'AMMADEA,Faira., HARAHAP, Dessy., HIGASHINO, Keigo.', 'Novel Jepang', 'Fiksi Kontemporer & Klasik', 1),
    ('Lintas Batas Ilmu Sosial', 'Budiawan, Oscar, WALLERSTEIN, Immanuel', 'Ilmu-ilmu Sosial, Samsoe B', 'Ilmu Sosial & Politik, Agama', 1),
    ('Sampar', 'CAMUS, Albert', 'Fiksi Perancis', 'Fiksi Kontemporer & Klasik', 1),
    ('Indonesia X-Files 2', 'IDRIES, Abdul Mu''in', 'Forensik', 'Ilmu Pengetahuan Alam & Teknologi', 1),
    ('Riwayat Hidup IBNU RUSYD (Averrroes) Filosuf Islam terbesat di Barat', 'AHMAD, Zainal Abidin.', 'Filosuf, Ibnu Rusyd, Riwayat hidup', 'Sejarah & Biografi, Filsafat & Etika', 1),
    ('Philosphy and Science in the Islamic world', 'qadir', 'Filsafat Islam', 'Filsafat & Etika, Agama', 1),
    ('Berpikir Majemuk Dalam Matematika', 'IHSAN, Aditya F., PRANOTO, Iwan.', 'Filsafat dan Teori Matematika, matematika', 'Filsafat & Etika, Ilmu Pengetahuan Alam & Teknologi', 1),
    ('Komitmen Muslim Kepada Harakah Islamiyyah', 'YAKAN, Fathi., Yasir Miqdad', 'Dakwah', 'Agama', 1),
    ('Ibadah Dengan Harta', 'UMAM, fatchul', 'Shadaqah, Shodaqoh, Sedekah', 'Agama, Ekonomi', 1),
    ('Adab dan Peradaban', 'Al-Attas, Syed Muhammad Al-Naquib', 'Adab, adab dalam Islam, Akhlak, Naquib Al-attas, Tasawuf', 'Agama, Filsafat & Etika, Sejarah & Biografi', 1),
    ('Barisan Pemuda Zaman Nabi Saw.', 'KARIM, Yusuf Abdul., Umar Mujtahid, Zuhair Musthafa', 'Sahabat Nabi Muhammad SAW', 'Agama, Sejarah & Biografi', 1),
    ('Kisah-kisah Nubuat dari Nabi Saw.', 'ASYQAR, Umar Sulaiman., Umar Mujtahid, Yasir Amri', 'Cerita-cerita Hadits', 'Agama, Sejarah & Biografi', 1),
    ('Hatta; Jejak Yang Melampaui Zaman', 'ZULKIFLI, Arif.', 'Biografi - Ahli Politik', 'Sejarah & Biografi, Ilmu Sosial & Politik', 1),
    ('Rahasia Halal-Haram', 'GHAZALI, Imam al., KURNIAWAN, Iwan.', 'Fikih, Fiqih, Fiqh, Hukum Islam', 'Agama, Ilmu Sosial & Politik', 1),
    ('Syarah Rasmul Bayan', 'JASIMAN', 'Tarbiyah, Tauhid', 'Agama', 1),
    ('Halal dan Haram dalam Islam', 'QARDHAWI, Yusuf.', 'Fiqih', 'Agama', 1),
    ('Catatan Harian Pidi Baiq: Drunken Monster', 'BAIQ, Pidi.', 'Fiksi Indonesia, Prosa Indonesia', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 1),
    ('Amalan yang Paling Dicintai Allah', 'SOMAD, Abdul', 'Ibadah', 'Agama', 1),
    ('Death on the Nile: Pembunuhan di Sungai Nil', 'CHRISTIE, Agatha, Mareta', 'Fiksi Inggris, Prosa Inggris', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 1),
    ('Membuat Anak Gila Membaca', 'ADHIM, Mohammad Fauzil.', 'Pendidikan', 'Ilmu Sosial & Politik, Pengembangan Diri', 1),
    ('50 wasiat rasulullah SAW bagi wanita', 'IBRAHIM, Majdi Sayyid.', 'Wanita Islam', 'Agama, Ilmu Sosial & Politik', 1),
    ('The Life And Adventures Of Robinson Crusoe', 'DEFOE, Daniel.', 'Fiksi Inggris, Prosa Inggris', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 1),
    ('Ternyata Kita Tak Pantas Masuk Surga', 'EL-SYAFA, Ahmad Zacky', 'Aspek Ibadah Lainnya', 'Agama', 1),
    ('Karakteristik Lelaki Shalih', 'RAHMAN, Abu Muhammad Jibriel Abdul', 'Akhlak, Akhlaq', 'Agama, Filsafat & Etika', 1),
    ('The Innovators', 'ISAACSON, Walter., Reni Indardini', 'Daya Khayal, Imajinasi, Kreativitas', 'Pengembangan Diri, Seni', 1),
    ('Beresin Dulu Hidupmu', 'BISHOP, Gary John., Susi Purwoko', 'Perkembangan Kepribadian, Perkembangan Karakter', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 1),
    ('Hikmah Penciptaan Makhluk', 'GHAZALI, Imam al., Pustaka', 'Ciptaan Tuhan, makhluk', 'Ilmu Pengetahuan Alam & Teknologi, Agama', 1),
    ('Siapa Sebenarnya Markesot?', 'Ahernawan, NADJIB, Ehma Ainun.', 'Esai Indonesia', 'Nonfiksi Naratif, Sastra & Puisi', 1),
    ('Persuasive Copywriting: Sebuah Seni Menjual melalui Tulisan', 'Amira, ASIANI, Febri.', 'Kepengarangan dan Teknik Editorial', 'Sastra & Puisi, Pengembangan Diri', 1),
    ('Penari Kecil', 'MOHAN, Sari Safitri.', 'Sastra', 'Sastra & Puisi', 1),
    ('Mr. Justice Raffles', 'HORNUNG, E.W.', 'Sastra', 'Sastra & Puisi', 1),
    ('Menerobos Kegelapan; Sebuah Autobiografi Spiritual', 'ARMSTRONG, Karen.', 'Autobiografi', 'Sejarah & Biografi, Nonfiksi Naratif', 1),
    ('Cina Muslim di Jawa Abad XV dan XVI Antara Historisitas dan Mitos', 'GRAAF, H.J. De.', 'Muslim Cina', 'Agama, Sejarah & Biografi', 1),
    ('Cheng Ho; Penyebar Islam dari China ke Nusantara', 'Abdul Kadir, SEN, Tan Ta.', 'Sejarah Islam di Indonesia', 'Sejarah & Biografi, Agama', 1),
    ('Literasi Menggerakkan Negeri', 'Komunitas Guru Belajar, SHIHAB, Najelaa.', 'Pendidikan', 'Ilmu Sosial & Politik, Pengembangan Diri', 1),
    ('Penaklukan Muslim di Mata Bangsa Taklukan', 'Indi Aunullah, ITANI, Hussam., Muhammad Husnil', 'Sejarah Islam di Berbagai Negeri', 'Sejarah & Biografi, Agama', 1),
    ('Istanbul: Ibu Kota TIga Imperium Agung Dunia', 'Fahmy Yamani, FREELY, John., Muhammad Husnil', 'Sejarah Eropa Tenggara Kuno, Sejarah Turki', 'Sejarah & Biografi', 1),
    ('The Life-changin Magic of Tidying Up', 'KONDO, Marie, Reni Indardini', 'Ide, Inspirasi', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 1),
    ('Banjir Darah; Kisah Nyata Aksi PKI terhadap Kiai, Santri, dan Kaum Muslimin', 'AFIFI, Anab, ZUHARON, Thowaf', 'Sejarah Indonesia pada Periode Tahun 1960 - 1969', 'Sejarah & Biografi', 1),
    ('Genom: Kisah Spesies Manusia dalam 23 Bab', 'RIDLEY, Matt', 'Evolusi, Genetika', 'Ilmu Pengetahuan Alam & Teknologi', 1),
    ('Kura-kura Berjanggut', 'Aiyub, Azhari', 'FIKSI, Fiksi Indonesia, Novel, Novel Tragedi, nusantara, Sastra Indonesia, Sejarah dan Geografi', 'Fiksi Sejarah, Fiksi Kontemporer & Klasik', 1),
    ('Sunda Abad Ke-19', 'SETIAWAN, Hawe', 'Esai Indonesia sunda, Ilmu Sejarah, Sejarah Indonesia, Suku Sunda', 'Sejarah & Biografi, Ilmu Sosial & Politik, Nonfiksi Naratif', 1),
    ('Perjalanan Hidup Empat Khalifah', 'al-Atsari, Abu Ihsan, as-Sulami, Muhammad bin Shamil, KATSIR, Ibnu.', 'Biografi, Khalifah, Sahabat Nabi Muhammad SAW, Sejarah Islam, Sejarah Islam pada Zaman Nabi Muhammad SAW', 'Sejarah & Biografi, Agama', 1),
    ('Kekasih Musim Gugur', 'PAMUNTJAK, Laksmi.', 'FIKSI, Novel, Sastra Indonesia', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 1),
    ('Sepotong Kisah Di Balik 98: Cerita Pilihan: Okky Madasari', 'Latifa, Ana, R. Goebahan, Retno, Katarina, SATRIAWAN, Agung.', 'Fiksi Indonesia, Novel, Novel Detektif dan Misteri, Sejarah, Sejarah Indonesia', 'Fiksi Genre Spesifik, Fiksi Sejarah', 1),
    ('Kesusastraan, kehancuran', 'Suryajaya, Martin', 'essai, Sastra', 'Sastra & Puisi, Nonfiksi Naratif', 1),
    ('Tasawuf Salafi : Rekonstruksi Tasawuf Ibn Taimiyyah', 'Maghribi, Hamdan', 'Ibn Taimiyyah, Salafi, Sufi, Tasawuf, Teologi', 'Agama, Filsafat & Etika, Sejarah & Biografi', 1),
    ('Jawahirul Qur''an : Permata Ayat-Ayat Suci', 'AL-GHAZALI , Abu Hamid, Mohammad Luqman Hakiem', 'Kandungan Al-Quran, Samsoe B', 'Agama', 1),
    ('Filsafat Seni', 'SUMARDJO, Jakob', 'Filsafat dan Teori Kesenian, Filsafat dan Teori Ka', 'Filsafat & Etika, Seni', 1),
    ('Khutbah Jumat Salman ITB 2017', 'SALMAN, Tim Khatib', 'Khutbah', 'Agama, Sastra & Puisi', 1),
    ('Setelah Dunia Dilipat: Animalitas, Parasitisme, Plastisitas.', 'Alfathri Adlin, PILIANG, Yasraf Amir.', 'Kebudayaan, Proses Sosial', 'Ilmu Sosial & Politik', 1),
    ('Capita Selecta: Pendidikan&Pemikiran Islam dari Teras Al-Azhar', 'FATAHILLAH, Bana', 'Pendidikan Agama Islam, Pendidikan Islam, Sekolah ', 'Agama, Ilmu Sosial & Politik', 1),
    ('Sehimpun Esai Dongeng Panjang Literasi Indonesia', 'PRIMADESI, Yona', 'essai, literasi, Parenting Skill, Pelatihan untuk Anak-anak', 'Pengembangan Diri, Ilmu Sosial & Politik, Nonfiksi Naratif', 1),
    ('Menjadi: Seni Membangun Kesadaran Tentang Diri dan Sekitar', 'Afutami', 'Cara Berpikir Kritis, Filsafat Kehidupan, Psikologi, Sains - Bumi, sains dan agama, self improvement, Social Science/Ilmu-ilmu Sosial', 'Filsafat & Etika, Psikologi & Kesehatan Mental, Ilmu Pengetahuan Alam & Teknologi', 1),
    ('Matilda', 'Blake, Quentin, Dahl, Roald, LUBIS, Maria.', 'Fiksi Inggris, Novel, Pendidikan', 'Fiksi Kontemporer & Klasik, Ilmu Sosial & Politik', 1),
    ('Pulang-Pergi: Yang Dibawa Dan Ditinggalkan', 'Thian, Alexander', 'Fiksi Indonesia, Kisah Perjalanan, Novel Indonesia', 'Fiksi Kontemporer & Klasik, Nonfiksi Naratif', 1),
    ('Yellowface', 'Chusfani,D Poppy, Kuang, R.F', 'Daya Khayal, Imajinasi, Kreativitas, Fiksi Inggris, Novel, Novel Detektif dan Misteri', 'Fiksi Genre Spesifik, Pengembangan Diri', 1),
    ('Menulis Dengan Cinta: Pengantar Belajar Menulis Kreatif', 'KURNIA, Anton.', 'Latihan Menulis, Menulis, Menulis kreatif, Sas', 'Sastra & Puisi, Pengembangan Diri', 1),
    ('Piagam Jakarta 22 Juni 1945', 'ANSHARI, Endang Saifuddin., Pustaka', 'Sejarah Indonesia pada Masa Kemerdekaan', 'Sejarah & Biografi', 1),
    ('Sekolah Calon Pemimpin', 'APRILYA, Dina', 'Kepemimpinan', 'Bisnis & Manajemen, Ilmu Sosial & Politik', 1),
    ('Pribadi Muslimah Ideal', 'Al-Hasyimi, Muhammad Ali, Hamzah, Amir', 'Akhlak, Fikih Muslimah, Kepribadian, Kepribadian Nabi Muhammad SAW, Perkembangan Kepribadian, Perkembangan Karakter, Wanita dalam Pandangan Islam, Wanita Islam', 'Agama, Pengembangan Diri, Sejarah & Biografi', 1),
    ('Statistika untuk Penelitian', 'SUGIYONO', 'statistika', 'Ilmu Pengetahuan Alam & Teknologi, Ilmu Sosial & Politik', 1),
    ('Amor Fati', 'Astiningsih, Kim, Rando', 'Cinta, Dewasa, Ide, Inspirasi, Motivasi, self improvement, Self Love', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 1),
    ('Funiculi Funicula: Kisah-kisah yang Baru Terungkap', 'Kawaguchi, Toshikazu, Wulandari, Asri Pratiwi', 'FIKSI, Kesusastraaan Jepang, Novel, Novel Detektif dan Misteri, Novel Jepang', 'Fiksi Genre Spesifik', 1),
    ('Nebula', 'LIYE, Tere.', 'Fiksi Indonesia, Novel Detektif dan Misteri, Petualangan, Remaja', 'Fiksi Genre Spesifik', 1),
    ('Selena', 'LIYE, Tere.', 'Fiksi Indonesia, misteri, Novel, Novel Detektif dan Misteri, Novel Indonesia, Petualangan', 'Fiksi Genre Spesifik', 1),
    ('The Little Book of Sloth Philosophy: Seni Hidup Santai, tapi Tetap Produktif ala Kungkang', 'Fitriani, Aswita R., McCartney, Jennifer', 'Filosofi, Motivasi, Produktif, self improvement, Seni Hidup', 'Filsafat & Etika, Pengembangan Diri', 1),
    ('The 5 Am Club: Bangun Rutinitas Pagi Untuk Level Up Hidupmu!', 'Kustiantie, Tantie, Sharma, Robin', 'Motivasi hidup, Paulo Coelcho, Personal  Growth, self improvement', 'Pengembangan Diri, Psikologi & Kesehatan Mental, Sejarah & Biografi', 1),
    ('Home Sweet Loan', 'Bastari, Almira', 'finansial, home sweet loan, sandwich generation', 'Ekonomi, Ilmu Sosial & Politik', 1),
    ('Merasa Pintar, Bodoh Saja Tak Punya; Kisah Sufi dari Madura', 'MATHARI, Rusdi, Prima S. Wardhani', 'Fiksi Indonesia, Prosa Indonesia', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 1),
    ('The Blonde Lady', 'Dewi Fita, LEBLANC, Maurice', 'Fiksi Inggris', 'Fiksi Kontemporer & Klasik', 1),
    ('Risalah Ibnu Taimiyah Tentang Tafsir Al-quran', 'TAIMIYAH, Ibnu.', 'Ilmu Tafsir', 'Agama', 1),
    ('Islam Masa Kini', 'YAQUB , Ali Mustafa', 'Gerakan Pembaharuan Pemikiran dalam Islam, Samsoe B', 'Agama, Filsafat & Etika, Ilmu Sosial & Politik', 1),
    ('Khawarij: Inspirator Faham Radikal', 'Nashir Bin Abdul Karim', 'ideologi khawarij, khawarij', 'Ilmu Sosial & Politik, Agama', 1),
    ('Ther Melian; Chronicle', 'SHIENNY, M.S.', 'Novel', 'Fiksi Kontemporer & Klasik', 1),
    ('Yuk, Berhijab!', 'ACHNI, Emeralda Noor, SIAUW, Felix Y.', 'Fikih Wanita', 'Agama, Ilmu Sosial & Politik', 1),
    ('Baca Buku Ini Saat Engkau Ingin Berubah', 'KUSHARJANTI, Rahma., Mus Pratt', 'Psikologi - Emosi dan Perasaan', 'Psikologi & Kesehatan Mental', 1),
    ('Dunia yang Dilipat: Tamasya Melampaui Batas-batas Kebudayaan', 'Alfathri Adlin, PILIANG, Yasraf Amir.', 'Kebudayaan, Proses Sosial', 'Ilmu Sosial & Politik', 1),
    ('Pengen Jadi Baik 1', 'SQU', 'Akhlak, anak, Komik, muslim', 'Agama, Seni', 1),
    ('Sejarah Kebangkitan Islam dan Perkembangannya di Indonesia', 'ZUHRI, Saifuddin.', 'Samsoe B, Sejarah Islam Indonesia', 'Sejarah & Biografi, Agama', 1),
    ('Dari Perbendaharaan Lama', 'HAMKA', 'Sejarah Islam Indonesia', 'Sejarah & Biografi, Agama', 1),
    ('Tunggu Aku Di Batavia', 'Suastini, Ni Ketut Yuni', 'Cinta, Fiksi Indonesia, Novel Indonesia, Sejarah dan Geografi', 'Fiksi Sejarah, Fiksi Kontemporer & Klasik', 1),
    ('Bu, Tidak Ada Teman Menangis Malam Ini', 'Candra, Boy', 'Dewasa, FIKSI, Novel Indonesia, Perkembangan Kepribadian, Perkembangan Karakter', 'Fiksi Kontemporer & Klasik, Pengembangan Diri', 1),
    ('Welcome To The Hyunam-dong Bookshop: Selamat Datang di Toko Buku Hyunam-dong', 'Bo-reum, Hwang, Pratiwi, Suci Anggunisa', 'FIKSI, Korea, Novel', 'Fiksi Kontemporer & Klasik', 1),
    ('Membaca Gerak Alam Semesta: mengenali jejak Sang Pencipta', 'ARIEF, ahmad jauhar, BUDIMAN, arie, SAMBAS, edy nasriyandi', 'Islam dan Sains', 'Agama, Ilmu Pengetahuan Alam & Teknologi', 1),
    ('The Psychology of Money', 'ANSHOR, Zia., Housel, Morgen', 'Manajemen Keuangan, Psikologi, uang', 'Ekonomi, Psikologi & Kesehatan Mental, Bisnis & Manajemen', 1),
    ('Polemik Negara Islam Soekarno vs Natsir', 'SUHELMI, Ahmad.', 'Negara Islam', 'Ilmu Sosial & Politik, Agama', 1),
    ('Dimana Kerusakan Umat Islam', 'QORDHOWI, Yusuf.', 'QARDHAWI, Yusuf.', 'Sejarah & Biografi, Agama', 1),
    ('Azas2 Negara dan Pemerintahan di Dalam Islam', 'ASAD, Muhammad.', 'Negara Islam', 'Ilmu Sosial & Politik, Agama', 1),
    ('Kumpulan Materi LMD dan SII', 'ORGIANUS, Yan.', 'Karangan tentang Islam, Samsoe B', 'Agama', 1),
    ('Sejarah Hidup Muhammad', 'AUDAH, Ali., HAEKAL, Muhammad Husain.', 'Sirah Nabi, Nabawiyah, Sejarah Nabi Muhammad SAW', 'Sejarah & Biografi, Agama', 1),
    ('Terapi al-Quran Menghindari Kefakiran', 'SAID, Shalahudin.', 'Akhlaq dan Tasawuf', 'Agama, Filsafat & Etika', 1),
    ('3700 Peribahasa Indonesia', 'S.P.D Bagas Pratama- Drs. Nur Arifin Chaniago', 'Peribahasa', 'Sastra & Puisi, Nonfiksi Naratif', 1),
    ('Berobat Dengan Ayat-Ayat Quran', 'SALIM, Muhammad Ibrahim, Sofyan Azwari', 'Doa dan Zikir, Samsoe B', 'Agama', 1),
    ('Israiliat Dalam Tafsir Dan Hadis', 'HAFIDHUDDIN, Didin.', 'Ilmu Riwayah, Samsoe B', 'Agama', 1),
    ('Tradisi Pesantren', 'DHOFIER, Zamakhsyari', 'pondok pesantren', 'Agama, Ilmu Sosial & Politik', 1),
    ('Jalaluddin Rumi: Sufi penyair terbesar', 'AN-NADWI, Abul Hasan, M. Adib Bisri, Sapardi Djoko Damono', 'Ahli Tasawuf, Biografi Tokoh-tokoh Pemuka Agama Islam, Samsoe B', 'Sejarah & Biografi, Agama', 1),
    ('Inilah Faktanya: Meluruskan Sejarah Umat Islam Sejak Wafat Nabi Saw. Hingga Terbunuhnya Al-Husain', 'KHAMIS, ''Utsman bin Muhammad al., Syafarudin', 'Sejarah Islam', 'Sejarah & Biografi, Agama', 1),
    ('Ensiklopedia Pernikahan', 'ISLAM, Direktorat Jendral Bimbingan Masyarakat', 'Ensiklopedia, Ensiklopedia Pernikahan, Pernikahan', 'Ilmu Sosial & Politik, Nonfiksi Naratif', 1),
    ('Dialog: Memahami Keimanan Kristen-Islam', 'WASIAN, KH. Abdullah', 'Biografi Tokoh-tokoh Pemuka Agama Islam, Dakwah - Pelaku', 'Sejarah & Biografi, Agama', 1),
    ('Titik Nol Kehendak Berpemerintahan Sendiri', 'HAMIJAYA, Nunu A., LESTARI, Fathia, RUKMANA, Nunung k.', 'Organisasi Politik Islam', 'Ilmu Sosial & Politik, Agama', 1),
    ('Seni Berbisnis Jusuf Kalla: Memadukan Spiritualitas, Profesionalitas dan Kearifan Lokal', 'KHOSIRUN, Irfan, PUTRA, Oki Indra, RUSLI, Salim, SETYAWATI, Shanty', 'Sukses Pribadi dalam Bisnis', 'Bisnis & Manajemen, Pengembangan Diri', 1),
    ('Isa Dari Masa Kelahiran Hingga Akhir Zaman', 'ASH-SHALLABI, ali muhammad', 'Biografi, Islam, Kisah Nabi, Sejarah Nabi dan Rasul Sebelum Nabi Muhammad Saw', 'Sejarah & Biografi, Agama', 1),
    ('Pintar Bahasa Arab Al-Quran', 'Harun, Salman', 'al-Quran, Bahasa Arab, Tata Bahasa Arab', 'Agama, Nonfiksi Naratif', 1),
    ('Aku Bagian Ummat Aku Bagian Bangsa; Otobiografi Deliar Noer', 'NOER, Deliar.', 'Autobiografi, Otobiografi', 'Sejarah & Biografi, Nonfiksi Naratif', 1),
    ('Islamic Parenting; Pendidikan Anak di Usia Emas', 'RACHMAN, M. Fauzi.', 'Pengasuhan', 'Ilmu Sosial & Politik, Pengembangan Diri', 1),
    ('Forty Hadith', 'IBRAHIM, Ezzedin., NAWAWI, An.', 'Hadits, Imam Nawawi', 'Agama, Sejarah & Biografi', 1),
    ('Karakteristik Manhaj AL-Quran dalam Pembinaan Ukhti Muslimah', 'JAUHARI, Mahmud Muhammad, safrudin Edi wibowo', 'Fikih Wanita, Samsoe B', 'Agama, Ilmu Sosial & Politik', 1),
    ('Fikih Ibu: Himpunan Hukum Islam Khas Ummahat', 'SUWAILIM, Wafa'' binti Abdul Aziz As., Umar Mujtahid, Yasir Amri', 'Fikih Wanita', 'Agama, Ilmu Sosial & Politik', 1),
    ('100 Ulama Nusantara di Tanah Suci', 'Arif Mahmudi, EDA, Maulana La.', 'Biografi Tokoh-tokoh Pemuka Agama Islam', 'Sejarah & Biografi, Agama', 1),
    ('Zulkarnain Agung; Antara Cyrus dan Alexander Jejak Cerita dalam al-Quran dan Riwayat Sejarah', 'Nadya Andwiani, PRABOWO, Wisnu Tanggap', 'Biografi Tokoh Agama', 'Sejarah & Biografi, Agama', 1),
    ('Ad-Daa'' Wa Ad-Dawaa'': Macam-Macam Penyakit Hati yang Membahayakan dan Resep Pengobatannya', 'AL-ATSARI, ''Ali Hasan ''Ali ''Abdul Hamid al-Halabi, AL-JAUZIYAH, Ibnu Qayyim, Kurniawan, Adni', 'Akhlak, Hasad, Islam (Umum), Jiwa, pendidikan Islam, Penyakit hati, Perilaku sosial, Tarbiyah', 'Agama, Psikologi & Kesehatan Mental, Pengembangan Diri', 1),
    ('Terus Menulis, Menulis Terus', 'Rohmatulloh, Winarni, Sri', 'Kepengarangan dan Teknik Editorial, Menulis', 'Sastra & Puisi, Pengembangan Diri', 1),
    ('Games Therapy untuk kecerdasan Bayi dan Balita', 'Yuriastien, Effiana. dkk.', 'Games, orang tua, Parenting Skill, Pendidikan anak, Pengasuhan, Pengasuhan Anak - Islam', 'Ilmu Sosial & Politik, Agama, Pengembangan Diri', 1),
    ('Self-Coaching', 'Aji, Darmawan', 'Coaching, Potensi Diri, self improvement, Self Love', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 1),
    ('Menjadi Muslimah Bahagia Sepanjang Masa', 'IBRAHIM, Majdi Sayyid.', 'Fikih Wanita', 'Agama, Ilmu Sosial & Politik', 1),
    ('Dapat Apa Sih dari Universitas?', 'WAHONO, Romi Satria.', 'Pendidikan Tinggi', 'Ilmu Sosial & Politik, Pengembangan Diri', 1),
    ('Adab Remaja Muslimah', 'FIKRI, Syeikh Ali, Irwan Raihan, dkk, Muhammad Halabi Hamdy', 'Akhlak, Samsoe B', 'Agama, Filsafat & Etika', 1),
    ('Mengungkap Makna dan Hikmah Sabar', 'FADAQ, Asma Umar Hasan, Nasib Musthafa', 'Akhlak, Samsoe B', 'Agama, Filsafat & Etika', 1),
    ('Kitab Para Pencari Ilmu', 'AL-ZARNUJI, Syaikh, CHOIRI, Faizah Ulfah, EL-SYAFA, Ahmad Zacky', 'Akhlak', 'Agama, Filsafat & Etika', 1),
    ('101 Hadits', 'Idaini, Moh Wifaqul', 'Hadits, Kumpulan Hadits', 'Agama', 1),
    ('Bidadari Berbisik', 'NADIA, Asma', 'Fiksi Indonesia, Prosa Indonesia', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 1),
    ('66 Muslimah Pengukir Sejarah ( Nisa Laha Tarikh)', 'Faqih. Cep Mochamad, Nuraeni, Nunung, Ummu Isra, binti Arafah', 'Fikih Wanita, Sejarah Islam, Sejarah Islam zaman Nabi, Wanita dalam Pandangan Islam, Wanita Islam', 'Agama, Sejarah & Biografi, Ilmu Sosial & Politik', 1),
    ('Healing The Empitiness: Sembuhkan Luka Emosi dan Jiwa, Capai Kedamaian Hakiki', 'Andwiani, Nadya, Mogahed, Yasmin', 'Iman Kepada Allah SWT, Jiwa, Psikologi - Emosi dan Perasaan, Psikologi Islam, self healing', 'Agama, Psikologi & Kesehatan Mental, Pengembangan Diri', 1),
    ('The Golden Stories Of Khadijah dan Fatimah', 'Roziqin, Badiatul', 'Fatimah, Fikih Muslimah, Islam, Khadijah, kisah teladan keluarga Nabi, Sahabat Nabi Muhammad SAW', 'Sejarah & Biografi, Agama', 1),
    ('Hi Bye My Blue', 'Hanifah, Hana', 'Agama, Muslimah, self improvement, Self Love', 'Agama, Pengembangan Diri', 1),
    ('Tuhan, Pantaskah Aku Pulang Ke Surga?', 'Astuti, Kartini F', 'Islam, Motivasi Islami, Muslimah, pengembangan diri, self improvement', 'Agama, Pengembangan Diri', 1),
    ('Mindful Life : Seni Menjalani  Hidup Bahagia dan Bermakna', 'Aji, Darmawan', 'Bahagia, Ide, Inspirasi, self improvement, Seni', 'Pengembangan Diri, Seni', 1),
    ('Berjalan Menembus Sepuluh Ribu Hijab', 'Kabeer, Maryam, Viviani, Nevisra', 'Hijab, Islam, Muslimah, perjalanan spiritual, self improvement', 'Agama, Pengembangan Diri', 1),
    ('Playing Victim', 'RAHAYU, Eva Sri., Yuli Pritania', 'Fiksi Indonesia, Prosa Indonesia', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 1),
    ('50 Kaidah Al-Qur''an untuk Jiwa dan Kehidupan', 'Artawijaya, Muhamad Yasir., MUQBIL, Umar bin Abdullah Al.', 'Kandungan Al-Qur''an', 'Agama', 1),
    ('Panggilan Islam Terhadap Wanita', 'Pustaka, RIDHA, Muhammad Rasyid.', 'Wanita dalam Pandangan Islam', 'Agama, Ilmu Sosial & Politik', 1),
    ('Di Depan Mahkamah Akal', 'MAUDUDI, Abul Ala., Pustaka', 'Islam dan filsafat', 'Filsafat & Etika, Agama', 1),
    ('Tidak Ada Negara Islam; Surat-surat Politik Murcholish Madjid - Mohamad Roem', 'SANTOSO, Agus Edi.', 'Negara Islam', 'Ilmu Sosial & Politik, Agama', 1),
    ('Buku Pintar Agama Islam', 'HAMID, Syamsul Rijal', 'Islam Umum, Samsoe B', 'Agama', 1),
    ('Tauhid dan Sains: Esai-esai tentang Sejarah dan Filsafat Islam', 'BAKAR, Osman.', 'filsafat islam, sejarah', 'Filsafat & Etika, Agama, Sejarah & Biografi', 1),
    ('Ensiklopedi Hukum Wanita Dan Keluarga', 'ZAIDAN, Abdul Karim.', 'Fikih Wanita, Samsoe B', 'Agama, Ilmu Sosial & Politik', 1),
    ('Bahasa Rupa', 'TABRANI, Primadi', 'Gambar dan Seni Menggambar', 'Seni', 1),
    ('Ensiklopediana Ilmu dalam al-Quran', 'RAHMAN, Afzalur.', 'Islam dan Sains', 'Agama, Ilmu Pengetahuan Alam & Teknologi', 1),
    ('Di Tanah Lada', 'ZEZSYAZEOVIENNAZABRIZKIE, Ziggy', 'Fiksi Indonesia, Novel, Novel Indonesia, Petualangan', 'Fiksi Kontemporer & Klasik, Fiksi Genre Spesifik', 1),
    ('al-Hikam; Untaian Hikmah Ibnu Athaillah', 'ATHAILLAH, Ibnu., Sibawaih El-Hasany', 'Tasawuf', 'Agama, Filsafat & Etika', 1),
    ('10 Ilmuwan Muslim Terhebat', 'Abqary, Ridwan, Herdianing, Muninggar', 'Ilmuwan Muslim, Kisah Islam, Kisah Perjalanan, Pendidikan anak', 'Sejarah & Biografi, Agama, Ilmu Sosial & Politik', 1),
    ('Rekonstruksi Sejarah Al-Quran', 'AMAL, Taufik Adnan.', 'Sejarah Al-Qur''an', 'Sejarah & Biografi, Agama', 1),
    ('Pemuda Dalam Bait Syair', 'AL-MUBASSYIR,Muhammad', 'Akhlak, Akhlaq', 'Agama, Filsafat & Etika', 1),
    ('The Journeys 3: Yang Melangkah dan Menemukan', 'ARIESTANTY, Windy', 'Kisah Perjalanan', 'Nonfiksi Naratif', 1),
    ('Kepribadian Rasulullah: Sosok dan Kebiasaan Sehari-hari Rasulullah Saw.', 'Abdul Ghafur, Owen Putra, TIRMIDZI, Imam.', 'Sirah Nabi, Nabawiyah, Sejarah Nabi Muhammad SAW', 'Sejarah & Biografi, Agama', 1),
    ('Recehan Bahasa: Baku Tak Mesti Kaku', 'LANIN, ivan', 'Linguistik', 'Sastra & Puisi, Nonfiksi Naratif', 1),
    ('Identitas: Tuntutan atas Martabat dan Politik Kebencian', 'FUKUYAMA, Francis., Wisnu Prasetya Utama', 'Ilmu Politik dan Ilmu Pemerintahan', 'Ilmu Sosial & Politik', 1),
    ('Seni Memahami Pria; Karena Tak Semua Pria Bersikap Ceroboh dan Menyebalkan', 'Puput Aliva, SABRINA, Claudia', 'Perkembangan Kepribadian, Perkembangan Karakter', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 1),
    ('Ronggeng Dukuh Paruk', 'TOHARI, Ahmad.', 'FIKSI, Fiksi Indonesia, Novel, Novel Indonesia, Politik, Sejarah Indonesia', 'Fiksi Sejarah, Fiksi Kontemporer & Klasik, Ilmu Sosial & Politik', 1),
    ('Dompet Ayah Sepatu Ibu', 'Khairen, J.S', 'Fiksi Indonesia, Novel Indonesia, orang tua, Perjuangan', 'Fiksi Kontemporer & Klasik, Ilmu Sosial & Politik, Pengembangan Diri', 1),
    ('The Door To Door Booksore', 'Henn, Carsten, Nugrahani, Berliani M.', 'buku, FIKSI, German, Novel, Novel Terjemah', 'Fiksi Kontemporer & Klasik', 1),
    ('Membongkar Kepalsuan Orientalisme', 'SYIBA''I, Mustofa Hassan as-.', 'Samsoe B', 'Agama', 1),
    ('Hadis Nabawi dan Sejarah Kodifikasinya', 'AZAMI, M.M.', 'Ilmu Hadits, Samsoe B', 'Agama', 1),
    ('Bahasa Mandarin Modern untuk Pemula', 'SEMITA, Muryani J.', 'Bahasa Mandarin', 'Nonfiksi Naratif', 1),
    ('Berdamai dengan Hidup Pas-pasan; Seni Hidup Sederhana Namun Bahagia', 'Herman Adamson, MAJID, Rofi Ali.', 'Emosi dan Perasaan', 'Psikologi & Kesehatan Mental', 1),
    ('Self Healing With Qur''an', 'Ummu Kalsum IQT', 'Alquran, Cinta, menthal health, Parenting Skill, Psikologi Islam, self healing, self improvement', 'Agama, Psikologi & Kesehatan Mental, Pengembangan Diri', 1),
    ('You Do You', 'Ruby, Fellexandro', 'Ide, Inspirasi, Manajemen Keuangan, Motivasi, self improvement, Sukses Pribadi dalam Bisnis', 'Pengembangan Diri, Bisnis & Manajemen, Ekonomi', 1),
    ('Reclaim Your Heart: Bebaskan Diri dari Jebakan Dunia, Temukan Makna-Hidup Sejati', 'Andwiani, Nadya, Mogahed, Yasmin', 'Jiwa, Motivasi hidup, Motivasi Islami, Psikologi - Emosi dan Perasaan, Psikologi Islam', 'Psikologi & Kesehatan Mental, Agama, Pengembangan Diri', 1),
    ('Perjalanan Membingkai Makna', 'Anggorowati, Rita, Yuliawan, Teddi Prasetya', 'Motivasi, NLP, self improvement', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 1),
    ('Sesuk', 'LIYE, Tere.', 'Fiksi Indonesia, Horor, Novel Detektif dan Misteri, Novel Indonesia, Remaja', 'Fiksi Genre Spesifik', 1),
    ('Anatomi Perasaan Ibu', 'Mega, Sophia', 'Bahasa dan Gender, essai, Ibu, Sastra', 'Sastra & Puisi, Ilmu Sosial & Politik, Nonfiksi Naratif', 1),
    ('Album Bandoeng en Omstreken 1845-1910an', 'KATAM, Sudarsono.', 'Aneka Ragam Sejarah', 'Sejarah & Biografi', 1),
    ('Understanding Kesurupan; Memahami Kesurupan, Mengatasi Depresi.', 'Fira Husaini, NOURY, Adebba Ramadhanti.', 'Emosi dan Perasaan, Psikologi - Emosi dan Perasaan', 'Psikologi & Kesehatan Mental', 1),
    ('Tadzkiratus Saami'' Wal Mutakallim Fii Adabil ''Alim Wal Muta''alim : Adab Penuntut Ilmu & Orang Yang Memiliki Ilmu', 'Angga, Jama''ah, Imam Badruddin Ibnu, Setyawan, Nurfajri', 'Akhlak, Islam, Penuntut Ilmu', 'Agama, Pengembangan Diri', 1),
    ('Mind Platter: Bejana Pikiran', 'Savitri, Intan, Zebian, Najwa', 'Psikologi, self improvement', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 1),
    ('Dari Berpikir Positif ke Bertindak Positif', 'Nunung Wiyati, Viffah Yuniastuti, WISEMAN, Richard.', 'Perkembangan Kepribadian, Perkembangan Karakter', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 1),
    ('Pengantar Ilmu Da''wah', 'LUBIS, Basrah.', 'Dakwah', 'Agama', 1),
    ('Dakwah Islam dan Transformasi Sosial-Budaya', 'ACHMAD, Amrullah.', 'Dakwah', 'Agama', 1),
    ('Sejarah Dakwah', 'Nunik Siti Nurbaya, SYAMSUDDIN, RS.', 'Dakwah - Sejarah', 'Sejarah & Biografi, Agama', 1),
    ('Waosan babad galuh: dari prabu ciungwanara hingga prabu siliwangi (Naskah kraton kasepuhan cirebon)', 'Pustaka, WAHJU, Amman N.', 'Babad, Sastra Sunda', 'Sastra & Puisi, Sejarah & Biografi', 1),
    ('Kebangkitan Islam di Andalusia', 'HIMAYAH, ahmad mahmud', 'Sejarah Islam', 'Sejarah & Biografi, Agama', 1),
    ('Konsep Pendidikan Dalam Islam', 'Al-Attas, Syed Muhammad Al-Naquib', 'pendidikan Islam', 'Agama, Ilmu Sosial & Politik', 1),
    ('Metode Menaklukan Jiwa', 'AL-GHAZALI ,muhamad', 'Akhlak, Imam Ghazali, Jiwa, Kepribadian, Psikologi Islam', 'Agama, Psikologi & Kesehatan Mental, Sejarah & Biografi', 1),
    ('Fitrah Based Education', 'Santosa, Harry', 'anak-anak, Edukasi, Mengasuh Anak, Parenting Skill, pendidikan Islam, Pengasuhan Anak - Islam', 'Ilmu Sosial & Politik, Agama, Pengembangan Diri', 1),
    ('Kata yang Rapuh', 'SAHIDAH, Ahmad', 'Aneka Ragam tentang Ilmu Bahasa', 'Sastra & Puisi, Nonfiksi Naratif', 1),
    ('Nation; Negeri', 'PRATCHETT, Terry.', 'Novel', 'Fiksi Kontemporer & Klasik', 1),
    ('The Compass: Filosofi Arete untuk Bahagia Sejati', 'Manampiring, Henry', 'Motivasi hidup, pengembangan diri, self improvement', 'Pengembangan Diri', 1),
    ('Awal Yang Baru', 'Syaladin, Khairunnisa', 'Parenting Skill, Pernikahan, pernikahan islami, self improvement', 'Ilmu Sosial & Politik, Agama, Pengembangan Diri', 1),
    ('Kucing Bernama Dickens', 'Grant, Callie Smith, PRAJOKO, Istiani.', 'FIKSI, Kucing, Novel Terjemah', 'Fiksi Kontemporer & Klasik', 1),
    ('Usus Yang Menakjubkan', 'Enders, Giulia, Fauziah, Syifa', 'Fakta, Kesehatan, non fiksi, Organ tubuh', 'Ilmu Pengetahuan Alam & Teknologi, Nonfiksi Naratif', 1),
    ('Keluarga Sakinah', 'DJAELANI , Abdul Qadir', 'Keluarga, Samsoe B', 'Ilmu Sosial & Politik, Agama', 1),
    ('Seni Memahami Wanita; Karena Peka Secara Nyata Bukan Hanya Sekedar Kata-kata', 'Reddy Suzayzt, SABRINA, Claudia', 'Perkembangan Kepribadian, Perkembangan Karakter', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 1),
    ('Muhammad Rasulullah', 'RASYID, Anwar', 'Samsoe B', 'Agama', 1),
    ('Kebebasan Beragama', 'RASYIDI, H.M.', 'Agama, Samsoe B', 'Agama', 1),
    ('Kerukunan Beragama dan Kontroversi Penggunaan Kata "Allah" dalam Agama Kristen', 'HUSAINI, Adian.', 'Islam dan Kristen', 'Agama, Ilmu Sosial & Politik', 1),
    ('Al-Quran, Realitas Sosial dan Limbo Sejarah (Sebuah Releksi)', 'MAARIF, Ahmad Syafii., Pustaka', 'Alqur''an, isi, Islam dan Ilmu Sosial', 'Agama, Ilmu Sosial & Politik', 1),
    ('Koreksi Terhadap Drs Nurcholis Majid Tentang Sekularisasi', 'RASJIDI', 'Politik islam, teori', 'Ilmu Sosial & Politik, Agama', 1),
    ('Paradigma Islam; Interpretasi untuk Aksi', 'AE Priyono, KUNTOWIJOYO', 'Karangan tentang Islam', 'Agama', 1),
    ('Pendidikan Aqil Baligh Jilid 1', 'RUSFi,Adriano.', 'Parenting Skill, Pendidikan Agama Islam, Pendidikan anak, Pengasuhan Anak - Islam', 'Ilmu Sosial & Politik, Agama, Pengembangan Diri', 1),
    ('Yusuf Zulaikha: Terinspirasi dari Kisah Cinta Nabi Yusuf dan Zulaikha', 'KHALIEQY, Abidah El.', 'Fiksi Indonesia, Prosa Indonesia', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 1),
    ('Filsafat Sejarah Ibn Khaldun', 'KHUDHAIRI, Zainab al., Pustaka', 'Filsafat Islam', 'Filsafat & Etika, Agama', 1),
    ('As-Sunnah; Sumber Hukum Islam yang Kedua', 'FARIDL, Miftah., Pustaka', 'Al-Hadits dan yang berkaitan', 'Agama', 1),
    ('K.H.A Wahid Hasyim Dalam Pandangan Dua Puteranya : Dialog Antara Gus Dur - Mas Solah Mengenai Pandangan Politik Keislaman Sang Ayah', 'WAHID, Abdurrahman', 'Biografi Tokoh Agama Islam, Samsoe B', 'Sejarah & Biografi, Agama', 1),
    ('The Midnight Library', 'Dharmawati, Haig, Matt', 'FIKSI, Fiksi Inggris, Novel, Novel Detektif dan Misteri', 'Fiksi Genre Spesifik', 1),
    ('Tikungan Maut Jerit Penumpang Ditelan Api', 'Azzura, Ry, Kisah Tanah Jawa', 'Cerpen, Horor, Kumpulan Cerpen, Novel, Remaja', 'Fiksi Genre Spesifik', 1),
    ('Metode Penelitian Komunikasi', 'MULYANA, Deddy. dkk', 'Komunikasi (Kursus)', 'Bisnis & Manajemen, Pengembangan Diri', 1),
    ('Pulau Run: Magnet Rempah-rempah Nusantara yang Ditukar dengan Manhattan', 'Ida Rosdalina, MILTON, Giles, Nunung Wiyati', 'Sejarah Indonesia', 'Sejarah & Biografi', 1),
    ('Hello', 'LIYE, Tere.', 'Cinta, Fiksi Indonesia, Novel, Remaja', 'Fiksi Kontemporer & Klasik', 1),
    ('Robohnya Surau Kami', 'NAVIS, A. A.', 'Novel', 'Fiksi Kontemporer & Klasik', 1),
    ('Garis Batas', 'WIBOWO, Agustinus', 'Asia Tenggara, Geography and Travel/Geografi dan Perjalanan, Kisah Perjalanan, Memoar', 'Nonfiksi Naratif, Sejarah & Biografi', 1),
    ('The True Power of Water : Hikmah Air dalam Olahjiwa', 'Azam, EMOTO, Masaru', 'Samsoe B, Topik terkait  filsafat', 'Filsafat & Etika, Agama', 1),
    ('Yang Fana Adalah Waktu', 'DAMONO, Sapardi Djoko.', 'Cinta, Dewasa, Kisah, Novel, Novel Indonesia', 'Fiksi Kontemporer & Klasik', 1),
    ('Mitologi Cina', 'COLLIER, Irene Dea, Nurul Afifah', 'Mitologi Cina, Samsoe B', 'Ilmu Sosial & Politik, Agama', 1),
    ('HItam 2045', 'Manampiring, Henry', 'Dewasa, Fiksi Indonesia, Masa depan, Novel, Novel Detektif dan Misteri, Politik, Remaja', 'Fiksi Genre Spesifik, Ilmu Sosial & Politik', 1),
    ('Kitalah yang Ada di Sini Sekarang', 'GAARDER, Jostein., Syahrir,Irwan', 'Filsafat, Filsafat Kehidupan, filsafat modern, Filsafat Umum, Motivasi hidup, Teori Filsafat', 'Filsafat & Etika, Pengembangan Diri', 1),
    ('Si Anak Pintar', 'LIYE, Tere.', 'Indonesian Fiction/Fiksi Indonesia, Prosa Indonesi, Kesusastraan Daerah dari Indonesia, Novel Indonesia, Novel Tragedi', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 1),
    ('Heartbreak Motel', 'NATASSA, Ika.', 'Cinta, Dewasa, Novel, Novel Detektif dan Misteri, Novel Indonesia', 'Fiksi Kontemporer & Klasik, Fiksi Genre Spesifik', 1),
    ('Kami (Bukan) Generasi Bac*ot)', 'Khairen, J.S', 'Fiksi Indonesia, Novel Indonesia, Politik, Sastra Indonesia', 'Fiksi Kontemporer & Klasik, Sastra & Puisi, Ilmu Sosial & Politik', 1),
    ('Public Relation in The Age of Disruption', 'LAKSAMANA, Agung', 'Komunikasi', 'Bisnis & Manajemen, Pengembangan Diri', 1),
    ('The Alpha Girl''s', 'Manampiring, Henry', 'Dewasa, Karakter, pengembangan diri, Wanita', 'Pengembangan Diri, Ilmu Sosial & Politik', 1),
    ('Confidence In You', 'Talitha, Cut Vivia', 'Ide, Inspirasi, Motivasi hidup, pengembangan diri, self improvement', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 1),
    ('Menjadi Lelaki Luqmanul Hakim Buku Pertama', 'Ferandy, Mohammad, RUSFI,Adriano', 'Fathers/Ayah, Keluarga, nikah, Parenting, Parenting Skill, pernikahan islami', 'Ilmu Sosial & Politik, Agama, Pengembangan Diri', 1),
    ('Sepotong Kisah Di Balik 98: Cerita Pilihan: A. Fuadi', 'Ariyanto, Herlambang, Ferry, ramdhan, M. Donny, Widianto, Heri', 'Fiksi Indonesia, Novel, Novel Detektif dan Misteri, Novel Indonesia, Sejarah Indonesia', 'Fiksi Genre Spesifik, Fiksi Sejarah', 1),
    ('Fabel Al-Quran: 16 Kisah Binatang Istimewa yang Diabadikan Al-Quran', 'Faiq Ihsan Anshori, RAHMAN, Kaserun AS.', 'Cerita dan Kisah dari Al-Qur''an', 'Agama, Sejarah & Biografi', 1),
    ('Komik 100 Kebiasaan Nabi', 'DW, Straightedge, Kungkang, Wawan', 'Akhlak, Kisah Nabi, Pengasuhan Anak - Islam, SIrah Nabi, Tata Krama dan Kebiasaan - Aceh, Teknik Menggambar Kartun, Karikatur, Komik', 'Agama, Sejarah & Biografi, Seni', 1),
    ('Bukannya Malas, Cuma Lagi Mager Aja', 'Prihasti, Presilia, Snail, Dancing', 'Jiwa, Kesehatan, Psikologi, self improvement', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 1),
    ('10 Ilmuwan Muslim Terhebat: Abbas Ibnu Firnas', 'Mustofa, Alif, Wulantini, Asri', 'Biografi, Cerita anak, Cerita Muslim, Ilmuwan', 'Sejarah & Biografi, Agama, Ilmu Pengetahuan Alam & Teknologi', 1),
    ('10 Ilmuwan Muslim Terhebat: Ibnu Battuta', 'S, Dwi Asep, Wulantini, Asri', 'Biografi, Cerita anak, Cerita Muslim, Ilmuwan', 'Sejarah & Biografi, Agama, Ilmu Pengetahuan Alam & Teknologi', 1),
    ('Thinking, Fast and Slow', 'ANSHOR, Zia., Kahneman, Daniel', 'Cara Berpikir Kritis, psikoanalisis, Psikologi', 'Psikologi & Kesehatan Mental, Filsafat & Etika', 1),
    ('Dilarang Gondrong! Praktik Kekuasaan Orde Baru Terhadap Anak Muda Awal 1970an', 'YUDHISTIRA, aria wiramata', 'Orde Baru', 'Sejarah & Biografi, Ilmu Sosial & Politik', 1),
    ('Fiqih Dakwah Muslimah; Buku Pintar Aktivis Muslimah', 'MAHMUD, Ali Abdul Halim.', 'Dakwah, Fikih Wanita', 'Agama, Ilmu Sosial & Politik', 1),
    ('People Development Handbook', 'KUSWANDI, N, MAFAZI, David', 'Manajemen Personalia', 'Bisnis & Manajemen', 1),
    ('Hai, Anak Cucuku!', 'Artawijaya, HASSAN, A.', 'Akhlak, Akhlaq', 'Agama, Filsafat & Etika', 1),
    ('Yang Sering Bilang Gapapa, Padahal Berantakannya Luar Biasa', 'Asri, Syarilla', 'Ide, Inspirasi, Kehidupan, Motivasi hidup, Perjuangan, self improvement, Self Love', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 1),
    ('Mari Menyelidiki Kekeliruan Teori Evolusi', 'YAHYA, Harun.', 'Evolution - Evolusi', 'Ilmu Pengetahuan Alam & Teknologi', 1),
    ('Why? ; Future Science', 'CHO, Young-Seon, NOVIANTI, Endah Nawang.', 'Sains', 'Ilmu Pengetahuan Alam & Teknologi', 1),
    ('Manhaj dan Aqidah Ahlussunnah Wal Jama''ah Menurut Pemahaman Ulama Salaf', 'Abu Fahmi, AL-MISHRI, Muhammad Abdul Hadi, As''ad Yasin, Ibnu marjan, M. Solihat', 'Samsoe B, Sunni, Ahli Sunnah, Ahlussunnah wal Jamaah', 'Agama', 1),
    ('Mendidik Anak Pra-aqil Baligh: panduan mendidik anak pra-aqil baligh (7-10 tahun)', 'AYNUN, Nur', 'Pendidikan anak', 'Ilmu Sosial & Politik, Pengembangan Diri', 1),
    ('The Danish Way Of Parenting: Rahasia Orang Denmark Membesarkan Anak', 'ALEXANDER, Jessica Joelle, Ayah Edy, Sandahl, Iben Dissing', 'anak, anak-anak, Keluarga, Parenting Skill, Pendidikan anak, Pengasuhan', 'Ilmu Sosial & Politik, Pengembangan Diri', 1),
    ('Why We Sleep: Mengapa Kita Tidur: Mengungkap Keampuhan Tidur dan Bermimpi', 'Walker, Watthew', 'Kesehatan, self improvement', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 1),
    ('Agar Hidup Selalu Berkah', 'ALAYDRUS, Habib Syarief.', 'Fikih', 'Agama', 1),
    ('Amalan Ringan Paling Menakjubkan: 20 kiat Menuju Kebahagiaan Hidup', 'JABER, ali', 'amal shaleh', 'Agama, Pengembangan Diri', 1),
    ('Lorong-lorong Rahasia', 'Al-JAILANI, Syaikh Abdul Qadir', 'Tasawuf', 'Agama, Filsafat & Etika', 1),
    ('Prinsip-Prinsip Komunikasi Dalam Islam', 'MUKTY, Ibnu Hisyam.', 'islam dan bidang lain', 'Agama, Ilmu Sosial & Politik', 1),
    ('Politik Hukum Era Jokowi-Ma''ruf', 'Andi, Ferdian', 'Hukum tata negara, Politik, Presiden', 'Ilmu Sosial & Politik, Sejarah & Biografi', 1),
    ('Percakapan-Percakapan Panjang Seusai Kelas', 'Riskawati, Tristia. dkk', 'Diskusi, essai, Kehidupan, Pendidikan, Pendidikan Formal', 'Ilmu Sosial & Politik, Nonfiksi Naratif, Pengembangan Diri', 1),
    ('Offline: Finding Yourself in the Age of Distractions', 'Anwar, Desi', 'Ide, Inspirasi, Psikologi, Psikologi - Emosi dan Perasaan, refleksi, Sastra Inggris', 'Psikologi & Kesehatan Mental, Sastra & Puisi, Pengembangan Diri', 1),
    ('Biografi Imam Malik: kehidupan, sikap dan pendapatnya', 'ASY-SYINAWI, abdul aziz', 'Imam Malik', 'Sejarah & Biografi, Agama', 1),
    ('The unfettere mind: tulisan seorang guru zen kepada seorang pendekar pedang', 'SOHO, takuan, WILSON, william scott', 'filsafat jepang', 'Filsafat & Etika, Ilmu Sosial & Politik', 1),
    ('Petualangan Don Quixote', 'De Cervantes, Miguel, Muajib', 'China, Fiksi Inggris, Novel, Petualangan, Kumpulan Peristiwa Tertentu, Sejarah dan Geografi', 'Fiksi Genre Spesifik, Sejarah & Biografi', 1),
    ('Dikuasai Kata-kata', 'San, Achmad', 'Bahasa dan Gender, Esai Indonesia, Filsafat dan Teori tentang Ilmu Politik, Tata Bahasa Indonesia', 'Sastra & Puisi, Ilmu Sosial & Politik, Filsafat & Etika', 1),
    ('How to be Twice as Smart', 'WITT, Scott.', 'Kecerdasan, Psikologi', 'Psikologi & Kesehatan Mental, Ilmu Pengetahuan Alam & Teknologi', 1),
    ('Brianna Dan Bottomwise', 'HIRATA, Andrea.', 'Fiksi Indonesia, Novel Indonesia, Sastra Indonesia', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 1),
    ('Catatan Najwa', 'SHIHAB, Najwa, Zen RS', 'Situasi dan Kondisi Politik di Indonesia', 'Ilmu Sosial & Politik', 1),
    ('Siklus Masalah Pendidikan [Indonesia]', 'Taruna, J.C. Tukiman', 'eDUCATION, Indonesia, Pendidikan', 'Ilmu Sosial & Politik, Pengembangan Diri', 1),
    ('Yang tak Dimengerti Perempuan akan Dirinya', 'Ahmad Djumadie, HILARD, Merchand.', 'Wanita dalam Pandangan Islam', 'Agama, Ilmu Sosial & Politik', 1),
    ('Hak dan Peran Aktif Wanita Muslimah', 'ARAFAH, Muhammad bin Abdullah Sulaiman.', 'Kedudukan Wanita dalam Islam', 'Agama, Ilmu Sosial & Politik', 1),
    ('Cara Quran Membebaskan Perempuan', 'BARLAS, Asma., R. Cecep Lukman Yasin.', 'Fikih Wanita, Kedudukan Wanita dalam Islam', 'Agama, Ilmu Sosial & Politik', 1),
    ('Seri Terampil Menulis Bahasa Indonesia: Paragraf', 'Prof. Drs. Soedjito, Saryono, Prof. Dr. Djoko', 'Bahasa Indonesia, Paragraf, Tata Bahasa Indonesia', 'Sastra & Puisi, Nonfiksi Naratif', 1),
    ('Emotional Intelligence: Kecerdasan Emosional', 'GOLEMAN, Daniel., Hermaya, T.', 'Emosi dan Perasaan, Emotions and Feeling/Emosi dan Perasaan, Psikologi, self improvement', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 1),
    ('1421 Saat Cina Menemukan Dunia', 'MANZIES, gavin, MUSYADAD, tufel najib', 'China, Penjelajahan Dunia', 'Sejarah & Biografi, Nonfiksi Naratif', 1);

-- Batch 3/8 (Records 1001-1500)
INSERT INTO books (title, author, category, general_category, library_id) VALUES
    ('Becoming white: refresentasi ras, kelas, femininitas dan globalisasi dalam iklan sabun', 'PRIYATNA, Aquarini.', 'feminisme', 'Ilmu Sosial & Politik, Filsafat & Etika', 1),
    ('Sign In The Heavens : A Muslim Astronomers Perspective on Religion and Science', 'AHMAD , Ima-ad-Dean', 'Islam dan Ilmu Murni, Samsoe B', 'Agama, Ilmu Pengetahuan Alam & Teknologi', 1),
    ('Muslimah Keren', 'Hanifah, Hana', 'Motivasi hidup, Motivasi Islami, Muhasabah, self improvement', 'Agama, Pengembangan Diri', 1),
    ('Al-Wadul Haq  Perjalanan Terakhir Anda Yang Pasti Terjadi', 'KAFI, Umar Abdul.', 'Mati, Kematian.', 'Psikologi & Kesehatan Mental, Agama', 1),
    ('Adabud Dunya Wad Din: Hidup Indah dan Berkah dengan Etika Islam', 'Iqbal Dawami, Jamaluddin, MAWARDI, Imam al.', 'Akhlak, Akhlaq', 'Agama, Filsafat & Etika', 1),
    ('Niat dan Ikhlas', 'QARDHAWI, Yusuf.', 'Akhlaq dan Tasawuf', 'Agama, Filsafat & Etika', 1),
    ('Filsafat Hukum Islam', 'SYAH, Ismail Muhammad, Zaini Dahlan', 'Fikih, Samsoe B', 'Agama', 1),
    ('Buku pintar sejarah filsafat barat', 'RAHMAN, Masykur Arif.', 'filsafat barat, Sejarah filsafat', 'Filsafat & Etika, Sejarah & Biografi', 1),
    ('Aliran-Aliran Tafsir', 'MUSTAQIM , Abdul', 'Ilmu Tafsir, Samsoe B', 'Agama', 1),
    ('Pengantar Ushul Fiqh', 'AMRULLAH, Abdul Karim', 'Ushul Fikih', 'Agama, Filsafat & Etika', 1),
    ('Majalah Bobo 50 tahun', 'Togatorop, David', 'anak-anak, FIKSI, Komik, Majalah Bobo', 'Fiksi Kontemporer & Klasik, Seni', 1),
    ('Aku Ingin Berani Seperti Nabi Daud', 'Muakhir, Ali, Studio, Meraki', 'anak, Islam, Kisah Nabi, Komik, Parenting', 'Agama, Sejarah & Biografi, Seni', 1),
    ('10 Ilmuwan Muslim Terhebat: Ibnu Nafis', 'Istiani, Anisa, Wulantini, Asri', 'Biografi, Cerita anak, Cerita Muslim', 'Sejarah & Biografi, Agama', 1),
    ('10 Ilmuwan Muslim Terhebat: Ibnu Haitsam', 'Ismail, Taufik, Wulantini, Asri', 'Biografi, Ilmuwan, Islam, muslim, Tokoh', 'Sejarah & Biografi, Agama, Ilmu Pengetahuan Alam & Teknologi', 1),
    ('Psikologi Islam Rujukan Utama Ilmu Psikologi Dunia', 'Sina, Ibnu, Syahid, Achmad', 'Kepribadian, Psikologi, Psikologi Islam', 'Psikologi & Kesehatan Mental, Agama, Pengembangan Diri', 1),
    ('Keep Going', 'Kleon, Austin, Mastura, Nuraini', 'inspirasi, Motivasi hidup, self improvement', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 1),
    ('MItologi Mesir', 'NARDO, Don, Nurul Afifah', 'Mitologi Mesir, Samsoe B', 'Ilmu Sosial & Politik, Agama', 1),
    ('Tafsir al-Azhar Juz XXX', 'AMRULLAH, Haji Abdulmalik Abdulkarim.', 'Samsoe B', 'Agama', 1),
    ('Bocah Sunda Di Mata Belanda', 'SETIAWAN, Hawe', 'Aspek Spesifik tentang Budaya dan Kebudayaan', 'Ilmu Sosial & Politik', 1),
    ('Keadilan Sosial dalam Islam', 'HAMKA', 'Masyarakat Islam', 'Ilmu Sosial & Politik, Agama', 1),
    ('Psikologi dan Masyarakat', 'HUSAIN, M. G., Pustaka', 'Pustaka', 'Nonfiksi Naratif', 1),
    ('Pemikiran Politik Islam; Dari Masa Nabi Hingga Masa Kini', 'Abdullah Ali, BLACK, Antony.', 'Politik Islam', 'Ilmu Sosial & Politik, Agama', 1),
    ('Keadilan Sosial dalam Islam', 'Pustaka, QUTHB, Sayyid.', 'Interaksi Sosial dalam Islam', 'Ilmu Sosial & Politik, Agama', 1),
    ('Mitologi Yunani', 'HAMILTON, Edith., M. Shaleh Isre, RACHMATULLAH, A.', 'Mitologi, Samsoe B', 'Ilmu Sosial & Politik, Agama', 1),
    ('Babylonia : Mesopotamia dan Kelahiran Peradaban', 'Debby Lukito, KRIWACZEK, Paul', 'Samsoe B, Sejarah Mesopotamia', 'Sejarah & Biografi, Ilmu Sosial & Politik, Agama', 1),
    ('Ilmu dan Peradaban', 'ABDUH, Mohamad', 'Islam dan Kristen, Samsoe B', 'Agama, Ilmu Sosial & Politik', 1),
    ('Politik Syariat Islam: idelogi dan pragmatisme', 'MUBARAK, M Zaki', 'Politik Islam', 'Ilmu Sosial & Politik, Agama', 1),
    ('Pelajaran dan Warisan Seorang Presiden John F. Kennedy On Leadership', 'Barnes, John A., Rajoe, Paul', 'Kepemimpinan, Leadership, Tokoh Politik, Biografi, Warisan', 'Bisnis & Manajemen, Ilmu Sosial & Politik, Sejarah & Biografi', 1),
    ('Quranic Law of Attraction', 'RAUF, Rusdin S.', 'Akhlaq dan Tasawuf', 'Agama, Filsafat & Etika', 1),
    ('Memahami Gangguan Hati Berikut Therapinya', 'Dzul Hilman, TAIMIYAH, Ibnu.', 'Akhlak, Samsoe', 'Agama, Filsafat & Etika', 1),
    ('The Art Of War: Seni Menaklukkan Lawan dan Memperoleh Peluang', 'Nugraha, Bima Adi, Tzu, Sun', 'Motivasi hidup, Sastra Cina, self improvement, Seni', 'Pengembangan Diri, Sastra & Puisi, Seni', 1),
    ('Falsafah Ketuhanan', 'HAMKA', 'Filsafat Islam', 'Filsafat & Etika, Agama', 1),
    ('Ayyuhal Walad', 'AL-GHAZALI ,muhamad, Dr. Ali Muhyiddin Ali Al-Qarrah Daghi', 'adab dalam Islam, Imam Ghazali, Pelajar', 'Agama, Sejarah & Biografi, Pengembangan Diri', 1),
    ('Anjing Mengeong, Kucing Menggonggong', 'KURNIAWAN, Eka.', 'Sastra', 'Sastra & Puisi', 1),
    ('Kanuku Leon', 'Senda, Dicky', 'FIKSI, Fiksi Indonesia, Kumpulan Cerita', 'Fiksi Kontemporer & Klasik', 1),
    ('Evolusi Reproduksi Manusia', 'Andya Primanda, DIAMOND, Jared., J.E. Retno Dwi Astuti', 'Psikologi Seks', 'Psikologi & Kesehatan Mental, Ilmu Sosial & Politik', 1),
    ('Teologi Dialog Islam Barat : Pergumulan Muslim Eropa', 'Abdullah Ali, Ahmad Baiquni, Pangestuningsih, RAMADAN, Tariq', 'Aqaid dan Ilmu Kalam, Samsoe B', 'Agama, Filsafat & Etika', 1),
    ('Filsafat Hukum Islam: Bagian pertama', 'DJAMIL, Fathurrahman', 'Fikih, Samsoe B', 'Agama', 1),
    ('Ibn Taimiyah Pelopor Kajian Islam yang Kritis', 'MAULUDI, Sahrul', 'Biografi Tokoh Agama Islam, Imam, Pemikiran Islam, Sejarah, Sejarah Islam', 'Sejarah & Biografi, Agama, Filsafat & Etika', 1),
    ('Tahafut Al-Falasifah: Kerancuan Para Filosof', 'Ahmad Maimun, GHAZALI, Imam al.', 'Filsafat Islam', 'Filsafat & Etika, Agama', 1),
    ('Pramoedya A. Toer; Dari Budaya ke Politik 1950-1965', 'Ajip Rosidi, Dalih Sembiring, SCHERER, Savitri.', 'Biografi Sastrawan Indonesia', 'Sejarah & Biografi, Sastra & Puisi', 1),
    ('Java Man', 'CURTIS, Garniss.', 'Ilmu Hayat', 'Ilmu Pengetahuan Alam & Teknologi', 1),
    ('Crank Palace', 'Candra, Yunita, DASHER, James.', 'Fantasi, Novel Detektif dan Misteri, Novel Indonesia, Novel Inggris', 'Fiksi Genre Spesifik', 1),
    ('Kritik dan Saran Untuk Para Da''i', 'AL-QARADHAWI, Yusuf, Nabhan Husein', 'Pelaku Dakwah, Samsoe B', 'Agama, Ilmu Sosial & Politik', 1),
    ('Teka-Teki Rumah Aneh', 'Pramestiningtyas, Eri, Uketsu', 'FIKSI, misteri, Novel Jepang, Sastra', 'Fiksi Genre Spesifik, Sastra & Puisi', 1),
    ('A Diary Of Genocide: Catatan Pembantaian Palestina', 'Saif, Atef Abu', 'Diary, Genocide, Palestine', 'Sejarah & Biografi, Ilmu Sosial & Politik, Nonfiksi Naratif', 1),
    ('Mindfulness Based Business: Berbisnis Dengan Hati', 'AWS, Sudhamek', 'Bisnis, Ekonomi, Sukses Pribadi dalam Bisnis', 'Bisnis & Manajemen, Ekonomi, Pengembangan Diri', 1),
    ('Dari Masjid Kita Belajar', 'ISLAM, Direktorat Jendral Bimbingan Masyarakat', 'Masjid, sejarah masjid', 'Agama, Sejarah & Biografi', 1),
    ('Fikih Mu''amalah Maliyyah; Akad Jual-Beli', 'Hasanudin, Iqbal Triadi Nugraha, MUBAROK, Jaih', 'Muamalat, Muamalah', 'Ekonomi, Agama', 1),
    ('Syekh Ahmad Khatib al-Minangkabawi: Guru Para Ulama Indonesia', 'JASMI, Khairul', 'Biografi, Biografi - Guru, Biografi Tokoh Agama, Ulama', 'Sejarah & Biografi, Agama', 1),
    ('The Chronicles Of Ghazi; Seri ke 3', 'ISA, Muhammad Sayf., SIAUW, Felix Y.', 'FIKSI, Novel, Remaja, Sejarah Islam, Sejarah Islam pada Zaman Nabi Muhammad SAW', 'Fiksi Sejarah, Agama', 1),
    ('The Chronicles Of Ghazi;seri ke 4', 'ISA, Muhammad Sayf., SIAUW, Felix Y.', 'FIKSI, Novel, Sejarah Islam, Sejarah Islam zaman Nabi', 'Fiksi Sejarah, Agama', 1),
    ('The Chronicles Of Ghazi; Seri ke 5', 'ISA, Muhammad Sayf., SIAUW, Felix Y.', 'Fiksi Indonesia, Novel Indonesia, Sejarah Islam zaman Nabi', 'Fiksi Sejarah, Agama', 1),
    ('The Chronicles Of Ghazi; Seri ke 6', 'ISA, Muhammad Sayf., SIAUW, Felix Y.', 'FIKSI, Novel Indonesia, Sejarah Islam zaman Nabi', 'Fiksi Sejarah, Agama', 1),
    ('Tuan Direktur', 'Hamka, Buya', 'Buya Hamka, Fiksi Indonesia, Fiksi Indonesia, Prosa Indonesia, Novel, Novel Indonesia', 'Fiksi Kontemporer & Klasik, Sejarah & Biografi', 1),
    ('Ibunda Para Pengubah Wajah Dunia', 'Abdul Jawwad, Ahmad Al-Jauhari, Tim Zaduna, Ummu Kaltsum', 'Biografi Tokoh Khusus Wanita, Kisah Islam, kisah teladan keluarga Nabi, Parenting Skill, Pendidikan Agama Islam, Pengasuhan Anak - Islam, syahabiyah', 'Sejarah & Biografi, Agama, Pengembangan Diri', 1),
    ('Daily Raicoret: Move Up!', 'Hibban, Syuraih', 'Akhlak, Islam, Komik, muslim', 'Agama, Seni', 1),
    ('Antara Jawa dan Eropa', 'Aisyah, Norma, Mulyanto, Dodit', 'Anekdot, Humor, Indonesian Fiction/Fiksi Indonesia, Prosa Indonesi, Komik', 'Fiksi Kontemporer & Klasik, Seni', 1),
    ('Sejarah Bangsa Israel dalam Bibel dan Al-Qur''an', 'AL-DARGAZELLI, shetha, FATOOHI, Louay.', 'Al qur''an,  kisah, Bani israil, Israel, sejarah', 'Sejarah & Biografi, Agama', 1),
    ('Menerapkan Multiple Intelligences di Sekolah', 'ARMSTRONG, Thomas.', 'Kecerdasan, Sekolah', 'Ilmu Sosial & Politik, Pengembangan Diri, Psikologi & Kesehatan Mental', 1),
    ('Sang Biru yang Membanggakan', 'Muhammad, Ibtihaj', 'Bacaan Anak', 'Fiksi Kontemporer & Klasik, Ilmu Sosial & Politik', 1),
    ('Tafsir Salman : Tafsir Ilmiah Juz Amma', 'Tim Tafsir Ilmiah salman ITB', 'Samsoe B, Tafsir Al-Quran', 'Agama', 1),
    ('Ulum Al Quran', 'MARZUKI Kamaluddin', 'Ilmu-ilmu Al-Qur''an', 'Agama', 1),
    ('Kambing dan Hujan', 'IKHWAN, mahfud', 'Novel Indonesia', 'Fiksi Kontemporer & Klasik', 1),
    ('Bicaralah, Sami!', 'Aldacher, Mariam, Cadir, Nasir, Fitrihasanah, Hussain, Shabana', 'anak, Bully, Cerita anak, Cerita Bergambar, Inklusi, Keberagaman, Keberanian, Ketidakadilan, Persahabatan, Perundungan, ras', 'Ilmu Sosial & Politik, Fiksi Kontemporer & Klasik', 1),
    ('Kuliah Tauhid', 'ABDULRAHIM, M. Imaduddin.', 'Samsoe B, Tauhid', 'Agama', 1),
    ('Perubahan Mendasar Pemikiran Sayyid Qutub', 'AT-THARABLUSI, Abdullah, M. Ihsan Abdul Djalil, Mohammad Maghfur Abdul Wachid, Rakhmat S. Labib', 'Islam dan filsafat, Samsoe B', 'Filsafat & Etika, Agama', 1),
    ('NGI, April 2018', 'NGI', 'Majalah', 'Nonfiksi Naratif', 1),
    ('Seri Mengapa Al-Quran Menakjubkan: Rahasia Jari Jemari', 'G.K, Tasaro.', 'anak, buku, Islam, Kisah Al-Quran', 'Agama, Sejarah & Biografi', 1),
    ('Sedekah Super Stories', 'ASSAD, Muhammad', 'Shadaqah', 'Agama, Ekonomi', 1),
    ('Puasa Tapi Keliru : Kesalahan-Kesalahan Yang sering Terjadi Saat Puasa Ramadhan , tapi Anda Tidak Merasa', 'SADHAN , Abdul Aziz, Umar Mujtahid', 'Puasa Wajib, Samsoe B', 'Agama', 1),
    ('Masuk Surga Tanpa Hisab', 'BALIH, Abdul Nashir.', 'Surga, Neraka', 'Agama', 1),
    ('Prophetic Parenting Cara Nabi SAW Mendidik Anak', 'Farid Abdul Aziz Quruzy, SUWAID, M. Nur Abdul Hafizh.', 'pendidikan Islam', 'Agama, Ilmu Sosial & Politik', 1),
    ('Professional Quotient', 'NUGRAHA, Ali.', 'Psikologi', 'Psikologi & Kesehatan Mental', 1),
    ('Bercinta dengan Allah', 'JAUZIYAH, Ibn al-Qayyim al.', 'Iman Kepada Allah SWT, Tauhid', 'Agama', 1),
    ('Quantum Thinker; Melatih Otak Berpikir Efektif & Kreatif', 'DEPORTER, Bobbi.', 'Kecerdasan', 'Psikologi & Kesehatan Mental, Ilmu Pengetahuan Alam & Teknologi', 1),
    ('Quantum Reading', 'HERNOWO, MLC', 'Minat Baca', 'Sastra & Puisi, Pengembangan Diri', 1),
    ('Jangan ke Dokter Lagi!', 'AZHAR, Tauhid Nur., TRIM, Bambang.', 'Kesehatan', 'Ilmu Pengetahuan Alam & Teknologi, Psikologi & Kesehatan Mental', 1),
    ('Rich Mom Poor Mom; Sosok Ibu Kaya MAteri Kaya Hati', 'AZISYA, Syasya.', 'Psikologi', 'Psikologi & Kesehatan Mental', 1),
    ('Al-Hikam Al-Nabawiyyah', 'ABBAS Samih, ABBAS, Samih., Yusri Amru Ghazali', 'Kumpulan Hadits - Hikmah', 'Agama, Filsafat & Etika', 1),
    ('Menuju Negeri Keabadian', 'ADNANI, Abu Fatiah, Ar-Risalah', 'Hari Akhir', 'Agama', 1),
    ('Buku Pintar Calon Penghuni Surga', 'FAQIH, Khozin Abu.', 'Surga', 'Agama', 1),
    ('Paradigma Qur''ani; Rangkaian Ayat-ayat Suci al-Qur''an 1', 'SUMAWIJAYA, Amin.', 'Samsoe B', 'Agama', 1),
    ('Paradigma Qur''ani; Rangkaian Ayat-ayat Suci al-Qur''an 2', 'SUMAWIJAYA, Amin.', 'Samsoe B', 'Agama', 1),
    ('Hafal al-Qur''an Mutqin dalam 55 Hari Metode NLP (Neuro Linguistic Programming)', 'ALGHOUTSANI, Yahya bin Abdurrazzaq., AZIZ, Saiful.', 'Neuro Linguistic', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 1),
    ('Hadits Qudsi yang Shahih dan Penjelasannya', 'Ali bin Sulthan Muhammad al-Qoriy, M. Thalib, NURUDDIN, Abi al-Hasan.', 'Hadits Shahih, Samsoe B', 'Agama', 1),
    ('Alquran: Buku yang Menyesatkan dan Buku yang Mencerahkan', 'HARYONO, Rudy.', 'al-Qur''an, Kritik dan Komentar Mengenai Al-quran, Samsoe B', 'Agama', 1),
    ('Jantung Al-Quran : Tafsir Surat Yasin', 'HAIRI, Fadhlullah, Nur Hidayah', 'Samsoe B, Tafsir Al-Quran', 'Agama', 1),
    ('Balita pun Hafal Al-Qur''an: Kisah Inspiratif Para Bocah, Lansia, dan Orang-orang Luar Biasa Penghafal Al-Qur''an', 'Sayyid, Salafudin Abu', 'al-Qur''an - Hafalan, Mukjizat al qur''an', 'Agama', 1),
    ('Tafsir Populer Al-Fatihah', 'ALCAFF, muhammad', 'Tafsir Al-Quran', 'Agama', 1),
    ('Biografi Imam Ahmad Bin Hambal: kehidupan, sikap dan pendapat', 'ASY-SYINAWI, abdul aziz', 'Hanabaliah, Imam Ahmad Bin Hambal', 'Sejarah & Biografi, Agama', 1),
    ('Detik-detik Penuh Makna', 'MALIK, Abdul Al-Qasim', 'Akhlak', 'Agama, Filsafat & Etika', 1),
    ('Rahasia Surah Yasin', 'RAHMAT, Asep', 'Surah Yasin', 'Agama', 1),
    ('Muslim Zaman Now: 30 Hari Hafal Al-Qur''an Metode At Taisir', 'HIDAYAT, Adi', 'Ilmu-ilmu Al-Qur''an', 'Agama', 1),
    ('Janji-janji Kemenangan dalam Al-Qur''an', 'Alkhalidi, Salah aabdul Fattah Al-Khalidi', 'al-Qur''an, Janji Allah', 'Agama', 1),
    ('Seribu Cerita Berjuta Makna darimu Uje', 'HABIBAH, M.', 'Biografi - Tokoh Agama Islam', 'Sejarah & Biografi, Agama', 1),
    ('Ihya Ulumuddin; Tobat, Sabar, Syukur', 'GHAZALI, Imam al.', 'Akhlaq dan Tasawuf', 'Agama, Filsafat & Etika', 1),
    ('Mengenal Wayang', 'KRESNA, Ardian.', 'Puppetry Show/Pertunjukan Wayang Kulit', 'Seni, Ilmu Sosial & Politik', 1),
    ('Dinamika Sejarah Umat Islam Indonesia', 'KUNTOWIJOYO', 'Sejarah Islam di Indonesia', 'Sejarah & Biografi, Agama', 1),
    ('Kudeta 1 Oktober 1965; Sebuah Studi tentang Konspirasi', 'FIC, Victor M.', 'Sejarah Indonesia Sejarah Indonesia 1960 - 1969', 'Sejarah & Biografi', 1),
    ('Wanita di dalam Islam', 'MERNISSI, Fatima., Pustaka', 'Wanita dalam Pandangan Islam, Wanita Islam', 'Agama, Ilmu Sosial & Politik', 1),
    ('Aku Menggugat, Maka Aku Kian Beriman', 'LANG, Jeffrey.', 'HUbungan Antara Allah dengan Makhluk, Iman Kepada Allah SWT, Alloh SWT', 'Agama, Filsafat & Etika', 1),
    ('Sedjarah dan Perdjuangan 40 Pahlawan Utama dalam Islam', 'ASH SHIDDIEQY, M. Hasbi', 'Sejarah Islam', 'Sejarah & Biografi, Agama', 1),
    ('15 Wisdom Success Classsical Motivation Stories', 'WONGSO, Andrie.', 'Motivasi', 'Pengembangan Diri', 1),
    ('Nuruddin Zanki & Perang Salib', 'ALATAS, Alwi.', 'Sejarah Islam - Zaman Daulah Lainnya', 'Sejarah & Biografi, Agama', 1),
    ('Sam Kok; Kisah Tiga Kerajaan', 'ANGKAWIJAYA, Yongkie.', 'Samsoe B', 'Agama', 1),
    ('The Moon Stone', 'COLLINS, Wilkie, Dewi Fita, Gema Mawardi', 'Fiksi Inggris', 'Fiksi Kontemporer & Klasik', 1),
    ('Kita dan Kami', 'HASSAN, Fuad.', 'Filsafat', 'Filsafat & Etika', 1),
    ('Buku Pintar Kedokteran Nabi SAW', 'FIRLY, Abu., JAUZIYAH, Ibn al-Qayyim al.', 'Islam dan Kedokteran', 'Agama, Ilmu Pengetahuan Alam & Teknologi', 1),
    ('Power Sales', 'MULIA, Elvie', 'Sukses Pribadi dalam Bisnis', 'Bisnis & Manajemen, Pengembangan Diri', 1),
    ('Penjungkirbalikan Dunia Islam', 'Pustaka, SAID, Edward W.', 'Islam, Sosial dan Budaya Islam', 'Agama, Ilmu Sosial & Politik', 1),
    ('Membendung Arus; Respons GErakan Muhammadiyyah Terhadap Penetrasi Misi Kristen di Indonesia', 'SHIHAB, Alwi.', 'Muhammadiyah', 'Agama, Ilmu Sosial & Politik, Sejarah & Biografi', 1),
    ('Pesan untuk Anakku', 'TEO, Jimmy.', 'Hubungan Individu dengan Anggota Keluarga', 'Ilmu Sosial & Politik, Psikologi & Kesehatan Mental', 1),
    ('Doa Ajaran Ilahi', 'MUSFAH, Jejen.', 'Doa dan Zikir, Samsoe B', 'Agama', 1),
    ('Gerimis di El Tari', 'SUMINAR, Erna', 'Fiksi Indonesia', 'Fiksi Kontemporer & Klasik', 1),
    ('Wanita-wanita Sufi', 'NURBAKHSH, Javad.', 'Akhlaq dan Tasawuf', 'Agama, Filsafat & Etika', 1),
    ('Marketing Plus 3', 'KARTAJAYA, Hermawan.', 'marketing', 'Bisnis & Manajemen, Ekonomi', 1),
    ('SEPIA; Kecerdasan Milyuner', 'UMMAH, Khairul. dkk', 'Bisnis', 'Bisnis & Manajemen', 1),
    ('Fiqih Ibadah', 'Baihaqi', 'Ibadah, Samsoe B', 'Agama', 1),
    ('Secercah Cahaya Ilahi; Hidup Bersama al-Quran', 'SHIHAB, M. Quraish.', 'al-Qur''an, Quraish Shihab', 'Agama, Sejarah & Biografi', 1),
    ('Ujar-ujar Syaikh Abdul Qadir Jailani', 'JAILANI, Abdul Qadir al.', 'Akhlaq dan Tasawuf', 'Agama, Filsafat & Etika', 1),
    ('Fiqih Nawazil: Standar Berfiqih dalam Perbedaan Fatwa', 'MAFTUHIN, Adhi', 'Fikih, Fiqih, Fiqh, Hukum Islam', 'Agama, Ilmu Sosial & Politik', 1),
    ('Islam dan Adab Seksual', 'BUKHORI', 'Adab, Samsoe B', 'Agama, Filsafat & Etika', 1),
    ('Waktu Pesta; Pestanya Para Penulis!', 'PRANANDA, Dodi. dkk', 'Sastra', 'Sastra & Puisi', 1),
    ('Kisah-Kisah Shahih Dalam Sunnah Nabi', 'SALIM, Thal''at Muhammad ''Afifi', 'Cerita-cerita Hadits', 'Agama, Sejarah & Biografi', 1),
    ('Masyarakat al-ikhwan al-Muslimun', 'MITCHELL, Richard P.', 'Pergerakan Islam', 'Agama, Ilmu Sosial & Politik, Sejarah & Biografi', 1),
    ('Meretas Jalan Kebangkitan Islam; Peta Pemikiran Hasan al-Banna', 'GHAZALI, Abdul Hamid al.', 'Akhlaq dan Tasawuf', 'Agama, Filsafat & Etika', 1),
    ('El Filibusterismo', 'RIZAL, Jose.', 'Novel, pahlawan', 'Fiksi Kontemporer & Klasik, Sejarah & Biografi', 1),
    ('Mutiara Ihya Ulumuddin', 'GHAZALI, al, Irwan Kurniawan, Tholib Anis', 'Akhlak dan Tasawuf, Samsoe B', 'Agama, Filsafat & Etika', 1),
    ('Wanita Islam Korban Patologi Sosial', 'KHAN, Mazhar ul-Haq., Pustaka', 'Wanita, Wanita Islam', 'Ilmu Sosial & Politik, Agama', 1),
    ('Kata Yesus Tentang Babi', 'MUNIR, Sanihu.', 'Kristen, Samsoe B', 'Agama', 1),
    ('Mencari Sosok Manusia Sunda', 'ROSIDI, Ajip.', 'Esai Indonesia', 'Nonfiksi Naratif, Sastra & Puisi', 1),
    ('Pendiri dan pemimpin dewan Da''wah islamiyah indonesia', 'HAKIEM, Lukman.', 'Organisasi Islam', 'Agama, Ilmu Sosial & Politik', 1),
    ('Elemen-elemen Semiologi', 'BARTHES, Roland., M. Ardiansyah.', 'Semiotik', 'Filsafat & Etika, Sastra & Puisi', 1),
    ('Guruku Orang Orang dari Pesantren', 'ZUHRI, Saifuddin.', 'pondok pesantren', 'Agama, Ilmu Sosial & Politik', 1),
    ('Komunikasi Lingkungan', 'KADARISMAN, Ade., Nunik Siti Nurbaya', 'Permasalahan Lingkungan', 'Ilmu Pengetahuan Alam & Teknologi, Ilmu Sosial & Politik', 1),
    ('Insomnia', 'KURNIA, Anton.', 'Fiksi Indonesia, Prosa Indonesia', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 1),
    ('"Pembaruan" Islam dan Orientalisme dalam Sorotan', 'RASYID, Daud.', 'Pembaharuan Pemikiran Islam', 'Agama, Filsafat & Etika', 1),
    ('Tiada Sufi Tanpa Humor', 'RAHMAN, Imam Jamal.', 'Tasawuf', 'Agama, Filsafat & Etika', 1),
    ('Ther Melian; Discord', 'SHIENNY, M.S.', 'Novel', 'Fiksi Kontemporer & Klasik', 1),
    ('Jangan Takut; Jagalah Allah, Allah Akan Menjaga Anda', 'QARNI, Aidh bin Abdullah al.', 'Akhlaq dan Tasawuf', 'Agama, Filsafat & Etika', 1),
    ('Identitas dan Kenikmatan: Politik Budaya Layar Indonesia', 'HERYANTO, ariel', 'budaya politik', 'Ilmu Sosial & Politik', 1),
    ('The Secret; Mengungkap Segala Rahasia Hidup', 'ANEES, Bambang Q.', 'Akhlaq dan Tasawuf', 'Agama, Filsafat & Etika', 1),
    ('Al-Hadits Sebagai Sumber Hukum', 'ASSIBAI , Mushtafa, Djafar Abd Muchith', 'Hadits, Samsoe B', 'Agama', 1),
    ('Shalat dalam Mazhab Ahlul Bait: Kajian ilmiah dari Qur''an, Hadis, dan Fatwa', 'Abdullah Beik, AL-HABSYI, Hidayatullah Husein, Firdaus', 'Samsoe B, Shalat', 'Agama', 1),
    ('Tema-tema Pokok Nahj al-Balaghah', 'arif mulyadi, MUTHAHHARI, Murtadha', 'Samsoe B, syiah', 'Agama', 1),
    ('Stroke Hanya Menyerang Orang Tua?', 'WAHYU, Genis Ginanjar.', 'Penyakit pada Pembuluh yang Membawa Darah ke Otak', 'Ilmu Pengetahuan Alam & Teknologi, Psikologi & Kesehatan Mental', 1),
    ('The Amazing Stories of al-Quran; Sejarah yang Harus Dibaca', 'ABDURRAHMAN, Emsoe.', 'al-Quran', 'Agama', 1),
    ('Berinteraksi dengan al-Qur''an', 'QARDHAWI, Yusuf.', 'al-Quran, Samsoe B', 'Agama', 1),
    ('Keakhwatan 3', 'TAKARIAWAN, Cahyadi.', 'Pernikahan', 'Ilmu Sosial & Politik, Agama', 1),
    ('Didiklah Anakmu ala Rasulullah', 'AHMAD, Ukasyah Habibu.', 'pendidikan Islam', 'Agama, Ilmu Sosial & Politik', 1),
    ('In God We Trust; Merentang Hijab dari Indonesia sampai Amerika', 'ARYANI, Ranti.', 'Autobiografi', 'Sejarah & Biografi, Nonfiksi Naratif', 1),
    ('Membangun Sistem Ekonomi Alternatif; prespektif islam', 'AN-NABHANI, taqiyuddin', 'Ekonomi Islam', 'Ekonomi, Agama', 1),
    ('Mukjizat al-Quran dan As-Sunnah tentang Iptek', '[et.al], ALZINDANI, Abdul Majid bin Aziz, Iwan Kusuma Hamdan', 'islam dan bidang lain', 'Agama, Ilmu Sosial & Politik', 1),
    ('Benabook', 'RIZKI, Benazio.', 'Komedi', 'Fiksi Kontemporer & Klasik, Seni', 1),
    ('Methode Khusus Membaca Al-Qur''an', 'CHADZIQ Ch., Moh., Mukmin Muhsin', 'Samsoe B, Tajwid', 'Agama', 1),
    ('Oh my goodness!: buku pintar seorang creative junkies', 'SEBASTIAN, yoris', 'kreativitas', 'Pengembangan Diri, Seni', 1),
    ('Seni Kaligrafi Islam', 'SIROJUDDIN', 'Seni Rupa Islam', 'Seni, Agama', 1),
    ('Berkisah Tentang Nabi Mihammad SAW', 'HAMKA', 'Sejarah Islam, sejarah nabi', 'Sejarah & Biografi, Agama', 1),
    ('Komik Kisah-kisah dalam Al-Qur''an', 'Adi, Pratama, Ahmad, Amalina, Nurul, Arsyad, Riza, Artlus, Fathurrindho, M., Ghufron, Ali, Haikal, Yusuf, Hamidawati, Rachmi, Nisak, Choirun, Pa''enony, Qasim, Jamal, Ruang Berwarna, Salsabila, Hanin, Sarwoko', 'al-Quran, anak, Cerita, Komik', 'Agama, Seni', 1),
    ('Jalan-jalan ke Pegunungan', 'Anis, Frida, Kurniawati, Dwi, Mou, Shopie, Putri, Jemima Jannah Darla, Satya, Angger, Yahuan, Yuan, Yujun, Xie', 'Cerita anak, Cerita Bergambar', 'Fiksi Kontemporer & Klasik, Seni', 1),
    ('Brem, Breeem Roda yang Hilang', 'Yulia, Ade', 'anak, Cerita Bergambar, Transportasi', 'Fiksi Kontemporer & Klasik, Seni', 1),
    ('Serba-serbi Al-Qur''an', 'Dwipayana, Mantox Team, Setiawan, Hendri, Tim Penerbit, Wardhana, Eka', 'Cerita anak, Cerita Bergambar, Kisah Al-Quran, Tafsir Al-Quran', 'Agama, Seni', 1),
    ('Seri 7 - Tetangga Rasulullah SAW. di Surga: Kisah Said bin Zaid dan Abu Ubaidah', 'Ahmad, Herlan, Arramly, Syamsu, Berry, Halfino, Budiman, Agus, Ginanjar, Anjar, Komaruzzaman, Erik, Kurnia, Rohmat, Kusuma, Koko Nata, Mantok, Maman, Muakhir, Ali, Nursidiq, M. Yusuf, Prasetyo, Aries, Puwi, Ferry, Raup, Abdul, Setio, Siswo, Umam, Mamang C., Wahab, Abdul, Yulianty, Rani', 'Cerita anak, Cerita Bergambar, Kisah Sahabat, Kisah Teladan, Sahabat Nabi Muhammad SAW', 'Agama, Sejarah & Biografi, Seni', 1),
    ('Seri 9 - Para Pemburu Surga', 'Ahmad, Herlan, Arramly, Syamsu, Berry, Halfino, Dinuri, Syahlan, Fawwaz, Abu, Ginanjar, Anjar, Komaruzzaman, Erik, Kurnia, Rohmat, Kusuma, Koko Nata, Muakhir, Ali, Nursidiq, M. Yusuf, Prasetyo, Aries, Puwi, Ferry, Raup, Abdul, Setio, Siswo, Tim Syaamil Books, Wahab, Abdul, Yulianty, Rani', 'Cerita anak, Cerita Bergambar, Kisah Sahabat, Sahabat Nabi Muhammad SAW', 'Agama, Sejarah & Biografi, Seni', 1),
    ('Seri 10 - Para Perindu Syahid', 'Ahmad, Herlan, Arramly, Syamsu, Berry, Halfino, Fawwaz, Abu, Ginanjar, Anjar, Komaruzzaman, Erik, Kurnia, Rohmat, Kurniawan, Heindry, Kusuma, Koko Nata, Muakhir, Ali, Nursidiq, M. Yusuf, Prasetyo, Aries, Puwi, Ferry, Raup, Abdul, Setio, Siswo, Tim Syaamil Books, Umam, Mamang C., Wahab, Abdul, Yulianty, Rani', 'Cerita anak, Cerita Bergambar, Kisah Sahabat, Sahabat Nabi Muhammad SAW', 'Agama, Sejarah & Biografi, Seni', 1),
    ('Segala Sesuatu tentang Alam Semesta', 'Riski, Azzurrino', 'Bacaan Anak, Islam dan Sains', 'Ilmu Pengetahuan Alam & Teknologi, Agama', 1),
    ('Si Putih Menghilang', 'Supriyanto', 'Bacaan Anak', 'Fiksi Kontemporer & Klasik', 1),
    ('Cara Cerdas Nabi; Mengoreksi Kesalahan Orang Lain', 'MUNAJJID, Muhammad Saleh.', 'Akhlaq dan Tasawuf', 'Agama, Filsafat & Etika', 1),
    ('Rumahku Tempat Belajarku', 'Irin Hidayati, ISTADI, Irawati.', 'Pendidikan', 'Ilmu Sosial & Politik, Pengembangan Diri', 1),
    ('Antara Fakta dan Khayal Tuanku Rao', 'HAMKA', 'Sejarah Indonesia', 'Sejarah & Biografi', 1),
    ('JavaScript', 'KURNIADI, Adi.', 'Bahasa Pemrograman, Komputer', 'Ilmu Pengetahuan Alam & Teknologi', 1),
    ('Untaian Jejak Emas', 'ABDURRAHMAN, Emsoe.', 'Sejarah dan Geografi', 'Sejarah & Biografi', 1),
    ('The Concept of Education in Islam', 'ATTAS, M. al-Naquib al-.', 'pendidikan Islam', 'Agama, Ilmu Sosial & Politik', 1),
    ('Manusia dan Agama', 'MUTAHHARI, Murtadha., RAHMAT, Jalaluddin.', 'al-Qur''an, Perspektif Al-Qur''an', 'Agama, Filsafat & Etika', 1),
    ('Hikmatut Tasyri''; Menyingkap Hikmah di Balik Perintah Ibadah', 'JURJAWI, Ali Ahmad., Toyib Arifin', 'Fikih - Ibadah', 'Agama', 1),
    ('Sajarah Wali; Syekh Syarif Hidayatullah Sunan Gunung Jati', 'Pustaka, WAHJU, Amman N.', 'Pustaka', 'Nonfiksi Naratif, Sastra & Puisi', 1),
    ('Pelajaran Kaligrafi Islam', 'SUDJA'', Mizany', 'Kesenian Islam, Kebudayaan Islam, Seni Islam, Buda, Samsoe B', 'Seni, Agama, Ilmu Sosial & Politik', 1),
    ('Majelis Ramadhan', 'As''ad Yasin, Subhan, UTSAIMIN, Syekh Muhammad bin Shalih', 'Puasa Wajib, Samsoe B', 'Agama', 1),
    ('Ngaji Quran di Zaman Edan', 'SARDAR, Ziauddin.', 'Ngaji Qur''an, Zaman Edan', 'Agama, Ilmu Sosial & Politik', 1),
    ('Manusia Menurut al-Ghazali', 'OTHMAN, Ali Issa., Pustaka', 'Antropologi, Filsafat Manusia, Imam Ghazali', 'Filsafat & Etika, Ilmu Sosial & Politik, Sejarah & Biografi', 1),
    ('Al-Ghazali: Sang Sufi Sang Filosof', 'Pustaka, ZAQZUQ, Mahmud Hamdi.', 'Sufi', 'Agama, Filsafat & Etika', 1),
    ('Tuhan Menurut al-Quran', 'BEHESHTI, Muhammad Husayni.', 'Akidah, FIlsafat Al-Qur''an, Ilmu al-Qur''an', 'Agama, Filsafat & Etika', 1),
    ('Menyingkap Mukjizat Shalat Dhuha', 'MAKHDLORI, Muhammad.', 'Salat Dhuha', 'Agama', 1),
    ('Sukses Bermodal Kegagalan', 'KHAN, Maulana Wahiddin.', 'Akhlak', 'Agama, Filsafat & Etika', 1),
    ('Duka Hati Duka Ilahi', 'GHAZALI, Abu Hamid Muhammad.', 'Akhlaq dan Tasawuf', 'Agama, Filsafat & Etika', 1),
    ('365 Tips Sehat ala Rasulullah', 'ASSEGAF, Mohammad Ali Toha.', 'Islam dan Kedokteran', 'Agama, Ilmu Pengetahuan Alam & Teknologi', 1),
    ('Dari Alam Barzakh Menuju Padang Mahsyar', 'Abu Fatiah Aladnani, MAJDI, Muhib al.', 'Alam Barzah, Alam Kubur', 'Agama', 1),
    ('Samudera Al-Qur''an', 'ANWAR, Rosihon.', 'Samsoe B', 'Agama', 1),
    ('25 Kiat Mempengaruhi Jiwa dan Akal Anak', 'Dadi M.H. Basri, DIMAS, Muhammad Rasyid, Intan Irawati, Sari Narulita', 'Akhlak dan Tasawuf', 'Agama, Filsafat & Etika', 1),
    ('Saat Hidayah Menyapa', 'ANUZ, Fariq Gasim.', 'Aqidah', 'Agama, Filsafat & Etika', 1),
    ('Kaum muda menatap masa depan', 'SYAMSUDDIN, aziz', 'pemuda', 'Ilmu Sosial & Politik, Pengembangan Diri', 1),
    ('Revolusi Mental Dalam Praktik Soft Skill', 'Tim Gibasa Consultant, ZAMAN, Saeful', 'Pendidikan - Alternatif', 'Ilmu Sosial & Politik, Pengembangan Diri', 1),
    ('Kisah Teladan dalam Al-Qur''an', 'ATH-THAHIR, Hamid Ahmad', 'Cerita dan Kisah dari Al-Qur''an', 'Agama, Sejarah & Biografi', 1),
    ('Motivaksi Metanoiac', 'WIDJAJAKUSUMA, Muhammad Karebet', 'Akhlak, Akhlaq', 'Agama, Filsafat & Etika', 1),
    ('Tawhid; Its Implications for Thought and Life', 'FARUQI, Ismail Raji al.', 'Tauhid', 'Agama', 1),
    ('Prophetic Learning', 'BUDIYANTO, Dwi.', 'pendidikan Islam', 'Agama, Ilmu Sosial & Politik', 1),
    ('Al-Quran Ilmu Kedokteran Jiwa dan Kesehatan Jiwa', 'HAWARI, Dadang.', 'Kandungan Al-Qur''an', 'Agama', 1),
    ('Filsafat Barat', 'HANAFI, A', 'Filsafat Umum, Samsoe B', 'Filsafat & Etika, Agama', 1),
    ('Pemasaran Strategis', 'SALIM, Lina.', 'Sales Management/Manajemen Pemasaran', 'Bisnis & Manajemen, Pengembangan Diri', 1),
    ('Rupa-rupa Upacara Adat Sunda Jaman Ayeuna', 'HASIM, Moh.E., Pustaka', 'Adat Istiadat Setempat', 'Ilmu Sosial & Politik, Sejarah & Biografi', 1),
    ('Sirrul Asrar; Hakikat Segala Rahasia Kehidupan', 'JAILANI, Abdul Qadir al.', 'Akhlaq dan Tasawuf', 'Agama, Filsafat & Etika', 1),
    ('Tanbihul ''Mughtarrin; Peringatan bagi Orang Yang Terbuai', 'SYA\''RANI, Abdul Wahab asy.', 'Akhlaq dan Tasawuf', 'Agama, Filsafat & Etika', 1),
    ('mengenal dan mewaspadai syi''ah di indonesia', 'Majelis Ulama Indonesia (MUI)', 'syiah', 'Agama', 1),
    ('Sebelum Janji Terucap', 'GINANJAR, Adriana S.', 'Pernikahan', 'Ilmu Sosial & Politik, Agama', 1),
    ('Merayu Allah Menjemput Jodoh dalam 40 Hari', 'ZAENAL, M.', 'Perkawinan - Jodoh', 'Ilmu Sosial & Politik, Pengembangan Diri', 1),
    ('Masyarakat Religius', 'MADJID, Nurcholish.', 'Masyarakat Islam', 'Ilmu Sosial & Politik, Agama', 1),
    ('Kuasa Ramalan Jilid 1', 'CAREY, Peter., Parakitri T. Simbolon', 'Diponegoro, Sejarah Indonesia - Penjajahan Belanda', 'Sejarah & Biografi', 1),
    ('Citra Muslim : Tinjauan Sejarah dan Sosiologi', 'AHMED, Akbar S., Nunding Ram', 'Orang Islam, Samsoe B', 'Agama', 1),
    ('Rekonstruksi dan Renungan Religius Islam', 'Ahmad Purwadaksi, Azyumardi Azra, Budhy Munawar Rachman, Dawam Rahardjo, Hanna Djumhana Bastaman, Komaruddin Hidayat, M. Quraish Shihab, Muhamad Wahyuni Nafis, Nurcholish Madjid, RAKHMAT, Jalaluddin, Yusril Ihza Mahendra', 'Gerakan Pembaharuan Pemikiran dalam Islam, Samsoe B', 'Agama, Filsafat & Etika, Ilmu Sosial & Politik', 1),
    ('Bersama Ayah Meraih Jannah', 'IZZUDDIN, Solikhin Abu.', 'Keluarga Sakinah', 'Agama, Ilmu Sosial & Politik, Pengembangan Diri', 1),
    ('Adakah Tuhan?', 'HASSAN, A.', 'Aqaid, Aqidah, Akidah, Ilmu Kalam', 'Agama, Filsafat & Etika', 1),
    ('Menggagas Fiqih Astronomi', 'DJAMALUDDIN, T.', 'Fikih - Aspek Lainnya', 'Agama', 1),
    ('Tarjamah Bidayatul Mujtahid 1', 'ABDURRAHMAN, MA., RUSYD, Ibnu.', 'Fikih, Fiqih, Fiqh, Hukum Islam', 'Agama, Ilmu Sosial & Politik', 1),
    ('Maududi; Thought & Movement', 'GILANI, Syed Asad.', 'Biografi Pemuka Agama Islam, Biografi Tokoh-tokoh Pemuka Agama Islam', 'Sejarah & Biografi, Agama', 1),
    ('Metode dan Strategi Penerapan Syari''at Islam di Indonesia', 'ZAENUDIN, Jeje.', 'Syariat Islam', 'Agama, Ilmu Sosial & Politik', 1),
    ('Falsafah Kalam', 'WIJAYA , Teuku Safir Iskandar', 'Filsafat Islam, Samsoe B', 'Filsafat & Etika, Agama', 1),
    ('Guru Sepanjang waktu: menginspirasi tanpa menggurui', 'IZZUDDIN, Solikhin Abu.', 'Guru, Tenaga Pengajar', 'Ilmu Sosial & Politik, Pengembangan Diri', 1),
    ('Engineers of Happy Land; Perkembangan Teknologi dan Nasionalisme di Sebuah Koloni', 'Hermojo, MRAZEK, Rudolf.', 'Nasionalisme', 'Ilmu Sosial & Politik, Sejarah & Biografi', 1),
    ('Letters to A Young Poet', 'Rainer Maria Rilke', 'Poetry & Literary Criticism', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('Estetika Hitam', 'Goenawan Mohamad', 'Poetry & Literary Criticism', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('The Martha Mills Young Writers'' Prize 2023', 'Martha Mills', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Grit - Why Passion and Resilience are the Secrets to Success', 'Angela Duckworth', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Big Ideas Simply Explained: The Economics Book', 'Nial Kishtainy', 'Critiques on Capitalism', 'Ekonomi, Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('How The World Works', 'Noam Chomsky', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('How The World Works (Terj)', 'Noam Chomsky', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('And So Flows History', 'Hahn Moo-Sook', 'Korean Literature', 'Sastra & Puisi, Fiksi Kontemporer & Klasik', 2),
    ('Siapa yang Memasak Makan Malam Adam Smith?', 'Katrine Marcal', 'Feminism', 'Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('The Madness of Crowds: Gender, Race and Identity', 'Douglas Murray', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Big Ideas Simply Explained: The Philosophy Book', 'Will Buckingham', 'Philosophy', 'Filsafat & Etika', 2),
    ('Sapiens - Riwayat Singkat Umat Manusia', 'Yuval Noah Harari', 'History', 'Sejarah & Biografi', 2),
    ('Burung-Burung Manyar', 'Y.B. Mangunwijaya', 'Indonesian Literature', 'Sastra & Puisi, Fiksi Kontemporer & Klasik', 2),
    ('Kartun Riwayat Peradaban Jilid 1', 'Larry Gonick', 'History', 'Sejarah & Biografi', 2),
    ('Kartun Riwayat Peradaban Jilid 2', 'Larry Gonick', 'History', 'Sejarah & Biografi', 2),
    ('Kartun Riwayat Peradaban Jilid 3', 'Larry Gonick', 'History', 'Sejarah & Biografi', 2),
    ('Kartun Riwayat Peradaban Modern', 'Larry Gonick', 'History', 'Sejarah & Biografi', 2),
    ('Kartun Riwayat Peradaban Modern Jilid 2', 'Larry Gonick', 'History', 'Sejarah & Biografi', 2),
    ('Big Ideas Simply Explained: The Politics Book', 'Kate Johnsen', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('The Arabian Nights', 'Anonymous', 'World Literature', 'Sastra & Puisi, Fiksi Kontemporer & Klasik', 2),
    ('Mankind: The Story of All of Us', 'Pamela D. Toler', 'History', 'Sejarah & Biografi', 2),
    ('All Over Creation', 'Ruth Ozeki', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Candide', 'Voltaire', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Catatan Seorang Demonstran', 'Soe Hok Gie', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Temporary', 'hillary', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Joseon''s Royal Heritage - 500 Years of Splendor', 'Robert Koehler, Eugene Kim', 'Travel', 'Nonfiksi Naratif, Sejarah & Biografi', 2),
    ('23 Things They Don''t Tell You About Capitalism', 'Ha-Joon Chang', 'Critiques on Capitalism', 'Ekonomi, Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('Alia''s Dowry Books', 'Various Authors', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Macan - Cerpen Pilihan Kompas 2020', 'M. Hilmi Faiq', 'Indonesian Literature', 'Sastra & Puisi, Fiksi Kontemporer & Klasik', 2),
    ('The Fabric of Civilization - How Textiles Made the World', 'Virginia Postrel', 'History', 'Sejarah & Biografi', 2),
    ('Bintang Merah Menerangi Dunia Ketiga', 'Vijay Prashad', 'History', 'Sejarah & Biografi', 2),
    ('Small Pleasures', 'Clare Chambers', 'Historical Fiction', 'Fiksi Sejarah', 2),
    ('Beyond The Story: 10-Year Record of BTS', 'Myeongseok Kang', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('The Bell Jar', 'Sylvia Plath', 'Feminism', 'Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('Istanbul - A Tale of Three Cities', 'Bettany Hughes', 'History', 'Sejarah & Biografi', 2),
    ('Niccolo Machiavelli''s The Prince on The Art of Power', 'Niccolo Machiavelli', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Kenapa Masa Depan Kita Bergantung pada Perpustakaan, Membaca dan Melamun?', 'Neil Gaiman, et.al', 'Education', 'Ilmu Sosial & Politik, Pengembangan Diri', 2),
    ('Upheaval - Turning Points for Nations in Crisis', 'Jared Diamond', 'History', 'Sejarah & Biografi', 2),
    ('Wild Swans - Three Daughters of China', 'Jung Chang', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Utopia for Realists and How We Can Get There', 'Rutger Bregman', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Yap Thiam Hien: 100 Tahun Sang Pendekar Keadilan', 'Tim Buku TEMPO', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Jalan Pos Daendels', 'Tim Buku TEMPO', 'Colonialism', 'Sejarah & Biografi, Ilmu Sosial & Politik', 2),
    ('The Fashion Business Manual', 'Fashionary', 'Business', 'Bisnis & Manajemen, Ekonomi', 2),
    ('Lost in Work - Escaping Capitalism', 'Amelia Horgan', 'Critiques on Capitalism', 'Ekonomi, Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('Perang Demi Uang - Kebusukan Media, Politikus dan Pebisnis Perang', 'Amy Goodman, David Goodman', 'Critiques on Capitalism', 'Ekonomi, Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('Ekonomi Indonesia Dalam Lintasan Sejarah', 'Boediono', 'Critiques on Capitalism', 'Ekonomi, Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('Rantai Nilai - Wajah Baru Imperialisme Ekonomi', 'Intan Suwadi', 'Critiques on Capitalism', 'Ekonomi, Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('Kiri Asia Tenggara - Pembacaan Ulang atas Beberapa Tokoh dan Karya', 'Ramon Guillermo, et al', 'Politics & Sociology', 'Ekonomi, Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('You''re Paid What You''re Worth', 'Jake Rosenfeld', 'Critiques on Capitalism', 'Ilmu Sosial & Politik', 2),
    ('Confessions of An Economic Hit Man', 'John Perkins', 'Critiques on Capitalism', 'Ekonomi, Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('Doughnut Economics 7 Ways to Think Like a 21st Century Economist', 'Kate Raworth', 'Critiques on Capitalism', 'Ekonomi, Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('The Big Con - How The Consulting Industry Weakens Our Businesses, Infantilizes Our Governments and Warps Our Economies', 'Mariana Mazzzucato, Rosie Collington', 'Critiques on Capitalism', 'Ekonomi, Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('The Entrepreneurial State - Debunking Public vs Private Sector Myths', 'Mariana Mazzucato', 'Critiques on Capitalism', 'Ekonomi, Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('The Value of Everything - Making & Taking in The Global Economy', 'Mariana Mazzucato', 'Critiques on Capitalism', 'Ekonomi, Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('Realisme Kapitalis - Tidak Adakah Alternatif?', 'Mark Fisher', 'Critiques on Capitalism', 'Ekonomi, Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('Membangun Koperasi dan Koperasi Membangun - Gagasan & Pemikiran Hatta', 'Mohammad Hatta', 'Critiques on Capitalism', 'Ekonomi, Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('Keynes-Hayek - The Clash That Defined Modern Economics', 'Nicholas Wapshott', 'Critiques on Capitalism', 'Ekonomi, Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('Economics: The User''s Guide', 'Ha-Joon Chang', 'Critiques on Capitalism', 'Ekonomi, Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('A Critical History of Poverty Finance - Colonial Roots and Neoliberal Failures', 'Nick Bernards', 'Critiques on Capitalism', 'Ekonomi, Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('The Death of Homo Economicus', 'Peter Fleming', 'Critiques on Capitalism', 'Ekonomi, Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('Koperasi Lawan Tanding Kapitalisme', 'Suroto', 'Critiques on Capitalism', 'Ekonomi, Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('The Will to Improve; Perencanaan, Kekuasaan, dan Pembangunan di Indonesia', 'Tania Murray Li', 'Critiques on Capitalism', 'Ekonomi, Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('The Anticapitalist Book of Fashion', 'Tansy E. Hoskins', 'Critiques on Capitalism', 'Ekonomi, Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('Capital in the Twenty-First Century', 'Thomas Piketty', 'Critiques on Capitalism', 'Ekonomi, Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('Kerja atau Dikerjain? Jalan Keluar dari Hidup yang Habis untuk Bekerja', 'William Morris', 'Critiques on Capitalism', 'Ekonomi, Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('Making Mondragon - The Growth and Dynamics of The Worker Cooperative Complex', 'William Foote Whyte, Kathleen King Whyte', 'Critiques on Capitalism', 'Ekonomi, Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('Talking to My Daughter - A Brief History of Capitalism', 'Yanis Varoufakis', 'Critiques on Capitalism', 'Ekonomi, Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('The Tyranny of Experts', 'William Easterly', 'Critiques on Capitalism', 'Ekonomi, Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('Ommelanden', 'Bondan Kanumoyoso', 'History', 'Ekonomi, Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('Nusantara', 'Bernard H. M. Vlekke', 'History', 'Sejarah & Biografi', 2),
    ('Rijsttafel - Budaya Kuliner di Indonesia Masa Kolonial 1870-1942', 'Fadly Rahman', 'History', 'Sejarah & Biografi', 2),
    ('Batavia', 'Frieda Amran', 'History', 'Sejarah & Biografi', 2),
    ('Kisah Para Preanger Planters', 'Her Suganda', 'History', 'Sejarah & Biografi', 2),
    ('Perkotaan, Masalah Sosial & Perburuhan di Jawa Masa Kolonial', 'John Ingleson', 'Colonialism', 'Sejarah & Biografi', 2),
    ('Hindia Belanda 1930', 'J. Stromberg', 'History', 'Sejarah & Biografi, Ilmu Sosial & Politik', 2),
    ('Max Havelaar', 'Multatuli', 'Colonialism, Race, Class (Fict.)', 'Sejarah & Biografi', 2),
    ('Percakapan Dengan Diponegoro', 'Peter Carey', 'History', 'Fiksi Genre Spesifik, Ilmu Sosial & Politik, Sejarah & Biografi', 2),
    ('Perdagangan Lada Abad XVII', 'P. Swantoro', 'History', 'Sejarah & Biografi', 2),
    ('Jalan Raya Pos, Jalan Daendels', 'Pramoedya Ananta Toer', 'History', 'Sejarah & Biografi', 2),
    ('Orang-orang di Persimpangan Kiri Jalan: Kisah Pemberontakan Madiun September 1948', 'Soe Hok Gie', 'History', 'Sejarah & Biografi', 2),
    ('Orang-orang di Persimpangan Kiri Jalan: Kisah Pemberontakan Madiun September 1949', 'Soe Hok Gie', 'History', 'Sejarah & Biografi', 2),
    ('BOMB: Persaingan Demi Senjata Paling Mematikan di Dunia', 'Steve Sheinkin', 'History', 'Sejarah & Biografi', 2),
    ('Dari Puncak Bagdad; Sejarah Dunia Versi Islam', 'Tamim Ansary', 'History', 'Sejarah & Biografi', 2),
    ('Orang dan Partai Nazi di Indonesia', 'Wilson', 'History', 'Sejarah & Biografi', 2),
    ('Perang Eropa Jilid 1', 'P. K. Ojong', 'History', 'Sejarah & Biografi', 2),
    ('Perang Eropa Jilid 2', 'P. K. Ojong', 'History', 'Sejarah & Biografi', 2),
    ('Perang Eropa Jilid 3', 'P. K. Ojong', 'History', 'Sejarah & Biografi', 2),
    ('Sejarah Kecil "Petite Histoire" Indonesia Jilid 1', 'Rosihan Anwar', 'History', 'Sejarah & Biografi', 2),
    ('Sejarah Kecil "Petite Histoire" Indonesia Jilid 2', 'Rosihan Anwar', 'History', 'Sejarah & Biografi', 2),
    ('Sejarah Kecil "Petite Histoire" Indonesia Jilid 4', 'Rosihan Anwar', 'History', 'Sejarah & Biografi', 2),
    ('Sejarah Kecil "Petite Histoire" Indonesia Jilid 5', 'Rosihan Anwar', 'History', 'Sejarah & Biografi', 2),
    ('HMI 1963-1966', 'M. Alfan Alfian', 'History', 'Sejarah & Biografi', 2),
    ('A History of the World', 'Andrew Marr', 'History', 'Sejarah & Biografi', 2),
    ('A History of Aesthetic', 'Bernard Bosanquet', 'History', 'Sejarah & Biografi', 2),
    ('Surga di Andalusia', 'Maria Rosa Menocal', 'History', 'Sejarah & Biografi', 2),
    ('Langkah Merah: Gerakan PKI 1950-1955', 'M. Subhan SD', 'History', 'Sejarah & Biografi', 2),
    ('The Civilization of the Middle Ages', 'Norman F. Cantor', 'History', 'Sejarah & Biografi', 2),
    ('Santo dan Sultan: Kisah Tersembunyi tentang Juru Damai Perang Salib', 'Paul Moses', 'History', 'Sejarah & Biografi', 2),
    ('A Short History of the Arabs', 'Philip K. Hitti', 'History', 'Sejarah & Biografi', 2),
    ('Osman''s Dream', 'Caroline Finkel', 'History', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Hitler''s Pope', 'John Cornwell', 'Memoirs & Biography', 'Sejarah & Biografi', 2),
    ('The Great Bait Al-Hikmah', 'Jonathan Lyons', 'History', 'Sejarah & Biografi', 2),
    ('Islamic Empires', 'Justin Marozzi', 'History', 'Sejarah & Biografi', 2),
    ('The Golden Thread', 'Kassia St. Clair', 'History', 'Sejarah & Biografi', 2),
    ('September 30 Incident: Japanese Perception and Response', 'Kurasawa Aiko', 'History', 'Sejarah & Biografi', 2),
    ('The Anvil of Civilization', 'Leonard Cottrell', 'History', 'Sejarah & Biografi', 2),
    ('Polisi Zaman Hindia Belanda', 'Marieke Bloembergen', 'History', 'Sejarah & Biografi', 2),
    ('Cannae 216 SM', 'Mark Healy', 'History', 'Sejarah & Biografi', 2),
    ('Sejarah Dunia untuk Pembaca Muda', 'Ernst H. Gombrich', 'History', 'Sejarah & Biografi', 2),
    ('On Grand Strategy', 'John Lewis Gaddis', 'History', 'Sejarah & Biografi', 2),
    ('Penghancuran Buku dari Masa ke Masa', 'Fernando Baez', 'History', 'Sejarah & Biografi', 2),
    ('Sejarah Islam yang Hilang', 'Firas Alkhateeb', 'History', 'Sejarah & Biografi', 2),
    ('Indonesia Merdeka karena Amerika?', 'Frances Gouda', 'History', 'Sejarah & Biografi', 2),
    ('Jejak Hitler di Indonesia', 'Horst H. Geerken', 'History', 'Ilmu Sosial & Politik', 2),
    ('Peranakan Tionghoa di Nusantara', 'Iwan Santosa', 'Politics & Sociology', 'Sejarah & Biografi', 2),
    ('The Unlocked Secret: Freemasonry Examined', 'James Dewar', 'History', 'Sejarah & Biografi', 2),
    ('Zona Aman Gorazde', 'Joe Sacco', 'History', 'Sejarah & Biografi', 2),
    ('Sejarah Prancis', 'Jean Carpentier, Francois Lebrun', 'History', 'Sejarah & Biografi', 2),
    ('Sebuah Masjid di Munich', 'Ian Johnson', 'History', 'Sejarah & Biografi', 2),
    ('Collapse: How Societies Choose to Fail or Survive', 'Jared Diamond', 'History', 'Sejarah & Biografi', 2),
    ('Sejarah Perancis', 'Jean Carpentier, Francois Lebrun', 'History', 'Sejarah & Biografi', 2),
    ('October: the Story of the Russian Revolution', 'China Meville', 'History', 'Sejarah & Biografi', 2),
    ('Threads of Life', 'Clare Hunter', 'History', 'Sejarah & Biografi', 2),
    ('Gardens in Java', 'Denys Lombard', 'History', 'Sejarah & Biografi', 2),
    ('Soviet Naval Power in the Pacific', 'Derek da Cunha', 'History', 'Sejarah & Biografi', 2),
    ('Debt: The First 5,000 Years', 'David Graeber', 'History', 'Sejarah & Biografi', 2),
    ('Yarmuk 636 M; Perang Besar Muslim VS "Romawi"', 'David Nicolle', 'History', 'Sejarah & Biografi', 2),
    ('The Price of Time', 'Edward Chancellor', 'History', 'Sejarah & Biografi', 2),
    ('How Chance and Stupidity Have Changed History', 'Erik Durschmied', 'History', 'Ekonomi, Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('The Democracy Project - A History. A Crisis. A Movement', 'David Graeber', 'Critiques on Capitalism', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Rosa Luxemburg - Sosialisme dan Demokrasi', 'Dede Mulyanto', 'Memoirs & Biography', 'Sejarah & Biografi', 2),
    ('A History of the Jews', 'Abraham Leon Sachar', 'History', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Left Bank', 'Agnes Poirier', 'Memoirs & Biography', 'Sejarah & Biografi', 2),
    ('Islam, Otoritarianisme, dan Ketertinggalan', 'Ahmet T. Kuru', 'History', 'Sejarah & Biografi', 2),
    ('1965 Indonesia and the World', 'Bernd Schaefer, Baskara T. wardaya', 'History', 'Sejarah & Biografi', 2),
    ('Hitler''s Battle of the Bulge Last Gamble', 'Cain, et al', 'History', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Mencuri Kreativitas Desainer', 'Raul Renanda', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Productivity Untuk Mendongkrak Hack', 'Darmawan Aji', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Apa yang Kita Pikirkan ketika Kita Sendirian', 'Desi Anwar', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('The Organized Mind', 'Daniel J. Levitin', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('The Monk Who Sold His Ferrari', 'Robin Sharma', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('The Art Of The Good Life, Filosofi Hidup Klasik untuk Abad Ke-21', 'Rolf Dobelli', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('The 80/20: Prinsip Pareto Unuk Mendapatkan Hasil Luar Biasa Tanpa Usaha Luar Biasa', 'Richard Koch', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('The 80/20: Achieve More with Less', 'Richard Koch', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('How To Be Human', 'Ruby Wax', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Strawberry Generation', 'Rhenald Kasali', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Self Driving: Menjadi Driver atau Passenger?', 'Rhenald Kasali', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Passion Without Creation is Nothing: Career Starter Pack for Students', 'Rene Suhardono', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Loving the Wounded Soul', 'Regis Machdy', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Notes On a Nervous Planet', 'Matt Haig', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('The Life-Changing Magic of Tidying Up', 'Marie Kondo', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Lorong Waktu', 'Monde Ariezta', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Mengenal Psikologi For Beginners', 'Nigel C. Benson, Simon Grove', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Kaizen: Sukses Mengubah Kebiasaan-Kebiasaan Buruk Agar Lebih Produktif dan Efisien', 'Nike Shinta', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Help! How to Become Slightly Happier and Get a Bit More Done', 'Oliver Burkeman', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Career Hacks: Kiat-kiat Akselerasi Karier para Profesional Sukses', 'Pambudi Sunarsihanto, et al', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Listful Thinking', 'Paula Rizzo', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('The Things You Can See Only when You Slow Down', 'Haemin Sunim', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('The Psychology of Money', 'Morgan Housel', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Leading with Emotional Courage', 'Peter Bregman', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Ibu Boleh Marah: Mengelola Emosi Negatif Jadi Edukatif', 'Park Yun Mi', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Happiness by Design: Finding Pleasure and Purpose in Everyday Life', 'Paul Dolan', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Merawat Luka Batin', 'Jiemi Ardian, Sp.KJ', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Do It With Passion', 'Ken Robinson, Lou Aronica', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Smart Millennials', 'KMPlus Consulting', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Seni Berbicara', 'Larry King, Bill Gilbert', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Lagom: Not Too Little Not Too Much', 'Lola A. Akerstrom', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('The Tipping Point', 'Malcolm Gladwell', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('How We Work', 'Leah Weiss, PhD', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('A Bigger Prize: When No One Wins Unless Everyone Wins', 'Margaret Heffernan', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Hidup Antigalau: Menata Karier dan Masa Depan di Umur 20-an', 'Juhyung Kim', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Emotional Intelligence (You Can Actually Use)', 'Kerry Goyette', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Gemar Rapi: Metode Berbenahnya Indonesia', 'Khoirun Nikmah', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Outliers: the Story of Success', 'Malcolm Gladwell', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Seni Hidup Minimalis', 'Francine Jay', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Seni membuat Hidup Jadi lebih Ringan', 'Francine Jay', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Hello, Habits', 'Fumio Sasaki', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Goodbye, Things: Hidup Minimalis Ala Orang Jepang', 'Fumio Sasaki', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Do', 'Handoko Hendroyono', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Duh, Katanya Aku Harus Bekerja Keras', 'Ha Wan', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Atomic Habits', 'James Clear', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('How To Be Interesting (In 10 Simple Steps)', 'Jessica Hagy', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('How Successful People Think', 'John C. Maxwell', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('What Successful People Know About Leadership', 'John C. Maxwell', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Do No Harm: Stories of Life, Death, and Brain Surgery', 'Henry Marsh', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Honjok: Seni Hidup Sendiri', 'Crystal Tai, Francie Healey', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Menjadi Pribadi yang Tegas, Mudah Memahami Orang Lain, dan Cakap Menyelesaikan Konflik', 'Dale Carnegie', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('7 Kunci Kebahagiaan Sejati', 'Deepak Chopra', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Ini Cara Gue: 6 Pilar Buat Bikin Profesi yang Gue Banget', 'Dedy Dahlan', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('10% Happier', 'Dan Harris', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Thinking, Fast and Slow', 'Daniel Kahneman', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Noise: A Flow in Human Judgment', 'Daniel Kahneman', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Blah Blah Blah: Apa yang Harus Dilakukan Ketika Kata Kehilangan Makna', 'Dan Roam', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Rindu yang Menipu', 'Faris Saputra', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('You Do You', 'Fellexandro Ruby', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Afirmasi untuk Dirimu yang Hebat', 'Fera Cania', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Menjaga Api', 'Agung Adi Prasetyo', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Si Cacing dan Kotoran Kesayangannya', 'Ajahn Brahm', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Si Cacing dan Kotoran Kesayangannya 3', 'Ajahn Brahm', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('My Passion My Career', 'Ardiningtyas Pitaloka, Andin Andiyasari', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('The Achievement Habit', 'Bernard Roth', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Young on Top', 'Billy Boen', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Don''t Follow Your Passion', 'Cal Newport', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('The Power of Habit', 'Charles Duhigg', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Manusia Modern Mencari Jiwa', 'Carl. G. Jung', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Work Simply', 'Carson Tate', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('The School of Life', 'Alain de Botton', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('I Want to Die but I Want to Eat Tteokpokki', 'Baek Se Hee', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('The Body Keeps the Score: Brain, Mind, and Body in the Healing of Trauma', 'Bessel van der Kolk', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Hyperfocus', 'Chris Bailey', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('The Joy of Missing Out', 'Tanya Dalton', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('The Success Book', 'Tim Johnson', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('The Networking Book', 'Simone Andersen', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Leaders Eat Last', 'Simon Sinek', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Find Your Why', 'Simon Sinek', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Start With Why', 'Simon Sinek', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Personal Branding Code', 'Silih Agung Wasesa', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('The Seven Habits of Highly Effective People', 'Stephen R. Covey', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Keajaiban yang Mengubah Hidup dari Bersikap Tidak Ambil Pusing', 'Sarah Knight', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('The Leader Who Had No Title', 'Robin Sharma', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Santai Aja, Namanya Juga Hidup!', 'Yozuck', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Studying Abroad: Belajar Sambil Berpetualang di Negeri Orang', 'Windy Ariestanty, Maurin Andri', 'Education', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('The Naked Traveler 2', 'Trinity', 'Travel', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('These Strange German Ways', 'Susan Stern', 'Travel', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Jejak Mata Pyongyang', 'Seno Gumira Ajidarma', 'Travel', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('The Geography of Love', 'Peter Theisen', 'Memoirs & Biography', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Asia & Australia', 'Myrna Ratna', 'Travel', 'Ilmu Sosial & Politik, Pengembangan Diri', 2),
    ('Panduan Hemat Keliling Rusia', 'M. Aji Surya, Eva Surya', 'Travel', 'Nonfiksi Naratif, Sejarah & Biografi', 2),
    ('Trik Juara Mengatur Waktu', 'Zivanna Letisha', 'Psychology & Self Help', 'Nonfiksi Naratif, Sejarah & Biografi', 2),
    ('Walking in the Woods', 'Yoshifumi Miyakaze', 'Psychology & Self Help', 'Nonfiksi Naratif, Sejarah & Biografi', 2),
    ('Man''s Search For Meaning', 'Viktor E. Frankl', 'Psychology & Self Help', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Oh My Goodness: Buku Pintar Seorang Creative Junkies', 'Yoris Sebastian', 'Psychology & Self Help', 'Nonfiksi Naratif, Sejarah & Biografi', 2),
    ('Beginners', 'Tom Vanderbilt', 'Psychology & Self Help', 'Nonfiksi Naratif, Sejarah & Biografi', 2),
    ('Less is More - How Degrowth Will Save the World', 'Jason Hickel', 'Climate Change', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('This Changes Everything: Capitalism vs. The Climate', 'Naomi Klein', 'Climate Change', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Earth Matters', 'Tita Larasati', 'Climate Change', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('The Uninhabitable Earth - Life After Warming', 'David Wallace-Wells', 'Climate Change', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('The Book of Jakarta: A City in Short Fiction', 'Maesy Ang (Editor), & Teddy W. Kusuma (Editor)', 'Indonesian Literature', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('30 Paspor di Kelas Sang Profesor', 'J. S. Khairen', 'Travel', 'Ilmu Pengetahuan Alam & Teknologi, Ilmu Sosial & Politik', 2),
    ('Journey to Iran: Bukan Jalan-Jalan Biasa', 'Dina Y. Sulaeman', 'Travel', 'Ilmu Pengetahuan Alam & Teknologi, Ilmu Sosial & Politik', 2),
    ('CitiX60: Milan 60 Creatives Show You The Best of the City', 'Viction Workshop', 'Travel', 'Ilmu Pengetahuan Alam & Teknologi, Ilmu Sosial & Politik', 2),
    ('Flashpacking to Australia', 'Deedee Caniago', 'Travel', 'Ilmu Pengetahuan Alam & Teknologi, Ilmu Sosial & Politik', 2),
    ('Travelicious: Jalan Hemat, Jajan Nikmat: Semarang & Karimunjawa', 'Ardi Teristi Hardi', 'Travel', 'Sastra & Puisi, Fiksi Kontemporer & Klasik', 2),
    ('45 Negara Pemberi Beasiswa', 'Alifia', 'Education', 'Nonfiksi Naratif, Sejarah & Biografi', 2),
    ('Menua dengan Gembira', 'Andina Dwifatma', 'Psychology & Self Help', 'Nonfiksi Naratif, Sejarah & Biografi', 2),
    ('Akhir Penjantanan Dunia', 'Esther Lianawati', 'Feminism', 'Nonfiksi Naratif, Sejarah & Biografi', 2),
    ('Yang Terlupakan dan Dilupakan - Membaca Kembali 10 Penulis Perempuan Indonesia', 'Giovanni Dessy Austriningrum, et.al', 'Feminism', 'Nonfiksi Naratif, Sejarah & Biografi', 2),
    ('Siapa yang Memasak Makan Malam Adam Smith? - Kisah Tentang Perempuan dan Ilmu Ekonomi', 'Katrine Marcal', 'Feminism', 'Nonfiksi Naratif, Sejarah & Biografi', 2),
    ('Memainkan Pelacur - Persoalan Hak dan Kerja dari Pekerjaan Seks', 'Melissa Gira Grant', 'Feminism', 'Ilmu Sosial & Politik, Pengembangan Diri', 2),
    ('The Tao of Islam', 'Sachiko Murata', 'Religions', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Para Raja dan Pahlawan Perempuan, serta Bidadari dalam Folklor Indonesia', 'Wiyatmi, et.a;', 'Feminism', 'Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('Pramoedya Ananta Toer dan Sastra Realisme Sosialis', 'Eka Kurniawan', 'Indonesian Literature', 'Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('Gara-Gara Alat Vital dan Kancing Gigi - Bunga Rampai Bahasa', 'Gustaaf Kusno', 'Poetry & Literary Criticism', 'Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('Kesusastraan dan Kekuasaan', 'Goenawan Mohamad', 'Poetry & Literary Criticism', 'Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('Tafseer of the Verse of Salat & Salam', 'Abdul Raheem Limbada', 'Religions', 'Agama', 2),
    ('Religion - A Crash Course', 'Adam Ford', 'Religions', 'Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('Islam Dalam Bingkai Keindonesiaan Dan Kemanusiaan', 'Ahmad Syafii Maarif', 'Religions', 'Sastra & Puisi, Fiksi Kontemporer & Klasik', 2),
    ('The Islamic Discourse in Religious Institutions', 'Al-Habib Umar bin Hafiz', 'Religions', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('Krisis Peradaban Islam', 'Ali A. Allawi', 'Religions', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('Qur''an and Woman: Rereading the Sacred Text from a Woman''s Perspective', 'Amina', 'Religions', 'Agama', 2),
    ('The Shari''a - History, Ethics and Law', 'Amyn B. Sajoo', 'Religions', 'Agama', 2),
    ('Akulah Angin, Engkaulah Api', 'Annemarie Schimmel', 'Religions', 'Agama', 2),
    ('Heaven and Hell: A History of the Afterlife', 'Bart D. Ehrman', 'Religions', 'Agama', 2),
    ('If The Oceans Were Ink: An Unlikely Friendship and a Journey to the Heart of the Quran', 'Carla Power', 'Religions', 'Agama', 2),
    ('How to Read the Qur''an', 'Carl W. Ernst', 'Religions', 'Agama', 2),
    ('Insan Kamil - Konsepsi Manusia Menurut Islam', 'Dawam Rahardjo', 'Religions', 'Agama', 2),
    ('Seribu Masjid Satu Jumlahnya', 'Emha Ainun Nadjib', 'Religions', 'Agama', 2),
    ('Man Seeks God - Mencari Tuhan Ke Berbagai Penjuru Dunia', 'Eric Weiner', 'Religions', 'Agama', 2),
    ('A Thinking Person''s Guide to Our Times', 'Ghazi bin Muhammad', 'Religions', 'Agama', 2),
    ('Islam Tuhan, Islam Manusia', 'Haidar Bagir', 'Religions', 'Agama', 2),
    ('Islam Di Mata Orang Jepang', 'Hisanori Kato', 'Religions', 'Agama', 2),
    ('Empat Imam Mazhab Yang Mempengaruhi Dunia', 'Ilham Wahyudi', 'Religions', 'Agama', 2),
    ('Maqasid Al-Shari''ah: A Beginner''s Guide', 'Jasser Auda', 'Religions', 'Agama', 2),
    ('Struggling to Surrender', 'Jeffrey Lang', 'Religions', 'Agama', 2),
    ('The Leadership of Muhammad - A Historical Reconstruction', 'Joel Hayward', 'Religions', 'Agama', 2),
    ('Islam: A Short History', 'Karen Armstrong', 'Religions', 'Agama', 2),
    ('A History of God', 'Karen Armstrong', 'Religions', 'Agama', 2),
    ('Compassion: 12 Langkah Menuju Hidup Berbelas Kasih', 'Karen Armstrong', 'Religions', 'Agama', 2),
    ('Women Around The Prophet', 'Khalid Muhammad Khalid', 'Feminism', 'Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('Speaking of Faith', 'Krista Tippet', 'Religions', 'Agama', 2),
    ('The Road to Mecca', 'Muhammad Asad', 'Religions', 'Agama', 2);

-- Batch 4/8 (Records 1501-2000)
INSERT INTO books (title, author, category, general_category, library_id) VALUES
    ('Sebuah Kajian Tentang Sistem Pemerintahan Islam', 'Muhammad Asad', 'Religions', 'Agama', 2),
    ('Islam Di Simpang Jalan', 'Muhammad Asad', 'Religions', 'Agama', 2),
    ('Merasa Dekat dengan Tuhan itu Godaan yang Berat', 'M. Zaid Su''di', 'Religions', 'Agama', 2),
    ('Reopening Muslim Minds', 'Mustafa Akyol', 'Religions', 'Agama', 2),
    ('Khadija', 'Resit Haylamaz', 'Religions', 'Agama', 2),
    ('The Qur''an and The Just Society', 'Ramon Harvey', 'Religions', 'Agama', 2),
    ('Relasi Damai Islam & Kristen', 'Richard Fletcher', 'Religions', 'Agama', 2),
    ('Sumbangan Islam Kepada Ilmu dan Peradaban Modern', 'S.I Poeradisastra', 'Religions', 'Agama', 2),
    ('1001 Masjid di 5 Benua', 'Taufik Uieks', 'Religions', 'Agama', 2),
    ('Ulama-Ulama Nusantara yang Mempengaruhi Dunia', 'Thoriq Aziz Jayana', 'Religions', 'Agama', 2),
    ('Kebangkitan Islam dalam Perbincangan Para Pakar', 'Yusuf Qardhawi', 'Religions', 'Agama', 2),
    ('Building A New Society', 'Zahid Parvez', 'Religions', 'Agama', 2),
    ('Imajinasi, Problematika, Kompleksitas', 'Anggi Afriansyah', 'Education', 'Ilmu Sosial & Politik, Pengembangan Diri', 2),
    ('Sekolah Tanpa Jurusan', 'Gernatiti', 'Education', 'Ilmu Sosial & Politik, Pengembangan Diri', 2),
    ('Memulihkan Sekolah Memulihkan Manusia', 'Haidar Bagir', 'Education', 'Ilmu Sosial & Politik, Pengembangan Diri', 2),
    ('The Marvels of the Heart', 'Al-Ghazali', 'Religions', 'Agama', 2),
    ('When We Cease to Understand the World', 'Benjamin Labatut', 'Philosophy', 'Filsafat & Etika', 2),
    ('When We Cease to Understand the World', 'Eric Weiner', 'Philosophy', 'Filsafat & Etika', 2),
    ('Sejarah Filsafat Cina', 'Fung Yu-Lan', 'Philosophy', 'Filsafat & Etika', 2),
    ('Filsafat John Locke', 'Frederick Copleston', 'Philosophy', 'Filsafat & Etika', 2),
    ('Filsafat Hobbes', 'Frederick Copleston', 'Philosophy', 'Filsafat & Etika', 2),
    ('The Little Book of Truth', 'Filosofi', 'Philosophy', 'Filsafat & Etika', 2),
    ('Dari Sinai Sampai Al-Ghazali', 'Goenawan Mohamad', 'Philosophy', 'Filsafat & Etika', 2),
    ('Kitalah yang Ada Di Sini Sekarang', 'Jostein Gaarder', 'Philosophy', 'Filsafat & Etika', 2),
    ('Meditations', 'Marcus Aurelius', 'Philosophy', 'Filsafat & Etika', 2),
    ('Timaeus dan Critias: Awal Mula Kisah Atlantis', 'Plato', 'Philosophy', 'Filsafat & Etika', 2),
    ('Letters from A Stoic', 'Seneca', 'Philosophy', 'Filsafat & Etika', 2),
    ('How to Keep Your Cool', 'Seneca', 'Philosophy', 'Filsafat & Etika', 2),
    ('Plato and A Platypus Walk Into A Bar... - Understanding Philosophy Through Jokes', 'Thomas Cathcart & Daniel Klein', 'Philosophy', 'Filsafat & Etika', 2),
    ('Aesthetics Vol. II', 'Dietrich von Hildebrand', 'Arts & Architecture', 'Seni', 2),
    ('Anya''s Ghost', 'Vera Brogsol', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Perempuan Indonesia: Dulu dan Kini', 'Mayling Oey-Gardiner', 'Feminism', 'Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('(Copy) Mitos Pribumi Malas: Citra Orang Jawa, Melayu dan Filipina dalam Kapitalisme Kolonial', 'S.H. Alatas', 'Colonialism', 'Sejarah & Biografi, Ilmu Sosial & Politik', 2),
    ('Written In Stone', 'Brian Switek', 'Science', 'Ilmu Pengetahuan Alam & Teknologi', 2),
    ('Shadows of Forgotten Ancestors - Bayang-Bayang Leluhur', 'Carl Sagan, Ann Druyan', 'Science', 'Ilmu Pengetahuan Alam & Teknologi', 2),
    ('Origin Story - Kisah Asal-Usul', 'David Christian', 'Science', 'Ilmu Pengetahuan Alam & Teknologi', 2),
    ('Asal-Usul Manusia', 'Richard', 'Science', 'Ilmu Pengetahuan Alam & Teknologi', 2),
    ('Spiritual Creativepreneur', 'M. Arief Budiman', 'Business', 'Bisnis & Manajemen, Ekonomi', 2),
    ('The 4 Day Week', 'Andrew Barnes', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Kreativitas Untuk Booming', 'Aris Ananda', 'Business', 'Bisnis & Manajemen, Ekonomi', 2),
    ('The 30 Day Money Cleanse', 'Ashley Feinstein Gerstley', 'Business', 'Bisnis & Manajemen, Ekonomi', 2),
    ('Business Wisdom of Muhammad SAW', 'Bambang Trim', 'Business', 'Bisnis & Manajemen, Ekonomi', 2),
    ('Do/Purpose', 'David Hieatt', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Setiap Pebisnis Harus Punya Buku Ini!', 'Dini Hert', 'Business', 'Bisnis & Manajemen, Ekonomi', 2),
    ('The Lean Startup', 'Eric Ries', 'Business', 'Bisnis & Manajemen, Ekonomi', 2),
    ('Local Champion! - Jurus Utama Jadi Juara Lokal', 'Hermawan Kartajaya', 'Business', 'Bisnis & Manajemen, Ekonomi', 2),
    ('Brand is Like A Donut', 'Irvan Permana', 'Business', 'Bisnis & Manajemen, Ekonomi', 2),
    ('Fish Eye', 'Handoko Hendroyono', 'Business', 'Bisnis & Manajemen, Ekonomi', 2),
    ('Falling Leaves Return to Their Roots: The True Story of an Unwanted Chinese Daughter', 'Adeline Yen Mah', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Mein Kampf', 'Adolf Hitler', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Garis Batas: Perjalanan di Negeri-Negeri Asia Tengah', 'Agustinus Wibowo', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Mellow Yellow Drama', 'Audrey Yu Jia Hui', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('My Life', 'Bill Clinton', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Nasionalisme unggul: Bukan hanya slogan', 'Dino Patti Djalal', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Perang Tani di Jawa Barat', 'Dipa Achmad', 'History', 'Sejarah & Biografi', 2),
    ('Mahatma Gandhi', 'Kazuki Ebine', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Kampung Boy', 'Lat', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Untuk Negeriku: Bukittinggi - Rotterdam Lewat Betawi', 'Mohammad Hatta', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Untuk Negeriku: Berjuang dan Dibuang', 'Mohammad Hatta', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Untuk Negeriku Menuju Gerbang Kemerdekaan', 'Mohammad Hatta', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Mochtar Riady: Manusia Ide', 'Mochtar Riady
', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('NASIONAL.IS.ME

', 'Pandji Pragiwaksono', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Bound Feet & Western Dress', 'Pang-Mei Natasha Chang', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('A Very Easy Death', 'Simone de Beauvoir', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Catatan Perang Korea', 'Mochtar Lubis', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('I Am Malala', 'Malala Yousafzai', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('The Art of Giving Back', 'Nila Tanzil', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Red China Blues', 'Jan Wong', 'History', 'Sejarah & Biografi', 2),
    ('In the Margins: On the Pleasures of Reading and Writing', 'Elena Ferrante', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('The Geography of Bliss: One Grump''s Search for the Happiest Places in the World', 'Eric Weiner
', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Rudy: Kisah Masa Muda Sang Visioner', 'Gina S. Noer
', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Onward: How Starbucks Fought for Its Life without Losing Its Soul', 'Howard Schultz, Joanne Gordon', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Renungan dan Catatan MayJen TNI (Purn) Soebijakto', 'Julius Pour', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Habis Gelap Terbitlah Terang', 'Raden Adjeng Kartini
', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Losing My Virginity: How I''ve Survived, Had Fun, and Made a Fortune Doing Business My Way', 'Richard Branson', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Tempat Terbaik di Dunia: Pengalaman Seorang Antropolog Tinggal di Kawasan Kumuh Jakarta', 'Roanne van Voorst
', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Let My People Go Surfing: The Education of a Reluctant Businessman', 'Yvon Chouinard', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Alexander Hamilton', 'Ron Chernow', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('I Don''t Feel Like Drawing Today', 'Larasatita', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Adults in the Room', 'Yanis Varoufakis', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Out of Africa and Shadows on the Grass', 'Karen Blixen', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Sprint: 5 Hari Sukses Pecahkan Masalah dan Uji Ide Baru', 'Jake Knapp', 'Business', 'Bisnis & Manajemen, Ekonomi', 2),
    ('You are a Badass at Making Money', 'Jen Sincero', 'Business', 'Bisnis & Manajemen, Ekonomi', 2),
    ('Powers of Two', 'Joshua Wolf Shenk', 'Business', 'Bisnis & Manajemen, Ekonomi', 2),
    ('It''s My Startup', 'Lahandi Baskoro', 'Business', 'Bisnis & Manajemen, Ekonomi', 2),
    ('10 Strategi Marketing Online', 'Merry Magdalena', 'Business', 'Bisnis & Manajemen, Ekonomi', 2),
    ('Indiepreneur', 'Pandji Pragiwaksono', 'Business', 'Bisnis & Manajemen, Ekonomi', 2),
    ('Make it Happen!', 'Prita Hapsari Ghozie', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Zero to One', 'Peter Thiel, Blake Masters', 'Business', 'Bisnis & Manajemen, Ekonomi', 2),
    ('The Rules of Management', 'Richard Templar', 'Business', 'Bisnis & Manajemen, Ekonomi', 2),
    ('Selling Yourself', 'Dr. Setyo Riyanto, Husin Wijaya, Dimas Soerojo', 'Business', 'Bisnis & Manajemen, Ekonomi', 2),
    ('Marketing to the MIddle Class Muslim', 'Yuswohady', 'Business', 'Bisnis & Manajemen, Ekonomi', 2),
    ('The Geography of Genius: Lessons from the World''s Most Creative Places', 'Eric Weiner
', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Indonesia Di Mataku', 'Henk Sneevliet', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Japan in the Second World War in Colour', 'David Batty', 'History', 'Sejarah & Biografi', 2),
    ('Kekerasan dan Identitas
', 'Amartya Sen', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Ras, Kelas, Bangsa: Politik Pergerakan Antikolonial di Surabaya Abad ke-20', 'Andi Achdian', 'Colonialism', 'Sejarah & Biografi, Ilmu Sosial & Politik', 2),
    ('Dilarang Membaca: Sepilihan Esai Anton Kurnia', 'Anton Kurnia', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Rakyatisme dan Esai-esai Lain', 'Alois A. Nugroho', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Manusia Paling Dipuja di Seluruh Dunia: Selebriti, Popularitas dan Kenapa Kita Terus Menyaksikan Mereka', 'Angga Prawadika Aji', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Religion and Social Ethos in Indonesia', 'Benedict Anderson', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Lima Pokok Pikiran yang Mengubah Dunia', 'Barbara Ward
', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Air-Conditioned Nation Revisited', 'Cherian George', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Liberalism Disavowed: Communitarianism and State Capitalism in Singapore', 'Chua Beng Huat', 'Critiques on Capitalism', 'Ekonomi, Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('Marinaleda - Eksperimen Kota Kecil Antikapitalis', 'Dan Hancox', 'Critiques on Capitalism', 'Ekonomi, Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('Why Nations Fail: The Origins of Power, Prosperity, and Poverty', 'Daron Acemoğlu, James A. Robinson', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Dari Soekarno Sampai SBY: Intrik & Lobi Politik Para Penguasa', 'Tjipta Lesmana', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Generation M: Generasi Muda Muslim dan Cara Mereka Membentuk Dunia', 'Shelina Janmohamed', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Merengkuh Djaman Kemadjoean', 'Deddy Arsya', 'History', 'Sejarah & Biografi', 2),
    ('Electoral Dynamics in Indonesia: Money Politics, Patronage and Clientelism at the Grassroots', 'Edward Aspinall, Mada Sukmajati
', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Metropolis Universalis: Belajar Membangun Kota yang Maju dari Sejarah Perkembangan Kota di Dunia', 'Eko Laksono', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Political Order and Political Decay: From the Industrial Revolution to the Globalization of Democracy', 'Francis Fukuyama', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('A World Without Islam', 'Graham E. Fuller', 'Religions', 'Agama', 2),
    ('Asian Aphrodisiacs: From Bangkok to Beijing - the Search for the Ultimate Turn-on', 'Jerry Hopkins', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Media & Kekuasaan: Televisi di Hari-hari Terakhir Presiden Soeharto', 'Ishadi S.K.', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Asia VS Barat', 'Ng Aik Kwang', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Transformasi Besar - Asal-usul Politik dan Ekonomi Zaman Sekarang', 'Karl Polanyi', 'Critiques on Capitalism', 'Ekonomi, Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('Villages in Indonesia', 'Koentjaraningrat', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Sapi, Babi, Perang dan Tukang Sihir: Menjawab Teka-teki Kebudayaan', 'Marvin Harris
', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('The Evolution of Everything: How New Ideas Emerge', 'Matt Ridley', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Politik Kerakyatan menurut Niccolo Machiavelli', 'Niccolò Machiavelli', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('China''s Silent Army: The Pioneers, Traders, Fixers and Workers Who are Remaking the World in Beijing''s Image', 'Juan Pablo Cardenal', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('The Next Civilization', 'Nanat Fatah Natsir', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('New Naratif: Menarasikan Indonesia', 'Tonggo Simangunsong, et al', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Hidup Begitu Indah dan Hanya Itu yang Kita Punya', 'Dea Anugrah', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Rezim lokal di Indonesia', 'Abdul Gaffar Karim, et al', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('
Pertanyaan-Pertanyaan Sosiologi', 'Pierre Bourdieu', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Merebut Ruang Kota: Aksi Rakyat Miskin Kota Surabaya 1900-1960an', 'Purnawan Basundoro', 'History', 'Sejarah & Biografi', 2),
    ('Civil Islam: Muslims and Democratization in Indonesia', 'Robert W. Hefner', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('How to be a Conservative', 'Roger Scruton', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Understanding Islam in Indonesia: Politics and Diversity', 'Robert Pringle', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Manusia, Kalian Hendak Ke Mana?', 'Simon Hate', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Zaman Peralihan', 'Soe Hok Gie', 'History', 'Sejarah & Biografi', 2),
    ('The Art of War', 'Sun Tzu
', 'History', 'Sejarah & Biografi', 2),
    ('Sosialisme Indonesia Pembangunan: Kumpulan Tulisan', 'Sutan Sjahrir', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Renungan dan Perjuangan', 'Sutan Sjahrir', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('One State: The Only Democratic Future for Palestine-Israel', 'Ghada Karmi', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Factfulness: Ten Reasons We''re Wrong About the World – and Why Things Are Better Than You Think', 'Hans Rosling', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Indonesia Di Mata Orang Jepang', 'Hisanori Kato', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Pasang Naik Kulit Berwarna', 'L. Stoddard', 'Colonialism', 'Sejarah & Biografi, Ilmu Sosial & Politik', 2),
    ('Imagined Communities', 'Benedict Anderson', 'History', 'Sejarah & Biografi', 2),
    ('Diplomacy: A Singapore Experience', 'S. Jayakumar', 'History', 'Sejarah & Biografi', 2),
    ('Mitos Pribumi Malas: Citra Orang Jawa, Melayu dan Filipina dalam Kapitalisme Kolonial', 'S. H. Alatas', 'History', 'Sejarah & Biografi', 2),
    ('Like the Moon and the Sun: Indonesia in the Words of an American Diplomat', 'Stanley Harsha', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('The Better Angels of Our Nature: Why Violence Has Declined', 'Steven Pinker', 'History', 'Sejarah & Biografi', 2),
    ('This Is What Inequality Looks Like', 'Teo You Yenn', 'Critiques on Capitalism', 'Ekonomi, Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('The World Is Flat: A Brief History of the Twenty-first Century', 'Thomas L. Friedman', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('The Divide - Global Inequality from Conquest to Free Markets', 'Jason Hickel', 'Critiques on Capitalism', 'Ekonomi, Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('Rock ''n Roll Industri Musik Indonesia', 'Theodore KS', 'History', 'Sejarah & Biografi', 2),
    ('Dominion: The Making of the Western Mind', 'Tom Holland', 'History', 'Sejarah & Biografi', 2),
    ('HBR Guide to Thinking Strategically', 'Harvard Business', 'Business', 'Bisnis & Manajemen, Ekonomi', 2),
    ('21 Pelajaran untuk Abad ke-21', 'Yuval Noah Harari', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('The Famous Five: Well Done Famous Five', 'Enid Blyton', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('The Famous Five: George''s Hair is Too Long', 'Enid Blyton', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('The Famous Five: The Birthday Adventure', 'Enid Blyton', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('The Famous Five: When Timmy Chased the Cat!', 'Enid Blyton', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('The Famous Five: Five to the Rescue!', 'Enid Blyton', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('The Famous Five: A Lazy Afternoon', 'Enid Blyton', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('The Famous Five: Five Have a Puzzling Time', 'Enid Blyton', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('The Famous Five: Five and a Half-Term Adventure', 'Enid Blyton', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('The Famous Five : Good Old Timmy', 'Enid Blyton', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('Danny the Champion of the World', 'Roald Dahl', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('Esio Trot', 'Roald Dahl', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('The Giraffe and the Pelly and Me', 'Roald Dahl', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('Fantastic Mr. Fox', 'Roald Dahl', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('The Twits', 'Roald Dahl', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('The Magic Finger', 'Roald Dahl', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('Billy and the Minpins', 'Roald Dahl', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('Matilda', 'Roald Dahl', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('Boy', 'Roald Dahl', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('The Witches', 'Roald Dahl', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('Charlie and the Great Glass Elevator', 'Roald Dahl', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('The BFG', 'Roald Dahl', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('Charlie and the Chocolate Factory', 'Roald Dahl', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('Going Solo', 'Roald Dahl', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('James and the Giant Peach', 'Roald Dahl', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('George''s Marvellous Medicine', 'Roald Dahl', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('The Complete Adventure of Charlie and Mr. Willy Wonka', 'Roald Dahl', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('The Enormous Crocodile', 'Roald Dahl', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('Little Fires Everywhere', 'Celeste Ng', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Story of a New Name', 'Elena Ferrante', 'On Womanhood', 'Ilmu Sosial & Politik, Pengembangan Diri', 2),
    ('The Secrets of The Immortal Nicholas Flamel: The Sorceress', 'Michael Scott', 'Fantasy & Sci-Fi', 'Fiksi Genre Spesifik', 2),
    ('The Secrets of The Immortal Nicholas Flamel: The Alchemyst', 'Michael Scott', 'Fantasy & Sci-Fi', 'Fiksi Genre Spesifik', 2),
    ('Dune', 'Frank Herbert', 'Fantasy & Sci-Fi', 'Fiksi Genre Spesifik', 2),
    ('Cloud Atlas', 'David Mitchell', 'Fantasy & Sci-Fi', 'Fiksi Genre Spesifik', 2),
    ('The Sound and The Fury', 'William Faulkner', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('A Series of Unfortunate Event 1: The Bad Beginning', 'Lemony Snicket', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('A Series of Unfortunate Event 2: The Reptile Room', 'Lemony Snicket', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('A Series of Unfortunate Event 3: The Wide Window', 'Lemony Snicket', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('A Series of Unfortunate Event 4: The Miserable Mill', 'Lemony Snicket', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('A Series of Unfortunate Event 5: The Austere Academy', 'Lemony Snicket', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('A Series of Unfortunate Event 6: The Ersatz Elevator', 'Lemony Snicket', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('A Series of Unfortunate Event 7: The Vile Village', 'Lemony Snicket', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('A Series of Unfortunate Event 8: The Hostile Hospital', 'Lemony Snicket', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('A Series of Unfortunate Event 9: The Carnivorous Carnival', 'Lemony Snicket', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('A Series of Unfortunate Event 10: The Slippery Slope', 'Lemony Snicket', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('A Series of Unfortunate Event 11: The Grim Grotto', 'Lemony Snicket', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('A Series of Unfortunate Event 12: The Penultimate Peril', 'Lemony Snicket', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('A Series of Unfortunate Event 13: The End', 'Lemony Snicket', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('Nightcrawling', 'Leila Mottley', 'Colonialism, Race, Class (Fict.)', 'Fiksi Genre Spesifik, Ilmu Sosial & Politik, Sejarah & Biografi', 2),
    ('Menyongsong Badai', 'Margarita García Robayo', 'Colonialism, Race, Class (Fict.)', 'Fiksi Genre Spesifik, Ilmu Sosial & Politik, Sejarah & Biografi', 2),
    ('The Majesties', 'Tiffany Tsao', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Sula', 'Toni Morrison', 'Colonialism, Race, Class (Fict.)', 'Fiksi Genre Spesifik, Ilmu Sosial & Politik, Sejarah & Biografi', 2),
    ('Paradise', 'Abdulrazak Gurnah', 'Colonialism, Race, Class (Fict.)', 'Fiksi Genre Spesifik, Ilmu Sosial & Politik, Sejarah & Biografi', 2),
    ('The White Tiger', 'Aravind Adiga', 'Colonialism, Race, Class (Fict.)', 'Fiksi Genre Spesifik, Ilmu Sosial & Politik, Sejarah & Biografi', 2),
    ('The God of Small Things', 'Arundhati Roy', 'Colonialism, Race, Class (Fict.)', 'Fiksi Genre Spesifik, Ilmu Sosial & Politik, Sejarah & Biografi', 2),
    ('How to Be a Revolutionary', 'C.A. Davis', 'Colonialism, Race, Class (Fict.)', 'Fiksi Genre Spesifik, Ilmu Sosial & Politik, Sejarah & Biografi', 2),
    ('The Promise', 'Damon Galgut', 'Colonialism, Race, Class (Fict.)', 'Fiksi Genre Spesifik, Ilmu Sosial & Politik, Sejarah & Biografi', 2),
    ('Go Set a Watchman', 'Harper Lee', 'Colonialism, Race, Class (Fict.)', 'Fiksi Genre Spesifik, Ilmu Sosial & Politik, Sejarah & Biografi', 2),
    ('Oeroeg', 'Hella S. Haasse', 'Colonialism, Race, Class (Fict.)', 'Fiksi Genre Spesifik, Ilmu Sosial & Politik, Sejarah & Biografi', 2),
    ('Best of Friends', 'Kamila Shamsie', 'Colonialism, Race, Class (Fict.)', 'Fiksi Genre Spesifik, Ilmu Sosial & Politik, Sejarah & Biografi', 2),
    ('Home Fire', 'Kamila Shamsie', 'On Womanhood', 'Ilmu Sosial & Politik, Pengembangan Diri', 2),
    ('Home Fire', 'Kamila Shamsie', 'Historical Fiction', 'Fiksi Sejarah', 2),
    ('Chunhyang', 'Jin Renshun', 'On Womanhood', 'Ilmu Sosial & Politik, Pengembangan Diri', 2),
    ('Pachinko', 'Min Jin Lee', 'Korean Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Clover', 'Na Hyerim', 'Korean Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Cursed Bunny', 'Bora Chung', 'Korean Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Every Day Is a Sunny Day When I Am with You', 'Bae Sung Tae', 'Korean Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Whale', 'Cheon Myeong-kwan', 'Korean Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Kim Ji-young, Born 1982', 'Cho Nam-joo', 'Korean Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('School Nurse Ahn Eunyoung', 'Chung Serang', 'Korean Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Kakakku, Bongsoon', 'Gong Ji-young', 'Korean Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Greek Lessons', 'Han Kang', 'Korean Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Vegetarian', 'Han Kang', 'Korean Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Human Acts', 'Han Kang', 'Korean Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('At Dusk', 'Hwang Sok-yong', 'Korean Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Brave New World', 'Aldous Huxley', 'Dystopian & Post-Apocalyptic', 'Fiksi Genre Spesifik', 2),
    ('This Is How You Lose The Time War', 'Amal El-Mohtar', 'Fantasy & Sci-Fi', 'Fiksi Genre Spesifik', 2),
    ('The Strain', 'Guillermo Del Toro, Chuck Hogan', 'Dystopian & Post-Apocalyptic', 'Fiksi Genre Spesifik', 2),
    ('The Transition', 'Luke Kennard', 'Dystopian & Post-Apocalyptic', 'Fiksi Genre Spesifik', 2),
    ('The Handmaid''s Tale', 'Margaret Atwood', 'Dystopian & Post-Apocalyptic', 'Fiksi Genre Spesifik', 2),
    ('World War Z', 'Max Brooks', 'Dystopian & Post-Apocalyptic', 'Fiksi Genre Spesifik', 2),
    ('Fahrenheit 451', 'Ray Bradbury', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Another Now', 'Yanis Varoufakis', 'Fantasy & Sci-Fi', 'Fiksi Genre Spesifik', 2),
    ('Remarkably Bright Creatures', 'Shelby Van Pelt', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Piranesi', 'Susanna Clarke', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Malibu Rising', 'Taylor Jenkins Reid', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Look Who''s Back', 'Timur Vermes', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Topics of Conversation', 'Miranda Popkey', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Prime of Miss Jean Brodie', 'Muriel Spark', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Exciting Times', 'Naoise Dolan', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Assembly', 'Natasha Brown', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('High Fidelity', 'Nick Hornby', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Charmed Wife', 'Olga Grushin', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Alone with You in the Ether', 'Olivie Blake', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('No One is Talking About This', 'Patricia Lockwood', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('When I''m Gone, Look for Me in the East', 'Quan Barry', 'World Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Pure Colour', 'Sheila Heti', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Dunia Sophie (2008)', 'Jostein Gaarder', 'Self Discovery', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 2),
    ('Fake Accounts', 'Lauren Oyler', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Writers & Lovers', 'Lily King', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Hamnet', 'Maggie O''Farrell', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Happy Hour', 'Marlowe Granados', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Comfort Book (Terj.)', 'Matt Haig', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Sorrow and Bliss', 'Meg Mason', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Crying in H Mart', 'Michelle Zauner', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('The Unbearable Lightness of Being', 'Harper Modern Classics', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Call Me By Your Name', 'André Aciman', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('orien', 'Bonnie Garmus', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Vanishing Half', 'Brit Bennett', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Americanah', 'Chimamanda Ngozi Adiche', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Small Things Like These', 'Claire Keegan', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('I Love You But I''ve Chosen Darkness', 'Claire Vaye Watkins', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('At Night All Blood is Black', 'David Diop', 'Colonialism, Race, Class (Fict.)', 'Fiksi Genre Spesifik, Ilmu Sosial & Politik, Sejarah & Biografi', 2),
    ('Our Wives Under the Sea', 'Julia Armfield', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Lost Daughter', 'Elena Ferrante', 'On Womanhood', 'Ilmu Sosial & Politik, Pengembangan Diri', 2),
    ('Oh William!', 'Elizabeth Strout', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Tomorrow, and Tomorrow, and Tomorrow', 'Gabrielle Zevin', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('All the Light We Cannot See', 'Anthony Doerr', 'Historical Fiction', 'Fiksi Sejarah', 2),
    ('The Historian - Sang Sejarawan', 'Elizabeth Kostova', 'Historical Fiction', 'Fiksi Sejarah', 2),
    ('The Odessa File', 'Frederick Forsyth', 'Historical Fiction', 'Fiksi Sejarah', 2),
    ('People of the Books', 'Grealdine Brooks', 'Historical Fiction', 'Fiksi Sejarah', 2),
    ('Astray', 'Emma Donoghue', 'Historical Fiction', 'Fiksi Sejarah', 2),
    ('The Stranger', 'Albert Camus', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Scarlett', 'Alexandra Ripley', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Death of a Salesman', 'Arthur Miller', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Walden Two', 'B.F. Skinner', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Hard Times', 'Charles Dickens', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Mary Barton', 'Elizabeth Gaskell', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('North and South', 'Elizabeth Gaskell', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Ladies Paradise', 'Émile Zola', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Great Gatsby', 'F. Scott Fitzgerald', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Great Gatsby (copy 2)', 'F. Scott Fitzgerald', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Middlemarch', 'George Eliot', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Keep The Aspidistra Flying', 'George Orwell', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Bergegas Mengudara', 'George Orwell', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Burmese Days', 'George Orwell', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Animal Farm', 'George Orwell', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Coming Up for Air', 'George Orwell', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Indiana', 'George Sand', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('One Hundred Years of Solitude', 'Gabriel García Márquez', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Persuasion', 'Jane Austen', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Sense and Sensibility', 'Jane Austen', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Northanger Abbey', 'Jane Austen', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('On the Road', 'Jack Kerouac', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Neraka Adalah Orang Lain', 'Jean Paul Sartre', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Little Women', 'Louisa May Alcott', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Good Wives', 'Louisa May Alcott', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Alchemist', 'Paulo Coelho', 'Self Discovery', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 2),
    ('The Catcher in the Rye', 'J.D.Salinger', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Jungle', 'Upton Sinclair', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Hunchback of Notre-Dame', 'Victor Hugo', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Mrs. Dalloway', 'Virginia Woolf', 'Russian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Lord of the Flies', 'William Golding', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('How Much Land Does a Man Need?', 'Leo Tolstoy', 'Russian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Little Girls are Wiser than Men', 'Leo Tolstoy', 'Russian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Crime and Punishment ENG', 'Fyodor Dostoevsky', 'Russian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Gambler', 'Fyodor Dostoevsky', 'Russian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Kejahatan dan Hukuman', 'Fyodor Dostoevsky', 'Russian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Haji Murad', 'Leo Tolstoy', 'Russian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Pecundang', 'Maxim Gorky', 'Russian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Jiwa-Jiwa Mati', 'Nikolai Gogol', 'Russian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Gulag', 'Solzhenitsyn', 'Russian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Lolita', 'Vladimir Nabokov', 'Russian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Kotagede', 'Revianto Budi Santosa', 'Travel', 'Nonfiksi Naratif, Sejarah & Biografi', 2),
    ('Half a Lifelong Romance', 'Eileen Chang', 'Chinese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Big Sister, Little Sister, Red Sister', 'Jung Chang', 'Chinese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Romance of the Three Kingdom', 'Lo Kuan-chung', 'Chinese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Red Sorghum', 'Mo Yan', 'Chinese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Di Bawah Bendera Merah', 'Mo Yan', 'Chinese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Dream of the Red Chamber', 'Tsao Hsueh-Chin', 'Chinese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('English', 'Wang Gang', 'Chinese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Babad Kopi Parahyangan', 'Evi Sri Rezeki', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Orang Orang Oetimu', 'Felix K. Nesi', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Rojak', 'Fira Basuki', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Enggan Jadi Keluarga Fasis', 'Frans Pascaries', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Amangkurat, Amangkurat', 'Goenawan Mohamad', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Hati Nurani Manusia', 'Idrus', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Semua untuk Hindia', 'Iksaka Banu', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Teh dan Pengkhianat', 'Iksaka Banu', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Ibuk,', 'Iwan Setyawan', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Lontar Anthology of Indonesian Short Stories', 'John H. McGlynn, Zen Hae, Andy Fuller', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Teori Tawa dan Cara-Cara Melucu Lainnya', 'Kai Elian', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Namaku Alam', 'Leila S. Chudori', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Perempuan: Kumpulan Cerita Pendek', 'Mochtar Lubis', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Manusia Indonesia', 'Mochtar Lubis', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Jalan Tak Ada Ujung', 'Mochtar Lubis', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Harimau! Harimau!', 'Mochtar Lubis', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Kiat Sukses Hancur Lebur', 'Martin Suryajaya', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Memang Jodoh', 'Marah Rusli', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Explosion Chronicles', 'Yan Lianke', 'Chinese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Dream of Ding Village', 'Yan Lianke', 'Chinese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Book of Goose', 'Yiyun Li', 'Chinese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('To Live', 'Yu Hua', 'Chinese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Brothers', 'Yu Hua', 'Chinese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Boy in The Twilight', 'Yu Hua', 'Chinese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Cries in The Drizzle', 'Yu Hua', 'Chinese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Chronicle of A Blood Merchant', 'Yu Hua', 'Chinese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Orang Orang Proyek', 'Ahmad Tohari', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Anak Rantau', 'A. Fuadi', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Waktu untuk Tidak Menikah', 'Amanatia Junda', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Bagaimana Cara Mengurangi Berat Badan', 'Amalia Yunus', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Siri''', 'Asmayani Kusrini', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Yang Tak Kunjung Usai', 'Awi Chin', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Manjali', 'Ayu Utami', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Anjas: Anak Kosan Jaksel', 'Candra Aditya', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Rectoverso', 'Dee Lestari', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Supernova: Kesatria, Putri, & Bintang Jatuh', 'Dee Lestari', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Lima Cerita: Kisah-Kisah Menjadi Dewasa', 'Desi Anwar', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Man Tiger', 'Eka Kurniawan', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Dongeng dari Sayap Kiri', 'Eka Kurniawan', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Tragedimu Komediku', 'Eka Kurniawan', 'Literary Criticism', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('O', 'Eka Kurniawan', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Norwegian Wood', 'Haruki Murakami', 'Japanese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Borrowed', 'Haruki Murakami', 'Japanese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Inter Ice Age 4', 'Kobe Abe', 'Japanese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Mild Vertigo', 'Mieko Kanai', 'Japanese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Botchan', 'Natsume Soseki', 'Japanese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Earthlings', 'Sayaka Murata', 'Japanese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Silence', 'Shusako Endo', 'Japanese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Before the Coffee Gets Cold', 'Toshikazu Kawaguchi', 'Japanese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Before the Coffee Gets Cold: Tales from the Cafe', 'Toshikazu Kawaguchi', 'Japanese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Kitchen (Terj)', 'Yoshimoto Banana', 'Japanese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Selamat Datang di Museum Penyiksaan', 'Yoko Ogawa, Hiromi Kawakami, Yuko Tsushima, Kono Taeko', 'Japanese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Privileged Ones', 'Mutiarini', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Tempurung', 'Oka Rusmini', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Entrok', 'Okky Madasari', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Years of the Voiceless', 'Okky Madasari', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Kerumunan Terakhir', 'Okky Madasari', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('86', 'Okky Madasari', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Arok Dedes', 'Pramoedya Ananta Toer', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Cerita Calon Arang', 'Pramoedya Ananta Toer', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('This Earth of Mankind', 'Pramoedya Ananta Toer', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Black Cat and Other Short Stories', 'Edgar Allan Poe', 'Pets!', 'Nonfiksi Naratif', 2),
    ('If Cats Disappeared From The World', 'Genki Kawamura', 'Pets!', 'Nonfiksi Naratif', 2),
    ('The Book Your Cat Wishes You Would Read', 'Lucy Hoile', 'Pets!', 'Nonfiksi Naratif', 2),
    ('The Writer''s Cats', 'Muriel Barbery, Maria Guitart', 'Pets!', 'Nonfiksi Naratif', 2),
    ('The Cat Who Saved Books', 'Sōsuke Natsukawa
', 'Pets!', 'Nonfiksi Naratif', 2),
    ('Gerombolan Kucing Bandel', 'Endah Raharjo (Terj.)', 'Pets!', 'Nonfiksi Naratif', 2),
    ('Tales from the Arabian Nights - Selected Tales', 'Andrew Lang', 'World Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Cinta Keindahan Kesunyian', 'Kahlil Gibran', 'World Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Aporisma - Kata-Kata Mutiara', 'Kahlil Gibran', 'World Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Sang Nabi, Sayap-Sayap Patah, Suara Sang Guru, Taman Sang Nabi', 'Kahlil Gibran', 'World Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('My First and Only Love', 'Sahar Khalifeh', 'World Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Seven Moons of Maali Almeida', 'Shehan Karunatilaka', 'World Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Year of the Runaways', 'Sunjeev Sahota', 'World Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Death of Bagrat Zakharych & Other Stories', 'Vazha-Pshavela', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Dilan: Dia adalah Dilanku Tahun 1990', 'Pidi Baiq', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Dilan: Dia adalah Dilanku Tahun 1991', 'Pidi Baiq', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Milea: Suara dari Dilan', 'Pidi Baiq', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Drunken Monster: Cacatnya Harian Pidi Baiq', 'Pidi Baiq', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Drunken Molen: Cacatnya Harian Pidi Baiq', 'Pidi Baiq', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('They Both Die at the End', 'Adam Silvera', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Pendekar Tanpa Bayangan Vol.1', 'Asmaraman S.Kho Ping Hoo', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Pendekar Tanpa Bayangan Vol.2', 'Asmaraman S.Kho Ping Hoo', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Pendekar Tanpa Bayangan Vol.3', 'Asmaraman S.Kho Ping Hoo', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Pendekar Tanpa Bayangan Vol.4', 'Asmaraman S.Kho Ping Hoo', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Pendekar Tanpa Bayangan Vol.5', 'Asmaraman S.Kho Ping Hoo', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Pendekar Tanpa Bayangan Vol.6', 'Asmaraman S.Kho Ping Hoo', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Pendekar Tanpa Bayangan Vol.7', 'Asmaraman S.Kho Ping Hoo', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Pendekar Tanpa Bayangan Vol.8', 'Asmaraman S.Kho Ping Hoo', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Pendekar Tanpa Bayangan Vol.9', 'Asmaraman S.Kho Ping Hoo', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Pendekar Tanpa Bayangan Vol.10', 'Asmaraman S.Kho Ping Hoo', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Pendekar Tanpa Bayangan Vol.11', 'Asmaraman S.Kho Ping Hoo', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Pendekar Tanpa Bayangan Vol.12', 'Asmaraman S.Kho Ping Hoo', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Pendekar Tanpa Bayangan Vol.13', 'Asmaraman S.Kho Ping Hoo', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Pendekar Tanpa Bayangan Vol.14', 'Asmaraman S.Kho Ping Hoo', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Pendekar Tanpa Bayangan Vol.15', 'Asmaraman S.Kho Ping Hoo', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Pendekar Tanpa Bayangan Vol.16', 'Asmaraman S.Kho Ping Hoo', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Pendekar Tanpa Bayangan Vol.17', 'Asmaraman S.Kho Ping Hoo', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Pendekar Tanpa Bayangan Vol.18', 'Asmaraman S.Kho Ping Hoo', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Pendekar Tanpa Bayangan Vol.19', 'Asmaraman S.Kho Ping Hoo', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Joy Luck Club', 'Amy Tan', 'Chinese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Elena Knows', 'Claudia Piñero', 'Crime & Mystery', 'Fiksi Genre Spesifik', 2),
    ('Ask Again, Yes', 'Mary Beth Keane', 'Family', 'Ilmu Sosial & Politik, Pengembangan Diri', 2),
    ('Gadis Kretek', 'Ratih Kumala', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Horrible Histories: Blitzed Brits', 'Terry Deary', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('Horrible Histories: Frightful First World War', 'Terry Deary', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('Horrible Histories: Woeful Second World War', 'Terry Deary', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('Horrible Histories: Barmy British Empire', 'Terry Deary', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('Horrible Histories: Villainous Victorians', 'Terry Deary', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('Horrible Histories: Vile Victorians', 'Terry Deary', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('Horrible Histories: Gorgeous Georgians', 'Terry Deary', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('Horrible Histories: Slimy Stuarts', 'Terry Deary', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('Horrible Histories: Terrible Tudors', 'Terry Deary', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('Horrible Histories: Measly Middle Ages', 'Terry Deary', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('Horrible Histories: Increadible Incas', 'Terry Deary', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('Horrible Histories: Angry Aztecs', 'Terry Deary', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('Horrible Histories: Stormin'' Normans', 'Terry Deary', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('Horrible Histories: Vicious Vikings', 'Terry Deary', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('Horrible Histories: Smashing Saxons', 'Terry Deary', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('Horrible Histories: Cut-Throat Celts', 'Terry Deary', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('Horrible Histories: Rotten Romans', 'Terry Deary', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('Horrible Histories: Groovy Greeks', 'Terry Deary', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Horrible Histories: Awesome Egyptians', 'Terry Deary', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Horrible Histories: Savage Stone Age', 'Terry Deary', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Saga dari Samudra', 'Ratih Kumala', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Wesel Pos', 'Ratih Kumala', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Na Willa: Serial Catatan Kemarin', 'Reda Gaudiamo', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Kerudung Merah Kirmizi', 'Remy Sylado', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Parijs Van Java', 'Remy Sylado', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Ca Bau Kan', 'Remy Sylado', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('120 Detik Mendengar Kecemburuan di Lampu Merah Gejayan', 'Riska Kahiyang', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Tandus', 'S. Rukiah', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Age of Vice', 'Deepit Kapoor', 'Crime & Mystery', 'Fiksi Genre Spesifik', 2),
    ('Manuscript Found in Accra', 'Paulo Coelho', 'Self Discovery', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 2),
    ('By the River Piedra I Sat Down and Wept', 'Paulo Coelho', 'Self Discovery', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 2),
    ('Aleph', 'Paulo Coelho', 'Self Discovery', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 2),
    ('The Only One Left', 'Riley Sager', 'Crime & Mystery', 'Fiksi Genre Spesifik', 2),
    ('Dilarang Menyanyi di Kamar Mandi', 'Seno Gumira Ajidarma', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Hatta: Aku Datang Karena Sejarah', 'Sergius Sutanto', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Yang Tak Kunjung Padam', 'Soe Tjeng Marching', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Manusia Bebas', 'Suwarsih Djojopuspito', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Tetap Saja Kusebut (Dia) Cinta', 'Tasaro G.K.', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Daun yang Jatuh Tak Pernah Membenci Angin', 'Tere Liye', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Tentang Kamu', 'Tere Liye', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Hingga Ujung Cakrawala', 'Titi Sanaria', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Sherlock Holmes: Kasus Misteri Harta Warisan', 'Sir Arthur Conan Doyle', 'Crime & Mystery', 'Fiksi Genre Spesifik', 2),
    ('Sherlock Holmes: Memburu Dokumen Rahasia Inggris', 'Sir Arthur Conan Doyle', 'Crime & Mystery', 'Fiksi Genre Spesifik', 2),
    ('The Best of Sherlock Holmes', 'Sir Arthur Conan Doyle', 'Crime & Mystery', 'Fiksi Genre Spesifik', 2),
    ('The Professor and the Madman', 'Simon Winchester', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('The Devotion of Suspect X', 'Keigo Higashino', 'Japanese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Angsa dan Kelelawar', 'Keigo Higashino', 'Japanese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('A Midsummer''s Equation', 'Keigo Higashino', 'Japanese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Sweetness of the Bottom of the Pie', 'Alan Bradley', 'Crime & Mystery', 'Fiksi Genre Spesifik', 2),
    ('The Da Vinci Code (terj)', 'Dan Brown', 'Crime & Mystery', 'Fiksi Genre Spesifik', 2),
    ('Malaikat dan Iblis', 'Dan Brown', 'Crime & Mystery', 'Fiksi Genre Spesifik', 2),
    ('Deception Point (Titik Muslihat)', 'Dan Brown', 'Crime & Mystery', 'Fiksi Genre Spesifik', 2),
    ('Digital Fortress', 'Dan Brown', 'Crime & Mystery', 'Fiksi Genre Spesifik', 2),
    ('The Secret History', 'Donna Tart', 'Crime & Mystery', 'Fiksi Genre Spesifik', 2),
    ('The Testament', 'John Grisham', 'Crime & Mystery', 'Fiksi Genre Spesifik', 2),
    ('Rencana Besar untuk Mati Dengan Tenang', 'Wisnu Suryaning Adji', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Beasts of a Little Land', 'Juhea Kim', 'Korean Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('I Went to See My Father', 'Kyung-Sook Shin', 'Korean Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Please Look After Mother', 'Kyung-Sook Shin', 'Korean Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Island of Sea Women', 'Lisa See', 'Korean Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Love in the Big City', 'Sang Young Park', 'Korean Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Almond', 'Won-Pyung Sohn', 'Korean Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Find Me', 'André Aciman', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Hello Beautiful', 'Ann Napolitano', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Cleopatra and Frankenstein', 'Coco Mellors', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('It Ends with Us', 'Colleen Hoover', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Lying Life of Adults', 'Elena Ferrante', 'On Womanhood', 'Ilmu Sosial & Politik, Pengembangan Diri', 2),
    ('Boulder', 'Eva Baltasar', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Yellowface', 'R. F. Kuang', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Midnight Library', 'Matt Haig', 'Self Discovery', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 2),
    ('On Earth We''re Briefly Gorgeous', 'Ocean Vuong', 'Colonialism, Race, Class (Fict.)', 'Fiksi Genre Spesifik, Ilmu Sosial & Politik, Sejarah & Biografi', 2),
    ('My Year of Rest and Relaxation', 'Ottessa Moshfegh', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Someone Who Will Love You in All Your Damaged Glory', 'Raphael Bob-Waksberg', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Conversations with Friends', 'Sally Rooney', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2);

-- Batch 5/8 (Records 2001-2500)
INSERT INTO books (title, author, category, general_category, library_id) VALUES
    ('Beautiful World Where Are You', 'Sally Rooney', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Never Let Me Go', 'Kazuo Ishiguro', 'Japanese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('There''s No Such Thing as an Easy Job', 'Kikuko Tsumura', 'Japanese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Heaven', 'Mieko Kawakami', 'Japanese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Breasts and Eggs', 'Mieko Kawakami', 'Japanese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Convenience Store Woman (Terj.)', 'Sayaka Murata', 'Japanese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Memory Police', 'Yoko Ogawa', 'Japanese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Botanist''s Daughter', 'Kayte Nunn', 'Family', 'Ilmu Sosial & Politik, Pengembangan Diri', 2),
    ('I''m A Fan', 'Sheena Patel', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('NW', 'Zadie Smith', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Every Rising Sun', 'Jamila Ahmed', 'World Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Talented Mr Ripley', 'Patricia Highsmith', 'Crime & Mystery', 'Fiksi Genre Spesifik', 2),
    ('Dark Places', 'Grillian Flynn', 'Crime & Mystery', 'Fiksi Genre Spesifik', 2),
    ('Days at the Morisaki Bookshop', 'Satoshi Yagisawa', 'Japanese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The State and The City', 'Ted Robert Gurr', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('The Swimmers', 'Julie Otsuka', 'Family', 'Ilmu Sosial & Politik, Pengembangan Diri', 2),
    ('The Silk House', 'Kayte Nunn', 'Historical Fiction', 'Fiksi Sejarah', 2),
    ('Black Butterflies', 'Priscilla Morris', 'Historical Fiction', 'Fiksi Sejarah', 2),
    ('The American Prison Business', 'Jessica Mitford', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Small is Beautiful', 'Ernst F. Schumacher', 'Business', 'Bisnis & Manajemen, Ekonomi', 2),
    ('The Invention of Wings', 'Sue Monk Kidd', 'Colonialism, Race, Class (Fict.)', 'Fiksi Genre Spesifik, Ilmu Sosial & Politik, Sejarah & Biografi', 2),
    ('Catching Fire: How Cooking Made Us Human', 'Richard W. Wrangham', 'Science', 'Ilmu Pengetahuan Alam & Teknologi', 2),
    ('Life and Labour in the Nineteenth Century', 'C.R. Fay', 'History', 'Sejarah & Biografi', 2),
    ('Cherry', 'Nico Walker', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('A Nietzsche Reader', 'Friedrich Nietzsche
', 'Philosophy', 'Filsafat & Etika', 2),
    ('Parable of Sower', 'Octavia E. Butler', 'Dystopian & Post-Apocalyptic', 'Fiksi Genre Spesifik', 2),
    ('Do We Need Economic Inequality?', 'Danny Dorling', 'Critiques on Capitalism', 'Ekonomi, Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('Plunder of the Commons: A Manifesto for Sharing Public Wealth', 'Guy Standing', 'Climate Change', 'Ilmu Pengetahuan Alam & Teknologi, Ilmu Sosial & Politik', 2),
    ('Demon Copperhead', 'Barbara Kingsolver', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Prophet Song', 'Paul Lynch', 'Dystopian & Post-Apocalyptic', 'Fiksi Genre Spesifik', 2),
    ('The Class Ceiling: Why It Pays to Be Privileged', 'Sam Friedman, Daniel Laurison', 'Critiques on Capitalism', 'Ekonomi, Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('Learned Optimism: How to Change Your Mind and Your Life', 'Martin E.P. Seligman', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('The First Decade: My Journey from Blogger to Entrepreneur', 'Vivy Yusof', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Humanizing the Economy: Co-operative in the Age of Capital', 'John Restakis', 'Critiques on Capitalism', 'Ekonomi, Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('The Sentence', 'Louise Erdrich', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('We All Want Impossible Things', 'Catherine Newman
', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Stone Blind', 'Natalie Haynes', 'Fantasy & Sci-Fi', 'Fiksi Genre Spesifik', 2),
    ('The Marriage Portrait', 'Maggie O''Farrell
', 'Historical Fiction', 'Fiksi Sejarah', 2),
    ('Foster', 'Claire Keegan', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Saha', 'Cho Nam-joo', 'Korean Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Stay True', 'Hua Hsu', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Diary of a Tuscan Bookshop', 'Alba Donati', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Babel', 'R.F. Kuang', 'Fantasy & Sci-Fi', 'Fiksi Genre Spesifik', 2),
    ('Normal People', 'Sally Rooney', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Mission Economy: A Moonshot Guide to Changing Capitalism', 'Mariana Mazzucato', 'Critiques on Capitalism', 'Ekonomi, Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('Miss Peregrine''s Peculiar Children', 'Ransom Riggs', 'Fantasy & Sci-Fi', 'Fiksi Genre Spesifik', 2),
    ('Hollow City', 'Ransom Riggs', 'Fantasy & Sci-Fi', 'Fiksi Genre Spesifik', 2),
    ('Library of Souls', 'Ransom Riggs', 'Fantasy & Sci-Fi', 'Fiksi Genre Spesifik', 2),
    ('A Map of Days', 'Ransom Riggs', 'Fantasy & Sci-Fi', 'Fiksi Genre Spesifik', 2),
    ('The Conference of The Birds', 'Ransom Riggs', 'World Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Desolations of Devil''s Acre', 'Ransom Riggs', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('On Palestine', 'Noam Chomsky, Ilan Pappe', 'Colonialism', 'Sejarah & Biografi, Ilmu Sosial & Politik', 2),
    ('1984', 'George Orwell', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('1984 (Terj.)', 'George Orwell', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('A Little Life', 'Hanya Yanagihara', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Perempuan Patah Hati yang Kembali Menemukan Cinta Melalui Mimpi', 'Eka Kurniawan', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('In the Dream House', 'Carmen Maria Machado', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('I''m Glad My Mom Died', 'Jennette McCurdy', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('How to Respect Myself', 'Honggyun Yun', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('The Book of Disquiet', 'Fernando Pessoa', 'Romance', 'Fiksi Kontemporer & Klasik', 2),
    ('The Self-Driven Child: The Science and Sense of Giving Your Kids More Control Over Their Lives', 'William Stixrud', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Summer', 'Edith Wharton', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Empireland: How Imperialism has Shaped Modern Britain', 'Sathnam Sanghera', 'History', 'Sejarah & Biografi', 2),
    ('Conversations on Love', 'Natasha Lunn', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Destiny Disrupted: A History of the World Through Islamic Eyes', 'Tamim Ansary', 'History', 'Sejarah & Biografi', 2),
    ('Kim Jiyoung, Born 1982', 'Cho Nam-joo', 'Korean Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('As Long as The Lemon Trees Grow', 'Zoulfa Katouh', 'World Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('How to Grow Old: Kebijaksanaan Klasik untuk Usia Pasca-Paruh Baya', 'Marcus Tullius Cicero', 'Philosophy', 'Filsafat & Etika', 2),
    ('Deng Xiaoping and the Transformation of China', 'Ezra F. Vogel', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Talking to My Daughter - A Brief History of Capitalism (2)', 'Yanis Varoufakis', 'Critiques on Capitalism', 'Ekonomi, Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('The $100 Startup: Reinvent the Way You Make a Living, Do What You Love, and Create a New Future', 'Chris Guillebeau', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Bumi yang Tak Dapat Dihuni - Kisah tentang Masa Depan (The Uninhabitable Earth)', 'David Wallace-Wells', 'Climate Change', 'Ilmu Pengetahuan Alam & Teknologi, Ilmu Sosial & Politik', 2),
    ('Lelaki Harimau', 'Eka Kurniawan', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Kota Kucing dan Kisah-kisah Lainnya', 'Haruki Murakami', 'Pets!', 'Nonfiksi Naratif', 2),
    ('Heart Sutra', 'Yan Lianke', 'Chinese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('To Kill A Mockingbird', 'Harper Lee', 'Colonialism, Race, Class (Fict.)', 'Fiksi Genre Spesifik, Ilmu Sosial & Politik, Sejarah & Biografi', 2),
    ('My Brilliant Friend', 'Elena Ferante', 'On Womanhood', 'Ilmu Sosial & Politik, Pengembangan Diri', 2),
    ('Selat Malaka: Sejarah Perdagangan & Etnisitas', 'Leonard Y. Andaya', 'History', 'Sejarah & Biografi', 2),
    ('Malam Seribu Jahanam', 'Intan Paramaditha', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Our Women on the Ground: Essays by Arab Women Reporting from the Arab World', 'Zahra Hankir', 'Feminism', 'Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('The Hundred Years'' War on Palestine: A History of Settler-Colonial Conquest and Resistance, 1917-2017', 'Rashid Khalidi', 'Colonialism', 'Sejarah & Biografi, Ilmu Sosial & Politik', 2),
    ('Why I Write', 'George Orwell', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Peace Movement in Islam', 'Juan R.I. Cole, Arman Tarmizi (Translator)', 'Religions', 'Agama', 2),
    ('How To Focus', 'Thich Nhat Hanh', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Educated', 'Tara Westover', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Anak Tiga Zaman: Rekam Jejak', 'Daoed Joesoef', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Kitab Kawin', 'Laksmi Pamuntjak', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Pulang', 'Leila S. Chudori', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('To the Lighthouse', 'Virginia Woolf', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Panenka', 'Ronan Hession', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Lebih Putih Dariku', 'Dido Michielsen, Martha Dwi Susilowati (penerjemah)', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The World on A Plate - 40 Cuisines, 100 Recipes and the Stories Behind Them', 'Mina Holland', 'Travel', 'Nonfiksi Naratif, Sejarah & Biografi', 2),
    ('Maps of Our Spectacular Bodies', 'Maddie Mortimer', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Aroma Karsa', 'Dee Lestari', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Circe', 'Madeline Miller', 'Fantasy & Sci-Fi', 'Fiksi Genre Spesifik', 2),
    ('RIFQA', 'Mohammed El-Kurd', 'Colonialism, Race, Class (Fict.)', 'Fiksi Genre Spesifik, Ilmu Sosial & Politik, Sejarah & Biografi', 2),
    ('The Ballad of Songbirds and Snakes', 'Suzanne Collins', 'Dystopian & Post-Apocalyptic', 'Fiksi Genre Spesifik', 2),
    ('Amnesty', 'Aravind Adiga', 'Colonialism, Race, Class (Fict.)', 'Fiksi Genre Spesifik, Ilmu Sosial & Politik, Sejarah & Biografi', 2),
    ('To Room Nineteen', 'Doris Lessing', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Tabi', 'Marchella FP', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Laut Bercerita', 'Leila S. Chudori', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Negeri Para Bedebah', 'Tere Liye', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Ten Myths About Israel', 'Ilan Pappe', 'Colonialism', 'Sejarah & Biografi, Ilmu Sosial & Politik', 2),
    ('Cantik itu Luka', 'Eka Kurniawan', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Kekasih Musim Gugur', 'Laksmi Pamuntjak', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('In The Middle of Everything', 'Lala Bohang', 'Poetry & Literary Criticism', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('Factfulness - Sepuluh Alasan Kita Keliru tentang Dunia—Dan Mengapa Segalanya Lebih Baik Daripada yang Kita Kira', 'Hans Rosling', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Lelaki-Lelaki Tanpa Perempuan', 'Haruki Murakami', 'Japanese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Eldest - Yang Pertama', 'Christopher Paolini', 'Fantasy & Sci-Fi', 'Fiksi Genre Spesifik', 2),
    ('Eragon', 'Christopher Paolini', 'Fantasy & Sci-Fi', 'Fiksi Genre Spesifik', 2),
    ('Siapa yang Datang ke Pemakamanku Saat Aku Mati Nanti?', 'Kim Sang-hyun', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Supernova: Gelombang', 'Dee Lestari', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Membunuh Commendatore', 'Haruki Murakami', 'Japanese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('IQ84', 'Haruki Murakami', 'Japanese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Perawan Remaja dalam Cengkeraman Militer', 'Pramoedya Ananta Toer', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Gie Dan Surat-Surat Yang Tersembunyi', 'Tim Buku TEMPO', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Perempuan Rok Ungu', 'Imamura Matsuko', 'Japanese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Siapa yang Datang ke Pemakamanku Saat Aku Mati Nanti? Copy 2', 'Kim Sang-hyun', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Barterleby Si Juru Tulis', 'Herman Melville', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Penance', 'Minato Kanae', 'Japanese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('My Crazy Feminist Girlfriend', 'Min Ji-hyoung', 'Feminism', 'Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('Don''t Let Your Mood Become Your Attitude', 'Lemon Psychology', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('The World Called Children', 'Kim Soyoung', 'Education', 'Ilmu Sosial & Politik, Pengembangan Diri', 2),
    ('Absolute Justice', 'Akiyoshi Rikako', 'Japanese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Bone', 'Mijin Jung', 'Korean Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Kitchen', 'Banana Yoshimoto', 'Japanese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Girls in the Dark', 'Akiyoshi Rikako', 'Japanese literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Emotional Blackmail', 'Zhou Mu-zi', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Where the Wild Ladies Are', 'Matsuda Aoko', 'Japanese literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Motherhood', 'Minato Kanae', 'Poetry & Literary Criticism', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('On Children', 'Wu Xiaole', 'Chinese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Menagerie 5', 'Laura Arkeman', 'Poetry & Literary Criticism', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('Kakakku, Bongsoon', 'Gong Ji-Young', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Confessions', 'Minato Kanae', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Tiga Dalam Kayu', 'Ziggy Zesyazeoviennazabrizkie', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Aku Bukannya Menyerah, Hanya Sedang Lelah', 'GuelBaewo', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Benny Moerdani yang Belum Terungkap', 'Seri Tempo', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Saman', 'Ayu Utami', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Peradaban Tionghoa Selayang Pandang', 'Nio joe Lan', 'History', 'Sejarah & Biografi', 2),
    ('Kisah Orang-Orang Capricorn', 'Ayu Utami', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Matinya Kepakaran', 'Tom Nichols', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Milk and honey', 'Rupi Kaur', 'Poetry & Literary Criticism', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('Pulau Batu di Samudra Buatan', 'Ziggy Zesyazeoviennazabrizkie', 'Indonesian literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Wali Berandal Tanah Jawa', 'George Quinn', 'Indonesian literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Si Parasit Lajang', 'Ayu Utami', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Menagerie 4', 'Laura Arkeman', 'Poetry & Literary Criticism', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('Larung', 'Ayu Utami', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Laut Bercerita (copy 2)', 'Leila S. Chudori', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Nyala', 'Alnurul Gheulia, Ibrahmi M. A.', 'Religions', 'Agama', 2),
    ('Edensor', 'Andrea Hirata', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Nabi Muhammad Juga Manusia', 'Khalid Muhammad Khalid', 'Religions', 'Agama', 2),
    ('China, Inc Bagaimana Kedigdayaan China Menentang Amerika dan Dunia', 'Ted C. Fishman', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Islam Sebagai Dasar Negara', 'Mohammad Natsir', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Islam dan Sosialisme', 'HOS Tjokroaminoto', 'Religions', 'Agama', 2),
    ('The Mistery of The Blue Arrows', 'Chuck & David Mckee', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Houdini the Disappearing Hamster', 'Terence blacker', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('Ronggeng Dukuh Paruk', 'Ahmad Tohari', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Magical Collection', 'Enid Blyton', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('Keeper of The Lost Cities Unlocked', 'Shannon Messenger', 'Fantasy & Sci-Fi', 'Fiksi Genre Spesifik', 2),
    ('Masalalu Selalu Aktual Jilid II', 'P. Swantoro', 'History', 'Sejarah & Biografi', 2),
    ('Sel: Eksplorasi Kedokteran dan Manusia Baru', 'Siddharta Mukherjee', 'Science', 'Ilmu Pengetahuan Alam & Teknologi', 2),
    ('Kartun Fisika', 'Larry Gonick & Art Huffman', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Tiga Manula Keliling Jawa', 'Benny Rachmadi', 'Travel', 'Nonfiksi Naratif, Sejarah & Biografi', 2),
    ('Hierofani', 'Kris Budiman', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Kartun (Non) Komunikasi', 'Larry Gonick', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Agus Salim: Diplomat Jenaka Penopang Republik', 'Tim Buku TEMPO', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Menuntaskan Sengketa Tanah: Melalui Pengadilan Khusus Pertanahan', 'Elza Syarief', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Belantik', 'Ahmad Tohari', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('At Home: A Short History of Private Life', 'Bill Bryson', 'History', 'Sejarah & Biografi', 2),
    ('Sang Pemimpi', 'Andrea Hirata', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Pearl', 'John Steinbeck', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Perempuan-Perempuan Perkasa', 'Peter Carey & Vincent Houben', 'Feminism', 'Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('Dunia Sukab', 'Seno Gumira Ajidarma', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Cinta di Dalam Gelas', 'Andrea Hirata', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Pot-Bouille', 'Emile Zola', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Buruh dan Intelektual', 'Michele Ford', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('The Fraud', 'Zadie Smith', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Marriage Plot', 'Jeffrey Eugenides', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Tidak Ada Manusia Jahat di Dunia Ini', 'Won Jaehoon', 'Korean Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Just Transformations: Grassroots Struggles for Alternative Futures', 'Iokine Rodriguez', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Kiat Menjadi Diktator', 'Mikal Hem', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Flourish', 'Antonia Case', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Ragam Akal Budi: Memahami Kesadaran', 'Daniel C. Dennett', 'Science', 'Ilmu Pengetahuan Alam & Teknologi', 2),
    ('Who Wants To Be a Rational Investor', 'Lukas Setia Atmaja', 'Religions', 'Agama', 2),
    ('Kartun Genetika: Panduan Grafis untuk Memahami Genetika dan DNA', 'Mark Schultz', 'Science', 'Ilmu Pengetahuan Alam & Teknologi', 2),
    ('40 on Justice', 'Omar Suleiman', 'Religions', 'Agama', 2),
    ('Islam and the Problems of the Youth', 'Imam Muhammad Said Ramadan al-Buti', 'Religions', 'Agama', 2),
    ('Bilangan Fu', 'Ayu Utami', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('KENDURI - Tracing The Origin of Indonesian Cuisine', 'Vita Datau Messakh', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Effortless - Karena Tak Semua Harus Sesulit Itu', 'Greg McKeown', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Menjadi: Seni Membangun Kesadaran tentang Diri dan Sekitar', 'Afutami', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Twenty-Four Eyes - Dua Belas Pasang Mata', 'Sakae Tsuboi', 'Japanese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('How To Avoid A Climate Disaster', 'Bill Gates', 'Climate Change', 'Ilmu Pengetahuan Alam & Teknologi, Ilmu Sosial & Politik', 2),
    ('Humankind - Sejarah Penuh Harapan', 'Rutger Bregman', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Hujan Bulan Juni', 'Sapardi Djoko Damono', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Pranaraksa - Program Konservasi Keanekaragaman Buah Langka Nusantara', 'ASTRA - Pusat Penelitian Bioteknologi LIPI', 'Science', 'Ilmu Pengetahuan Alam & Teknologi', 2),
    ('Totto-chan: Gadis Cilik di Jendela', 'Tetsuko Kuroyanagi', 'Poetry & Literary Criticism', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('Solilokui - Kumpulan Esai Sastra', 'Budi Darma', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Puisi Cinta dari Negeri Selatan', 'Itaru Ogasawara', 'Poetry & Literary Criticism', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('Perjalanan Menuju Pulang: Kisah Perempuan di Antara Ruang & Waktu', 'Lala Bohang & Lara Nuberg', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Mata Hari', 'Paulo Coelho', 'Historical Fiction', 'Fiksi Sejarah', 2),
    ('Antologi Rasa', 'Ika Natassa', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('A Very Yuppy Wedding', 'Ika Natassa', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Twivortiare', 'Ika Natassa', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Twivortiare 2', 'Ika Natassa', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Man`s Search For Meaning', 'Victor E. Frankl', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('The Malay Archipelago', 'Alfred Russel Wallace', 'Science', 'Ilmu Pengetahuan Alam & Teknologi', 2),
    ('Sex and Reason', 'Richardo A. Posner', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Supernova: Akar', 'Dee Lestari', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Republic', 'Plato', 'Philosophy', 'Filsafat & Etika', 2),
    ('Si Parasit Lajang (copy 2)', 'Ayu Utami', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The 48 Laws Of Power', 'Robert Greene', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Silent Spring', 'Rachel Carson', 'Science', 'Ilmu Pengetahuan Alam & Teknologi', 2),
    ('Filosofi Kopi', 'Dee Lestari', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Ones Who Walk Away From Omelas', 'Ursula K.Le Guin', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Jazz, Parfum, dan Insiden', 'Seno Gumira Ajidarma', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Self-Driven Child', 'William Stixrud & Ned Johnson', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Twenty-Four Eyes', 'Sakae Tsuboi', 'Japanese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('So Late in the Day: Stories of Women and Men', 'Claire Keegan', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Blindness', 'Jose Saramago', 'Dystopian & Post-Apocalyptic', 'Fiksi Genre Spesifik', 2),
    ('The Evolution of Cooperation', 'Robert Axelrod', 'Critiques on Capitalism', 'Ekonomi, Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('Sila Ke-6; Kreatif sampai mati', 'Wahyu Aditya', 'Arts & Architecture', 'Seni', 2),
    ('The Odyssey', 'Homer', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Designhers: A Celebration of Women in Design Today', 'Victionary', 'Arts & Architecture', 'Seni', 2),
    ('Aku Ini Binatang Jalang', 'Chairil Anwar', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Di Kaki Bukit Cibalak', 'Ahmad Tohari', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Maya', 'Ayu Utami', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Such a Fun Age', 'Kiley Reid', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Black Heart of Jamaica', 'Julia Golding', 'Historical Fiction', 'Fiksi Sejarah', 2),
    ('Lukisan Dorian Gray', 'Oscar Wlide', 'Western Classic Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Socrates Express - Menjaga Kewarasan di Tengah Ketidakpastian', 'Eric Weiner', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Sapiens: A Graphic History Volume 1', 'Yuval Noah Harari', 'Graphic Novels', 'Fiksi Kontemporer & Klasik, Seni', 2),
    ('Kaizen', 'Niken Shinta', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('The Thames & Hudson Introduction To Art', 'Debra J. Dewitte', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Quran And Woman', 'Amina Wadud- Muhsin', 'Religions', 'Agama', 2),
    ('Salvage the Bones', 'Jesmyn Ward', 'Family', 'Ilmu Sosial & Politik, Pengembangan Diri', 2),
    ('News of A Kidnapping', 'Gabriel Garcia Marquez', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('City of Girls', 'Elizabeth Gilbert', 'On Womanhood', 'Ilmu Sosial & Politik, Pengembangan Diri', 2),
    ('Teknik Pendekatan Desain Bentuk Estetik Arsitektural', 'F.X. Budiwidodo Pangarso - Y. Roni Sugiarto', 'Arts & Architecture', 'Seni', 2),
    ('The Essential Principles of Graphic Design', 'Debbie Millman', 'Arts & Architecture', 'Seni', 2),
    ('Indonesian Architects - Volume, Mobility, Investment, Interaction, Environment', 'Imelda Akmal', 'Arts & Architecture', 'Seni', 2),
    ('Tegang Bentang - Seratus Tahun Perspektif Arsitektural di Indonesia', 'Pusat Dokumentasi Arsitektur Indonesia', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Album Bandung Tempo Doeloe', 'Sudarsono Katam & Lulus Abadi', 'Poetry & Literary Criticism', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('Around the World in Eighty Days', 'Jules Verne', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Upaya-Upaya yang Lantang', 'Kata Puan & Adriel Arizon', 'Poetry & Literary Criticism', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('Istri Konsul', 'Nh. Dini', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Epigrams of Oscar Wilde', 'Oscar Wilde', 'Poetry & Literary Criticism', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('Harry Potter and The Sorcerer''s Stone', 'JK Rowling', 'Fantasy & Sci-Fi', 'Fiksi Genre Spesifik', 2),
    ('Harry Potter and The Chamber of Secrets', 'JK Rowling', 'Fantasy & Sci-Fi', 'Fiksi Genre Spesifik', 2),
    ('Harry Potter and The Prisoner of Azzkaban', 'JK Rowling', 'Fantasy & Sci-Fi', 'Fiksi Genre Spesifik', 2),
    ('Harry Potter and The Order of The Phoenix', 'JK Rowling', 'Fantasy & Sci-Fi', 'Fiksi Genre Spesifik', 2),
    ('Harry Potter and The Half-Blood Prince', 'JK Rowling', 'Religions', 'Agama', 2),
    ('Harry Potter and The Deathly Hallows', 'JK Rowling', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('A Unique Pedagogical Approach in The Qur''an', 'Imam Muhammad Said Ramadan al-Buti', 'Religions', 'Agama', 2),
    ('The Creative Spark: Bagaimana Imajinasi Mengarahkan Evolusi Manusia', 'Agustin Fuentes', 'Science', 'Ilmu Pengetahuan Alam & Teknologi', 2),
    ('Asal Mula: Terjadinya Alam Semesta, Galaksi, Tata Surya, dan Kita', 'Neil DeGrasse Tyson', 'Science', 'Ilmu Pengetahuan Alam & Teknologi', 2),
    ('Homo Deus: Masa Depan Umat Manusia', 'Yuval Noah Harari', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Kanker: Biografi Suatu Penyakit', 'Siddhartha Mukherjee', 'Science', 'Ilmu Pengetahuan Alam & Teknologi', 2),
    ('The Geography of Bliss', 'Eric Weiner
', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Why? People: Marie Curie', 'Hyeonjong PARK', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Moonbound: Apollo 11 and the Dream of Spaceflight', 'Jonathan Fetter-Vorm', 'Science', 'Ilmu Pengetahuan Alam & Teknologi', 2),
    ('Inheritance: How Our Genes Change Our Lives—and Our Lives Change Our Genes', 'Sharon Moalem', 'Science', 'Ilmu Pengetahuan Alam & Teknologi', 2),
    ('Kartun Kimia', 'Larry Gonick, Craig Criddle', 'Science', 'Ilmu Pengetahuan Alam & Teknologi', 2),
    ('My Stroke of Insight: A Brain Scientist''s Personal Journey', 'Jill Bolte Taylor', 'Science', 'Ilmu Pengetahuan Alam & Teknologi', 2),
    ('Guns, Germs & Steel (Bedil, Kuman, & Baja)', 'Jared Diamond', 'History', 'Sejarah & Biografi', 2),
    ('Origin', 'Dan Brown', 'Crime & Mystery', 'Fiksi Genre Spesifik', 2),
    ('Stuff Matters', 'Mark Miodownik', 'Science', 'Ilmu Pengetahuan Alam & Teknologi', 2),
    ('A Brief History of Time', 'Stephen Hawking', 'Science', 'Ilmu Pengetahuan Alam & Teknologi', 2),
    ('Dunia Sophie Novel Grafis Filsafat: Dari Socrates hingga Galileo', 'Jostein Gaarder', 'Graphic Novels', 'Fiksi Kontemporer & Klasik, Seni', 2),
    ('The Body: Pedoman Bagi Penghuni', 'Bill Bryson', 'Science', 'Ilmu Pengetahuan Alam & Teknologi', 2),
    ('Elementary: The Periodic Table Explained', 'James M. Russell', 'Science', 'Ilmu Pengetahuan Alam & Teknologi', 2),
    ('Estetika Paradoks', 'Jakob Sumardjo', 'Arts & Architecture', 'Seni', 2),
    ('Af+ermasks', 'Hanafi', 'Arts & Architecture', 'Seni', 2),
    ('Sejarah Klasik Dunia Timur', 'Victor Duruy', 'History', 'Sejarah & Biografi', 2),
    ('Coretanino Bandung Travel Sketch', 'Nino Puriando', 'Travel', 'Nonfiksi Naratif, Sejarah & Biografi', 2),
    ('Coretanino Bali Travel Sketch', 'Nino Puriando', 'Science', 'Ilmu Pengetahuan Alam & Teknologi', 2),
    ('The Tell -Tale Brain Unlocking the Mistery of Human Nature', 'V.S. Ramachandran', 'Science', 'Ilmu Pengetahuan Alam & Teknologi', 2),
    ('Cerita Hantu Klasik', 'Vic Parker', 'Crime & Mystery', 'Fiksi Genre Spesifik', 2),
    ('Beyond Contemporary Art', 'Etan Jonathan Ilfeld', 'Arts & Architecture', 'Seni', 2),
    ('Kritik Seni - Wacana Apresiasi dan Kreasi', 'Dr. Nooryan Bahari, M. Sn', 'Arts & Architecture', 'Seni', 2),
    ('Humor at Work - Kerja Gembira, Usaha Berjaya', 'Danny Septriadi, et. al', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('This is Not A Book', 'Keri Smith', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('The Book of Executor - Guided Planner Designed for Achieving One Specific Dream', 'Poppy''s Dream', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Tirani Demokrasi', 'Sapardi Djoko Damono', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Membicarakan Feminisme', 'Nadya Karima Melati', 'Feminism', 'Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('Digital Minimalism', 'Cal Newport', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Pralaya', 'Liu Cixin', 'Chinese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Trisurya', 'Liu Cixin', 'Chinese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Belantara : The Dark Forest', 'Liu Cixin', 'Chinese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Orientalism', 'Edward W. Said', 'Philosophy', 'Filsafat & Etika', 2),
    ('TED Talks: The Official TED Guide to Public Speaking', 'Chris Anderson', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('An Intimate History of Humanity', 'Theodore Zeldin', 'History', 'Sejarah & Biografi', 2),
    ('Lessons in Chemistry', 'Bonnie Garmus', 'Feminism', 'Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('William Shakespeare: The Complete Plays in One Sitting', 'Joelle Herr', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Supernova: Intelegensi Embun Pagi', 'Dee Lestari', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Padang Bulan', 'Andrea Hirata', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Coretanino Bandung', 'Nino Puriando', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Nadira', 'Leila S. Chudori', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('The Sociology of the Indonesian Novel 1920-1955', 'C. W. Watson', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('The Work of Mourning', 'Jacques Derrida', 'Philosophy', 'Filsafat & Etika', 2),
    ('Kisah Seorang Pedagang Darah', 'Yu Hua', 'Chinese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Filosofi Teras - Filsafat Yunani-Romawi Kuno untuk Mental Tangguh Masa Kini', 'Henry Manampiring', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Bermula dari Cerita Abah - Pemikiran Islam, Politik Islam, dan Islam Tradisi', 'Muhammad Iqbal', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Leila Khaled - Kisah Perjuang Perempuan Palestina', 'Sarah Irving', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('When Marnie Was There - Kala Marnie Ada', 'Joan G. Robinson', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Sunda Abad Ke-19 - Tafsir atas Ilustrasi-ilustrasi Junghuhn', 'Hawe Setiawan', 'History', 'Sejarah & Biografi', 2),
    ('Kapten Hanya Ingin Ke Dili', 'Felix K. Nesi', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Winarta', 'Basuki Gunawan', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Gagal Menjadi Manusia', 'Osamu Dazai', 'Japanese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Anjing-Anjing yang Setia - Lima Cerita Anjing dari Lima Penulis Dunia', 'Stephen Crane, et. al', 'Pets!', 'Nonfiksi Naratif', 2),
    ('Eleanor Oliphant Is Completely Fine', 'Gail Honeyman', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Bukan 350 Tahun Dijajah', 'GJ. Resink', 'History', 'Sejarah & Biografi', 2),
    ('3 Tahun', 'Anton Chekov', 'Russian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Desawarna - Saduran Kakawin Nagarakertagama Untuk Bacaan Remaj', 'Mpu Prapanca, Mien Ahmad Rifai', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Save The Cat! Writes A Novel', 'Blake Snynder', 'Education', 'Ilmu Sosial & Politik, Pengembangan Diri', 2),
    ('The Medici - Godfathers of the Renaissance', 'Paul Strathern', 'History', 'Sejarah & Biografi', 2),
    ('Good Arguments - How Debate Teaches Us to Listen and Be Heard', 'Bo Seo', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Beyond the Sea', 'Paul Lynch', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Doughnut Economics - Seven Ways to Think Like a 21st Century Economist', 'Kate Raworth', 'Critiques on Capitalism', 'Ekonomi, Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('Grief is The Thing With Feathers', 'Max Porter', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Birnam Wood', 'Eleanor Catton', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Days of Abandonment', 'Elena Ferrante', 'On Womanhood', 'Ilmu Sosial & Politik, Pengembangan Diri', 2),
    ('The Story of the Lost Child', 'Elena Ferrante', 'On Womanhood', 'Ilmu Sosial & Politik, Pengembangan Diri', 2),
    ('Those Who Leave and Those Who Stay', 'Elena Ferrante', 'On Womanhood', 'Ilmu Sosial & Politik, Pengembangan Diri', 2),
    ('Babi Babi Babi', 'Supartika', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('All The Lovers in The Night', 'Mieko Kawakami', 'Japanese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Crazy Rich Asian', 'Kevin Kwan', 'World Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('24 Jam Bersama Gaspar', 'Sabda Armando', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Loneliest Girl in the Universe', 'Lauren James', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Mayflies', 'Andrew O''Hagan', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Natural Beauty', 'Ling Ling Huang', 'Chinese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Embedded Autonomy', 'Peter Evans', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('White Nights', 'Fyodor Dostoyevsky', 'Russian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Metamorphosis and Other Stories', 'Franz Kafka', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Governing the Commons', 'Elinor Ostrom', 'Critiques on Capitalism', 'Ekonomi, Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('Cerita Bergambar Totto-chan 1', 'Tetsuko Kuroyanagi', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Cerita Bergambar Totto-chan 2', 'Tetsuko Kuroyanagi', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Kesusastraan, Kehancuran', 'Martin Suryajaya', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Aku Mengeong', 'Wawan Kurniawan', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Kepikiran Dangdut dan Hal-Hal Pop Lainnya', 'Mahfud Ikhwan', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Student Hidjo', 'Mas Marco Kartodikromo', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Epigram 60', 'Joko Pinurbo', 'Poetry & Literary Criticism', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('Perjamuan Khong Guan', 'Joko Pinurbo', 'Poetry & Literary Criticism', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('The Snatch and The Snapped; Yang Terampas dan yang Putus', 'Chairil Anwar', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Perihal Gendis', 'Sapardi Djoko Damono', 'Poetry & Literary Criticism', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('Salah Piknik', 'Joko Pinurbo', 'Poetry & Literary Criticism', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('Islam yang Saya Anut', 'M. Quraish Shihab', 'Religions', 'Agama', 2),
    ('Miti and the Japanese Miracle', 'Chalmers Johnson', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Everyone Brave is Forgiven', 'Chris Cleave', 'Historical Fiction', 'Fiksi Sejarah', 2),
    ('Cerita Cerita Jakarta', 'Maesy Ang', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Mimi Lemon -- cerita-cerita Cyntha Hariadi', 'Cyntha Hariadi', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Lucifer! Lucifer!', 'Venerdi Handoyo', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Semasa', 'Teddy W. Kusuma & Maesy Ang', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Na Willa dan hari-hari ramai', 'Reda Gaudiamo', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Na Willa dan rumah dalam gang', 'Reda Gaudiamo', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Na Willa', 'Reda Gaudiamo', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Talented Mr. Ripley', 'Patricia Highsmith', 'Crime & Mystery', 'Fiksi Genre Spesifik', 2),
    ('We are nowhere and it`s wow.', 'Mikael Johani', 'Poetry & Literary Criticism', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('Aku, Meps, dan Beps', 'Soca Sobhita & Reda', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Seesaw', 'Timothy Ogene', 'World Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Memburu Manusia Ekonomi, Menggeledah Naluri', 'B. Herry- Priyono', 'Critiques on Capitalism', 'Ekonomi, Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('Kajian Gender dalam Konteks Pascakolonialisme', 'Katrin Bandel', 'Feminism', 'Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('Menarasikan Indonesia', 'New Naratif', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Renungan dan Perjuangan', 'Sultan Sjahrir', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Habis Malam Terbitlah Puisi', 'Egy Resa', 'Poetry & Literary Criticism', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('Seperti Aku Mengenalmu', 'Egy Resa', 'Poetry & Literary Criticism', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('Chega!', 'CAVR', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('THE BANDUNG SPIRIT - MOVING ON THE TIDE OF HISTORY', 'Dr H. Roeslan Abdulgani', 'Colonialism', 'Sejarah & Biografi, Ilmu Sosial & Politik', 2),
    ('The Factory', 'Hiroko Oyamada', 'Japanese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Kisah Pejuang Perempuan Palestina', 'Leila Khaled', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Fairy Tales and Stories', 'H.C Andersen', 'Fantasy & Sci-Fi', 'Fiksi Genre Spesifik', 2),
    ('Humankind - A Hopeful History', 'Rutger Bregman', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('The 7 Habits of Highly Effective People', 'Stephen R. Covey', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Adolf 1', 'Osamu Tezuka', 'Historical Fiction', 'Fiksi Sejarah', 2),
    ('Adolf 2', 'Osamu Tezuka', 'Historical Fiction', 'Fiksi Sejarah', 2),
    ('Anak Semua Bangsa', 'Pramoedya Ananta Toer', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Tanah dan Air Sunda', 'Hawe Setiawan', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Asal Usul Manusia', 'Richard Leakey', 'Science', 'Ilmu Pengetahuan Alam & Teknologi', 2),
    ('The Intelligent Investor', 'Benjamin Graham', 'Business', 'Bisnis & Manajemen, Ekonomi', 2),
    ('Rijsttafel - Budaya Kuliner di Indonesia Masa Kolonial 1870 - 1942', 'Fadly Rahman', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Psychology of Money (Terj.)', 'Morgan Housel', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Percakapan Paling Panjang Perihal Pulang Pergi', 'Theoresia Rumthe & Weslly Johannes', 'Poetry & Literary Criticism', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('Pesona Sejarah Bandung - Perkebunan di Priangan', 'M. Ryzki Wiryawan', 'History', 'Sejarah & Biografi', 2),
    ('Dial A For Aunties', 'Jesse Q Sutanto', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Art of Feeling Better', 'Matilda Haeindow', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Memori Sang Primadona', 'Evelyn Faniya', 'Crime & Mystery', 'Fiksi Genre Spesifik', 2),
    ('Penebusan', 'Misha F. Ruli', 'Crime & Mystery', 'Fiksi Genre Spesifik', 2),
    ('Pasien', 'Naomi Midori', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Ngapain Jadi Orang Baik', 'Michael Schur', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Teach Like Finland', 'Timothy D. Walker', 'Education', 'Ilmu Sosial & Politik, Pengembangan Diri', 2),
    ('Menjadi Diri Sendiri - Pendekatan Psikologi Analitis', 'Carl Gustav Jung', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Emak - Perempuan Minang Tiga Zaman', 'Rizal Malik', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Company of One - Why Staying Small is the Next Big Thing for Business', 'Paul Jarvis', 'Business', 'Bisnis & Manajemen, Ekonomi', 2),
    ('Calm - The harmony and serenity we crave', 'The School of Life', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('The History of The Decline and Fall of The Roman Empire', 'Edward Gibbon', 'History', 'Sejarah & Biografi', 2),
    ('Four Thousand Weeks - Time Management for Mortals', 'Oliver Burkeman', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Knowing What We Know - The Transmission of Knowledge from Ancient Wisdom to Modern Magic', 'Simon Winchester', 'History', 'Sejarah & Biografi', 2),
    ('Rapijali 1', 'Dee Lestari', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Rapijali 2', 'Dee Lestari', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Rapijali 3', 'Dee Lestari', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Kambing dan Hujan', 'Mahfud Ikhwan', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Persib dan Ilusi Sulanjana', 'Rizki Sanjaya', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Buku Pegangan Mencari Kerja', 'Dadang Ari Murtono', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Atomic Habits Terj.', 'James Clear', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Harry Potter and the Goblet of Fire', 'J. K. Rowling', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Raden Mandasia Si Pencuri Daging Sapi', 'Yusi Avianto Pareanom', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Orang-Orang Bloomington', 'Budi Dharma', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Petualangan Naif dan Mesin Waktu : "Radio Antik"', 'Franki Indrasmoro', 'Graphic Novels', 'Fiksi Kontemporer & Klasik, Seni', 2),
    ('Pramoedya Ananta Toer: Yang Berumah dalam Buku', 'Muhidin M. Dahlan', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Freakonomics', 'Steven D. Levitt & Stephen J. Dubner', 'Critiques on Capitalism', 'Ekonomi, Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('Tangerine Green', 'Cho Nam Joo', 'Korean Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Labor of Love: The Invention of Dating', 'Moira Weigel', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('India: A Wounded Civilization', 'V.S. Naipaul', 'History', 'Sejarah & Biografi', 2),
    ('Ogilvy on Advertising', 'David Ogilvy', 'Business', 'Bisnis & Manajemen, Ekonomi', 2),
    ('Inward Sin: The Greatest Danger in The Lives of Muslims', 'Imam Muhammad Sa''id Ramadan al-Buti', 'Religions', 'Agama', 2),
    ('Le Petit Prince', 'Antoine De Saint-Exupery', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Bones to Ashes', 'Kathy Reichs', 'Crime & Mystery', 'Fiksi Genre Spesifik', 2),
    ('Perjalanan Mustahil Samiam dari Lisboa', 'Zaky Yamani', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Museum Teman Baik', 'Ruhaeni Intan, et.al', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Harry Potter and The Philosopher''s Stone', 'J.K. Rowling', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('Three Apples Fell From The Sky', 'Narine Abgaryan', 'World Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Perjalanan Mustahil Samiam dari Lisboa Sepasang Elang dari Diyarbakir', 'Zaky Yamani', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Discipline and Punish: The Birth of The Prison', 'Michel Foucault', 'History', 'Sejarah & Biografi', 2),
    ('Babel (Terj)', 'R.F. Kuang', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('1000 Years of Joys and Sorrows', 'Ai Weiwei', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Wiji Thukul - Teka-teki Orang Hilang', 'Seri Buku Saku TEMPO', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Lalita', 'Ayu Utami', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Rekayasa Buah', 'Rio Johan', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Laskar Pelangi', 'Andrea Hirata', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Negeri 5 Menara', 'A. Fuadi', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Ranah 3 Warna', 'A. Fuadi', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Rantau 1 Muara', 'A. Fuadi', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('To Heal is To Accept', 'Adi K.', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Wajah Bandoeng Tempo Doeloe', 'Haryoto Kunto', 'History', 'Sejarah & Biografi', 2),
    ('The Architecture of Love', 'Ika Natassa', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Passion Is Nothing', 'Rene Suhartono', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Ladang Perminus', 'Ramadhan KH', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Kesastraan Melayu Tionghoa dan Kebangsaan Indonesia - Jilid 1', 'Marcus A.S & Pax Benedanto', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Kesastraan Melayu Tionghoa dan Kebangsaan Indonesia - Jilid 2', 'Marcus A.S & Pax Benedanto', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Kesastraan Melayu Tionghoa dan Kebangsaan Indonesia - Jilid 3 (Drama di Boven Digul)', 'Kwee Tek Hoay', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Kesastraan Melayu Tionghoa dan Kebangsaan Indonesia - Jilid 4 (Empat Karya Kwee Tek Hoay)', 'Kwee Tek Hoay', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Kesastraan Melayu Tionghoa dan Kebangsaan Indonesia - Jilid 5 (Riwayat Empat Tokoh Tionghoa Masa Lampau)', 'Marcus A.S & Pax Benedanto', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Kesastraan Melayu Tionghoa dan Kebangsaan Indonesia - Jilid 6', 'Marcus A.S & Pax Benedanto', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Kesastraan Melayu Tionghoa dan Kebangsaan Indonesia - Jilid 7', 'Marcus A.S & Yul Harmiyanto', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Kesastraan Melayu Tionghoa dan Kebangsaan Indonesia - Jilid 8', 'Marcus A.S & Yul Harmiyanto', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Kesastraan Melayu Tionghoa dan Kebangsaan Indonesia - Jilid 9', 'Marcus A.S & Yul Harmiyanto', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Kesastraan Melayu Tionghoa dan Kebangsaan Indonesia - Jilid 10', 'Marcus A.S & Pax Benedanto', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Salah Pilih', 'Nur St. Iskandar', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Hikayat Kadiroen', 'Semaoen', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Sengsara Membawa Nikmat', 'Tulis St. Sati', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Salah Asuhan', 'Abdoel Moeis', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Dian yang Tak Kunjung Padam', 'Sutan Takdir Alisjahbana', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Tak Putus Dirundung Malang', 'Sutan Takdir Alisjahbana', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Anak Perawan Disarang Penyamun', 'Sutan Takdir Alisjahbana', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Layar Terkembang', 'Sutan Takdir Alisjahbana', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Belenggu', 'Armijn Pane', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Kisah Antara Manusia', 'Armijn Pane', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Tenggelamnya Kapal Van Der Wijck', 'Hamka', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Tuan Direktur', 'Hamka', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Di Bawah Lindungan Ka''bah', 'Hamka', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Antologi Cerpen Indonesia Jilid 1: Masa Pra-Kemerdekaan-1965', 'John H. McGlynn, Zen Hae, Andy Fuller', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Manifesto Wacana Kiri', 'Nur Sayyid Santoso Kristeva, M.A', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Gone Girl', 'Gillian Flynn', 'Crime & Mystery', 'Fiksi Genre Spesifik', 2),
    ('Demokrasi Kita', 'Mohammad Hatta', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Gongka - Cerita Cerita dari Pecinan Jakarta', 'Frisca Saputra', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Larasati', 'Pramoedya Ananta Toer', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('goenawan mohamad diujung bahasa : antologi puisi 1961 - 2022', 'Goenawan Mohamad', 'Poetry & Literary Criticism', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('Sentimentalisme Calon Mayat', 'Sony Karsono', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Sjahrir - Peran Besar Bung Kecil', 'Seri Buku Saku TEMPO', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('How Proust Can Change Your Life', 'Alain de Botton', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Performance Without Passion Is Meaningless', 'Rene Suhardono & Team Impact Factory', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Orang Makan Orang - Kibul-Kibul Budaya Politik', 'Seno Gumira Ajidarma', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Merahnya Merah', 'Iwan Simatupang', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Sandhyakala Ning Majapahit', 'Sanusi Pane', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Kawan Bergelut', 'Suman HS', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Surapati', 'Abdoel Moeis', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Robert Anak Surapati', 'Abdoel Moeis', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Bukan Pasar Malam', 'Pramoedya Ananta Toer', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Midah, Simanis Bergigi Emas', 'Pramoedya Ananta Toer', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Atheis', 'Achdiat K. Mihardja', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Dari Ave Maria ke Jalan Lain ke Roma', 'Idrus', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Dimsum Terakhir', 'Clara Ng', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Summer In Seoul', 'Illana Tan', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Kau Menjadi Aku', 'Nabilla Anasty Fahzaria', 'Poetry & Literary Criticism', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('Perlahan Meninggalkan Gelembung', 'Hapsari Eby', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Cerita Detektif Inspektur Jamal', 'Achmad Saerozi A.M.', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Kapankah Kesusasteraan Indonesia Lahir', 'Ajip Rosidi', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Anak Bajang Menggiring Angin', 'Sindhunata', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Antologi Cerpen Indonesia Jilid 2: Masa Orde Baru dan Sesudahnya, 1965-2000', 'John H. McGlynn, Zen Hae, Andy Fuller', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Sri Sumarah', 'Umar Kayam', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Stasiun', 'Putu Wijaya', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Raumanen', 'Marianne Katoppo', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Kapai Kapai', 'Arifin C. Noer', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Balada si Roy - Joe', 'Gola Gong', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Ular dan Kabut', 'Ajip Rosidi', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Karmila', 'Marga T', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Lupus - Tangkaplah Daku, Kau Kujitak!', 'Hilman', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Lupus - Tragedi Sinemata', 'Hilman', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Lupus - Bangun Dong Lupus!', 'Hilman', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Lupus - Makhluk Manis Dalam Bis', 'Hilman', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2);

-- Batch 6/8 (Records 2501-3000)
INSERT INTO books (title, author, category, general_category, library_id) VALUES
    ('Lupus - Ih, Sereeem!', 'Hilman', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Lupus - Candlelight Dinner', 'Hilman', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Lupus ABG', 'Hilman, Boim', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Lupus Kecil - Rumpi Kala Hujan', 'Hilman, Boim', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Lupus Kecil - Duit Lebaran', 'Hilman, Boim', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Lupus Kecil - Sunatan Masal', 'Hilman, Boim', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Lupus Kecil - Bolos', 'Hilman, Boim', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Lulu - Sohib Gaib', 'Hilman, Boim, Gusur', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Lulu - SMA Elite', 'Hilman, Boim, Gusur', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Arjuna Mencari Cinta', 'Yudhistira Anm Massardi', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Para Priyayi', 'Umar Kayam', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Adam Ma''rifat', 'Danarto', 'Indonesian Literature', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Langkah-Langkah Menuju Kemajuan', 'A.S. Abdullah', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('A Guide Book To Express Love Language', 'Meina Tan', 'Psychology & Self Help', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Lauk Daun', 'Hartari', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Kejatuhan Dan Hati', 'S. Rukiah', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Sitti Nurbaya (Kisah Tak Sampai)', 'Marah Rusli', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('5 Cm', 'Donny Dhirgantoro', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Cossacks and The Raid', 'Leo Tolstoy', 'Russian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Oxford Reads Kafka', 'Franz Kafka', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Laila Tak Pulang', 'Abi Ardianda', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Lampuki', 'Arafat Nur', 'Indonesian Literature', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Corat-coret di Toilet', 'Eka Kurniawan', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Dari Blora ke Siberia', 'Soesilo toer', 'Memoirs & Biography', 'Fiksi Sejarah', 2),
    ('Seperti Dendam Rindu Harus Dibayar Tuntas', 'Eka Kurniawan', 'Indonesian Literature', 'Ilmu Sosial & Politik, Pengembangan Diri', 2),
    ('Figures in the Sand', 'Janice Elliot', 'Historical Fiction', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('New York Libralogue', 'Dyah Dyanita', 'Education', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Perempuan yang menangis kepada bulan hitam', 'Diab Purnomo', 'Indonesian Literature', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('How Do You Live?', 'Genzaburo Yoshino', 'Japanese Literature', 'Seni', 2),
    ('When Things Dont Go Your Way', 'Haemin Sunim', 'Psychology & Self Help', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Doodle For Your Journal', 'Asrika Vitawati', 'Arts & Architecture', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Momotaro', 'Akutagawa Ryunosuke', 'Japanese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Giselle', 'Akiyoshi Rikako', 'Japanese Literature', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Naomi', 'Tanizaki Junichiro', 'Japanese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Sudah Kau Urus Uangmu, Nak?', 'Park So Yeon', 'Psychology & Self Help', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('My (not so) Perfect Life', 'Sophie Kinsella', 'Western Contemporary Lit.', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('The Good Daughter', 'Karin Slaughter', 'Western Contemporary Lit.', 'Nonfiksi Naratif', 2),
    ('When Breath Becomes Air', 'Paul Kalanithi', 'Memoirs & Biography', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Travelling Cat Chronicles', 'Hiro Arikawa', 'Pets!', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Convenience Store Woman', 'Sayaka Murata', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('About Us', 'Sinead Moriarty', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Lonely Castle in the Mirror', 'Mizuki Tsujimura', 'Japanese Literature', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Lukisan Dorian Gray', 'Oscar Wilde', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Seorang Pria yang Melalui Duka dengan Mencuci Piring', 'dr. Andreas Kurniawan', 'Psychology & Self Help', 'Fiksi Genre Spesifik', 2),
    ('The Course of Love', 'Alain de Botton', 'Western Contemporary Lit.', 'Fiksi Genre Spesifik', 2),
    ('Rumah Lebah', 'Ruwi Meita', 'Crime & Mystery', 'Fiksi Genre Spesifik', 2),
    ('Nostalgia Merah', 'M. Fadli', 'Crime & Mystery', 'Fiksi Genre Spesifik', 2),
    ('Sebelas Babak', 'Daras', 'Crime & Mystery', 'Fiksi Genre Spesifik', 2),
    ('A Friend''s Goodwill', 'Denkus', 'Crime & Mystery', 'Fiksi Genre Spesifik', 2),
    ('Creepy Case Club', 'Rizal Iwan', 'Crime & Mystery', 'Fiksi Genre Spesifik', 2),
    ('Misteri Mamoli Kuno', 'Agnes Bemoe', 'Crime & Mystery', 'Fiksi Genre Spesifik', 2),
    ('Reset', 'L. Zeth', 'Crime & Mystery', 'Fiksi Genre Spesifik', 2),
    ('Podcase', 'Lia Nurida', 'Crime & Mystery', 'Fiksi Genre Spesifik', 2),
    ('Rencana Besar', 'Tsugaeda', 'Crime & Mystery', 'Fiksi Genre Spesifik', 2),
    ('Sisi Liar', 'Tsugaeda', 'Crime & Mystery', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Subliminal Assassin', 'Finn R.', 'Crime & Mystery', 'Fiksi Genre Spesifik', 2),
    ('Laila Tak Pulang (copy 2)', 'Abi Ardianda', 'Indonesian Literature', 'Fiksi Genre Spesifik', 2),
    ('Jejak Balak', 'Ayu Welirang', 'Crime & Mystery', 'Fiksi Genre Spesifik', 2),
    ('Playing Victim', 'Eva Sri Rahayu', 'Crime & Mystery', 'Fiksi Genre Spesifik', 2),
    ('Vermilion Rain', 'Kai Ellan', 'Crime & Mystery', 'Fiksi Genre Spesifik', 2),
    ('Arum Manis', 'Teguh Affandi', 'Crime & Mystery', 'Fiksi Genre Spesifik', 2),
    ('Histery', 'Chandra Bientang, et al', 'Crime & Mystery', 'Fiksi Genre Spesifik', 2),
    ('Sang Peramal', 'Chandra Bientang', 'Crime & Mystery', 'Fiksi Genre Spesifik', 2),
    ('Pemburu Halimun', 'Rezawardhana', 'Crime & Mystery', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Suicide Knot', 'Vie Asano', 'Crime & Mystery', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Misteri Rumah Tertawa', 'Wini Afianti', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('A Guide Book to Dream', 'Desy Rachma', 'Psychology & Self Help', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 2),
    ('Life of Pi', 'Yann Martel', 'World Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Alchemist (copy 2)', 'Paulo Coelho', 'Self Discovery', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Anne of Green Gables', 'Lucy M. Montgomery', 'Western Classics', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 2),
    ('The Secret Garden', 'Frances Hodgson Burnett', 'Western Classics', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 2),
    ('The Ringmaster''s Daughter', 'Jostein Gaarder', 'Self Discovery', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 2),
    ('The Castle in the Pyrenees', 'Jostein Gaarder', 'Self Discovery', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 2),
    ('Sophie''s World', 'Jostein Gaarder', 'Self Discovery', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Maya', 'Jostein Gaarder', 'Self Discovery', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('A Guide Book To Find Yourself', 'Luc Diana', 'Psychology & Self Help', 'Fiksi Genre Spesifik', 2),
    ('A Guide Book To Be a Beginner', 'Luc Diana', 'Psychology & Self Help', 'Fiksi Genre Spesifik', 2),
    ('The Secrets of The Immortal Nicholas Flamel: The Magician', 'Michael Scott', 'Fantasy & Sci-Fi', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('The Secrets of The Immortal Nicholas Flamel: The Necromancer', 'Michael Scott', 'Fantasy & Sci-Fi', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('A Guide Book To Set Boundaries', 'Agnes Chin', 'Psychology & Self Help', 'Fiksi Genre Spesifik', 2),
    ('Mata Gelap', 'Mas Marco Kartodikromo', 'Indonesian Literature', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 2),
    ('The Tourist (Turis)', 'Olen Steinhauer', 'Crime & Mystery', 'Fiksi Genre Spesifik', 2),
    ('The Five People You Meet In Heaven', 'Mitch Albom', 'Self Discovery', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('The Time Keeper', 'Mitch Albom', 'Fantasy & Sci-Fi', 'Fiksi Genre Spesifik', 2),
    ('Tuesday with Morrie (Selasa Bersama Morrie)', 'Mitch Albom', 'Memoirs & Biography', 'Fiksi Genre Spesifik', 2),
    ('Never Let Me Go (Jangan Lepaskan Aku)', 'Kazuo Ishiguro', 'Dystopian & Post-Apocalyptic', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 2),
    ('The Adventure of the Christmas Pudding (Skandal Perjamuan Natal)', 'Agatha Christie', 'Crime & Mystery', 'Fiksi Genre Spesifik', 2),
    ('Dunia Sophie (2018)', 'Jostein Gaarder', 'Self Discovery', 'Fiksi Sejarah', 2),
    ('The Girl With The Dragon Tattoo', 'Stieg Larsson', 'Crime & Mystery', 'Fiksi Genre Spesifik', 2),
    ('Imperium', 'Robert Harris', 'Historical Fiction', 'Filsafat & Etika', 2),
    ('The Bartimaeus Trilogy #1 - The Amulet of Samarkand (Amulet Samarkand)', 'Maurice LeBlanc', 'Fantasy & Sci-Fi', 'Fiksi Genre Spesifik', 2),
    ('A Cabinet of Philosophical Curiosities', 'Roy Sorensen', 'Philosophy', 'Fiksi Genre Spesifik', 2),
    ('Tunnels - Will Burrows dan Koloni Misterius Bawah Tanah', 'Roderick Gordon & Brian Williams', 'Fantasy & Sci-Fi', 'Fiksi Genre Spesifik', 2),
    ('The Bartimaeus Trilogy #1 - The Amulet of Samarkand (Amulet Samarkand)', 'Jonathan Stroud', 'Fantasy & Sci-Fi', 'Fiksi Genre Spesifik', 2),
    ('The Bartimaeus Trilogy #2 - The Golem''s Eye (Mata Golem)', 'Jonathan Stroud', 'Fantasy & Sci-Fi', 'Fiksi Sejarah', 2),
    ('The Bartimaeus Trilogy #3 - Ptolemy''s Gate (Gerbang Ptolemy)', 'Jonathan Stroud', 'Fantasy & Sci-Fi', 'Fiksi Sejarah', 2),
    ('The Last Secret', 'Maia Caron', 'Historical Fiction', 'Fiksi Sejarah', 2),
    ('Gajah Mada - Bergelut dalam Kemelut Takhta dan Angkara', 'Langit Kresna Hadi', 'Historical Fiction', 'Fiksi Sejarah', 2),
    ('Gajah Mada - Madakaripura Hamukti Moksa', 'Langit Kresna Hadi', 'Historical Fiction', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Candi Murca - Air Terjun Seribu Angsa', 'Langit Kresna Hadi', 'Historical Fiction', 'Fiksi Genre Spesifik', 2),
    ('Ramayana', 'C. Rajagopalachari', 'World Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Neverwhere - Kota Antah Berantah', 'Neil Gaiman', 'Fantasy & Sci-Fi', 'Ilmu Pengetahuan Alam & Teknologi', 2),
    ('Bilangan Fu (copy 2)', 'Ayu Utami', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Connectome - How the Brain''s Wiring Makes Us Who We Are', 'Sebastian Seung', 'Science', 'Fiksi Genre Spesifik', 2),
    ('William Shakespeare on The Art of Love - The Illustrated Edition', 'Michael Best', 'Western Classics', 'Fiksi Genre Spesifik', 2),
    ('Brisingr', 'Christoper Paolini', 'Fantasy & Sci-Fi', 'Fiksi Genre Spesifik', 2),
    ('Inheritance', 'Christoper Paolini', 'Fantasy & Sci-Fi', 'Seni', 2),
    ('The Inheritance Almanac', 'Michael Macaulay', 'Fantasy & Sci-Fi', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Mollie Makes How To Knit - Go from beginner to expert with 20 news project', 'Mollie Makes', 'Arts & Architecture', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Conversations with Friends (Versi Terjemahan)', 'Sally Rooney', 'Western Contemporary Lit.', 'Sejarah & Biografi', 2),
    ('Beautiful World, Where Are You (Versi Terjemahan)', 'Sally Rooney', 'Western Contemporary Lit.', 'Fiksi Genre Spesifik', 2),
    ('Estates An Intimate History', 'Lynsey Hanley', 'History', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Body in the Library', 'Agatha Christie', 'Crime & Mystery', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Intermezzo', 'Sally Rooney', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('AKU - Berdasarkan Perjalan Hidup Karya Penyair Chairil Anwar', 'Sjuman Djaya', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('La Grande Borne', 'Nh. Dini', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Bandung Menjelang Pagi', 'Brian Khrisna', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Home Sweet Loan', 'Almira Bastari', 'Indonesian Literature', 'Fiksi Genre Spesifik', 2),
    ('Tarian Bumi', 'Oka Rusmini', 'Indonesian Literature', 'Seni', 2),
    ('Battle Royale', 'Koushun Takami', 'Fantasy & Sci-Fi', 'Nonfiksi Naratif, Sejarah & Biografi', 2),
    ('Vincent van Gogh - The Work, The Man, The Visionary', 'Diederick van Eck', 'Arts & Architecture', 'Bisnis & Manajemen, Ekonomi', 2),
    ('Indonesia Etc.', 'Elizabeth Pisani', 'Travel', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Originals - How non-conformists change the world', 'Adam Grant', 'Business', 'Ilmu Pengetahuan Alam & Teknologi', 2),
    ('The Compass - Filosofi Arette', 'Henry Manampiring', 'Psychology & Self Help', 'Ilmu Sosial & Politik', 2),
    ('Taking the Work Out of Networking', 'Karen Wickre', 'Science', 'Ilmu Sosial & Politik, Pengembangan Diri', 2),
    ('Sepakbola Tak Akan Pulang', 'Mahfud Ikhwan', 'Politics & Sociology', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Creative Writing', 'A.S. Laksana', 'Education', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Kumpulan Sajak', 'Goenawan Mohamad', 'Indonesian Literature', 'Fiksi Genre Spesifik', 2),
    ('How To Win Friends & Influence People', 'Dale Carnegie', 'Psychology & Self Help', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Teka-Teki Rumah Aneh', 'Uketsu', 'Crime & Mystery', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Iblis di Pekarangan', 'Akiyoshi Rikako', 'Indonesian Literature', 'Sejarah & Biografi', 2),
    ('Never Let Me Go', 'Kazuo Ishiguro', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Jakarta Method', 'Vincent Bevins', 'History', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Eleanor & Park', 'Rainbow Rowell', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Gentayangan', 'Intan Paramaditha', 'Indonesian Literature', 'Sejarah & Biografi', 2),
    ('Dongeng Betawi Tempo Doeloe', 'Abdul Chaer', 'Indonesian Literature', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Naturalis Jerman di Tanah Priangan', 'Muhammad Malik Ar Rahiem', 'History', 'Fiksi Genre Spesifik', 2),
    ('Surat Surat Rahasia', 'Tan Malaka', 'Memoirs & Biography', 'Sejarah & Biografi', 2),
    ('The Shadow of Sakura', 'Fino Y. K.', 'Crime & Mystery', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Metode Jakarta', 'Vincent Bevins', 'History', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('Menjadi Tjamboek Berdoeri', 'Kwee Thiam Tjing', 'Memoirs & Biography', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Macondo, Para Raksasa, dan Lain-Lain Hal', 'Ronny Agustinus', 'Poetry & Literary Criticism', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Apakah Aku Ibu yang Baik?', 'Rouli Esther Pasaribu', 'Psychology & Self Help', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('jiwa jiwa mati', 'Nikolai Gogol', 'Western Classics', 'Fiksi Genre Spesifik', 2),
    ('Jalan untuk mendengarkan', 'Teti Diana', 'Poetry & Literary Criticism', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Who''s There?', 'Dimas Rio', 'Crime & Mystery', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('A Room of One''s Own', 'Virginia Woolf', 'Western Classics', 'Agama', 2),
    ('Shorter Stories', 'Firnita', 'Poetry & Literary Criticism', 'Ilmu Sosial & Politik, Pengembangan Diri', 2),
    ('The Art of Waiting: Having Faith in God''s Perfect Plan When Things Don''t Go Our Way', 'Ezzah Mahmud', 'Religions', 'Agama', 2),
    ('Reading Together', 'Noah Brown, et al', 'Education', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Beauty of Time Management in Islam', 'Umm Muhammad Abizer', 'Religions', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('Lusifer! Lusifer!', 'Venerdi Handoyo', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Strings Attached', 'Firnita', 'Poetry & Literary Criticism', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('Muhammad Lelaki Penggenggam Hujan', 'Tasaro G.K', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Seperempat Abad', 'Eva Krisja', 'Poetry & Literary Criticism', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Inferno', 'Dante', 'Western Classics', 'Ilmu Pengetahuan Alam & Teknologi', 2),
    ('Bumi Manusia', 'Pramoedya Ananta Toer', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Why Information Grows', 'Cesar Hidalgo', 'Science', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Sisi Tergelap Surga', 'Brian Khrisna', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('All About Love - New Visions', 'Bell Hooks', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Dawuk', 'Mafhud Ikhwan', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Temporary', 'Hilary Leichter', 'Western Contemporary Lit.', 'Fiksi Genre Spesifik', 2),
    ('Dari Lembah ke Coolibah', 'Titis Basimo P.I.', 'Indonesian Literature', 'Seni', 2),
    ('Clair - The Death that Brings Us Closer', 'Ary Nilandari', 'Crime & Mystery', 'Seni', 2),
    ('Drawn to Drawing', 'John Vernon Lord', 'Arts & Architecture', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Auke Sonnega', 'Didier Hamel', 'Arts & Architecture', 'Seni', 2),
    ('Perjalanan Menuju Kearifan : Voyage to Wisdom', 'Jean Couteau', 'Psychology & Self Help', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Nang 3: Fiction', 'Caryn Koh', 'Arts & Architecture', 'Fiksi Genre Spesifik', 2),
    ('Winter in Sokcho', 'Elisa Shua Dusapin', 'Korean Literature', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('The Silent Patient', 'Alex Michaelides', 'Crime & Mystery', 'Seni', 2),
    ('The Bee is not Afraid of Me', 'Fran Long & Isabel Galleymore', 'Poetry & Literary Criticism', 'Fiksi Kontemporer & Klasik', 2),
    ('Soft and Weak like Water', 'Park Yang-Woo', 'Arts & Architecture', 'Fiksi Kontemporer & Klasik', 2),
    ('Bahagia Menjadi Aku', 'Haniefah Noor Esa', 'Children''s Books', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Bangga Menjadi Aku', 'Haniefah Noor Esa', 'Children''s Books', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Madame Bovary', 'Gustave Flaubert', 'Western Classics', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('The Richeset Man In Babylon', 'George S. Clason', 'Psychology & Self Help', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Showtime Book', 'Ricky Setiawan & Didi Muditha', 'Psychology & Self Help', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('A Diary Of Genocide', 'Atef Abu Saif', 'Memoirs & Biography', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('Di Atas Umbria', 'Acep Zamzam Noor', 'Poetry & Literary Criticism', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Pecinta Dari Palestina', 'Mahmoud Darwish', 'Literary Criticalism', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Life in Manchester: Libbie Marsh''s Three Eras', 'Elizabeth Gaskell', 'Western Classics', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Kiat-Kiat Berhenti Merokok', 'Aditya Siregar', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Ada Kalanya', 'Aditya Siregar', 'Psychology & Self Help', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Welcome to the Hyunam-Dong Bookshop', 'Hwang Bo-Reum', 'Korean Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Butter', 'Asako Yuzuki', 'Japanese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('More Days at the Morisaki Bookshop', 'Satoshi Yagisawa', 'Japanese Literature', 'Agama', 2),
    ('What You Are Looking For is in the Library', 'Michiko Aoyama', 'Japanese Literature', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('The Qur''an', 'M. A. S. Abdel Haleem', 'Religions', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('Good Boss, Bad Boss', 'Robert I. Sutton', 'Psychology & Self Help', 'Fiksi Genre Spesifik, Ilmu Sosial & Politik, Sejarah & Biografi', 2),
    ('Menjadi Dewasa', 'Prasanti Widyasih Sarli', 'Poetry & Literary Criticism', 'Sejarah & Biografi', 2),
    ('Detail Kecil', 'Adania Shibli', 'Colonialism, Race, Class (Fict.)', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Catatan Kaki Dari Gaza', 'Joe Sacco', 'History', 'Sejarah & Biografi', 2),
    ('Thought Culture or Practical Mental Training', 'William Atkinson', 'Psychology & Self Help', 'Nonfiksi Naratif, Sejarah & Biografi', 2),
    ('Dari Ngak Ngik Ngok ke Dheg Dheg Plas', 'Irama Nusantara', 'History', 'Seni', 2),
    ('100 Mak Nyus Jakarta', 'Bondan Winarno', 'Traavel', 'Sejarah & Biografi', 2),
    ('Cerita Tentang Placemaking', 'Yakobus Gatot, Handoko Hendroyono, Wendi Putranto', 'Arts & Architecture', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('A History of Tea', 'Laura C. Martin', 'History', 'Seni', 2),
    ('Menggali Ajaran Kebijaksanaan dalam Chado', 'Syarafmaulini', 'Psychology & Self Help', 'Sejarah & Biografi', 2),
    ('Steal Like an Artist', 'Austin Kleon', 'Arts & Architecture', 'Agama', 2),
    ('Palestina: Sebuah Novel Grafis', 'Joe Sacco', 'History', 'Fiksi Kontemporer & Klasik', 2),
    ('Even Angels Ask', 'Jeffrey Lang', 'Religions', 'Fiksi Kontemporer & Klasik', 2),
    ('Winnie the Pooh', 'A. A. Milne', 'Children''s Books', 'Sejarah & Biografi', 2),
    ('The House at Pooh Corner', 'A. A. Milne', 'Children''s Books', 'Sejarah & Biografi', 2),
    ('Lima Tahun Perang Kemerdekaan 1945-1949 Edisi ketiga 1947', 'Radik Utoyo', 'History', 'Sejarah & Biografi', 2),
    ('Lima Tahun Perang Kemerdekaan 1945-1949 Edisi keempat 1948', 'Radik Utoyo', 'History', 'Ilmu Sosial & Politik', 2),
    ('Lima Tahun Perang Kemerdekaan 1945-1949 Edisi kelima 1949', 'Radik Utoyo', 'History', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('When China Rules The World', 'Martin Jacques', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Babad Pajajaran', 'M. R. Candiaz', 'Indonesian Literature', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Revolusi Energi: Solusi Krisis Energi & Pengentasan Kemiskinan', 'Arifin Panigoro', 'Politics & Sociology', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Love in the Age of Drought', 'Fiona Higgins', 'Memoirs & Biography', 'Fiksi Genre Spesifik', 2),
    ('The Strange Library', 'Haruki Murakami', 'Japanese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Legends & Lattes', 'Travis Baldree', 'Fantasy & Sci-Fi', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Master & Margarita', 'Mikhail Bulgakov', 'Russian Literature', 'Sejarah & Biografi', 2),
    ('Mari Pergi Lebih Jauh', 'Ziggy Zesyazeoviennazabrizkie', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Indonesian Political Thinking 1945-1965', 'Herbert Feith & Lance Castles', 'History', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Slaughterhouse-Five', 'Kurt Vonnegut', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Njoto: Peniup Saksofon di Tengah Prahara', 'Tim Buku Tempo', 'Memoirs & Biography', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Midnight Diaries by Malioboro Hartigan', 'Skysphire', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Loneliness is My Best Friend', 'Alvi Syahrin', 'Psychology & Self Help', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Monologue: Her Untold Words', 'Nawang Nidlo Titisari', 'Indonesian Literature', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Malioboro at Midnight', 'Skysphire', 'Indonesian Literature', 'Fiksi Genre Spesifik', 2),
    ('A Guide Book to Trust Yourself', 'Ares Ulia', 'Psychology & Self Help', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Orbital', 'Samantha Harvey', 'Fantasy & Sci-Fi', 'Ekonomi, Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('Asa: The Girl Who Turned Into A Pair of Chopsticks', 'Natsuko Imamura', 'Japanese Literature', 'Fiksi Sejarah', 2),
    ('The Big Con - How The Consulting Industry Weakens Our Businesses, Infantilizes Our Governments and Warps Our Economies (2)', 'Mariana Mazzucato, Rosie Collington', 'Critiques on Capitalism', 'Fiksi Genre Spesifik', 2),
    ('Trust', 'Hernan Diaz', 'Historical Fiction', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('My Husband', 'Maud Ventura', 'Crime & Mystery', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Premonition', 'Banana Yoshimoto', 'Japanese Literature', 'Fiksi Sejarah', 2),
    ('Kitchen (Eng)', 'Banana Yoshimoto', 'Japanese Literature', 'Fiksi Genre Spesifik', 2),
    ('Kairos', 'Jenny Erpenbeck', 'Historical Fiction', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Dallergut Dream Department Store', 'Miye Lee', 'Fantasy & Sci-Fi', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Jane Austen: Her Complete Novels in One Sitting', 'Jennifer Kasius', 'Western Classics', 'Fiksi Genre Spesifik', 2),
    ('The Safekeep', 'Yael van der Wouden', 'Western Contemporary Lit.', 'Ilmu Sosial & Politik', 2),
    ('Chain Gang All Stars', 'Nana Kwame Adjei-Brenyah', 'Dystopian & Post-Apocalyptic', 'Fiksi Sejarah', 2),
    ('How to Run a Government', 'Michael Barber', 'Politics & Sociology', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Covenant of Water', 'Abraham Verghese', 'Historical Fiction', 'Seni', 2),
    ('Wednesday''s Child', 'Yiyun Li', 'Chinese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Emergent Tokyo: Designing the Spontaneous City', 'Jorge Almazán, Joe McReynolds', 'Arts & Architecture', 'Sejarah & Biografi, Ilmu Sosial & Politik', 2),
    ('The Trio', 'Johanna Hedman', 'Western Contemporary Lit.', 'Nonfiksi Naratif, Sejarah & Biografi', 2),
    ('The Punishment of Gaza', 'Gideon Levy', 'Colonialism', 'Ilmu Sosial & Politik', 2),
    ('The New Art of Travel', 'Alain de Botton', 'Travel', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Meritocracy Trap', 'Daniel Markovits', 'Politics & Sociology', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Trunk', 'Kim Ryeoryeong', 'Korean Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Stay With Me', 'Hanne Orstavik', 'Western Contemporary Lit.', 'Agama', 2),
    ('Pretty Ugly', 'Kirsty Gunn', 'Western Contemporary Lit.', 'Ilmu Pengetahuan Alam & Teknologi', 2),
    ('Depression & Anxiety', 'Imam Muhammad Sa''id Ramadan al-Buti', 'Religions', 'Ilmu Sosial & Politik', 2),
    ('Brief Answers to the Big Questions', 'Stephen Hawking', 'Science', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Citizens: Why the Key to Fixing Everything is All of Us', 'Jon Alexander, Ariane Conrad', 'Politics & Sociology', 'Ilmu Pengetahuan Alam & Teknologi', 2),
    ('Life of Pi (2)', 'Yann Martel', 'World Literature', 'Ilmu Pengetahuan Alam & Teknologi', 2),
    ('The Order of Time', 'Carlo Rovelli', 'Science', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Black Holes: The Key to Understanding the Universe', 'Brian Cox, Jeff Forshaw', 'Science', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Persepolis', 'Marjane Satrapi', 'Memoirs & Biography', 'Bisnis & Manajemen, Ekonomi', 2),
    ('Unaccustomed Earth', 'Jhumpa Lahiri', 'World Literature', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('Heaven''s Bankers: Inside the Hidden World of Islamic Finance', 'Harris Irfan', 'Business', 'Fiksi Genre Spesifik, Ilmu Sosial & Politik, Sejarah & Biografi', 2),
    ('The Orange and Other Poems', 'Wendy Cope', 'Literary Criticalism', 'Sejarah & Biografi, Ilmu Sosial & Politik', 2),
    ('Swing Time', 'Zadie Smith', 'Colonialism, Race, Class (Fict.)', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Ten Myths About Israel (2)', 'Ilan Pappe', 'Colonialism', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Skippy Dies', 'Paul Murray', 'Western Contemporary Lit.', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('The Tatami Galaxy', 'Tomihiko Morimi', 'Japanese Literature', 'Bisnis & Manajemen, Ekonomi', 2),
    ('The Comfort Book', 'Matt Haig', 'Psychology & Self Help', 'Ilmu Sosial & Politik, Pengembangan Diri', 2),
    ('The New Digital Age', 'Eric Schmidt & Jared Cohen', 'Business', 'Ekonomi, Ilmu Sosial & Politik, Filsafat & Etika', 2),
    ('The Gifted School', 'Bruce Holsinger', 'Family', 'Sejarah & Biografi, Ilmu Sosial & Politik', 2),
    ('Techno Feudalism - What Killed Capitalism', 'Yanis Varoufakis', 'Critiques on Capitalism', 'Ilmu Pengetahuan Alam & Teknologi', 2),
    ('A Very Short History of the Israel-Palestinian Conflict', 'Ilan Pappe', 'Colonialsm', 'Ilmu Pengetahuan Alam & Teknologi', 2),
    ('Eve - How The Female Body Drove 200 Million Years of Human Evolution', 'Cat Bohannon', 'Science', 'Fiksi Genre Spesifik', 2),
    ('Cloudspotting for Beginners', 'Gavin Pretor-Pinney & William Grill', 'Science', 'Ilmu Sosial & Politik', 2),
    ('The Secrets of The Immortal Nicholas Flamel: The Warlock', 'Michael Scott', 'Fantasy & Sci-Fi', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Kota Komunikatif - Kapasitas Warga Perkotaan & Inovasi Tema Pembangunan Kota Menuju Kota Berkelas Dunia', 'Ridwan Sutriadi & Nayaka Angger', 'Politics & Sociology', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Catatan Bawah Tanah', 'M. Fadjroel Rachman', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Semua Punya Luka', 'Karamel SkyPeach', 'Indonesian Literature', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Anxious People', 'Fredrik Backman', 'Western Contemporary Lit.', 'Ilmu Sosial & Politik, Pengembangan Diri', 2),
    ('The Psyschology of Money', 'Morgan Housel', 'Psychology & Self Help', 'Fiksi Genre Spesifik', 2),
    ('The Library Book', 'Rebecca Gray & Alan Bennett', 'Education', 'Fiksi Genre Spesifik', 2),
    ('The Bartimaseus Trilogy: The Amulet of Samarkand', 'Jonathan Stroud', 'Fantasy & Sci-Fi', 'Fiksi Genre Spesifik', 2),
    ('The Bartimaseus Trilogy: The Golem''s Eye', 'Jonathan Stroud', 'Fantasy & Sci-Fi', 'Seni', 2),
    ('The Bartimaseus Trilogy: Ptolemy''s Gate', 'Jonathan Stroud', 'Fantasy & Sci-Fi', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Desain, Bandung, & Budaya Sunda', 'Jamaludin', 'Arts & Architecture', 'Fiksi Genre Spesifik', 2),
    ('Berjuta Rasanya', 'Tere Liye', 'Indonesian Literature', 'Fiksi Genre Spesifik', 2),
    ('The Phantom of the Opera', 'Gaston Leroux', 'Crime & Mystery', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Haunted Stories', 'Aidan Chambers', 'Crime & Mystery', 'Fiksi Genre Spesifik', 2),
    ('Do (2)', 'Handoko Hendroyono', 'Psychology & Self Help', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Da Vinci Code', 'Dan Brown', 'Crime & Mystery', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Rumah Kaca', 'Pramoedya Ananta Toer', 'Indonesian Literature', 'Sejarah & Biografi', 2),
    ('Jejak Langkah', 'Pramoedya Ananta Toer', 'Indonesian Literature', 'Sejarah & Biografi', 2),
    ('Sejarah Pergerakan Buruh Indonesia', 'Sandra', 'History', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Terbentuknya Sebuah Elite Birokrasi', 'Heather Sutherland', 'History', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The City and Its Uncertain Walls', 'Haruki Murakami', 'Japanese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Menari di Antara Desing Peluru', 'Luri Permadi', 'Indonesian Literature', 'Nonfiksi Naratif', 2),
    ('The Trial', 'Franz Kafka', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('TEMPO Hamengku Buwono IX', 'TEMPO', 'Magazine & Zine', 'Nonfiksi Naratif', 2),
    ('TEMPO Bandung 1955', 'TEMPO', 'Magazine & Zine', 'Nonfiksi Naratif', 2),
    ('TEMPO Bowo, Joko, Hatta & Kalla', 'TEMPO', 'Magazine & Zine', 'Nonfiksi Naratif', 2),
    ('Historia Srikandi Revolusi', 'Historia', 'Magazine & Zine', 'Nonfiksi Naratif', 2),
    ('Scaling Responsible Digital Payments in The Indonesian Cocoa Sector', 'Better Than Cash', 'Magazine & Zine', 'Nonfiksi Naratif', 2),
    ('TEMPO Sutan Sjahrir Peran Besar Bung Kecil', 'TEMPO', 'Magazine & Zine', 'Nonfiksi Naratif', 2),
    ('Krisis di Semenangjung Korea Akankah Memantik Perang Dunia III', 'Angkasa', 'Magazine & Zine', 'Nonfiksi Naratif', 2),
    ('Cannae 216 SM Hannibal Memikil Pasukan Romawi', 'Mark Healy', 'History', 'Sejarah & Biografi', 2),
    ('Green Beret Pasukan Elite Amerika di Vietnam 1957-73', 'Gordon Rottman', 'History', 'Sejarah & Biografi', 2),
    ('Deadly Inferno Battle of The Wilderness', 'Abnett & Vansant & Verma', 'History', 'Sejarah & Biografi', 2),
    ('Ksatria Templar 1120-1312', 'Helen Nicholson & Wayne Reynolds', 'History', 'Sejarah & Biografi', 2),
    ('Day of Infamy Attack on Pearl Harbor', 'Steve White & Gary Erskine & Jerrold Spahn', 'History', 'Sejarah & Biografi', 2),
    ('Hitler''s Last Gamble Battle of The Bulge', 'Cain & Wagner & Verma', 'History', 'Sejarah & Biografi', 2),
    ('Nafsu Perang', 'Joel Andreas', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Welcome to the Hyunam-Dong Bookshop (2)', 'Hwang Bo-Reum', 'Korean Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The New Geography of Jobs', 'Enrico Moretti', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Kawan Tidur', 'Hanna Fransisca', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Making Sense of Islamic Art & Architecture', 'Adam Barkman', 'Arts & Architecture', 'Seni', 2),
    ('Berani Tidak Disukai', 'Ichiro Kishimi & Fumitake Koga', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Of Self and Nation: Autobiography and the Representation of Modern Indonesia', 'C.W. Watson', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Enter Ghost', 'Isabella Hammad', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Jendela Bandung : Pengalaman Bersama Kompas', 'Hersuganda', 'History', 'Sejarah & Biografi', 2),
    ('A Gentleman in Moscow', 'Amor Towles', 'Historical Fiction', 'Fiksi Sejarah', 2),
    ('Time Shelter', 'Georgi Gospodibov', 'Fantasy & Sci-Fi', 'Fiksi Genre Spesifik', 2),
    ('The Bee Sting', 'Paul Murray', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Mountain in the Sea', 'Ray Nayler', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Good Material', 'Dolly Alderton', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Milkman', 'Anna Burns', 'Historical Fiction', 'Fiksi Sejarah', 2),
    ('Minor Detail', 'Adania Shibli', 'Historical Fiction', 'Fiksi Sejarah', 2),
    ('The Things We Do To Our Friends', 'Heather Darwent', 'Crime & Mystery', 'Fiksi Genre Spesifik', 2),
    ('The Hobbit', 'J. R. R. Tolkien', 'Fantasy & Sci-Fi', 'Fiksi Genre Spesifik', 2),
    ('Saksi Mata', 'Seno Gumira Ajidarma', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Islam, Marx dan Keynes: pembahasan ekonomi', 'Taher Ibrahim', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('On Violence', 'Hannah Arendt', 'Philosophy', 'Filsafat & Etika', 2),
    ('The Village of Stepanchikovo and Its Inhabitants', 'Fyodor Dostoevsky', 'Russian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Estetika Banal & Spiritualisme Kritis (eks.1)', 'Ayu Utami', 'Arts & Architecture', 'Seni', 2),
    ('Estetika Banal & Spiritualisme Kritis (eks.2)', 'Ayu Utami', 'Arts & Architecture', 'Seni', 2),
    ('Serious Money: Walking Plutocratic London', 'Caroline Knowles', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('History of Western Philosophy', 'Bertrand Russell', 'History', 'Sejarah & Biografi', 2),
    ('Notes on Nationalism', 'George Orwell', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Islam and Capitalism', 'Maxime Rodinson', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('The Origins of Political Order: From Prehuman Times to the French Revolution', 'Francis Fukuyama', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Air : Memberi Minum Dunia yang Dahaga', 'Michael Burgan', 'Magazine & Zine', 'Nonfiksi Naratif', 2),
    ('Relung Rasa Raisa', 'Lea Agustina Citra', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Tempat Paling Liar di Muka Bumi', 'Theoresia Rumthe & Weslly Johannes', 'Poetry & Literary Criticism', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('Merasa Pintar, Bodoh Saja Tak Punya', 'Rusdi Mathari', 'Religions', 'Agama', 2),
    ('Dear Tomorrow', 'Maudy Ayunda', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Aku: Berdasarkan Perjalanan Hidup Dan Karya Penyair Chairil Anwar', 'Sjuman Djaya', 'Poetry & Literary Criticism', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('Catatan Najwa 2', 'Najwa Shihab', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Aku Ini Binatang Jalang (copy 2)', 'Chairil Anwar', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Sapiens', 'Yuval Noah Harari', 'History', 'Sejarah & Biografi', 2),
    ('Tidak Ada New York Hari Ini', 'M. Aan Mansyur', 'Poetry & Literary Criticism', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('The Book of Invisible Questions', 'Lala Bohang', 'Poetry & Literary Criticism', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('Sebelum Sendiri', 'M. Aan Mansyur', 'Poetry & Literary Criticism', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('Filosofi Teras - Filsafat Yunani-Romawi Kuno untuk Mental Tangguh Masa Kini (2)', 'Henry Manampiring', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Notes From Underground & Other Stories', 'Fyodor Dostoevsky', 'Russian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Introducing Kierkegaard: A Graphic Guide', 'Dave Robinson & Oscar Zarate', 'Philosophy', 'Filsafat & Etika', 2),
    ('Introducing Extentialism: A Graphic Guide', 'Richard Appignanesi & Oscar Zarate', 'Philosophy', 'Filsafat & Etika', 2),
    ('The Dawn of Day', 'Friedrich Wilhelm Nietzsche', 'Philosophy', 'Filsafat & Etika', 2),
    ('Human, All Too Human: A Book for Free Spirits', 'Friedrich Wilhelm Nietzsche', 'Philosophy', 'Filsafat & Etika', 2),
    ('The Art of Rhetoric', 'Aristotle', 'Philosophy', 'Filsafat & Etika', 2),
    ('The Case of Wagner and Nietzsche Contra Wagner', 'Friedrich Nietzsche', 'Philosophy', 'Filsafat & Etika', 2),
    ('Metamorfosis', 'Franz Kafka', 'Western Classics', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Anti-Education', 'Friedrich Nietzsche', 'Philosophy', 'Filsafat & Etika', 2),
    ('Das Griechische Musikdrama The Greek Music Drama', 'Friedrich Nietzsche', 'Philosophy', 'Filsafat & Etika', 2),
    ('Zarathustra', 'Friedrich Nietzsche', 'Philosophy', 'Filsafat & Etika', 2),
    ('The Boy, The Mole, The Fox and The Horse', 'Charlie Mackesy', 'Children''s Books', 'Fiksi Kontemporer & Klasik', 2),
    ('Wajah Abu-Abu', 'Mita Vacariani', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Book at War: Libraries and Readers in an Age of Conflict', 'Andrew Pettegree', 'History', 'Sejarah & Biografi', 2),
    ('Istanbul: Memories and the City', 'Orhan Pamuk', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Majapahit: Intrigue, Betrayal and War in Indonesia’s Greatest Empire', 'Herald van der Linde', 'History', 'Sejarah & Biografi', 2),
    ('But the Girl', 'Jessica Zhan Mei Yu', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Sel : Eksplorasi Kedokteran dan Manusia Baru', 'Siddharta Mukherjee', '- Biology
- Anatomy
- Medicine', 'Ilmu Pengetahuan Alam & Teknologi', 2),
    ('Kakek dalam kucing - kucing takamoto', 'Bagus Dwi Hananto', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Gender, Muslim, & Sinema', 'Dwiki Aprianaldi', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Film, Ideologi, & Militer', 'Budi Irawanto', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Madilog', 'Tan Malaka', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Arsitektur Hujan', 'Afrizal Malna', 'Poetry & Literary Criticism', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('Brave Not Perfect', 'Reshma Saujani', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Sihir Perempuan', 'Intan Paramaditha', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Jilid 1 Kuasa Ramalan: Pangeran Diponegoro dan Akhir Tatanan Lama di Jawa, 1785-1855', 'Peter Carey', 'History', 'Sejarah & Biografi', 2),
    ('Jilid 2 Kuasa Ramalan: Pangeran Diponegoro dan Akhir Tatanan Lama di Jawa, 1785-1855', 'Peter Carey', 'History', 'Sejarah & Biografi', 2),
    ('Jilid 3 Kuasa Ramalan: Pangeran Diponegoro dan Akhir Tatanan Lama di Jawa, 1785-1855', 'Peter Carey', 'History', 'Sejarah & Biografi', 2),
    ('The Unabridged Journals of Sylvia Plath', 'Sylvia Plath', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Half Past Twenties', 'Firnita', 'Poetry & Literary Criticism', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('100 Ideas That Changed Art', 'Michael Bird', 'Arts & Architecture', 'Seni', 2),
    ('Amazing Art Adventure', 'Yolanda Zappaterra', 'Arts & Architecture', 'Seni', 2),
    ('Perspektif Perencana: Smart City Inovasi, Kota Komunikatif, dan Kota Berkeadilan', 'Ridwan Sutriadi', 'Arts & Architecture', 'Seni', 2),
    ('The Golden Section Nature''s Greatest Secret', 'Scott Olsen', 'Arts & Architecture', 'Seni', 2),
    ('Egon Schiele: Landscapes', 'Rudolf Leopold', 'Arts & Architecture', 'Seni', 2),
    ('Laika', 'Nick Abadzis', 'Graphic Novels', 'Fiksi Kontemporer & Klasik, Seni', 2),
    ('Hotel K: The Shocking Inside Story of Bali''s Most Notorious Jail', 'Kathryn Bonella', 'Crime & Mystery', 'Fiksi Genre Spesifik', 2),
    ('What The Day Owes The Night', 'Yasmina Khadra', 'World Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Love, Nina', 'Nina Stibbe', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Disabilitas & Narasi Ketidaksetaraan', 'Muhammad Khambali', 'Education', 'Ilmu Sosial & Politik, Pengembangan Diri', 2),
    ('Luka Luka Linimasa', 'Kalis Mardiasih', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Deep Work', 'Cal Newport', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('How Rich Countries Got Rich... and Why Poor Countries Stay Poor', 'Erik S. Reinert', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Titik Nol: Makna Sebuah Perjalanan', 'Agustinus Wibowo', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Nyai Dasima', 'S.M. Ardan', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Orang Pertama Tunggal', 'KPG', 'Japanese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Subjek Sunda: Genealogi, Kelahiran, dan Kewilayahan', 'Marjin Kiri', 'History', 'Sejarah & Biografi', 2),
    ('Si Bengkok', 'Ichikawa Saou', 'Japanese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Rumah Kertas', 'Carlos Maria Domiguez, Ronny Agustinus (penerjemah)', 'World Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Dinner Party', 'Joshua Ferris', 'Western Contemporary Lit.', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Menua dengan Gembira (2)', 'Andina Dwifatma', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('My Home: Myself', 'Aji Tri Prasetyo', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Kita Semua Gagal Menjadi yang Terbaik', 'Sherly Pitaloka', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Belajar Mencintai Hal-Hal yang Nggak Kamu Sukai', 'Sherly Pitaloka', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Hai Nak!', 'Reda Gaudiamo', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Masa Depan yang Tidak Boleh Dibicarakan', 'Adit MKM', 'Dystopian & Post-Apocalyptic', 'Fiksi Genre Spesifik', 2),
    ('Kemarau di Sedanau', 'Asroruddin Zoechni', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Travel Tales A Bobobox Travel Magazine', 'Bobobox', 'Magazine & Zine', 'Nonfiksi Naratif', 2),
    ('Dona Dona', 'Toshikazu Kawaguchi', 'Japanese Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Book of Lost Things - Kitab Tentang Yang Telah Hilang', 'John Connolly', 'Fantasy & Sci-Fi', 'Fiksi Genre Spesifik', 2),
    ('Selamat Tinggal Hindia', 'Pans Schomper', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Sentient - How Animals Illuminate The Wonder of Our Human Senses', 'Jackie Higgins', 'Science', 'Ilmu Pengetahuan Alam & Teknologi', 2),
    ('I Contain Multitudes - The Microbes Within Us and A Grander View of Life', 'Ed Yong', 'Science', 'Ilmu Pengetahuan Alam & Teknologi', 2),
    ('Melihat Indonesia dari Sepeda', 'Ahmad Arif', 'History', 'Sejarah & Biografi', 2),
    ('Perempuan yang Membuat Air', 'Moon Chung Hee', 'Poetry & Literary Criticism', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('Bertolt Brecht 100 Gedichte', 'Bertolt Brecht', 'Poetry & Literary Criticism', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('Powers of Two: Finding the Essence of Innovation in Creative Pairs', 'Joshua Wolf Shenk', 'Business', 'Bisnis & Manajemen, Ekonomi', 2),
    ('The Lord of the Rings', 'J. R. R. Tolkien', 'Fantasy & Sci-Fi', 'Fiksi Genre Spesifik', 2),
    ('Jakarta 1950-an Kenangan Semasa Remaja', 'Firman Lubis', 'History', 'Sejarah & Biografi', 2),
    ('Bumi Manusia (new cover)', 'Pramoedya Ananta Toer', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Anak Semua Bangsa (new cover)', 'Pramoedya Ananta Toer', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('How China Escaped the Poverty Trap', 'Yuen Yuen Ang', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('American Caesars: Lives of the Presidents from Franklin D. Roosevelt to George W. Bush', 'Nigel Hamilton', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Josh Hartnett Definitely wants to do this... True Stories From a Life In The Screen Trade', 'Bruce Beresford', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('The Innovators: How a Group of Hackers, Geniuses and Geeks Created the Digital Revolution', 'Walter Isaacson', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Linking People: Pertalian dan Interaksi Orang Australia dan Orang Indonesia', 'Antje Missbach, Jemma Purdey', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Islam In Indonesia: The Contest for Society, Ideas and Values', 'Carool Kersten', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Conversations with Lee Kuan Yew', 'Tom Plate', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Rebooting India: Realizing a billion aspirations', 'Nandan Nilekani, Viral Shah', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Media Sosial dan Perencanaan Kota - Seri Smart City dari Sisi Perencana Kota', 'Ridwan Sutriadi', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('One City One Factory', 'Eko Edhi Caroko', 'memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('The Political Writings I - The Time of The Bedouin on The Politics of Power', 'Ian Dallas', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Kangen Indonesia', 'Hisanori Kato', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Tan Malaka Putra Bangsa Yang Terlupakan', 'Novi Fuji', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Natsir Politik Santun di Antara Dua Rezim', 'Seri Buku Saku Tempo', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Douwes Dekker', 'Seri Buku Saku Tempo', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Wiji Thukul Teka-Teki Orang Hilang', 'Seri Buku Saku Tempo', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Hatta Jejak yang Melampaui Zaman', 'Seri Buku Saku Tempo', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Sarwo Edhie dan Misteri 1965', 'Seri Buku Tempo', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Tjokroaminoto Guru Para Pendiri Bangsa', 'Seri Buku Tempo', 'Memoirs & Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Tak Perlu Ratu Adil: Kumpulan Esai tentang Politik, Demokrasi, dan Anak Muda', 'Edbert Gani Suryahudaya', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Indonesia Bagian Dari Desa Saya', 'Emha Ainun Nadjib', 'Politics & Sociology', 'Ilmu Sosial & Politik', 2),
    ('Aku Ini Binatang Jalang (copy 3)', 'Chairil Anwar', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Kenanga', 'Oka Rusmini', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Manjali (copy 2)', 'Ayu Utami', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Calon arang: Kisah perempuan korban patriarki : prosa lirik', 'Toeti Heraty', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Nagabonar Jadi 2', 'Akmal Nasery Basral', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Maryamah Karpov: Mimpi-mimpi Lintang', 'Andrea Hirata', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Buku Saku Laskar Pelangi: Kisah Ikal dan Lintang', 'Andrea Hirata', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Ketika Cinta Bertasbih: Episode 1', 'Habiburrahman El-Shirazy', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Ketika Cinta Bertasbih: Episode 2', 'Habiburrahman El-Shirazy', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Ayat-Ayat Cinta', 'Habiburrahman El-Shirazy', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Big Feelings', 'Liz Fosslien, Mollie West Duffy', 'Self Help', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 2),
    ('Y.B. Mangunwijaya: Karya dan Dunianya', 'B.Rahmanto', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Kuntowijoyo: Karya dan Dunianya', 'Wan Anwar', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Rendra: Karya dan Dunianya', 'Bakdi Soemanto', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Sapardi Djoko Damono: Karya dan Dunianya', 'Bakdi Soemanto', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Umar Kayam: Karya dan Dunianya', 'B. Rahmanto', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Celana Pacarkecilku di Bawah Kibaran Sarung', 'Joko Pinurbo', 'Poetry & Literary Criticism', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('Malu (Aku) Jadi Orang Indonesia', 'Taufiq Ismail', 'Poetry & Literary Criticism', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('Golf untuk Rakyat', 'Darmanto Jatman', 'Poetry & Literary Criticism', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('Saut Kecil Bicara dengan Tuhan', 'Saut Situmorang', 'Poetry & Literary Criticism', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('Upacara Bulan', 'Korrie Layun Rampan', 'Poetry & Literary Criticism', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('Khalwat', 'Sofyan RH. Zaid', 'Poetry & Literary Criticism', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('Pendidikan Jasmani dan Kesunyian', 'Beni Satryo', 'Poetry & Literary Criticism', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('Jantung Lebah Ratu', 'Nirwan Dewanto', 'Poetry & Literary Criticism', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('Khazanah Pantun Sunda: Sebuah Interpretasi', 'Jakob Sumardjo', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Kekasih Teluk', 'Saras Dewi', 'Poetry & Literary Criticism', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('Negeri Daging', 'A. Mustofa Bisri', 'Poetry & Literary Criticism', 'Sastra & Puisi, Nonfiksi Naratif', 2),
    ('Ayang-Ayang Gung: Petikan Surat-Surat 1980-1986', 'Ajip Rosidi', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Khazanah Naskah', 'Henri Chambert-Loir', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Kuda terbang Maria Pinto', 'Linda Christanty', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Surga Sungsang', 'Triyanto Triwikromo', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Lelaki Bernama Karsa : Kumpulan Cerita Pendek', 'Susmana AJ', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Amangkurat Amangkurat: Lakon Dalam Empat Belas Adegan', 'Goenawan Mohamad', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('BH', 'Emha Ainun Najib', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Bunga Di Atas Batu', 'Situmorang, Sitor', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Persekongkolan ahli makrifat', 'Kuntowijoyo', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Lupus : Tangkaplah Daku, Kau Kujitak!', 'Hilman Hariwijaya', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Surat Panjang Tentang Jarak Kita yang Jutaan Tahun Cahaya', 'Dewi Kharisma Michellia', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Lemah Tanjung', 'Ratna Indraswari Ibrahim', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Namaku Teweraut', 'Ani Sekarningsih', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Langkah-Langkah Menuju Kemanjuan', 'A.S Abdullah', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Pulang (copy 2)', 'Leila S. Chudori', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Jatisaba', 'Ramayda Akmal', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Ancika: Dia yang Bersamaku Tahun 1995', 'Pidi Baiq', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Perfect World of Miwako Sumida', 'Clarissa Goenawan', 'Indonesian Literature', 'Nonfiksi Naratif', 2),
    ('Jika Kucing Lenyap dari Dunia', 'Genki Kawamura', 'Pets!', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Laut Bercerita (copy 3)', 'Leila S. Chudori', 'Indonesian Literature', 'Sejarah & Biografi', 2),
    ('Rahasia Nusantara', 'Asisi Suhariyanto', 'History', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Surat-surat adik R.A. Kartini', 'Jaquet Frist G.P.', 'Memoirs & Biography', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('KonMari Mengubah Hidupku', 'Khoirun Nikmah', 'Psychology & Self Help', 'Seni', 2),
    ('Symmetry The Ordering Principle', 'David Wade', 'Art & Architecture', 'Nonfiksi Naratif', 2),
    ('Seporsi Sate yang Membawa Harapan Baru', 'Ukiskukis', 'Magazine & Zine', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Hello, This is Your Captain Speaking : Kencangkan Sabuk Pengamanmu, Everything Will Be Alright', 'Monika Anggreini', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('80,000 Hours: Find a Fulfilling Career that Does Good', 'Benjamin Todd', 'Psychology & Self Help', 'Fiksi Kontemporer & Klasik', 2),
    ('Robot Paling Keren', 'Rassi Narika', 'Children''s Book', 'Nonfiksi Naratif', 2),
    ('Fortune Indonesia: (Not) Too Big to Fail', 'Fortuneidn', 'Magazine & Zine', 'Fiksi Genre Spesifik', 2),
    ('The Employees: Aworkplace Novel of The 22nd Century', 'Olga Ravn', 'Science Fiction', 'Fiksi Genre Spesifik', 2),
    ('The Ministry for The Future', 'Kim Stanley Robinson', 'Science Fiction', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('A Magical Girl Retires', 'Park Seolyeon', 'Korean Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Chinese Cinderella: The Mystery of The Song Dynasty Painting', 'Adeline Yen Mah', 'Chinese Literature', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Berani Bahagia', 'Ichiro Kishimi, Fumitake Koga', 'Psychology & Self Help', 'Fiksi Sejarah', 2),
    ('Adolf 3', 'Osamu Tezuka', 'Historical Fiction', 'Fiksi Sejarah', 2),
    ('Adolf 4', 'Osamu Tezuka', 'Historical Fiction', 'Fiksi Sejarah', 2),
    ('Adolf 5', 'Osamu Tezuka', 'Historical Fiction', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2);

-- Batch 7/8 (Records 3001-3500)
INSERT INTO books (title, author, category, general_category, library_id) VALUES
    ('Just My Luck', 'Adele Parks', 'Western Contemporary Lit.', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Man''s Search For Meaning (Eng)', 'Viktor E. Frankl', 'Psychology & Self Help', 'Fiksi Genre Spesifik', 2),
    ('The Lost World', 'Sir Arthur Conan Doyle', 'Fantasy & Sci-Fi', 'Sejarah & Biografi', 2),
    ('Raffles dan Invasi Inggris ke Jawa', 'Tim Hannigan', 'History', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Finding Sisu: Hidup Sehat Dan Seimbang Ala Orang Finlandia', 'Katja Pantzar', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Tak Masalah Menjadi Orang Yang Berbeda - It''s Okay, You''re Just Different', 'Kim Doo Eung', 'Psychology & Self Help', 'Fiksi Genre Spesifik', 2),
    ('Dracula', 'Bram Stoker', 'Fantasy & Sci-Fi', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('The Road to Wigan Pier', 'George Orwell', 'Western Classic', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Homage to Catalonia', 'George Orwell', 'Western Classic', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Diskoneksi', 'Into The Light x Awi Chin x Yuu Sasih', 'Indonesian Literature', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 2),
    ('Drama Mangir', 'Pramoedya Ananta Toer', 'Indonesian Literature', 'Fiksi Sejarah', 2),
    ('The Coast Road', 'Alan Murrin', 'Historical Fiction', 'Sejarah & Biografi', 2),
    ('The Worldwide History of Warfare: The Ultimate Visual Guide, from the Ancient World to the American Civil War', 'Thames & Hudson', 'History', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Tenang di Dunia yang Sibuk', 'Zein Permana', 'Psychology & Self Help', 'Sejarah & Biografi, Nonfiksi Naratif', 2),
    ('Habibie & Ainun', 'Bacharuddin Jusuf Habibie', 'Memoirs & Biography', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Happiness is Homemade', 'Putty Puar', 'Psychology & Self Help', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('88 Love Life', 'Diana Rikasari', 'Psychology & Self Help', 'Seni', 2),
    ('Textile Design', 'Simon Clarke', 'Art & Architecture', 'Seni', 2),
    ('The Hand Printed Home', 'Jenny McCabe', 'Art & Architecture', 'Seni', 2),
    ('Figure Poses for Fashion Illustrators', 'Sha Tahmasebi', 'Art & Architecture', 'Seni', 2),
    ('Batik : From the Courts of Java and Sumatra', 'Rudolf G. Smend Collection', 'Art & Architecture', 'Psikologi & Kesehatan Mental, Pengembangan Diri', 2),
    ('Connect: Building Exceptional Relationships with Family, Friends, and Colleagues', 'David Bradford', 'Psychology & Self Help', 'Filsafat & Etika', 2),
    ('Introducing Existentialism: A Graphic Guide', 'Oscar Zarate', 'Philosophy', 'Sejarah & Biografi', 2),
    ('Sangkakala Padjadjaran', 'H. Setia Hidayat', 'History', 'Sejarah & Biografi', 2),
    ('Winter King: The Dawn of Tudor England', 'Thomas Penn', 'History', 'Fiksi Genre Spesifik', 2),
    ('Koleksi Kasus Sherlock Holmes (The Case-Book of Sherlock Holmes)', 'Sir Arthur Conan Doyle', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Petualangan Sherlock Holmes (The Adventures of Sherlock Holmes)', 'Sir Arthur Conan Doyle', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Koleksi Memoar Sherlock Holmes (The Memoir of Sherlock Holmes)', 'Sir Arthur Conan Doyle', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Kembalinya Sherlock Holmes (The Return of Sherlock Holmes)', 'Sir Arthur Conan Doyle', 'Mystery, Crime', 'Psikologi & Kesehatan Mental', 3),
    ('Great Expectations', 'Charles Dickens', 'Psychology', 'Fiksi Genre Spesifik', 3),
    ('The Mortal Immortal and Other Stories', 'Mary Shelley', 'Science Fiction', 'Ilmu Sosial & Politik', 3),
    ('Mrs. Dalloway', 'Virginia Woolf', 'Social Issue', 'Fiksi Sejarah', 3),
    ('As Long as the lemon Trees Grow', 'Zoulfa Katouh', 'Historical Fiction', 'Fiksi Kontemporer & Klasik', 3),
    ('Imaginary City', 'Rain Chudori', 'Romance', 'Sastra & Puisi', 3),
    ('The Prophet', 'Kahlil Gibran', 'Poetry, Rhymes', 'Sastra & Puisi', 3),
    ('Nyanyian Jiwa', 'Kahlil Gibran', 'Poetry, Rhymes', 'Sastra & Puisi', 3),
    ('Yesus Anak Manusia (Jesus the Son of Man)', 'Kahlil Gibran', 'Poetry, Rhymes', 'Sastra & Puisi', 3),
    ('Sayap-Sayap Patah (Broken Wings)', 'Kahlil Gibran', 'Poetry, Rhymes', 'Sastra & Puisi', 3),
    ('Almustafa', 'Kahlil Gibran', 'Poetry, Rhymes', 'Fiksi Genre Spesifik', 3),
    ('Rembulan Tenggelam di Wajahmu', 'Tere Liye', 'Adventure', 'Fiksi Genre Spesifik', 3),
    ('Si Anak Savana', 'Tere Liye', 'Adventure', 'Psikologi & Kesehatan Mental', 3),
    ('Sang Alkemis (The Alchemist)', 'Paulo Coelho', 'Psychology', 'Filsafat & Etika', 3),
    ('The Picture of Dorian Grey', 'Oscar Wilde', 'Philosophy', 'Filsafat & Etika', 3),
    ('Five People You Meet in Heaven', 'Mitch Albom', 'Philosophy', 'Filsafat & Etika', 3),
    ('For One More Day', 'Mitch Albom', 'Philosophy', 'Sastra & Puisi', 3),
    ('Cinta Keindahan Kesunyian', 'Kahlil Gibran', 'Poetry, Rhymes', 'Nonfiksi Naratif', 3),
    ('The Diary of a Young Girl #Copies2', 'Anne Frank', 'Journalism', 'Psikologi & Kesehatan Mental', 3),
    ('The Shift', 'Kimberly White', 'Psychology', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('You do You', 'Fellexandro Ruby', 'Self Help', 'Ilmu Sosial & Politik', 3),
    ('Marketing 5.0', 'Philip Kotler', 'Social', 'Psikologi & Kesehatan Mental', 3),
    ('Emotional Intelligence', 'Daniel Goleman', 'Psychology', 'Filsafat & Etika', 3),
    ('Letters from a Stoic', 'Seneca', 'Philosophy', 'Filsafat & Etika', 3),
    ('Meditations', 'Marcus Aurelius', 'Philosophy', 'Psikologi & Kesehatan Mental', 3),
    ('Blink', 'Malcolm Gladwell', 'Psychology', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('Sebuah Seni Untuk Bersikap Bodo Amat', 'Mark Manson', 'Self Help', 'Ilmu Sosial & Politik', 3),
    ('Zero to One', 'Peter Thiel', 'Social', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('The Happiness Project', 'Gretchen Rubin', 'Self Help', 'Nonfiksi Naratif, Seni', 3),
    ('The ABC''s of Journaling', 'Abbey SY', 'Hobbies', 'Ilmu Sosial & Politik', 3),
    ('Artisan Brand Kenapa Begitu Penting?', 'Handoko Hendroyono', 'Social', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('Cara yang Paling Tepat dan Mudah untuk Berbicara dan Berpidato', 'Dale Carnegie', 'Self Help', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('Bagaimana Mencari Kawan dan Memengaruhi Orang Lain (How to Win Friends and Influence People)', 'Dale Carnegie', 'Self Help', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('On Purpose: The Busy Woman''s Guide to an Extraordinary Life of Meaning and Success', 'Tanya Dalton', 'Self Help', 'Seni', 3),
    ('Textilepedia: The Complete Fabric Guide', 'Fashionary Team', 'Art', 'Seni', 3),
    ('Fashionpedia - The Visual Dictionary of Fashion Design', 'Fashionary Team', 'Art', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('Daily Reflection for Highly Effective People', 'Stephen R. Covey', 'Self Help', 'Nonfiksi Naratif, Sastra & Puisi', 3),
    ('The Mystery of Things', 'A. C. Grayling', 'Essay', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('Thrivers', 'Michele Borba, Ed.D.', 'Self Help', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('The Almanack of Naval Ravikant', 'Eric Jorgenson', 'Self Help', 'Ilmu Sosial & Politik', 3),
    ('Business Plan', 'Yudi Pramudiana, Risris Rismayani, Fitri Rahmawati', 'Social', 'Ilmu Sosial & Politik', 3),
    ('The Psychology of Money', 'Morgan Housel', 'Social', 'Ilmu Sosial & Politik, Pengembangan Diri', 3),
    ('Sang Pemimpi', 'Andrea Hirata', 'Relationship', 'Ilmu Sosial & Politik, Pengembangan Diri', 3),
    ('Maaryamah Karpov', 'Andrea Hirata', 'Relationship', 'Psikologi & Kesehatan Mental', 3),
    ('Sang Penjudi', 'Fyodor Dostoevsky', 'Psychology', 'Filsafat & Etika', 3),
    ('Orang Asing', 'Albert Camus', 'Philosophy', 'Filsafat & Etika', 3),
    ('Putusan', 'Franz Kafka', 'Philosophy', 'Filsafat & Etika', 3),
    ('Kejatuhan', 'Albert Camus', 'Philosophy', 'Ilmu Sosial & Politik', 3),
    ('Animal Farm', 'George Orwell', 'Politics, Goverment', 'Ilmu Sosial & Politik, Pengembangan Diri', 3),
    ('Aristotle and Dante Discover the Secrets of the Universe', 'Benjamin Alire Sáenz', 'Relationship', 'Fiksi Genre Spesifik', 3),
    ('A Midsummer''s Equation', 'Keigo Higashino', 'Mystery, Crime', 'Ilmu Sosial & Politik', 3),
    ('1984', 'George Orwell', 'Politics, Goverment', 'Fiksi Sejarah', 3),
    ('Ghazi: The Rise of Ottomans', 'Sayf Muhammad Isa, Felix Siauw', 'Historical Fiction', 'Fiksi Sejarah', 3),
    ('Ghazi: The Howling of Wolf, The Eyesight of Eagle', 'Sayf Muhammad Isa, Felix Siauw', 'Historical Fiction', 'Fiksi Sejarah', 3),
    ('Ghazi: The Beginning of The Conquest', 'Sayf Muhammad Isa, Felix Siauw', 'Historical Fiction', 'Fiksi Sejarah', 3),
    ('Ghazi: The Gaze of Ghazi', 'Sayf Muhammad Isa, Felix Siauw', 'Historical Fiction', 'Filsafat & Etika', 3),
    ('Statism & Anarchy', 'Mikhail Bakunin', 'Philosophy', 'Filsafat & Etika', 3),
    ('Filosofi Teras', 'Henry Manampiring', 'Philosophy', 'Ilmu Sosial & Politik', 3),
    ('Bandarmology', 'Ryan Filbert', 'Social', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('As a Man Thinketh and from Poverty to Power', 'James Allen', 'Self Help', 'Ilmu Sosial & Politik', 3),
    ('Rich Dad Poor Dad', 'Robert Kiyosaki', 'Social', 'Filsafat & Etika', 3),
    ('Sang Pangeran', 'Niccolo Machiavelli', 'Philosophy', 'Filsafat & Etika', 3),
    ('God and the State', 'Mikhail Bakunin', 'Philosophy', 'Filsafat & Etika', 3),
    ('ABC Filsafat', 'Daffin Davanka', 'Philosophy', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('Sebuah Seni untuk Bersikap Bodo Amat', 'Mark Manson', 'Self Help', 'Filsafat & Etika', 3),
    ('Retorika Seni Berbicara', 'Aristotle', 'Philosophy', 'Nonfiksi Naratif', 3),
    ('Asian Godfather', 'Joe Studwell', 'Journalism', 'Filsafat & Etika', 3),
    ('Filsafat Seni Karl Marx', 'Mikhail Lifshitz', 'Philosophy', 'Ilmu Sosial & Politik', 3),
    ('Nak, Belajarlah Soal Uang', 'Jeong Seon Yong', 'Social', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('Think and Grow Rich', 'Napoleon Hill', 'Self Help', 'Nonfiksi Naratif', 3),
    ('Hit Refresh', 'Satya Nadella', 'Journalism', 'Ilmu Sosial & Politik', 3),
    ('Bagaimana Media Sosial Menghancurkanmu', 'Eno Bening', 'Social', 'Sejarah & Biografi', 3),
    ('Introduction to Geography', 'Saul Israel', 'History', 'Ilmu Pengetahuan Alam & Teknologi', 3),
    ('Kosmos', 'Carl Sagan', 'Science', 'Sejarah & Biografi', 3),
    ('Sapiens', 'Yuval Noah Harari', 'History', 'Fiksi Genre Spesifik', 3),
    ('Tokyo Zodiac Murder', 'Soji Shimada', 'Mystery, Crime', 'Fiksi Sejarah', 3),
    ('The Vanishing Half', 'Brit Bennett', 'Historical Fiction', 'Fiksi Genre Spesifik', 3),
    ('Dracula', 'Bram Stoker', 'Horror', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('GRIT: The Power of Passion and Perseverance', 'Angela Duckworth', 'Self Help', 'Nonfiksi Naratif', 3),
    ('Radikus Makankakus', 'Raditya Dika', 'Journalism', 'Nonfiksi Naratif', 3),
    ('Unbroken', 'Laura Hillenbrand', 'Journalism', 'Ilmu Sosial & Politik, Pengembangan Diri', 3),
    ('Ayahku Bukan Pembohong', 'Tere Liye', 'Relationship', 'Fiksi Genre Spesifik', 3),
    ('Pulang Pergi', 'Tere Liye', 'Adventure', 'Fiksi Genre Spesifik', 3),
    ('Pergi', 'Tere Liye', 'Adventure', 'Ilmu Sosial & Politik, Pengembangan Diri', 3),
    ('Moga Bunda Disayang Allah', 'Tere Liye', 'Relationship', 'Fiksi Genre Spesifik', 3),
    ('Bumi', 'Tere Liye', 'Adventure', 'Filsafat & Etika', 3),
    ('Aleph', 'Paulo Coelho', 'Philosophy', 'Psikologi & Kesehatan Mental', 3),
    ('Adultery', 'Paulo Coelho', 'Psychology', 'Filsafat & Etika', 3),
    ('The Zahir', 'Paulo Coelho', 'Philosophy', 'Filsafat & Etika', 3),
    ('Seperti Sungai yang Mengalir (Like the Flowing River)', 'Paulo Coelho', 'Philosophy', 'Filsafat & Etika', 3),
    ('Iblis dan Miss Prym (The Devil and Miss Prym)', 'Paulo Coelho', 'Philosophy', 'Fiksi Kontemporer & Klasik', 3),
    ('Sebelas Menit (Eleven Minutes)', 'Paulo Coelho', 'Drama, Romance', 'Ilmu Sosial & Politik, Pengembangan Diri', 3),
    ('The Fault in Our Stars', 'John Green', 'Relationship', 'Ilmu Sosial & Politik, Pengembangan Diri', 3),
    ('Paper Towns', 'John Green', 'Relationship', 'Ilmu Sosial & Politik, Pengembangan Diri', 3),
    ('Looking for Alaska', 'John Green', 'Relationship', 'Fiksi Kontemporer & Klasik', 3),
    ('Segi Tiga', 'Sapardi Djoko Damono', 'Drama', 'Fiksi Kontemporer & Klasik', 3),
    ('Tenggelamnya Kapal Van Der Wijck', 'Hamka', 'Drama, Romance', 'Fiksi Sejarah', 3),
    ('Kalah dan Menang', 'S. Takdir Alisjahbana', 'Historical Fiction', 'Fiksi Sejarah', 3),
    ('Sekali Peristiwa di Banten Selatan', 'Pramoedya Ananta Toer', 'Historical Fiction', 'Fiksi Genre Spesifik', 3),
    ('The Poppy War', 'R. F. Kuang', 'Fantasy, Dystopian', 'Fiksi Genre Spesifik', 3),
    ('The Dragon Republic', 'R. F. Kuang', 'Fantasy, Dystopian', 'Fiksi Genre Spesifik', 3),
    ('The Burning God', 'R. F. Kuang', 'Fantasy, Dystopian', 'Ilmu Sosial & Politik, Pengembangan Diri', 3),
    ('Heaven', 'Mieko Kawakami', 'Relationship', 'Ilmu Sosial & Politik, Pengembangan Diri', 3),
    ('All the Lovers in the Night', 'Mieko Kawakami', 'Relationship', 'Ilmu Sosial & Politik', 3),
    ('Breasts and Eggs', 'Mieko Kawakami', 'Social Issue', 'Fiksi Sejarah', 3),
    ('Pachinko', 'Min Jin Lee', 'Historical Fiction', 'Fiksi Sejarah', 3),
    ('Sam Kok', 'San Guo Yan Yi', 'Historical Fiction', 'Fiksi Genre Spesifik', 3),
    ('A Game of Thrones Perebutan Takhta', 'George R. R. Martin', 'Fantasy, Dystopian', 'Fiksi Genre Spesifik', 3),
    ('The Curious Incident of the Dog in the Night Time', 'Mark Haddon', 'Mystery, Crime', 'Fiksi Kontemporer & Klasik', 3),
    ('The Merchant of Venice', 'William Shakespeare', 'Comedy, Humanity', 'Fiksi Sejarah', 3),
    ('Romance of Three Kingdoms Vol 1', 'Luo Guan Zhong', 'Historical Fiction', 'Fiksi Sejarah', 3),
    ('Romance of Three Kingdoms Vol 2', 'Luo Guan Zhong', 'Historical Fiction', 'Fiksi Genre Spesifik', 3),
    ('Partikel', 'Dee Lestari', 'Fantasy', 'Fiksi Genre Spesifik', 3),
    ('Kesatria, Putri, & Bintang Jatuh', 'Dee Lestari', 'Fantasy', 'Fiksi Genre Spesifik', 3),
    ('Inteligensi Embun Pagi', 'Dee Lestari', 'Fantasy', 'Fiksi Genre Spesifik', 3),
    ('Origin', 'Dan Brown', 'Mystery', 'Fiksi Genre Spesifik', 3),
    ('Animorphs the Visitor', 'Katherine Applegate', 'Science Fiction', 'Sastra & Puisi', 3),
    ('Hikmah-Hikmah Kehidupan', 'Kahlil Gibran', 'Poetry, Rhymes', 'Fiksi Kontemporer & Klasik', 3),
    ('Sense and Sensibility', 'Jane Austen', 'Drama, Romance', 'Ilmu Sosial & Politik', 3),
    ('Oliver Twist', 'Charles Dickens', 'Social Issue', 'Filsafat & Etika', 3),
    ('The Magic Library', 'Jostein Gaarder', 'Philosophy', 'Fiksi Genre Spesifik', 3),
    ('Inferno', 'Dan Brown', 'Mystery', 'Ilmu Sosial & Politik, Pengembangan Diri', 3),
    ('Laskar Pelangi', 'Andrea Hirata', 'Relationship', 'Fiksi Genre Spesifik, Seni', 3),
    ('Evil Librarians 1', 'Brandon Sanderson', 'Superhero', 'Fiksi Genre Spesifik, Seni', 3),
    ('Evil Librarians 2', 'Brandon Sanderson', 'Superhero', 'Fiksi Genre Spesifik, Seni', 3),
    ('Evil Librarians 3', 'Brandon Sanderson', 'Superhero', 'Fiksi Sejarah', 3),
    ('Anak Semua Bangsa', 'Pramoedya Ananta Toer', 'Historical Fiction', 'Fiksi Sejarah', 3),
    ('Jejak Langkah', 'Pramoedya Ananta Toer', 'Historical Fiction', 'Fiksi Sejarah', 3),
    ('Rumah Kaca', 'Pramoedya Ananta Toer', 'Historical Fiction', 'Ilmu Sosial & Politik', 3),
    ('A Dog Called Money', 'Bodo Schäfer', 'Social', 'Nonfiksi Naratif, Pengembangan Diri', 3),
    ('The History Book Big Ideas Simply Explained', 'DK (Dorling Kindersley)', 'Guide', 'Nonfiksi Naratif, Pengembangan Diri', 3),
    ('The Sherlock Holmes Book Big Ideas Simply Explained', 'DK (Dorling Kindersley)', 'Guide', 'Nonfiksi Naratif, Pengembangan Diri', 3),
    ('The Mythology Book Big Ideas Simply Explained', 'DK (Dorling Kindersley)', 'Guide', 'Nonfiksi Naratif, Pengembangan Diri', 3),
    ('The Shakespare Book Big Ideas Simply Explained', 'DK (Dorling Kindersley)', 'Guide', 'Nonfiksi Naratif, Pengembangan Diri', 3),
    ('The Literature Book Big Ideas Simply Explained', 'DK (Dorling Kindersley)', 'Guide', 'Nonfiksi Naratif, Pengembangan Diri', 3),
    ('The Art Book Big Ideas Simply Explained', 'DK (Dorling Kindersley)', 'Guide', 'Sejarah & Biografi', 3),
    ('Sejarah Filsafat Barat (History of Western Philosophy)', 'Bertrand Russell', 'History', 'Sejarah & Biografi', 3),
    ('Sejarah Filsafat Timur', 'Elizabeth Louisa Moresby', 'History', 'Filsafat & Etika', 3),
    ('How to Keep Your Cool', 'Seneca', 'Philosophy', 'Filsafat & Etika', 3),
    ('How to Die', 'Seneca', 'Philosophy', 'Filsafat & Etika', 3),
    ('How to Win an Election', 'Quintus Tullius Cicero', 'Philosophy', 'Filsafat & Etika', 3),
    ('How to Run a Country', 'Marcus Tullius Cicero', 'Philosophy', 'Filsafat & Etika', 3),
    ('How to Win an Argument', 'Marcus Tullius Cicero', 'Philosophy', 'Filsafat & Etika', 3),
    ('How to Grow Old', 'Marcus Tullius Cicero', 'Philosophy', 'Filsafat & Etika', 3),
    ('How to be a Friend', 'Marcus Tullius Cicero', 'Philosophy', 'Filsafat & Etika', 3),
    ('How to be Free', 'Epiktetos', 'Philosophy', 'Psikologi & Kesehatan Mental', 3),
    ('I Want to Die but I Want to Eat Tteokpokki', 'Baek Se Hee', 'Psychology', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('The Kremlin School of Negotiation', 'Igor Ryzov', 'Self Help', 'Filsafat & Etika', 3),
    ('Kerancauan Filsafat', 'Al-Gazali', 'Philosophy', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('Find Your Why', 'Simon Sinek', 'Self Help', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('Conversations on Love', 'Natasha Lunn', 'Self Help', 'Ilmu Sosial & Politik', 3),
    ('The Richest Man in Babylon', 'George S. Clason', 'Social', 'Psikologi & Kesehatan Mental', 3),
    ('Seorang Pria yang Melalui Duka dengan Mencuci Piring', 'Dr. Andreas Kurniawan', 'Psychology', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('Loving the Wounded Soul', 'Regis Machdy', 'Self Help', 'Filsafat & Etika', 3),
    ('Filsafat Kebahagiaan', 'Fahruddin Faiz', 'Philosophy', 'Filsafat & Etika', 3),
    ('Filsafat Moral', 'Fahruddin Faiz', 'Philosophy', 'Sejarah & Biografi', 3),
    ('Babad Tanah Jawi', 'W. L. Olthof', 'History', 'Nonfiksi Naratif', 3),
    ('Bung Karno Bapakku, Kawanku, Guruku', 'Guntur Soekarno', 'Journalism', 'Nonfiksi Naratif', 3),
    ('Jalan Harus Terang -  SBY', 'Dr. Ahmad Yani Basuki', 'Journalism', 'Nonfiksi Naratif', 3),
    ('Dari Penjara ke Penjara', 'Tan Malaka', 'Journalism', 'Nonfiksi Naratif', 3),
    ('Yap Thien Hien', 'Seri Buku Tempo', 'Journalism', 'Nonfiksi Naratif', 3),
    ('Daud Beureueh', 'Seri Buku Tempo', 'Journalism', 'Nonfiksi Naratif', 3),
    ('Ali Moertopo', 'Seri Buku Tempo', 'Journalism', 'Nonfiksi Naratif', 3),
    ('Douwes Dekker', 'Seri Buku Tempo', 'Journalism', 'Nonfiksi Naratif', 3),
    ('Matahari Jakarta', 'Soekanto S. A.', 'Journalism', 'Nonfiksi Naratif', 3),
    ('Orang Indonesia di Kamp Konsentrasi NAZI', 'Parlindoengan Loebis', 'Journalism', 'Nonfiksi Naratif', 3),
    ('Amir Hamzah Pangeran dari Seberang', 'Nh. Dini', 'Journalism', 'Nonfiksi Naratif', 3),
    ('Catatan Seorang Demonstran', 'Soe Hok Gie', 'Journalism', 'Filsafat & Etika', 3),
    ('Alam Baidu dan Masa Depan Marxisme', 'Martin Suryajaya', 'Philosophy', 'Nonfiksi Naratif', 3),
    ('The Starbucks Experience', 'Joseph Michelli', 'Journalism', 'Nonfiksi Naratif, Pengembangan Diri', 3),
    ('The Adventurous Boys handbook', 'Stephen Brennan', 'Guide', 'Ilmu Sosial & Politik', 3),
    ('Analisis Sekuritas Edisi 5', 'Benjamin Graham', 'Social', 'Sejarah & Biografi', 3),
    ('The History of Javanese Kings', 'Dr. Purwadi', 'History', 'Sejarah & Biografi', 3),
    ('Classical Mythology: Images and Insights Fourth Edition', 'Gloria Platzner, Stephen L. Harris', 'History', 'Nonfiksi Naratif', 3),
    ('Bunga Rampai Kehidupan - Syarifuddin Harahap', 'Agus S.P. Hashibuan', 'Journalism', 'Sejarah & Biografi', 3),
    ('The Decline and Fall of the Roman Empire', 'Edward Gibbon', 'History', 'Nonfiksi Naratif, Pengembangan Diri', 3),
    ('Indonesia', 'Lonely Planet', 'Guide', 'Sejarah & Biografi', 3),
    ('Rise & Fall of the Nazis', 'Claire Welch', 'History', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('12 Rules for Life', 'Jordan Peterson', 'Self Help', 'Ilmu Sosial & Politik', 3),
    ('A Colony in a Nation', 'Chris Hayes', 'Social', 'Ilmu Sosial & Politik', 3),
    ('The Black Swan', 'Nassim Nicholas Taleb', 'Social', 'Ilmu Sosial & Politik', 3),
    ('Accounting 101', 'Michele Cagan', 'Social', 'Filsafat & Etika', 3),
    ('Philosophy 101', 'Paul Kleinman', 'Philosophy', 'Ilmu Pengetahuan Alam & Teknologi', 3),
    ('A Brief History of Time', 'Stephen Hawking', 'Science', 'Ilmu Sosial & Politik', 3),
    ('Good to Great', 'Jim Collins', 'Social', 'Ilmu Pengetahuan Alam & Teknologi', 3),
    ('Brief Answer to the Big Question', 'Stephen Hawking', 'Science', 'Ilmu Pengetahuan Alam & Teknologi', 3),
    ('Mengapa KIta Tidur', 'Matthew Walker, Ph.D.', 'Science', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('Deep Work', 'Cal Newport', 'Self Help', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('Ego is the Enemy', 'Ryan Holiday', 'Self Help', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('Belajar Marketing Belajar Hidup', 'Henry Manampiring', 'Self Help', 'Sastra & Puisi', 3),
    ('Aku Ini Binatang Jalang', 'Chairil Anwar', 'Poetry, Rhymes', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('The Book You Wish Your Parents Had Read', 'Philippa Perry', 'Self Help', 'Filsafat & Etika', 3),
    ('Stoik: Apa dan Bagaimana', 'Massimo Pigliucci', 'Philosophy', 'Nonfiksi Naratif', 3),
    ('Soekarno is a Great Lover', 'Ilmiyanti', 'Journalism', 'Nonfiksi Naratif, Sastra & Puisi', 3),
    ('Hidup Begitu Indah dan Hanya Itu yang Kita Punya', 'Dea Anugrah', 'Essay', 'Nonfiksi Naratif, Sastra & Puisi', 3),
    ('Kenapa Kita Tidak Berdansa', 'Dea Anugrah', 'Essay', 'Filsafat & Etika', 3),
    ('Filsafat Kecerdasan Buatan', 'Martin Suryajaya', 'Philosophy', 'Nonfiksi Naratif', 3),
    ('Wiji Thukul Teka-Teki Orang Hilang', 'TEMPO', 'Journalism', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('Start with Why #Copies 2', 'Simon Sinek', 'Self Help', 'Nonfiksi Naratif', 3),
    ('The Diary of a Young Girl', 'Anne Frank', 'Journalism', 'Fiksi Genre Spesifik', 3),
    ('Tiga Belas Kasus (The Thirteen Problems)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Misteri Gedung Tua', 'Enid Blyton', 'Mystery', 'Fiksi Genre Spesifik', 3),
    ('Petualangan di Sungai Ajaib', 'Enid Blyton', 'Mystery', 'Fiksi Genre Spesifik', 3),
    ('Petualangan di Kapal Pesiar', 'Enid Blyton', 'Mystery', 'Fiksi Genre Spesifik', 3),
    ('Misteri di Holly Lane', 'Enid Blyton', 'Mystery', 'Fiksi Genre Spesifik', 3),
    ('Petualangan di SIrkus Asing', 'Enid Blyton', 'Mystery', 'Fiksi Genre Spesifik', 3),
    ('Petualangan di Gunung Bencana', 'Enid Blyton', 'Mystery', 'Fiksi Genre Spesifik', 3),
    ('Misteri di Tally-Ho', 'Enid Blyton', 'Mystery', 'Fiksi Genre Spesifik', 3),
    ('Misteri Penginapan Tua (The Pale Horse)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Misteri Listerdale (The Listerdale Mystery)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Mengail di Air Keruh (Taken at the Flood)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Kasus-Kasus Terakhir Miss Marple (Miss Marple''s FInal Cases )', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Kartu-Kartu di Meja (Cards on the Table)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Muslihat dengan Cermin (They Do It with Mirrors)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('N atau M? (N or M?)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Poirot Melacak (Poirot Investigates)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Mati di Udara (Death in the Clouds)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Pembunuhan di Orient Express (Murder on the Orient Express)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Pembunuhan di Sungai Nil (Death on the Nile)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Setelah Pemakaman (After the Funeral)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Musuh dalam Selimut (The Secret Adversary)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Pembunuhan Terpendam (Sleeping Murder)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Pasangan Detektif (Partners in Crime)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Rahasia Chimneys (The Secret of Chimneys)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Pembunuhan di Malam Natal (Hercule Poirot''s Christmas)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Satu, Dua, Pasang Gesper Sepatunya (One, Two, Buckle My Shoe)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Misteri Karibia (A Carribean Mystery)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Kucing di Tengah Burung Dara (Cat among the Pigeons)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Penumpang ke Frankfurt (Passenger to Frankfurt)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Dan Cermin pun Retak (And Mirror Crack''d from Side to Side)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Nemesis', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Kubur Berkubah (Deads Man''s Folly)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Mata Rantai yang Hilang (Ordeal by Innocence)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Rumah di Tepi Kanal (By the Pricking of My Thumbs)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Membunuh itu Gampang (Murder is Easy)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Mr. Quin yang Misterius (The Mysterious Mr.Quin)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Mengungkit Pembunuhan (Five Little Pigs)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Pembunuhan di Mesopotamia (Murder in Mesopotamia)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Kereta 4.50 dari Paddington (4.50 from Paddington)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Kasus-Kasus Perdana Poirot (Poirot''s Early Cases)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Menuju Titik Nol (Towards Zero)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Perjanjian dengan Maut (Appointment with Death)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Buku Catatan Josephine (Crooked House)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Mrs. Mcginty Sudah Mati (Mrs. Mcginty''s Dead)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Misteri Tujuh Lonceng (Seven Dials Mystery)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Gadis Ketiga (Third Girl)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Pembunuhan di Lorong (Murder in the Mews)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Mayat Misterius (The Clocks)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Misteri Burung Hitam (A Pocket Full of Rye)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Hotel Bertram (At Bertram''s Hotel)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Pembunuh di Balik Kabut (Why didn''t They Ask Evans)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Pembunuhan di Pondokan Mahasiswa (Hickory Dickory Dock)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Pembunuhan di Wisma Pendeta (Murder at the Vicarage)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Lapangan Golf Maut (Murder on the Links)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Matinya Lord Edgware (Lord Edgware Dies)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Skandal Perjamuan Natal (The Adventure of Christmas Pudding)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Gajah Selalu Ingat (Elephant Can Remember)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Misteri Kereta Api Biru (The Mystery of the Blue Train)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Mayat dalam Perpustakaan (The Body in The Library)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Malam Tanpa Akhir (Endless Night)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Salam Perpisahan (His Last Bow)', 'Sir Arthur Conan Doyle', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Misteri Anjing Setan (The Hound of The Baskerville)', 'Sir Arthur Conan Doyle', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Misteri Empat Tanda (The Sign of Four)', 'Sir Arthur Conan Doyle', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Misteri Lembah Ketakutan (The Valley of Fear)', 'Sir Arthur Conan Doyle', 'Mystery, Crime', 'Sastra & Puisi', 3),
    ('Si Penyewa Kamar Misterius', 'Sir Arthur Conan Doyle', 'Mystery, Crime', 'Fiksi Kontemporer & Klasik', 3),
    ('The Sound and the Fury', 'William Faulkner', 'Literature', 'Fiksi Genre Spesifik', 3),
    ('Shatter Me', 'Tahereh Mafi', 'Drama, Romance', 'Fiksi Genre Spesifik', 3),
    ('Unravel Me', 'Tahereh Mafi', 'Dystopian', 'Fiksi Genre Spesifik', 3),
    ('Ignite Me', 'Tahereh Mafi', 'Dystopian', 'Fiksi Genre Spesifik', 3),
    ('Vicious', 'V. E. Schwab', 'Science Fiction', 'Fiksi Genre Spesifik, Seni', 3),
    ('Vengeful', 'V. E. Schwab', 'Science Fiction', 'Fiksi Genre Spesifik, Seni', 3),
    ('Steelheart', 'Brandon Sanderson', 'Superhero', 'Fiksi Genre Spesifik, Seni', 3),
    ('Firefight', 'Brandon Sanderson', 'Superhero', 'Fiksi Genre Spesifik', 3),
    ('Calamity', 'Brandon Sanderson', 'Superhero', 'Fiksi Genre Spesifik', 3),
    ('The Girl with the Dragon Tattoo', 'Stieg Larsson', 'Mystery', 'Fiksi Sejarah', 3),
    ('Keajaiban Toko Kelontong Namiya', 'Keigo Higashino', 'Adventure', 'Fiksi Genre Spesifik', 3),
    ('Cantik Itu Luka', 'Eka Kurniawan', 'Historical Fiction', 'Psikologi & Kesehatan Mental', 3),
    ('A Good Girl''s Guide to Murder', 'Holly Jackson', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Normal People', 'Sally Rooney', 'Psychology', 'Fiksi Genre Spesifik', 3),
    ('Red Queen', 'Victoria Aveyard', 'Fantasy, Dystopian', 'Fiksi Genre Spesifik', 3),
    ('Cruel Crown', 'Victoria Aveyard', 'Fantasy, Dystopian', 'Fiksi Genre Spesifik', 3),
    ('The Last Olympian', 'Rick Riordan', 'Fantasy, Dystopian', 'Fiksi Kontemporer & Klasik', 3),
    ('The Titan''s Curse', 'Rick Riordan', 'Fantasy, Dystopian', 'Ilmu Sosial & Politik', 3),
    ('Wuthering Heights', 'Emily Bronte', 'Drama, Romance', 'Fiksi Genre Spesifik', 3),
    ('Lalita', 'Ayu Utami', 'Social Issue', 'Fiksi Genre Spesifik', 3),
    ('Harry Potter and the Order of the Phoenix', 'J. K. Rowling', 'Fantasy, Dystopian', 'Ilmu Sosial & Politik, Fiksi Sejarah', 3),
    ('A Court of Thorns and Roses', 'Sarah J. Maas', 'Dystopian, Fantasy', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('Larung', 'Ayu Utami', 'Social Issue, Historical Fiction', 'Sejarah & Biografi', 3),
    ('The Art of Thinking Clearly', 'Rolf Dobelli', 'Self Help', 'Fiksi Genre Spesifik', 3),
    ('Millennium', 'Tom Holland', 'History', 'Fiksi Genre Spesifik', 3),
    ('A Court of Wings and Ruin', 'Sarah J. Maas', 'Dystopian, Fantasy', 'Fiksi Genre Spesifik', 3),
    ('A Court of Silver Flames', 'Sarah J. Maas', 'Dystopian, Fantasy', 'Ilmu Sosial & Politik', 3),
    ('Aroma Karsa', 'Dee Lestari', 'Fantasy', 'Fiksi Sejarah', 3),
    ('Seperti Dendam, Rindu Harus Dibayar Tuntas', 'Eka Kurniawan', 'Social Issue', 'Psikologi & Kesehatan Mental', 3),
    ('Mother Night', 'Kurt Vonnegut', 'Historical Fiction', 'Ilmu Sosial & Politik', 3),
    ('The Catcher in the Rye', 'J. D. Salinger', 'Psychology', 'Filsafat & Etika', 3),
    ('To Kill a Mockingbird', 'Harper Lee', 'Social Issue', 'Psikologi & Kesehatan Mental', 3),
    ('The Stranger', 'Albert Camus', 'Philosophy', 'Fiksi Sejarah', 3),
    ('My Year of Rest and Relaxation', 'Ottessa Moshfegh', 'Psychology', 'Fiksi Kontemporer & Klasik', 3),
    ('Slaughterhouse-Five', 'Kurt Vonnegut', 'Historical Fiction', 'Filsafat & Etika', 3),
    ('Norwegian Wood', 'Haruki Murakami', 'Drama, Romance', 'Fiksi Sejarah', 3),
    ('Crime and Punishment', 'Fyodor Dostoevsky', 'Philosophy', 'Psikologi & Kesehatan Mental', 3),
    ('Bilangan Fu', 'Ayu Utami', 'Historical Fiction', 'Filsafat & Etika', 3),
    ('Kafka on the Shore', 'Haruki Murakami', 'Psychology', 'Fiksi Sejarah', 3),
    ('1Q84', 'Haruki Murakami', 'Philosophy', 'Fiksi Genre Spesifik', 3),
    ('Circe', 'Madeline Miller', 'Historical Fiction', 'Fiksi Genre Spesifik', 3),
    ('24 Jam Bersama Gaspar', 'Sabda Armandio', 'Mystery, Crime', 'Fiksi Sejarah', 3),
    ('King''s Cage', 'Victoria Aveyard', 'Fantasy, Dystopian', 'Ilmu Sosial & Politik, Pengembangan Diri', 3),
    ('Max Havelaar', 'Multatuli', 'Historical Fiction', 'Fiksi Genre Spesifik', 3),
    ('Malam Terakhir', 'Leila S. Chudori', 'Relationship', 'Fiksi Sejarah', 3),
    ('The Sirens of Titan', 'Kurt Vonnegut', 'Science Fiction', 'Fiksi Sejarah', 3),
    ('Book Thief', 'Markus Zusak', 'Historical Fiction', 'Ilmu Sosial & Politik', 3),
    ('Saman', 'Ayu Utami', 'Historical Fiction', 'Fiksi Genre Spesifik', 3),
    ('Perempuan yang Menangis kepada Bulan Hitam', 'Dian Purnomo', 'Social Issue', 'Fiksi Kontemporer & Klasik', 3),
    ('Through the Ever Night', 'Veronica Rossi', 'Science Fiction', 'Fiksi Genre Spesifik', 3),
    ('Maya', 'Ayu Utami', 'Drama, Romance', 'Fiksi Genre Spesifik', 3),
    ('Into the Still Blue', 'Veronica Rossi', 'Science Fiction', 'Fiksi Genre Spesifik', 3),
    ('Obsidian', 'Jennifer L. Armentrout', 'Science Fiction', 'Fiksi Kontemporer & Klasik', 3),
    ('Fantastic Beasts & Where to Find Them', 'J. K. Rowling', 'Fantasy', 'Fiksi Kontemporer & Klasik, Seni', 3),
    ('Corat-Coret di Toilet', 'Eka Kurniawan', 'Drama', 'Fiksi Kontemporer & Klasik, Seni', 3),
    ('Lucid Dream', 'Ziggy Z', 'Graphic Novel', 'Fiksi Kontemporer & Klasik, Seni', 3),
    ('Solvite', 'Hilmy An Nabhany', 'Graphic Novel', 'Fiksi Kontemporer & Klasik, Seni', 3),
    ('Black Reminiscence', 'Fauzi Maulana', 'Graphic Novel', 'Fiksi Kontemporer & Klasik, Seni', 3),
    ('Injurious', 'Nabilla Anasty', 'Graphic Novel', 'Ilmu Sosial & Politik', 3),
    ('Teru Teru Bozu', 'Ziggy Z', 'Graphic Novel', 'Fiksi Kontemporer & Klasik', 3),
    ('Perempuan di Titik Nol', 'Nawal el-Saadawi', 'Social Issue', 'Fiksi Genre Spesifik', 3),
    ('To All the Boys I''ve Loved Before', 'Jenny Han', 'Drama, Romance', 'Fiksi Sejarah', 3),
    ('The Battle of the Labyrinth', 'Rick Riordan', 'Fantasy, Dystopian', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('Go Set a Watchman', 'Harper Lee', 'Historical Fiction', 'Sejarah & Biografi', 3),
    ('The Things You Can See Only When You Slow Down', 'Haemin Sunim', 'Self Help', 'Ilmu Sosial & Politik', 3),
    ('Sejarah Estetika', 'Martin Suryajaya', 'History', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('Freakonomics', 'Steven Levitt', 'Social', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('The 48 Laws of Power', 'Robert Greene', 'Self Help', 'Filsafat & Etika', 3),
    ('Atomic Habits', 'James Clear', 'Self Help', 'Filsafat & Etika', 3),
    ('Ayat-Ayat Kiri', 'Karl Marx, Friedrich Engels, Rosa Luxemburg, Mao Zedong, Ernesto Che Guevara, Vladimir Lenin, Joseph Stalin, Jean-Paul Sartre, Slavoj Žižek, Soekarno', 'PhIlosophy', 'Fiksi Genre Spesifik', 3),
    ('The Art of War #Copies 2', 'Sun Tzu', 'Philosophy', 'Fiksi Genre Spesifik', 3),
    ('Glass Sword', 'Victoria Aveyard', 'Dystopian', 'Fiksi Kontemporer & Klasik, Fiksi Genre Spesifik', 3),
    ('Moby-Dick', 'Herman Melville', 'Adventure', 'Fiksi Kontemporer & Klasik', 3),
    ('The Adventure of Tom Sawyer & Huckleberry Finn', 'Mark Twain', 'Satire, Adventure', 'Psikologi & Kesehatan Mental', 3),
    ('Floating in Space', 'Naela Ali', 'Romance', 'Fiksi Kontemporer & Klasik', 3),
    ('The Bell Jar', 'Sylvia Path', 'Psychology', 'Fiksi Kontemporer & Klasik, Seni', 3),
    ('Hujan Bulan Juni', 'Sapardi Djoko Damono', 'Romance', 'Fiksi Kontemporer & Klasik, Seni', 3),
    ('Nanti Kita Cerita Tentang Hari Ini', 'Marchella FP', 'Graphic Novel', 'Fiksi Kontemporer & Klasik, Seni', 3),
    ('Love is...', 'Puuung', 'Graphic Novel', 'Fiksi Kontemporer & Klasik, Seni', 3),
    ('The Book of Imaginary Beliefs', 'Lala Bohang', 'Graphic Novel', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('The Book of Forbidden Feelings', 'Lala Bohang', 'Graphic Novel', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('Mindset', 'Carol S. Dweck', 'Self Help', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('The Art of Loving', 'Erich Fromm', 'Self Help', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('Rusak Saja Buku Ini', 'Sony Adams', 'Self Help', 'Fiksi Genre Spesifik', 3),
    ('Wreck This Journal', 'Keri Smith', 'Self Help', 'Fiksi Genre Spesifik', 3),
    ('Bintang', 'Tere Liye', 'Adventure', 'Fiksi Genre Spesifik', 3),
    ('Matahari', 'Tere Liye', 'Adventure', 'Fiksi Genre Spesifik', 3),
    ('Bulan', 'Tere Liye', 'Adventure', 'Fiksi Genre Spesifik', 3),
    ('Akar', 'Dee Lestari', 'Fantasy', 'Ilmu Sosial & Politik, Pengembangan Diri', 3),
    ('Petir', 'Dee Lestari', 'Fantasy', 'Fiksi Kontemporer & Klasik, Seni', 3),
    ('Anne of Green Gables and Anne of Avonlea', 'Lucy Maud Montgomery', 'Relationship', 'Fiksi Kontemporer & Klasik, Seni', 3),
    ('Stories for Rainy Days Volume 2', 'Naela Ali', 'Graphic Novel', 'Fiksi Kontemporer & Klasik, Seni', 3),
    ('Stories for Rainy Days Volume 3', 'Naela Ali', 'Graphic Novel', 'Filsafat & Etika', 3),
    ('Jingga Jenaka', 'Annisa Rizkiana Rahmasari', 'Graphic Novel', 'Filsafat & Etika', 3),
    ('Dunia Sophie', 'Jostein Gaarder', 'Philosophy', 'Fiksi Genre Spesifik', 3),
    ('The Metamorphosis', 'Franz Kafka', 'Philosophy', 'Fiksi Sejarah', 3),
    ('The Little Prince', 'Antoine de Saint-Exupéry', 'Science Fiction', 'Fiksi Genre Spesifik', 3),
    ('For Whom the Bell Tolls', 'Ernest Hemingway', 'Historical Fiction', 'Ilmu Sosial & Politik', 3),
    ('Lord of the Rings: The Two Towers', 'J. R. R. Tolkien', 'Fantasy, Dystopian', 'Fiksi Genre Spesifik', 3),
    ('Cerita-Cerita Jakarta', 'Ratri Ninditya, Hanna Fransisca, Sabda Armandio, Utiuts, Dewi Kharisma Michellia, Ziggy Zezsyazeoviennazabrizkie, Ben Sohib, Cyntha Hariadi, Afrizal Malna, Yusi Avianto Pareanom', 'Social Issue', 'Fiksi Genre Spesifik', 3),
    ('The Da Vinci Code', 'Dan Brown', 'Mystery', 'Fiksi Genre Spesifik', 3),
    ('The Lost Symbol', 'Dan Brown', 'Mystery', 'Fiksi Genre Spesifik', 3),
    ('Digital Fortress', 'Dan Brown', 'Mystery', 'Sastra & Puisi', 3),
    ('The Bliss Bakery', 'Kathryn Littlewood', 'Adventure', 'Sastra & Puisi', 3),
    ('Sergius Mencari Bacchus', 'Norman Erikson Pasaribu', 'Poetry, Rhymes', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('Malam Ini Aku Akan Tidur di Matamu', 'Joko Pinurbo', 'Poetry, Rhymes', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('Things & Thoughts I Drew When I Was Bored', 'Naela Ali', 'Self Help', 'Nonfiksi Naratif, Sastra & Puisi', 3),
    ('The Book of Invisible Question', 'Lala Bohang', 'Self Help', 'Psikologi & Kesehatan Mental', 3),
    ('I am My Own Home and other Essays', 'Isyana Artharini', 'Essay', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('Art & Jung Seni Dalam Sorotan Psikologi Analitis Jung', 'Buntje Harbunangin', 'Psychology', 'Ilmu Sosial & Politik', 3),
    ('Bimbingan Lengkap Membentuk Kecerdasan & Kesehatan Emosional (EQ) Anak Sejak Dini', 'Dianna Hine', 'Self Help', 'Ilmu Sosial & Politik', 3),
    ('Unlimited Wealth', 'Bong Chandra', 'Social', 'Ilmu Sosial & Politik', 3),
    ('The Cashflow Quadrant', 'Robert Kiyosaki', 'Social', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('Rich Dad''s Guide to Investing', 'Robert Kiyosaki', 'Social', 'Ilmu Sosial & Politik', 3),
    ('The Subtle Art of not Giving a Fuck', 'Mark Manson', 'Self Help', 'Nonfiksi Naratif', 3),
    ('Cerdas Uang Zaman Sekarang', 'Anatoli Dzikri Al Indragiri', 'Social', 'Fiksi Genre Spesifik', 3),
    ('Chairul Tanjung si Anak Singkong', 'Tjahja Gunawan Diredja', 'Journalism', 'Fiksi Genre Spesifik', 3),
    ('Petualangan Huckleberry Finn', 'Mark Twain', 'Adventure', 'Fiksi Kontemporer & Klasik', 3),
    ('Death on the Nile', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Kontemporer & Klasik', 3),
    ('Romeo and Juliet', 'William Shakespeare', 'Drama, Romance', 'Fiksi Kontemporer & Klasik', 3),
    ('New Kids on the Block: Berlatih', 'Seth McEvoy & Laure Smith', 'Drama', 'Psikologi & Kesehatan Mental', 3),
    ('Love Story', 'Erich Segal', 'Drama, Romance', 'Fiksi Kontemporer & Klasik', 3),
    ('Chicken Soup for the Preteen Soul', 'Jack Canfield', 'Psychology', 'Fiksi Genre Spesifik', 3),
    ('The Adventures of Tom Sawyer', 'Mark Twain', 'Satire', 'Fiksi Genre Spesifik', 3),
    ('The Treasure Seekers', 'Michael Donovan', 'Adventure', 'Nonfiksi Naratif', 3),
    ('Pencari Harta Karun', 'Michael Donovan', 'Adventure', 'Fiksi Genre Spesifik', 3),
    ('Wise Guy', 'Nicholas Pileggi', 'Journalism', 'Fiksi Genre Spesifik', 3),
    ('Petualangan di Gunung Bencana #Copies 2', 'Enid Blyton', 'Mystery', 'Fiksi Genre Spesifik', 3),
    ('The Adventures of Huckleberry Finn', 'Mark Twain', 'Adventure', 'Fiksi Genre Spesifik', 3),
    ('Menuju Titik Nol', 'Agatha Christie', 'Mystery, Crime', 'Ilmu Sosial & Politik', 3),
    ('Towards Zero', 'Agatha Christie', 'Mystery, Crime', 'Ilmu Sosial & Politik', 3),
    ('Nineteen Eighty-Four', 'George Orwell', 'Politics, Goverment', 'Fiksi Genre Spesifik', 3),
    ('Tahun 1984', 'George Orwell', 'Politics, Goverment', 'Nonfiksi Naratif', 3),
    ('Menjelang Titik Terakhir', 'Agatha Christie', 'Mystery, Crime', 'Nonfiksi Naratif', 3),
    ('Revolusi di Nusa Damai', 'K''tut Tantri', 'Journalism', 'Fiksi Genre Spesifik', 3),
    ('Revolt in Paradise', 'K''tut Tantri', 'Journalism', 'Fiksi Genre Spesifik', 3),
    ('Bajak Laut', 'Harold Robins', 'Adventure', 'Fiksi Genre Spesifik', 3),
    ('The Pirate', 'Harold Robins', 'Adventure', 'Fiksi Kontemporer & Klasik', 3),
    ('The Other Side of Midnight', 'Sidney Sheldon', 'Mystery', 'Fiksi Genre Spesifik', 3),
    ('Petualangan Tom Sawyer', 'Mark Twain', 'Satire', 'Fiksi Genre Spesifik', 3),
    ('Pembunuhan di Sungai Nil', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Pembunuhan Atas Roger Ackroyd', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('The Murder of Roger Ackroyd', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Mountain of Adventure', 'Enid Blyton', 'Mystery', 'Fiksi Genre Spesifik', 3),
    ('Rage of Angels', 'Sidney Sheldon', 'Mystery', 'Fiksi Kontemporer & Klasik', 3),
    ('The Naked Face', 'Sidney Sheldon', 'Mystery', 'Fiksi Genre Spesifik', 3),
    ('79 Park Avenue', 'Harold Robins', 'Drama', 'Fiksi Genre Spesifik', 3),
    ('Robinson Crusoe', 'Daniel Defoe', 'Adventure', 'Fiksi Kontemporer & Klasik', 3),
    ('Serigala Siluman', 'Franklin W. Dixon', 'Mystery', 'Fiksi Genre Spesifik', 3),
    ('New Kids on the Block Workin'' Out', 'Seth McEvoy & Laure Smith', 'Drama', 'Fiksi Genre Spesifik', 3),
    ('Around the World in Eighty Days', 'Jules Verne', 'Adventure', 'Fiksi Genre Spesifik', 3),
    ('Round the World in 80 Days', 'Jules Verne', 'Adventure', 'Fiksi Kontemporer & Klasik', 3),
    ('Night of the Werewolf', 'Franklin W. Dixon', 'Mystery', 'Fiksi Genre Spesifik', 3),
    ('Romeo dan Julia', 'William Shakespeare', 'Drama, Romance', 'Fiksi Genre Spesifik', 3),
    ('Rosemary''s Baby', 'Ira Levin', 'Horror', 'Nonfiksi Naratif', 3),
    ('80 Hari Keliling Dunia', 'Jules Verne', 'Adventure', 'Nonfiksi Naratif', 3),
    ('IACOCCA: Sebuah Otobiografi', 'Lee Iacocca', 'Journalism', 'Sejarah & Biografi', 3),
    ('Veil: The Secret Wars of the CIA', 'Bob Woodward', 'Journalism', 'Sejarah & Biografi', 3),
    ('Garis Besar Sejarah Amerika', 'Frances Whitney', 'History', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('An Outline of American History', 'Frances Whitney', 'History', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('Cara Cepat & Mudah Berbicara Efektif', 'Dale Carnegie', 'Self Help', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('The 7 Habits of Highly Effective People', 'Stephen R. Covey', 'Self Help', 'Ilmu Sosial & Politik', 3),
    ('The 7 Habits of Highly Effective People (7 Kebiasaan Manusia yang Sangat Efektif)', 'Stephen R. Covey', 'Self Help', 'Ilmu Sosial & Politik', 3),
    ('Megatrends 2000', 'Naisbitt & Aburdene', 'Social', 'Ilmu Pengetahuan Alam & Teknologi', 3),
    ('Future Shock', 'Alvin Toffler', 'Social', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('How Not to Die Young', 'Dr. Joan Gomez', 'Science', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('Anda Pasti Bisa Bila Anda Pikir Bisa', 'Norman Vincent Peale', 'Self Help', 'Nonfiksi Naratif', 3),
    ('The Art of Negotiating', 'Gerard I. Nierenberg', 'Self Help', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('IACOCCA: An Autobiography', 'Lee Iacocca', 'Journalism', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('How to Win Friends and Influence People', 'Dale Carnegie', 'Self Help', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('The Quick & Easy Way to Effective Speaking', 'Dale Carnegie', 'Self Help', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('How to Stop Worrying and Start Living', 'Dale Carnegie', 'Self Help', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('Berpikir Maju Sumber Setiap Sukses', 'Napoleon Hill', 'Self Help', 'Ilmu Sosial & Politik', 3),
    ('Seni Negosiasi', 'Gerard I. Nierenberg', 'Self Help', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('Kejutan Masa Depan', 'Alvin Toffler', 'Social', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('Tuan Ingin Banyak Kawan?', 'Dale Carnegie', 'Self Help', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('Cara yang Paling Tepat & Mudah untuk Berbicara dan Berpidato', 'Dale Carnegie', 'Self Help', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('Berpikir & Menjadi Kaya', 'Napoleon Hill', 'Self Help', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('How to Enjoy Your Life and Your Job', 'Dale Carnegie', 'Self Help', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('Resep-Resep Berumur Panjang', 'Joan Gomez', 'Self Help', 'Nonfiksi Naratif', 3),
    ('Petunjuk Hidup Tentram dan Bahagia', 'Dale Carnegie', 'Self Help', 'Ilmu Pengetahuan Alam & Teknologi', 3),
    ('Kisah Penghidupan Abraham Lincoln', 'Stefan Lorant', 'Journalism', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('Dr. Einstein dan Alam Semesta', 'Lincoln Barnett', 'Science', 'Ilmu Pengetahuan Alam & Teknologi', 3),
    ('Petunjuk Menikmati Hidup dan Pekerjaan Anda', 'Dale Carnegie', 'Self Help', 'Nonfiksi Naratif', 3),
    ('The Universe and Dr. Einstein', 'Lincoln Barnett', 'Science', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('The Life of Abraham Lincoln', 'Stefan Lorant', 'Journalism', 'Ilmu Pengetahuan Alam & Teknologi, Psikologi & Kesehatan Mental', 3),
    ('You Can If You Think You Can', 'Norman Vincent Peale', 'Self Help', 'Ilmu Pengetahuan Alam & Teknologi, Psikologi & Kesehatan Mental', 3),
    ('Aerobics', 'Kenneth H. Cooper', 'Health and Fitness', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('Aerobik', 'Kenneth H. Cooper', 'Health and Fitness', 'Agama, Filsafat & Etika', 3),
    ('Cara Mencari Kawan dan Mempengaruhi Orang', 'Dale Carnegie', 'Self Help', 'Agama, Filsafat & Etika', 3),
    ('99 Wisdom from the Holy Qur''an', 'Adi Kurniadi', 'Spiritual', 'Ilmu Sosial & Politik', 3),
    ('50 Prayers from the Holy Qur''an', 'Adi Kurniadi', 'Spiritual', 'Filsafat & Etika', 3),
    ('Teruslah Bodoh Jangan Pintar', 'Tere Liye', 'Social Issue', 'Nonfiksi Naratif, Sastra & Puisi', 3),
    ('The Ikigai Journey', 'Hector Garcia', 'Philosophy', 'Ilmu Pengetahuan Alam & Teknologi', 3),
    ('Outliers', 'Malcolm Gladwell', 'Essay', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('How to Find Higgs Boson and Other Big Mysteries In the World of Very Small', 'Ivo Van Vulpen', 'Science', 'Nonfiksi Naratif, Sastra & Puisi', 3),
    ('Practical Steps to Think & Grow Rich', 'Napoleon Hill', 'Self Help', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('Si Parasit Lajang Seks, Sketsa, & Cerita', 'Ayu Utami', 'Essay', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('Grit: Kekuatan Passion & Kegigihan', 'Angela Duckworth', 'Self Help', 'Filsafat & Etika', 3),
    ('Start with Why', 'Simon Sinek', 'Self Help', 'Fiksi Genre Spesifik', 3),
    ('The Art of War', 'Sun Tzu', 'Philosophy', 'Ilmu Sosial & Politik', 3),
    ('Glass Sword #Copies 2', 'Victoria Aveyard', 'Dystopian', 'Fiksi Genre Spesifik', 3),
    ('The Psychology of Money #Copies 2', 'Morgan Housel', 'Social', 'Nonfiksi Naratif, Sastra & Puisi', 3),
    ('Miss Peregrine''s Home for Peculiar Children', 'Ransom Riggs', 'Horror', 'Nonfiksi Naratif, Sastra & Puisi', 3),
    ('Blink', 'Malcolm Gladwell', 'Essay', 'Nonfiksi Naratif, Sastra & Puisi', 3),
    ('What the Dog Saw', 'Malcolm Gladwell', 'Essay', 'Nonfiksi Naratif, Sastra & Puisi', 3),
    ('David and Goliath', 'Malcolm Gladwell', 'Essay', 'Nonfiksi Naratif', 3);

-- Batch 8/8 (Records 3501-3592)
INSERT INTO books (title, author, category, general_category, library_id) VALUES
    ('Tipping Point', 'Malcolm Gladwell', 'Essay', 'Nonfiksi Naratif, Sastra & Puisi', 3),
    ('Man''s Search for Meaning', 'Viktor E. Frankl', 'Journalism', 'Fiksi Genre Spesifik', 3),
    ('Outliers #Copies 2', 'Malcolm Gladwell', 'Essay', 'Filsafat & Etika', 3),
    ('The Secret History', 'Donna Tartt', 'Mystery', 'Fiksi Sejarah', 3),
    ('The Myth of Sisyphus', 'Albert Camus', 'Philosophy', 'Fiksi Genre Spesifik', 3),
    ('One Hundred Years of Solitude', 'Gabriel Garcia Marquez', 'Historical Fiction', 'Fiksi Genre Spesifik', 3),
    ('The Wind-Up Bird Chronicle', 'Haruki Murakami', 'Fantasy', 'Filsafat & Etika', 3),
    ('Fahrenheit 451', 'Ray Bradbury', 'Dystopian', 'Nonfiksi Naratif', 3),
    ('Dibawah Bendera Revolusi Jilid 1', 'Ir Soekarno', 'Philosophy', 'Fiksi Genre Spesifik', 3),
    ('Tan Malaka: Bapak Republik yang Dilupakan', 'Seri Buku Tempo: Bapak Bangsa Empat Serangkai Pendiri Republik', 'Journalism', 'Fiksi Genre Spesifik', 3),
    ('The Case Book of Sherlock Holmes', 'Sir Arthur Conan Doyle', 'Mystery, Crime', 'Fiksi Genre Spesifik', 3),
    ('Hyouka', 'Yonezawa Honobu', 'Mystery', 'Fiksi Genre Spesifik', 3),
    ('Approximating The Distance Between Two People', 'Yonezawa Honobu', 'Mystery', 'Psikologi & Kesehatan Mental', 3),
    ('Credit Roll of The Fool', 'Yonezawa Honobu', 'Mystery', 'Sejarah & Biografi', 3),
    ('Chicken Soup for The Golden Soul', 'Jack Canfield', 'Psychology', 'Fiksi Genre Spesifik', 3),
    ('Kehidupan Sosial di Batavia', 'Jean Gelman Taylor', 'History', 'Fiksi Genre Spesifik', 3),
    ('The Big Four (Empat Besar)', 'Agatha Christie', 'Mystery, Crime', 'Fiksi Kontemporer & Klasik', 3),
    ('Hallowe''en Party (Pesta Hallowe''en)', 'Agatha Christie', 'Mystery, Crime', 'Ilmu Sosial & Politik', 3),
    ('Persuasion', 'Jane Austen', 'Drama, Romance', 'Ilmu Sosial & Politik', 3),
    ('Ekonomi Politik Pembangunan Timor Timur', 'Joao Mariano de Sousa Saldanha', 'Social', 'Filsafat & Etika', 3),
    ('The Political Economy of East Timor Development', 'Joao Mariano de Sousa Saldanha', 'Social', 'Nonfiksi Naratif, Sastra & Puisi', 3),
    ('The Fall', 'Albert Camus', 'Philosophy', 'Ilmu Sosial & Politik', 3),
    ('Tanggung Jawab Para Intelektual', 'Noam Chomsky', 'Essay', 'Ilmu Sosial & Politik', 3),
    ('Politik Kuasa Media', 'Noam Chomsky', 'Social', 'Fiksi Kontemporer & Klasik, Seni', 3),
    ('On Palestine', 'Noam Chomsky, Ilan Pappe', 'Social', 'Nonfiksi Naratif, Sastra & Puisi', 3),
    ('Menjadi Nyala', 'Alnurul Gheulia', 'Graphic Novel', 'Ilmu Sosial & Politik', 3),
    ('Madilog', 'Tan Malaka', 'Essay', 'Nonfiksi Naratif, Sastra & Puisi', 3),
    ('Cerita dari Jakarta', 'Pramoedya Ananta Toer', 'Social Issue', 'Nonfiksi Naratif, Sastra & Puisi', 3),
    ('Gerpolek (Gerilya-Politik-Ekonomi)', 'Tan Malaka', 'Essay', 'Nonfiksi Naratif, Sastra & Puisi', 3),
    ('Aksi Massa', 'Tan Malaka', 'Essay', 'Nonfiksi Naratif, Sastra & Puisi', 3),
    ('Islam dan Sosialisme', 'HOS Tjokroaminoto', 'Essay', 'Sastra & Puisi', 3),
    ('Nasionalisme Islamisme Marxisme', 'Ir Soekarno', 'Essay', 'Sastra & Puisi', 3),
    ('Sang Nabi', 'Kahlil Gibran', 'Poetry, Rhymes', 'Fiksi Genre Spesifik', 3),
    ('Bermain Kata Beribadah Puisi', 'Joko Pinurbo', 'Poetry, Rhymes', 'Fiksi Kontemporer & Klasik', 3),
    ('The Old Man and the Sea', 'Ernest Hemingway', 'Adventure', 'Fiksi Sejarah', 3),
    ('Macbeth', 'William Shakespare', 'Drama', 'Fiksi Kontemporer & Klasik', 3),
    ('Gajahmada', 'Langit Kresna Hariadi', 'Historical Fiction', 'Fiksi Kontemporer & Klasik, Fiksi Genre Spesifik', 3),
    ('Breakfast at Tiffany''s', 'Truman Capote', 'Drama, Romance', 'Sejarah & Biografi', 3),
    ('Jakarta Sebelum Pagi', 'Young Adult', 'Romance, Mystery', 'Agama, Filsafat & Etika', 3),
    ('Kehidupan Sosial di Batavia', 'Jean Gelman Taylor', '1975', 'Fiksi Genre Spesifik', 3),
    ('Secrets of Divine Love', 'A. Helwa', 'Spiritual', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('Petualangan di Lembah Maut', 'Enid Blyton', 'Mystery', 'Seni', 3),
    ('How To Sell Yourself', 'Joe Girard', 'Self Help', 'Fiksi Kontemporer & Klasik, Seni', 3),
    ('Potensi Manusia: Kreativitas', 'Primadi Tabrani', 'Art', 'Fiksi Kontemporer & Klasik, Seni', 3),
    ('The Dead Returns', 'Akiyoshi Rikako', 'Comic', 'Fiksi Kontemporer & Klasik, Seni', 3),
    ('Attack on Titan 1, 10', 'Hajime Isayama', 'Comic', 'Fiksi Kontemporer & Klasik, Seni', 3),
    ('Naruto (Compiled 1-18, 20, 57, 58)', 'Masashi Kishimoto', 'Comic', 'Fiksi Kontemporer & Klasik, Seni', 3),
    ('H2O Reborn Phase 1-3', 'Sweta Kartika', 'Comic', 'Fiksi Kontemporer & Klasik, Seni', 3),
    ('Wanara Vol.1', 'Sweta Kartika', 'Comic', 'Fiksi Kontemporer & Klasik, Seni', 3),
    ('Wanara Vol.2', 'Sweta Kartika', 'Comic', 'Fiksi Kontemporer & Klasik, Seni', 3),
    ('Bleach 1,2,4, 6-10, 12, 13', 'Tite Kubo', 'Comic', 'Fiksi Genre Spesifik, Fiksi Sejarah', 3),
    ('Assassination Classroom (Compiled 3-5, 7-9, 13)', 'Yusei Matsui', 'Comic', 'Sejarah & Biografi', 3),
    ('Babel', 'R.F. Kuang', 'Fantasy, Historical Fiction', 'Fiksi Kontemporer & Klasik', 3),
    ('The House of Wisdom: How Arabic Science Saved Ancient Knowledge and Gave Us the Renaissance', 'Jim Al-Khalili', 'History', 'Fiksi Kontemporer & Klasik, Seni', 3),
    ('White Nights', 'Fyodor Dostoevsky', 'Romance', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('Blue Spring Ride Vol. 2-4, 7, 9-10', 'Io Sakisaka', 'Comic', 'Fiksi Genre Spesifik', 3),
    ('Makanya, Mikir!', 'Abigail Limuria, Cania Cita', 'Self Help', 'Fiksi Sejarah', 3),
    ('Harimau! Harimau!', 'Mochtar Lubis', 'Thriller', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 3),
    ('Ronggeng Dukuh Paruk', 'Ahmad Tohari', 'Historical Fiction', 'Sejarah & Biografi', 3),
    ('Orang-orang Proyek', 'Ahmad Tohari', 'Literary Fiction', 'Fiksi Sejarah', 3),
    ('Perawan Remaja Dalam Cengkeraman Militer', 'Pramoedya Ananta Toer', 'History', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 3),
    ('Burung-Burung Manyar', 'Y.B. Mangunwijaya', 'Historical Fiction', 'Sejarah & Biografi', 3),
    ('The Vegetarian', 'Han Kang', 'Literary Fiction', 'Fiksi Sejarah', 3),
    ('Subjek Sunda', 'Holy Rafika Dhona', 'History', 'Fiksi Sejarah', 3),
    ('Laut Bercerita', 'Leila S. Chudori', 'Historical Fiction', 'Fiksi Kontemporer & Klasik', 3),
    ('Pulang', 'Leila S. Chudori', 'Historical Fiction', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 3),
    ('Re: dan Perempuan', 'Maman Suherman', 'Drama', 'Nonfiksi Naratif, Sastra & Puisi', 3),
    ('Tertolak sebagai Manusia', 'Osamu Dazai', 'Literary Fiction', 'Nonfiksi Naratif, Sastra & Puisi', 3),
    ('Kalau Kerasukan Lingkungan, Baiknya Dibawa ke Klinik Saja', 'Kafi Khaibar Lubis', 'Essay', 'Fiksi Sejarah', 3),
    ('Melawan dengan Gagasan', 'Bandung Bergerak', 'Essays', 'Sejarah & Biografi', 3),
    ('Don Quixote', 'Miguel de Cervantes Saavedra
', 'Historical Fiction', 'Psikologi & Kesehatan Mental', 3),
    ('Aldera: Potret Gerakan Politik Kaum Muda 1993-1999', 'Teddy Wibisana, Nanang Pujalaksana, Rahadi T. Wiratama', 'History', 'Fiksi Genre Spesifik', 3),
    ('The Art Of Living: Hidup Antara Memiliki dan Menjadi', 'Erich Fromm', 'Psychology', 'Pengembangan Diri, Psikologi & Kesehatan Mental', 3),
    ('Supernatural: #2 Witch''s Canyon', 'Jeff Mariotte', 'Fantasy', 'Sejarah & Biografi, Nonfiksi Naratif', 3),
    ('Mindfulness for All: The Wisdom to Transform the World', 'Jon Kabat-Zinn', 'Self Help', 'Nonfiksi Naratif, Sastra & Puisi', 3),
    ('My Brief History - Sejarah Singkat Saya', 'Stephen Hawking', 'Biography', 'Filsafat & Etika', 3),
    ('Slow', 'Greatmind', 'Essay', 'Fiksi Genre Spesifik', 3),
    ('Orang Aneh', 'Albert Camus', 'Philosophy', 'Filsafat & Etika', 3),
    ('Bintang [#2 copy]', 'Tere Liye', 'Adventure', 'Fiksi Genre Spesifik', 3),
    ('The Beginner''s Guide to Living', 'Lia Hills', 'Philosophy', 'Nonfiksi Naratif', 3),
    ('Dark Fantasteen: Bloody Memory', 'Ziggy Zezsyazeoviennazabrizkie', 'Horror', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 3),
    ('Kamus Basa Sunda: Sunda-Indonesia, Indonesia-Sunda', 'Asep Kusnandar', 'Other', 'Sastra & Puisi, Nonfiksi Naratif', 3),
    ('The Nick Adams Stories', 'Ernest Hemingway', 'Literary Fiction', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 3),
    ('Yankee Invasion: A Novel of Mexico City', 'Ignacio Solares', 'Historical Fiction', 'Fiksi Sejarah', 3),
    ('Lelaki Harimau', 'Eka Kurniawan', 'Literary Fiction', 'Fiksi Kontemporer & Klasik, Sastra & Puisi', 3),
    ('Eleanor of Aquitaine', 'Desmond Seward', 'History', 'Sejarah & Biografi', 3),
    ('Caramel Macchiato', 'Iffah Ariqoh', 'Romance', 'Fiksi Kontemporer & Klasik', 3),
    ('Sang Putri dan Sang Pemintal', 'Neil Gaiman', 'Graphic Novel', 'Fiksi Kontemporer & Klasik, Seni', 3),
    ('Financial Management Canvas: Dapatkan Esensi Laporan Keuangan Secara Visual untuk Meningkatkan Kinerja Perusahaan', 'Kho Sin Hien', 'Financial Management', 'Ekonomi, Bisnis & Manajemen', 3),
    ('Value Proposition Design', 'Alex Osterwalder, Yves Pigneur, Greg Bernarda, Alan Smith', 'Business', 'Bisnis & Manajemen, Ekonomi', 3),
    ('Hidup, Cinta, dan Kematian Che Guevara', 'Jorge G. Castañeda', 'Biography', 'Sejarah & Biografi, Nonfiksi Naratif', 3),
    ('Eat, Pray, Love - Makan, Doa, Cinta', 'Elizabeth Gilbert', 'Memoir', 'Sejarah & Biografi, Nonfiksi Naratif', 3);

-- =====================================================
-- CREATE HELPFUL VIEWS
-- =====================================================

-- View: Books with Library Name
CREATE OR REPLACE VIEW books_with_library AS
SELECT 
    b.id,
    b.title,
    b.author,
    b.category,
    b.general_category,
    b.library_id,
    l.name as library_name,
    b.created_at,
    b.updated_at
FROM books b
JOIN libraries l ON b.library_id = l.id;

-- View: Library Statistics
CREATE OR REPLACE VIEW library_statistics AS
SELECT 
    l.id,
    l.name,
    COUNT(b.id) as total_books,
    COUNT(DISTINCT b.author) as total_authors
FROM libraries l
LEFT JOIN books b ON l.id = b.library_id
GROUP BY l.id, l.name;

-- =====================================================
-- CREATE SEARCH FUNCTION
-- =====================================================

-- Function: Search books with filters
CREATE OR REPLACE FUNCTION search_books(
    search_query TEXT DEFAULT NULL,
    filter_library_id INTEGER DEFAULT NULL,
    filter_category TEXT DEFAULT NULL,
    limit_count INTEGER DEFAULT 50,
    offset_count INTEGER DEFAULT 0
) RETURNS TABLE (
    id INTEGER,
    title TEXT,
    author VARCHAR,
    category TEXT,
    general_category TEXT,
    library_id INTEGER,
    library_name VARCHAR
) AS $$
BEGIN
    RETURN QUERY
    SELECT b.id, b.title, b.author, b.category, b.general_category,
           b.library_id, l.name as library_name
    FROM books b
    JOIN libraries l ON b.library_id = l.id
    WHERE 
        (search_query IS NULL OR 
         b.title ILIKE '%' || search_query || '%' OR 
         b.author ILIKE '%' || search_query || '%')
        AND (filter_library_id IS NULL OR b.library_id = filter_library_id)
        AND (filter_category IS NULL OR b.category ILIKE '%' || filter_category || '%')
    ORDER BY b.title
    LIMIT limit_count
    OFFSET offset_count;
END;
$$ LANGUAGE plpgsql;

-- =====================================================
-- STATISTICS & USAGE EXAMPLES
-- =====================================================

-- Database Statistics:
-- Total Books: 3592
-- Total Libraries: 3
-- Total Categories: 889
-- Total General Categories: 15

-- Salman Reading Corner: 1219 books
-- HOWL Library: 1806 books
-- Creative Space: 567 books

-- Usage Examples:
-- 1. View all libraries with statistics:
--    SELECT * FROM library_statistics;
--
-- 2. View books with library name:
--    SELECT * FROM books_with_library LIMIT 10;
--
-- 3. Search books by title:
--    SELECT * FROM search_books('Muhammad');
--
-- 4. Search books by author:
--    SELECT * FROM search_books('KUNTOWIJOYO');
--
-- 5. Filter by library:
--    SELECT * FROM search_books(NULL, 1);  -- Salman Reading Corner
--
-- 6. Search with multiple filters:
--    SELECT * FROM search_books('Islam', 1, 'Dakwah');
--
-- 7. Count books by library:
--    SELECT library_id, COUNT(*) FROM books GROUP BY library_id;