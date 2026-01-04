<?php

namespace Database\Seeders;

use App\Models\Library;
use Illuminate\Database\Seeder;

class LibrarySeeder extends Seeder
{
    public function run(): void
    {
        $libraries = [
            [
                'name' => 'Perpustakaan Salman ITB',
                'address' => 'Jl. Ganesa No.7, Lb. Siliwangi, Coblong, Bandung',
                'latitude' => -6.8905,
                'longitude' => 107.6107,
                'phone' => '022-2500089',
                'email' => 'info@salmanitb.com',
                'website_url' => 'https://salmanitb.com/perpustakaan',
                'description' => 'Perpustakaan modern dengan koleksi lengkap dan suasana nyaman untuk belajar dan membaca.',
                'opening_hours' => 'Senin-Kamis: 08:00-20:00, Jumat: 08:00-16:00, Sabtu: 08:00-17:00, Minggu: 09:00-15:00', // ⭐ ADD THIS
                'facilities' => ['WiFi', 'AC', 'Reading Room', 'Computer Lab', 'Prayer Room', 'Cafe'],
                'facility_details' => [
                    'wifi' => ['name' => 'WiFi Gratis', 'speed' => '100 Mbps', 'available' => true],
                    'ac' => ['name' => 'AC', 'available' => true],
                    'reading_room' => ['name' => 'Ruang Baca', 'capacity' => 100, 'available' => true],
                    'computer_lab' => ['name' => 'Lab Komputer', 'computers' => 20, 'available' => true],
                    'prayer_room' => ['name' => 'Mushola', 'available' => true],
                    'cafe' => ['name' => 'Cafe & Kantin', 'available' => true],
                    'parking' => ['name' => 'Parkir', 'motor' => true, 'car' => true, 'fee' => 'Gratis'],
                ],
                'operating_hours' => [
                    'monday' => ['open' => '08:00', 'close' => '20:00'],
                    'tuesday' => ['open' => '08:00', 'close' => '20:00'],
                    'wednesday' => ['open' => '08:00', 'close' => '20:00'],
                    'thursday' => ['open' => '08:00', 'close' => '20:00'],
                    'friday' => ['open' => '08:00', 'close' => '16:00'],
                    'saturday' => ['open' => '08:00', 'close' => '17:00'],
                    'sunday' => ['open' => '09:00', 'close' => '15:00'],
                ],
                'rules' => [
                    'Wajib menggunakan kartu anggota',
                    'Tidak boleh membawa makanan di ruang baca',
                    'Harap menjaga ketenangan',
                    'Maksimal peminjaman 3 buku selama 7 hari',
                    'Denda keterlambatan Rp 1.000/hari',
                ],
                'parking_info' => 'Parkir motor & mobil tersedia gratis di basement',
                'public_transport' => [
                    ['type' => 'Angkot', 'route' => 'Abdul Muis - Dago', 'stop' => 'Depan ITB'],
                    ['type' => 'Trans Metro Pasundan', 'route' => 'Koridor 1', 'stop' => 'Halte ITB'],
                ],
            ],
            [
                'name' => 'HOWL Library Bandung',
                'address' => 'Jl. Tubagus Ismail IX No.8, Sekeloa, Coblong, Bandung',
                'latitude' => -6.8712,
                'longitude' => 107.6043,
                'phone' => '022-82065650',
                'email' => 'hello@howllibrary.com',
                'website_url' => 'https://howllibrary.com',
                'description' => 'Library & co-working space dengan konsep modern dan instagramable.',
                'opening_hours' => 'Senin-Jumat: 09:00-21:00, Sabtu-Minggu: 09:00-22:00', // ⭐ ADD THIS
                'facilities' => ['WiFi', 'AC', 'Cafe', 'Co-working Space', 'Meeting Room', 'Outdoor Area'],
                'facility_details' => [
                    'wifi' => ['name' => 'WiFi Super Cepat', 'speed' => '200 Mbps', 'available' => true],
                    'ac' => ['name' => 'AC', 'available' => true],
                    'cafe' => ['name' => 'Cafe HOWL', 'menu' => 'Coffee, Tea, Snacks', 'available' => true],
                    'coworking' => ['name' => 'Co-working Space', 'capacity' => 50, 'available' => true],
                    'meeting_room' => ['name' => 'Meeting Room', 'capacity' => 10, 'booking_required' => true],
                    'outdoor' => ['name' => 'Outdoor Reading Area', 'available' => true],
                    'parking' => ['name' => 'Parkir', 'motor' => true, 'car' => false, 'fee' => 'Rp 2.000'],
                ],
                'operating_hours' => [
                    'monday' => ['open' => '09:00', 'close' => '21:00'],
                    'tuesday' => ['open' => '09:00', 'close' => '21:00'],
                    'wednesday' => ['open' => '09:00', 'close' => '21:00'],
                    'thursday' => ['open' => '09:00', 'close' => '21:00'],
                    'friday' => ['open' => '09:00', 'close' => '21:00'],
                    'saturday' => ['open' => '09:00', 'close' => '22:00'],
                    'sunday' => ['open' => '09:00', 'close' => '22:00'],
                ],
                'rules' => [
                    'Minimum order Rp 25.000 untuk akses 3 jam',
                    'All day pass Rp 50.000',
                    'Boleh membawa laptop & charger',
                    'Buku tidak boleh dipinjam pulang',
                    'Reservasi meeting room via WhatsApp',
                ],
                'parking_info' => 'Parkir motor tersedia di depan. Parkir mobil terbatas.',
                'public_transport' => [
                    ['type' => 'Angkot', 'route' => 'St. Hall - Dago', 'stop' => 'Tubagus Ismail'],
                    ['type' => 'Grab/Gojek', 'route' => 'Online', 'stop' => 'HOWL Library'],
                ],
            ],
            [
                'name' => 'Creative Space Bandung',
                'address' => 'Jl. Braga No.99, Braga, Sumur Bandung, Bandung',
                'latitude' => -6.9175,
                'longitude' => 107.6191,
                'phone' => '022-4231234',
                'email' => 'hello@creativespace.id',
                'website_url' => 'https://creativespace.id',
                'description' => 'Ruang kreatif dengan perpustakaan digital dan workshop area.',
                'opening_hours' => 'Senin-Jumat: 10:00-22:00, Sabtu-Minggu: 10:00-23:00', // ⭐ ADD THIS
                'facilities' => ['WiFi', 'AC', 'Workshop Area', 'Digital Library', 'Event Space', 'Lounge'],
                'facility_details' => [
                    'wifi' => ['name' => 'WiFi', 'speed' => '150 Mbps', 'available' => true],
                    'ac' => ['name' => 'AC', 'available' => true],
                    'workshop' => ['name' => 'Workshop Area', 'capacity' => 30, 'available' => true],
                    'digital_library' => ['name' => 'Perpustakaan Digital', 'ebooks' => 5000, 'available' => true],
                    'event_space' => ['name' => 'Event Space', 'capacity' => 100, 'booking_required' => true],
                    'lounge' => ['name' => 'Creative Lounge', 'available' => true],
                    'parking' => ['name' => 'Parkir', 'motor' => true, 'car' => true, 'fee' => 'Rp 3.000'],
                ],
                'operating_hours' => [
                    'monday' => ['open' => '10:00', 'close' => '22:00'],
                    'tuesday' => ['open' => '10:00', 'close' => '22:00'],
                    'wednesday' => ['open' => '10:00', 'close' => '22:00'],
                    'thursday' => ['open' => '10:00', 'close' => '22:00'],
                    'friday' => ['open' => '10:00', 'close' => '22:00'],
                    'saturday' => ['open' => '10:00', 'close' => '23:00'],
                    'sunday' => ['open' => '10:00', 'close' => '23:00'],
                ],
                'rules' => [
                    'Registrasi gratis untuk member',
                    'Day pass Rp 30.000',
                    'Workshop by appointment',
                    'Event space rental Rp 500.000/session',
                    'Boleh foto & video untuk konten',
                ],
                'parking_info' => 'Parkir di gedung sebelah, akses via lift',
                'public_transport' => [
                    ['type' => 'Angkot', 'route' => 'Braga - Stasiun', 'stop' => 'Braga'],
                    ['type' => 'Bus', 'route' => 'Trans Metro', 'stop' => 'Halte Braga'],
                ],
            ],
        ];

        foreach ($libraries as $library) {
            Library::updateOrCreate(
                ['name' => $library['name']],
                $library
            );
        }
    }
}
