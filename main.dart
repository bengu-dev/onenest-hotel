import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DefaultFirebaseOptions {
  static const FirebaseOptions web = FirebaseOptions(
      apiKey: 'AIzaSyAqCtUgLdLa-JPJt7pG21DYWAXPxcv4Xqc',
      appId: '1:123456789:web:abcdef',
      messagingSenderId: '123456789',
      projectId: 'onenest-hotel',
      authDomain: 'onenest-hotel.firebaseapp.com',
      storageBucket: 'onenest-hotel.appspot.com');
}

class LanguageService extends ChangeNotifier {
  static final LanguageService _i = LanguageService._();
  factory LanguageService() => _i;
  LanguageService._();
  String _lang = 'EN';
  String get currentLanguage => _lang;
  void setLanguage(String l) {
    _lang = l;
    notifyListeners();
  }

  String get(String k) => (_t[_lang]?[k] ?? _t['EN']?[k] ?? k);
  final Map<String, Map<String, String>> _t = {
    'EN': {
      'discover': 'Discover your perfect escape',
      'luxury_rooms': 'Luxury Rooms',
      'contact_us': 'Contact Us',
      'view_map': 'View on Map',
      'home': 'Home',
      'search': 'Search',
      'bookings': 'Bookings',
      'favorites': 'Favorites',
      'profile': 'Profile',
      'book_now': 'Book Now',
      'per_night': '/night',
      'left': 'left',
      'sign_in': 'Sign In',
      'sign_up': 'Sign Up',
      'email': 'Email',
      'password': 'Password',
      'forgot_password': 'Forgot Password?',
      'no_account': "Don't have an account?",
      'have_account': 'Already have an account?',
      'welcome_back': 'Welcome Back',
      'create_account': 'Create Account',
      'sign_out': 'Sign Out',
      'verify_email': 'Verify Email',
      'check_inbox': 'Please check your inbox',
      'resend': 'Resend Email',
      'about_us': 'About Us',
      'amenities': 'Amenities',
      'special_offers': 'Special Offers',
      'guest_reviews': 'Guest Reviews',
      'view_all': 'View All',
      'type_message': 'Type your message...',
      'notifications': 'Notifications',
      'language': 'Language',
      'dark_mode': 'Dark Mode',
      'privacy': 'Privacy Policy',
      'help': 'Help & Support',
      'your_points': 'Your Points',
      'total_bookings': 'Total Bookings',
      'saved_rooms': 'Saved Rooms',
      'edit_profile': 'Edit Profile',
      'version': 'Version',
      'ai_assistant': 'AI Assistant',
      'location': 'Location',
      'explore': 'Explore Paradise',
      'adults': 'Adults',
      'children': 'Children',
      'coupon': 'Coupon Code',
      'apply': 'Apply',
      'payment': 'Payment',
      'pay_now': 'Pay Now',
      'card_number': 'Card Number',
      'expiry': 'Expiry',
      'cvv': 'CVV',
      'card_holder': 'Card Holder Name',
      'guests': 'Guests',
      'summary': 'Booking Summary',
      'save': 'Save',
      'name': 'Name',
      'phone': 'Phone',
      'cancel': 'Cancel',
      'cancel_warning':
          'Cancellation is non-refundable. The paid amount will not be returned.',
      'spa': 'Spa & Wellness',
      'restaurant': 'Restaurant',
      'room_overview': 'Room Overview',
      'beds_bedding': 'Beds and Bedding',
      'room_features': 'Room Features',
      'bath_features': 'Bath Features',
      'view_rates': 'View Rates',
      'max_occupancy': 'Max Occupancy',
      'room_size': 'Room Size',
      'bed_type': 'Bed Type',
      'our_location': 'Our Location',
      'about_desc':
          'Nestled in the heart of Maldives, OneNest has been providing unforgettable luxury experiences since 2015. Our resort combines traditional hospitality with modern amenities.',
      'happy_guests': 'Happy Guests',
      'countries': 'Countries',
      'awards': 'Awards',
      'years_exp': 'Years Experience',
      'stats_title': 'Why Choose Us',
      'coupons': 'Coupons & Offers',
      'available_coupons': 'Available Coupons',
      'use_code': 'Use this code at checkout to get your discount',
      'copy_code': 'Copy Code',
      'code_copied': 'Code copied!',
      'ai_planner': 'AI Vacation Planner',
      'plan_vacation': 'Plan Your Perfect Vacation',
      'how_many_days': 'How many days?',
      'traveling_with': 'Traveling with?',
      'couple': 'Couple',
      'family': 'Family',
      'solo': 'Solo',
      'friends': 'Friends',
      'purpose': 'Purpose?',
      'relaxation': 'Relaxation',
      'honeymoon': 'Honeymoon',
      'adventure': 'Adventure',
      'business': 'Business',
      'budget': 'Budget?',
      'luxury': 'Luxury',
      'moderate': 'Moderate',
      'budget_friendly': 'Budget Friendly',
      'special_requests': 'Special requests?',
      'quiet': 'Quiet',
      'ocean_view': 'Ocean View',
      'family_friendly': 'Family Friendly',
      'spa_access': 'Spa Access',
      'next': 'Next',
      'previous': 'Previous',
      'get_plan': 'Get My Plan',
      'your_plan': 'Your Perfect Vacation Plan',
      'recommended_room': 'Recommended Room',
      'total_cost': 'Total Cost',
      'you_save': 'You Save',
      'why_this': 'Why This Room?',
      'book_this_plan': 'Book This Plan',
      'days': 'days',
      'deposit': 'Deposit',
      'deposit_desc': 'Refundable security deposit',
      'subtotal': 'Subtotal',
      'pay_deposit': 'Pay Deposit Now',
      'views_24h': 'views in 24h',
      'high_demand': 'High Demand',
      'price_may_increase': 'Price may increase',
      'booking_chance': 'chance it gets booked',
      'rooms_left': 'rooms left',
      'smart_booking': 'Smart Booking Insights',
      'based_on_data': 'Based on real data',
      'get_directions': 'Get Directions',
      'open_in_maps': 'Open in Google Maps',
      'hotel_location': 'Hotel Location',
      'nearby_attractions': 'Nearby Attractions',
      'remaining_at_hotel': 'Remaining at check-in',
      'eco_mode': 'Eco Mode',
      'eco_title': 'OneNest Eco-Mode',
      'eco_subtitle': 'Help us save the planet!',
      'skip_cleaning': 'Skip daily room cleaning',
      'reuse_towels': 'Reuse towels',
      'your_impact': 'Your Impact',
      'co2_saved': 'CO2 saved',
      'water_saved': 'water saved',
      'enable_eco': 'Enable Eco-Mode',
      'disable_eco': 'Disable Eco-Mode',
      'eco_bonus': 'Eco Bonus',
      'achievements': 'Achievements',
      'progress': 'Progress',
      'reward': 'Reward',
      'unlocked': 'Unlocked',
      'locked': 'Locked',
      'tier_progress': 'Tier Progress',
      'points_to_next': 'points to'
    },
    'TR': {
      'discover': 'Mükemmel kaçamağınızı keşfedin',
      'luxury_rooms': 'Lüks Odalar',
      'contact_us': 'Bize Ulaşın',
      'view_map': 'Haritada Gör',
      'home': 'Ana Sayfa',
      'search': 'Ara',
      'bookings': 'Rezervasyonlar',
      'favorites': 'Favoriler',
      'profile': 'Profil',
      'book_now': 'Rezervasyon Yap',
      'per_night': '/gece',
      'left': 'kaldı',
      'sign_in': 'Giriş Yap',
      'sign_up': 'Kayıt Ol',
      'email': 'E-posta',
      'password': 'Şifre',
      'forgot_password': 'Şifremi Unuttum?',
      'no_account': 'Hesabınız yok mu?',
      'have_account': 'Zaten hesabınız var mı?',
      'welcome_back': 'Tekrar Hoşgeldiniz',
      'create_account': 'Hesap Oluştur',
      'sign_out': 'Çıkış Yap',
      'verify_email': 'E-posta Doğrula',
      'check_inbox': 'Lütfen gelen kutunuzu kontrol edin',
      'resend': 'Tekrar Gönder',
      'about_us': 'Hakkımızda',
      'amenities': 'Olanaklar',
      'special_offers': 'Özel Teklifler',
      'guest_reviews': 'Misafir Yorumları',
      'view_all': 'Tümünü Gör',
      'type_message': 'Mesajınızı yazın...',
      'notifications': 'Bildirimler',
      'language': 'Dil',
      'dark_mode': 'Karanlık Mod',
      'privacy': 'Gizlilik Politikası',
      'help': 'Yardım ve Destek',
      'your_points': 'Puanlarınız',
      'total_bookings': 'Toplam Rezervasyon',
      'saved_rooms': 'Kaydedilen Odalar',
      'edit_profile': 'Profili Düzenle',
      'version': 'Sürüm',
      'ai_assistant': 'AI Asistan',
      'location': 'Konum',
      'explore': 'Cenneti Keşfet',
      'adults': 'Yetişkin',
      'children': 'Çocuk',
      'coupon': 'Kupon Kodu',
      'apply': 'Uygula',
      'payment': 'Ödeme',
      'pay_now': 'Şimdi Öde',
      'card_number': 'Kart Numarası',
      'expiry': 'Son Kullanma',
      'cvv': 'CVV',
      'card_holder': 'Kart Sahibi',
      'guests': 'Misafirler',
      'summary': 'Rezervasyon Özeti',
      'save': 'Kaydet',
      'name': 'İsim',
      'phone': 'Telefon',
      'cancel': 'İptal Et',
      'cancel_warning':
          'İptal durumunda ücret iadesi yapılmaz. Ödenen tutar geri ödenmeyecektir.',
      'spa': 'Spa & Wellness',
      'restaurant': 'Restoran',
      'room_overview': 'Oda Özeti',
      'beds_bedding': 'Yatak Bilgisi',
      'room_features': 'Oda Özellikleri',
      'bath_features': 'Banyo Özellikleri',
      'view_rates': 'Fiyatları Gör',
      'max_occupancy': 'Maks Kapasite',
      'room_size': 'Oda Boyutu',
      'bed_type': 'Yatak Tipi',
      'our_location': 'Konumumuz',
      'about_desc':
          'Maldivler\'in kalbinde yer alan OneNest, 2015\'ten bu yana unutulmaz lüks deneyimler sunmaktadır. Tesisimiz geleneksel misafirperverliği modern olanaklarla birleştirmektedir.',
      'happy_guests': 'Mutlu Misafir',
      'countries': 'Ülke',
      'awards': 'Ödül',
      'years_exp': 'Yıllık Deneyim',
      'stats_title': 'Neden Bizi Seçmelisiniz',
      'coupons': 'Kuponlar ve Teklifler',
      'available_coupons': 'Mevcut Kuponlar',
      'use_code': 'Ödeme sırasında bu kodu kullanarak indirim kazanın',
      'copy_code': 'Kodu Kopyala',
      'code_copied': 'Kod kopyalandı!',
      'ai_planner': 'AI Tatil Planlayıcı',
      'plan_vacation': 'Mükemmel Tatilinizi Planlayın',
      'how_many_days': 'Kaç gün?',
      'traveling_with': 'Kiminle?',
      'couple': 'Çift',
      'family': 'Aile',
      'solo': 'Yalnız',
      'friends': 'Arkadaşlar',
      'purpose': 'Amaç?',
      'relaxation': 'Dinlenme',
      'honeymoon': 'Balayı',
      'adventure': 'Macera',
      'business': 'İş',
      'budget': 'Bütçe?',
      'luxury': 'Lüks',
      'moderate': 'Orta',
      'budget_friendly': 'Ekonomik',
      'special_requests': 'Özel istek?',
      'quiet': 'Sessizlik',
      'ocean_view': 'Deniz Manzarası',
      'family_friendly': 'Çocuk Dostu',
      'spa_access': 'Spa Erişimi',
      'next': 'İleri',
      'previous': 'Geri',
      'get_plan': 'Planımı Al',
      'your_plan': 'Mükemmel Tatil Planınız',
      'recommended_room': 'Önerilen Oda',
      'total_cost': 'Toplam Tutar',
      'you_save': 'Tasarrufunuz',
      'why_this': 'Neden Bu Oda?',
      'book_this_plan': 'Bu Planı Rezerve Et',
      'days': 'gün',
      'deposit': 'Depozito',
      'deposit_desc': 'İade edilebilir güvenlik depozitosu',
      'subtotal': 'Ara Toplam',
      'pay_deposit': 'Depozito Öde',
      'views_24h': '24 saatte görüntülenme',
      'high_demand': 'Yüksek Talep',
      'price_may_increase': 'Fiyat artabilir',
      'booking_chance': 'rezerve edilme ihtimali',
      'rooms_left': 'oda kaldı',
      'smart_booking': 'Akıllı Rezervasyon Bilgileri',
      'based_on_data': 'Gerçek veriye dayalı',
      'get_directions': 'Yol Tarifi Al',
      'open_in_maps': 'Google Maps\'te Aç',
      'hotel_location': 'Otel Konumu',
      'nearby_attractions': 'Yakındaki Yerler',
      'remaining_at_hotel': 'Check-in\'de ödenecek',
      'eco_mode': 'Eco Mode',
      'eco_title': 'OneNest Eco-Mode',
      'eco_subtitle': 'Gezegeni kurtarmamıza yardım edin!',
      'skip_cleaning': 'Günlük temizlik yapılmasın',
      'reuse_towels': 'Havluları tekrar kullan',
      'your_impact': 'Etkileriniz',
      'co2_saved': 'CO2 tasarrufu',
      'water_saved': 'su tasarrufu',
      'enable_eco': 'Eco-Mode Aktif Et',
      'disable_eco': 'Eco-Mode Kapat',
      'eco_bonus': 'Eco Bonusu',
      'achievements': 'Başarılar',
      'progress': 'İlerleme',
      'reward': 'Ödül',
      'unlocked': 'Kazanıldı',
      'locked': 'Kilitli',
      'tier_progress': 'Seviye İlerlemesi',
      'points_to_next': 'puan kaldı'
    },
  };
}

class ThemeNotifier extends ChangeNotifier {
  bool _isDark = false;
  bool get isDark => _isDark;
  void toggle() {
    _isDark = !_isDark;
    notifyListeners();
  }
}

class AppColors {
  static const Color accent = Color(0xFFD4AF37);
  static Color background(bool d) =>
      d ? const Color(0xFF0D0D0D) : const Color(0xFFFAFAFA);
  static Color card(bool d) => d ? const Color(0xFF1A1A1A) : Colors.white;
  static Color text(bool d) => d ? Colors.white : const Color(0xFF1A1A1A);
  static Color textSecondary(bool d) =>
      d ? const Color(0xFF888888) : const Color(0xFF666666);
  static Color surface(bool d) =>
      d ? const Color(0xFF141414) : const Color(0xFFF5F5F5);
}

class Room {
  final String id, name, image, description, bedType, roomSize;
  final double price, rating;
  final int available, maxOccupancy;
  final List<String> amenities, images, bathFeatures;
  Room(
      {required this.id,
      required this.name,
      required this.image,
      required this.description,
      required this.price,
      required this.rating,
      required this.available,
      required this.amenities,
      required this.images,
      this.bedType = '1 King',
      this.roomSize = '36 sqm',
      this.maxOccupancy = 3,
      this.bathFeatures = const [
        'Shower',
        'Hair Dryer',
        'Bathrobe',
        'Slippers'
      ]});
}

class Booking {
  final String id, roomId, roomName, roomImage, status;
  final DateTime checkIn, checkOut;
  final double totalPrice;
  final int adults, children;
  bool cancelled;
  Booking(
      {required this.id,
      required this.roomId,
      required this.roomName,
      required this.roomImage,
      required this.checkIn,
      required this.checkOut,
      required this.totalPrice,
      required this.status,
      required this.adults,
      required this.children,
      this.cancelled = false});

  // Convert to JSON
  Map<String, dynamic> toJson() => {
        'id': id,
        'roomId': roomId,
        'roomName': roomName,
        'roomImage': roomImage,
        'status': status,
        'checkIn': checkIn.toIso8601String(),
        'checkOut': checkOut.toIso8601String(),
        'totalPrice': totalPrice,
        'adults': adults,
        'children': children,
        'cancelled': cancelled,
      };

  // Create from JSON
  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        id: json['id'],
        roomId: json['roomId'],
        roomName: json['roomName'],
        roomImage: json['roomImage'],
        status: json['status'],
        checkIn: DateTime.parse(json['checkIn']),
        checkOut: DateTime.parse(json['checkOut']),
        totalPrice: json['totalPrice'],
        adults: json['adults'],
        children: json['children'],
        cancelled: json['cancelled'] ?? false,
      );
}

class Review {
  final String name, comment, country;
  final double rating;
  Review(
      {required this.name,
      required this.comment,
      required this.country,
      required this.rating});
}

class Coupon {
  final String code;
  final double discount;
  final String desc;
  Coupon({required this.code, required this.discount, required this.desc});
}

final List<Coupon> coupons = [
  Coupon(code: 'WELCOME10', discount: 0.10, desc: '10% off'),
  Coupon(code: 'SUMMER20', discount: 0.20, desc: '20% off'),
  Coupon(code: 'VIP15', discount: 0.15, desc: '15% off'),
  Coupon(code: 'HOLIDAY25', discount: 0.25, desc: '25% off'),
  Coupon(code: 'ONENEST30', discount: 0.30, desc: '30% off')
];

final List<Room> rooms = [
  Room(
      id: '1',
      name: 'Ocean View Suite',
      image:
          'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=800',
      description: 'Breathtaking ocean views with private balcony.',
      price: 450,
      rating: 4.9,
      available: 5,
      amenities: [
        'Ocean View',
        'King Bed',
        'Balcony',
        'Mini Bar',
        'WiFi',
        'Air Conditioning',
        'Room Service'
      ],
      images: [
        'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=800',
        'https://images.unsplash.com/photo-1590490360182-c33d57733427?w=800',
        'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?w=800'
      ],
      bedType: '1 King',
      roomSize: '42 sqm',
      maxOccupancy: 3,
      bathFeatures: [
        'Rain Shower',
        'Hair Dryer',
        'Bathrobe',
        'Slippers',
        'Premium Toiletries'
      ]),
  Room(
      id: '2',
      name: 'Lagoon Suite',
      image:
          'https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800',
      description: 'Overwater lagoon suite with glass floor.',
      price: 780,
      rating: 4.95,
      available: 2,
      amenities: [
        'Lagoon Access',
        'Glass Floor',
        'Jacuzzi',
        'Butler',
        'WiFi',
        'Mini Bar'
      ],
      images: [
        'https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800',
        'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800',
        'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=800'
      ],
      bedType: '1 King',
      roomSize: '65 sqm',
      maxOccupancy: 2,
      bathFeatures: ['Jacuzzi', 'Rain Shower', 'Double Vanity', 'Bathrobe']),
  Room(
      id: '3',
      name: 'Sunset Suite',
      image:
          'https://images.unsplash.com/photo-1602002418082-a4443e081dd1?w=800',
      description: 'West-facing suite with infinity pool.',
      price: 920,
      rating: 4.85,
      available: 1,
      amenities: ['Infinity Pool', 'Sunset View', 'Outdoor Dining', 'Butler'],
      images: [
        'https://images.unsplash.com/photo-1602002418082-a4443e081dd1?w=800',
        'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800',
        'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?w=800'
      ],
      bedType: '1 King',
      roomSize: '78 sqm',
      maxOccupancy: 4,
      bathFeatures: ['Outdoor Shower', 'Bathtub', 'Steam Room']),
  Room(
      id: '4',
      name: 'Beach Villa',
      image:
          'https://images.unsplash.com/photo-1499793983690-e29da59ef1c2?w=800',
      description: 'Beachfront with private beach access.',
      price: 1450,
      rating: 4.92,
      available: 2,
      amenities: ['Beach Access', '2 Bedrooms', 'Private Garden', 'BBQ'],
      images: [
        'https://images.unsplash.com/photo-1499793983690-e29da59ef1c2?w=800',
        'https://images.unsplash.com/photo-1510414842594-a61c69b5ae57?w=800',
        'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800'
      ],
      bedType: '2 King',
      roomSize: '120 sqm',
      maxOccupancy: 6,
      bathFeatures: ['2 Bathrooms', 'Bathtub', 'Outdoor Shower']),
  Room(
      id: '5',
      name: 'Garden Room',
      image:
          'https://images.unsplash.com/photo-1566665797739-1674de7a421a?w=800',
      description: 'Peaceful garden retreat.',
      price: 380,
      rating: 4.7,
      available: 8,
      amenities: ['Garden View', 'Queen Bed', 'Patio', 'WiFi'],
      images: [
        'https://images.unsplash.com/photo-1566665797739-1674de7a421a?w=800',
        'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?w=800',
        'https://images.unsplash.com/photo-1563911302283-d2bc129e7570?w=800'
      ],
      bedType: '1 Queen',
      roomSize: '32 sqm',
      maxOccupancy: 2,
      bathFeatures: ['Shower', 'Hair Dryer', 'Toiletries']),
  Room(
      id: '6',
      name: 'Royal Villa',
      image:
          'https://images.unsplash.com/photo-1613490493576-7fde63acd811?w=800',
      description: 'Ultimate luxury with private chef.',
      price: 2200,
      rating: 5.0,
      available: 1,
      amenities: ['3 Bedrooms', 'Private Chef', 'Butler', 'Pool', 'Cinema'],
      images: [
        'https://images.unsplash.com/photo-1613490493576-7fde63acd811?w=800',
        'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800',
        'https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?w=800'
      ],
      bedType: '3 King',
      roomSize: '350 sqm',
      maxOccupancy: 8,
      bathFeatures: ['3 Bathrooms', 'Jacuzzi', 'Sauna', 'Steam Room']),
];

final List<Review> reviews = [
  Review(
      name: 'Sarah J.',
      comment: 'Absolutely stunning resort!',
      country: 'USA',
      rating: 5.0),
  Review(
      name: 'Marcus W.',
      comment: 'Perfect honeymoon destination!',
      country: 'Germany',
      rating: 4.9),
  Review(
      name: 'Yuki T.',
      comment: 'Spa treatments were divine.',
      country: 'Japan',
      rating: 5.0),
  Review(
      name: 'Emma T.',
      comment: 'Private beach dinner was magical!',
      country: 'UK',
      rating: 4.8),
];

final List<String> aboutImages = [
  'https://images.unsplash.com/photo-1573843981267-be1999ff37cd?w=800',
  'https://images.unsplash.com/photo-1439066615861-d1af74d74000?w=800',
  'https://images.unsplash.com/photo-1514282401047-d79a71a590e8?w=800',
  'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=800',
  'https://images.unsplash.com/photo-1559494007-9f5847c49d94?w=800'
];

final List<Map<String, String>> spaServices = [
  {
    'name': 'Balinese Massage',
    'duration': '60 min',
    'price': '\$120',
    'image': 'https://images.unsplash.com/photo-1544161515-4ab6ce6db874?w=800'
  },
  {
    'name': 'Hot Stone Therapy',
    'duration': '90 min',
    'price': '\$180',
    'image':
        'https://images.unsplash.com/photo-1600334089648-b0d9d3028eb2?w=800'
  },
  {
    'name': 'Couple Retreat',
    'duration': '120 min',
    'price': '\$350',
    'image':
        'https://images.unsplash.com/photo-1515377905703-c4788e51af15?w=800'
  },
];

final List<Map<String, String>> restaurantItems = [
  {
    'name': 'Ocean Grill',
    'type': 'Seafood',
    'hours': '12:00 - 22:00',
    'image':
        'https://images.unsplash.com/photo-1514933651103-005eec06c04b?w=800'
  },
  {
    'name': 'Sunset Lounge',
    'type': 'International',
    'hours': '18:00 - 23:00',
    'image': 'https://images.unsplash.com/photo-1552566626-52f8b828add9?w=800'
  },
  {
    'name': 'Beach Bar',
    'type': 'Cocktails & Snacks',
    'hours': '10:00 - 00:00',
    'image':
        'https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800'
  },
];

class NotificationItem {
  final String title, body;
  final DateTime time;
  bool read;
  NotificationItem(
      {required this.title,
      required this.body,
      required this.time,
      this.read = false});
}

class NotificationService {
  static final NotificationService _i = NotificationService._();
  factory NotificationService() => _i;
  NotificationService._();
  final List<NotificationItem> _notifs = [
    NotificationItem(
        title: 'Welcome to OneNest!',
        body: 'Enjoy your luxury experience.',
        time: DateTime.now().subtract(const Duration(hours: 1))),
    NotificationItem(
        title: 'Special Offer',
        body: 'Use code WELCOME10 for 10% off!',
        time: DateTime.now().subtract(const Duration(hours: 3))),
  ];
  List<NotificationItem> get notifs => _notifs;
  int get unreadCount => _notifs.where((n) => !n.read).length;
  void markAllRead() {
    for (var n in _notifs) n.read = true;
  }
}

// 🏆 Achievement System
class Achievement {
  final String id;
  final String name;
  final String nameTr;
  final String description;
  final String descriptionTr;
  final IconData icon;
  final int requiredPoints;
  final String reward;
  final String rewardTr;
  bool unlocked;

  Achievement({
    required this.id,
    required this.name,
    required this.nameTr,
    required this.description,
    required this.descriptionTr,
    required this.icon,
    required this.requiredPoints,
    required this.reward,
    required this.rewardTr,
    this.unlocked = false,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'unlocked': unlocked,
      };

  static Achievement fromJson(Map<String, dynamic> json, Achievement template) {
    return Achievement(
      id: template.id,
      name: template.name,
      nameTr: template.nameTr,
      description: template.description,
      descriptionTr: template.descriptionTr,
      icon: template.icon,
      requiredPoints: template.requiredPoints,
      reward: template.reward,
      rewardTr: template.rewardTr,
      unlocked: json['unlocked'] ?? false,
    );
  }
}

// 🌿 Eco Mode
class EcoMode {
  bool enabled;
  int totalSavings; // CO2 savings in kg
  int bonusPoints;

  EcoMode({
    this.enabled = false,
    this.totalSavings = 0,
    this.bonusPoints = 0,
  });

  Map<String, dynamic> toJson() => {
        'enabled': enabled,
        'totalSavings': totalSavings,
        'bonusPoints': bonusPoints,
      };

  factory EcoMode.fromJson(Map<String, dynamic> json) {
    return EcoMode(
      enabled: json['enabled'] ?? false,
      totalSavings: json['totalSavings'] ?? 0,
      bonusPoints: json['bonusPoints'] ?? 0,
    );
  }
}

class UserProfile {
  static final UserProfile _i = UserProfile._();
  factory UserProfile() => _i;
  UserProfile._();
  String name = '';
  String phone = '';
  EcoMode ecoMode = EcoMode();

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = AuthService().user?.uid;
    if (userId == null) return;

    name = prefs.getString('profile_name_$userId') ?? '';
    phone = prefs.getString('profile_phone_$userId') ?? '';

    final ecoJson = prefs.getString('eco_mode_$userId');
    if (ecoJson != null) {
      ecoMode = EcoMode.fromJson(jsonDecode(ecoJson));
    }
  }

  Future<void> save() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = AuthService().user?.uid;
    if (userId == null) return;

    await prefs.setString('profile_name_$userId', name);
    await prefs.setString('profile_phone_$userId', phone);
    await prefs.setString('eco_mode_$userId', jsonEncode(ecoMode.toJson()));
  }
}

class LoyaltyService {
  static final LoyaltyService _i = LoyaltyService._();
  factory LoyaltyService() => _i;
  LoyaltyService._();
  int _points = 0;
  String _tier = 'Bronze';
  final List<Achievement> _achievements = [
    Achievement(
      id: 'weekend_warrior',
      name: 'Weekend Warrior',
      nameTr: 'Hafta Sonu Gezgini',
      description: 'Book 3 weekend stays',
      descriptionTr: '3 hafta sonu rezervasyonu yap',
      icon: Icons.weekend,
      requiredPoints: 1000,
      reward: 'Free breakfast',
      rewardTr: 'Ücretsiz kahvaltı',
    ),
    Achievement(
      id: 'spa_lover',
      name: 'SPA Enthusiast',
      nameTr: 'SPA Müdavimi',
      description: 'Visit spa 5 times',
      descriptionTr: '5 kez spa ziyareti',
      icon: Icons.spa,
      requiredPoints: 1500,
      reward: 'Free massage',
      rewardTr: 'Ücretsiz masaj',
    ),
    Achievement(
      id: 'eco_champion',
      name: 'Eco Champion',
      nameTr: 'Yeşil Şampiyon',
      description: 'Save 50kg CO2 with Eco Mode',
      descriptionTr: 'Eco Mode ile 50kg CO2 tasarrufu',
      icon: Icons.eco,
      requiredPoints: 2000,
      reward: 'Restaurant discount',
      rewardTr: 'Restoran indirimi',
    ),
    Achievement(
      id: 'loyal_guest',
      name: 'Loyal Guest',
      nameTr: 'Sadık Misafir',
      description: 'Reach Gold tier',
      descriptionTr: 'Gold seviyesine ulaş',
      icon: Icons.star,
      requiredPoints: 5000,
      reward: "Chef's Table dinner",
      rewardTr: "Chef's Table akşam yemeği",
    ),
  ];

  int get points => _points;
  String get tier => _tier;
  List<Achievement> get achievements => _achievements;
  int get pointsToNextTier {
    if (_tier == 'Bronze') return 2500 - _points;
    if (_tier == 'Silver') return 5000 - _points;
    return 0;
  }

  String get nextTier {
    if (_tier == 'Bronze') return 'Silver';
    if (_tier == 'Silver') return 'Gold';
    return 'Diamond';
  }

  double get tierProgress {
    if (_tier == 'Bronze') return _points / 2500;
    if (_tier == 'Silver') return (_points - 2500) / 2500;
    return 1.0;
  }

  double get discountPercent =>
      _tier == 'Gold' ? 0.10 : (_tier == 'Silver' ? 0.05 : 0.0);
  Color get tierColor => _tier == 'Gold'
      ? const Color(0xFFFFD700)
      : (_tier == 'Silver' ? const Color(0xFFC0C0C0) : const Color(0xFFCD7F32));

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = AuthService().user?.uid;
    if (userId == null) return;

    _points = prefs.getInt('loyalty_points_$userId') ?? 0;
    _tier = prefs.getString('loyalty_tier_$userId') ?? 'Bronze';

    // Load achievements
    final achievementsJson = prefs.getString('achievements_$userId');
    if (achievementsJson != null) {
      final List<dynamic> decoded = jsonDecode(achievementsJson);
      for (var json in decoded) {
        final achievement = _achievements.firstWhere((a) => a.id == json['id'],
            orElse: () => _achievements.first);
        achievement.unlocked = json['unlocked'] ?? false;
      }
    }
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = AuthService().user?.uid;
    if (userId == null) return;

    await prefs.setInt('loyalty_points_$userId', _points);
    await prefs.setString('loyalty_tier_$userId', _tier);
    await prefs.setString('achievements_$userId',
        jsonEncode(_achievements.map((a) => a.toJson()).toList()));
  }

  void addPoints(int a) {
    _points += a;
    if (_points >= 5000)
      _tier = 'Gold';
    else if (_points >= 2500)
      _tier = 'Silver';
    else
      _tier = 'Bronze';

    // Check achievements
    for (var achievement in _achievements) {
      if (!achievement.unlocked && _points >= achievement.requiredPoints) {
        achievement.unlocked = true;
      }
    }

    _save();
  }
}

class BookingService {
  static final BookingService _i = BookingService._();
  factory BookingService() => _i;
  BookingService._();
  final List<Booking> _bookings = [];
  List<Booking> get bookings => _bookings;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = AuthService().user?.uid;
    if (userId == null) return;

    final bookingsJson = prefs.getStringList('bookings_$userId') ?? [];
    _bookings.clear();
    for (final json in bookingsJson) {
      try {
        final data = jsonDecode(json);
        _bookings.add(Booking.fromJson(data));
      } catch (e) {
        print('Error loading booking: $e');
      }
    }
  }

  Future<void> addBooking(Booking b) async {
    _bookings.add(b);
    LoyaltyService().addPoints((b.totalPrice ~/ 10));
    await _save();
  }

  Future<void> cancelBooking(String id) async {
    final b = _bookings.firstWhere((b) => b.id == id);
    b.cancelled = true;
    await _save();
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = AuthService().user?.uid;
    if (userId == null) return;

    final bookingsJson = _bookings.map((b) => jsonEncode(b.toJson())).toList();
    await prefs.setStringList('bookings_$userId', bookingsJson);
  }
}

// Smart Booking Protection - DÜRÜST ve ŞEFFAF
class RoomAnalytics {
  final String roomId;
  int viewsLast24h;
  DateTime lastViewed;
  List<DateTime> recentViews;
  double basePrice;

  RoomAnalytics({
    required this.roomId,
    this.viewsLast24h = 0,
    DateTime? lastViewed,
    List<DateTime>? recentViews,
    this.basePrice = 0,
  })  : lastViewed = lastViewed ?? DateTime.now(),
        recentViews = recentViews ?? [];
}

class BookingProtectionService {
  static final BookingProtectionService _i = BookingProtectionService._();
  factory BookingProtectionService() => _i;
  BookingProtectionService._();

  final Map<String, RoomAnalytics> _analytics = {};

  // Gerçek veri: Oda görüntülendiğinde kaydet
  void trackView(String roomId, double price) {
    if (!_analytics.containsKey(roomId)) {
      _analytics[roomId] = RoomAnalytics(roomId: roomId, basePrice: price);
    }

    final analytics = _analytics[roomId]!;
    final now = DateTime.now();

    // Son 24 saat içindeki görüntülemeleri filtrele
    analytics.recentViews
        .removeWhere((view) => now.difference(view).inHours > 24);
    analytics.recentViews.add(now);
    analytics.viewsLast24h = analytics.recentViews.length;
    analytics.lastViewed = now;
  }

  // Gerçek analiz: Fiyat artış ihtimali
  String getPriceRiskLevel(String roomId, int available) {
    final analytics = _analytics[roomId];
    if (analytics == null) return 'low';

    // Mantıklı hesaplama:
    // - Yüksek görüntülenme + Az oda = Yüksek risk
    // - Düşük görüntülenme + Çok oda = Düşük risk

    final viewRate = analytics.viewsLast24h;

    if (available <= 2 && viewRate >= 15) return 'high';
    if (available <= 3 && viewRate >= 10) return 'high';
    if (available <= 5 && viewRate >= 8) return 'medium';
    if (available >= 6 && viewRate <= 5) return 'low';

    return 'medium';
  }

  // Gerçek tahmin: Dolma ihtimali
  int getBookingProbability(String roomId, int available) {
    final analytics = _analytics[roomId];
    if (analytics == null) return 30;

    // Matematiksel hesaplama:
    // views / available = talep/arz oranı

    if (available == 0) return 100;
    if (available >= 8) return 20;

    final demandRatio = analytics.viewsLast24h / available;

    if (demandRatio >= 10) return 85; // Çok yüksek talep
    if (demandRatio >= 7) return 70;
    if (demandRatio >= 5) return 60;
    if (demandRatio >= 3) return 45;

    return 30;
  }

  int getViews24h(String roomId) {
    return _analytics[roomId]?.viewsLast24h ?? 0;
  }

  // Gerçek veri: En son ne zaman rezerve edildi
  DateTime? getLastBookingTime(String roomId) {
    final bookings = BookingService()
        .bookings
        .where((b) => b.roomId == roomId && !b.cancelled)
        .toList();

    if (bookings.isEmpty) return null;

    bookings.sort((a, b) => b.checkIn.compareTo(a.checkIn));
    return bookings.first.checkIn;
  }

  // Şeffaf mesaj oluştur
  Map<String, dynamic> getProtectionData(
      String roomId, int available, double price) {
    final views = getViews24h(roomId);
    final riskLevel = getPriceRiskLevel(roomId, available);
    final probability = getBookingProbability(roomId, available);
    final lastBooking = getLastBookingTime(roomId);

    String urgencyMessage = '';
    String riskMessage = '';
    bool showWarning = false;

    // Dürüst mesajlar
    if (available <= 2) {
      urgencyMessage =
          available == 1 ? 'Only 1 room left' : '$available rooms left';
      showWarning = true;
    }

    if (riskLevel == 'high') {
      riskMessage = 'High demand - price may increase';
    } else if (riskLevel == 'medium') {
      riskMessage = 'Moderate demand';
    } else {
      riskMessage = 'Available with stable pricing';
    }

    return {
      'views24h': views,
      'available': available,
      'riskLevel': riskLevel,
      'probability': probability,
      'urgencyMessage': urgencyMessage,
      'riskMessage': riskMessage,
      'showWarning': showWarning,
      'lastBooking': lastBooking,
      'isHonest': true, // ŞEFFAFwe don't lie!
    };
  }
}

class VacationPlan {
  final Room room;
  final int days;
  final double originalPrice;
  final double finalPrice;
  final Coupon? appliedCoupon;
  final String reason;
  VacationPlan(
      {required this.room,
      required this.days,
      required this.originalPrice,
      required this.finalPrice,
      this.appliedCoupon,
      required this.reason});
  double get savings => originalPrice - finalPrice;
  double get savingsPercent => (savings / originalPrice) * 100;
}

class VacationPlannerService {
  static VacationPlan createPlan({
    required int days,
    required String travelWith,
    required String purpose,
    required String budget,
    required List<String> specialRequests,
  }) {
    // Score each room based on criteria
    Room? bestRoom;
    double bestScore = 0;

    for (final room in rooms) {
      double score = 0;

      // Budget matching
      if (budget == 'luxury' && room.price >= 900)
        score += 30;
      else if (budget == 'moderate' && room.price >= 400 && room.price < 900)
        score += 30;
      else if (budget == 'budget_friendly' && room.price < 400) score += 30;

      // Travel companion matching
      if (travelWith == 'couple' && room.maxOccupancy >= 2) score += 20;
      if (travelWith == 'family' && room.maxOccupancy >= 4) score += 20;
      if (travelWith == 'solo' && room.maxOccupancy <= 2) score += 20;
      if (travelWith == 'friends' && room.maxOccupancy >= 4) score += 20;

      // Purpose matching
      if (purpose == 'honeymoon' &&
          (room.name.contains('Lagoon') || room.name.contains('Sunset')))
        score += 25;
      if (purpose == 'relaxation' &&
          (room.name.contains('Ocean') || room.name.contains('Garden')))
        score += 25;
      if (purpose == 'adventure' && room.name.contains('Beach')) score += 25;
      if (purpose == 'business' && room.name.contains('Suite')) score += 25;

      // Special requests
      if (specialRequests.contains('quiet') && room.name.contains('Garden'))
        score += 15;
      if (specialRequests.contains('ocean_view') &&
          (room.amenities.contains('Ocean View') ||
              room.amenities.contains('Lagoon Access'))) score += 15;
      if (specialRequests.contains('family_friendly') && room.maxOccupancy >= 4)
        score += 15;
      if (specialRequests.contains('spa_access') &&
          room.amenities.any((a) => a.contains('Spa') || a.contains('Jacuzzi')))
        score += 15;

      if (score > bestScore) {
        bestScore = score;
        bestRoom = room;
      }
    }

    final room = bestRoom ?? rooms.first;
    final basePrice = room.price * days;

    // Find best coupon
    Coupon? bestCoupon;
    double maxDiscount = 0;
    for (final coupon in coupons) {
      final discount = basePrice * coupon.discount;
      if (discount > maxDiscount) {
        maxDiscount = discount;
        bestCoupon = coupon;
      }
    }

    // Apply loyalty discount
    final loyaltyDiscount = basePrice * LoyaltyService().discountPercent;

    // Calculate final price
    final couponDiscount =
        bestCoupon != null ? basePrice * bestCoupon.discount : 0;
    final finalPrice = basePrice - couponDiscount - loyaltyDiscount;

    // Generate reason
    String reason = _generateReason(room, travelWith, purpose, specialRequests);

    return VacationPlan(
      room: room,
      days: days,
      originalPrice: basePrice,
      finalPrice: finalPrice,
      appliedCoupon: bestCoupon,
      reason: reason,
    );
  }

  static String _generateReason(
      Room room, String travelWith, String purpose, List<String> requests) {
    List<String> reasons = [];

    if (purpose == 'honeymoon') reasons.add('Perfect for romantic getaways');
    if (purpose == 'relaxation') reasons.add('Peaceful and serene atmosphere');
    if (purpose == 'adventure') reasons.add('Easy access to activities');
    if (purpose == 'business') reasons.add('Professional and comfortable');

    if (travelWith == 'family') reasons.add('Spacious for the whole family');
    if (travelWith == 'couple') reasons.add('Intimate and cozy');
    if (travelWith == 'solo') reasons.add('Personal retreat');

    if (requests.contains('ocean_view')) reasons.add('Stunning ocean views');
    if (requests.contains('quiet')) reasons.add('Quiet and private');
    if (requests.contains('spa_access'))
      reasons.add('Spa facilities available');

    if (room.rating >= 4.9) reasons.add('Highly rated by guests');

    return reasons.take(3).join(' • ');
  }
}

class AuthService extends ChangeNotifier {
  static final AuthService _i = AuthService._();
  factory AuthService() => _i;
  AuthService._();
  User? _user;
  String? _error;
  User? get user => _user;
  String? get error => _error;
  bool get isLoggedIn => _user != null;
  bool get isEmailVerified => _user?.emailVerified ?? false;
  void init() {
    FirebaseAuth.instance.authStateChanges().listen((u) {
      _user = u;
      notifyListeners();
    });
  }

  Future<bool> signUp(String e, String p) async {
    try {
      final c = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: e, password: p);
      await c.user?.sendEmailVerification();
      notifyListeners();
      return true;
    } on FirebaseAuthException catch (ex) {
      _error = ex.message;
      notifyListeners();
      return false;
    }
  }

  Future<bool> signIn(String e, String p) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: e, password: p);
      notifyListeners();
      return true;
    } on FirebaseAuthException catch (ex) {
      _error = ex.message;
      notifyListeners();
      return false;
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    notifyListeners();
  }

  Future<void> reloadUser() async {
    await _user?.reload();
    _user = FirebaseAuth.instance.currentUser;
    notifyListeners();
  }

  Future<void> resetPassword(String e) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: e);
  }

  Future<bool> resendVerification() async {
    try {
      await _user?.sendEmailVerification();
      return true;
    } catch (e) {
      _error = e.toString();
      return false;
    }
  }
}

class UrlLauncherService {
  static Future<void> call(String p) async {
    final u = Uri.parse('tel:$p');
    if (await canLaunchUrl(u)) await launchUrl(u);
  }

  static Future<void> email(String e) async {
    final u = Uri.parse('mailto:$e');
    if (await canLaunchUrl(u)) await launchUrl(u);
  }

  static Future<void> openMap(double lat, double lng) async {
    final u = Uri.parse('https://www.google.com/maps?q=$lat,$lng');
    if (await canLaunchUrl(u))
      await launchUrl(u, mode: LaunchMode.externalApplication);
  }
}

class ChatService {
  // 🔧 HANGİ API'Yİ KULLANMAK İSTİYORSUN?
  static const bool _useGemini =
      true; // true = Gemini (ÜCRETSİZ), false = Claude (Ücretli)

  // API Keys
  static const String _anthropicKey = 'YOUR_ANTHROPIC_API_KEY';
  static const String _geminiKey =
      'AIzaSyBeivOvT_nTLrj-YCdh58jXALTblMRtGtM'; // ✅ Gemini API Key

  static Future<String> getResponse(String m, String l) async {
    // Hangi API seçilmiş?
    if (_useGemini) {
      return _getGeminiResponse(m, l);
    } else {
      return _getClaudeResponse(m, l);
    }
  }

  // 🤖 GEMINI API (ÜCRETSIZ)
  static Future<String> _getGeminiResponse(String m, String l) async {
    if (_geminiKey == 'YOUR_GEMINI_API_KEY') {
      return _getFallbackResponse(m, l);
    }

    try {
      final prompt =
          '''You are a helpful AI assistant for OneNest Hotel in Maldives. 

Hotel Information:
- Rooms: Ocean View Suite (\$450), Lagoon Suite (\$780), Sunset Suite (\$920), Beach Villa (\$1450), Garden Room (\$380), Royal Villa (\$2200)
- Amenities: Spa, Restaurant, Beach Access, WiFi, Room Service
- Coupons: WELCOME10 (10% off), SUMMER20 (20% off), VIP15 (15% off), HOLIDAY25 (25% off), ONENEST30 (30% off)
- Restaurants: Ocean Grill (Seafood, 12:00-22:00), Sunset Lounge (International, 18:00-23:00), Beach Bar (Cocktails, 10:00-00:00)
- Spa Services: Balinese Massage (60 min, \$120), Hot Stone Therapy (90 min, \$180), Couple Retreat (120 min, \$350)
- Location: Maldives

Respond in ${l == 'TR' ? 'Turkish' : 'English'}.

User message: $m''';

      final response = await http.post(
        Uri.parse(
            'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=$_geminiKey'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'contents': [
            {
              'parts': [
                {'text': prompt}
              ]
            }
          ],
          'generationConfig': {
            'temperature': 0.7,
            'maxOutputTokens': 1024,
          }
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['candidates'][0]['content']['parts'][0]['text'] ??
            _getFallbackResponse(m, l);
      } else {
        print('❌ Gemini API Error: ${response.statusCode}');
        print('Response: ${response.body}');
        return _getFallbackResponse(m, l);
      }
    } catch (e) {
      print('❌ Gemini Exception: ${e.runtimeType}');
      print('Message: $e');
      return _getFallbackResponse(m, l);
    }
  }

  // 🤖 CLAUDE API (ÜCRETLİ)
  static Future<String> _getClaudeResponse(String m, String l) async {
    if (_anthropicKey == 'YOUR_ANTHROPIC_API_KEY') {
      return _getFallbackResponse(m, l);
    }

    try {
      final response = await http.post(
        Uri.parse('https://api.anthropic.com/v1/messages'),
        headers: {
          'Content-Type': 'application/json',
          'x-api-key': _anthropicKey,
          'anthropic-version': '2023-06-01',
        },
        body: jsonEncode({
          'model': 'claude-3-5-sonnet-20241022',
          'max_tokens': 1024,
          'messages': [
            {
              'role': 'user',
              'content':
                  '''You are a helpful AI assistant for OneNest Hotel in Maldives. 
              
Hotel Information:
- Rooms: Ocean View Suite (\$450), Lagoon Suite (\$780), Sunset Suite (\$920), Beach Villa (\$1450), Garden Room (\$380), Royal Villa (\$2200)
- Amenities: Spa, Restaurant, Beach Access, WiFi, Room Service
- Coupons: WELCOME10 (10% off), SUMMER20 (20% off), VIP15 (15% off), HOLIDAY25 (25% off), ONENEST30 (30% off)
- Restaurants: Ocean Grill (Seafood, 12:00-22:00), Sunset Lounge (International, 18:00-23:00), Beach Bar (Cocktails, 10:00-00:00)
- Spa Services: Balinese Massage (60 min, \$120), Hot Stone Therapy (90 min, \$180), Couple Retreat (120 min, \$350)
- Location: Maldives

Respond in ${l == 'TR' ? 'Turkish' : 'English'}.

User message: $m''',
            }
          ],
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['content'][0]['text'];
      } else {
        return _getFallbackResponse(m, l);
      }
    } catch (e) {
      return _getFallbackResponse(m, l);
    }
  }

  static String _getFallbackResponse(String m, String l) {
    final msg = m.toLowerCase();

    // Greetings
    if (msg.contains('hello') ||
        msg.contains('hi') ||
        msg.contains('hey') ||
        msg.contains('merhaba') ||
        msg.contains('selam')) {
      return l == 'TR'
          ? 'Merhaba! 🌴 OneNest Hotel\'e hoş geldiniz. Size nasıl yardımcı olabilirim?'
          : 'Hello! 🌴 Welcome to OneNest Hotel. How can I help you?';
    }

    // Booking
    if (msg.contains('book') ||
        msg.contains('rezervasyon') ||
        msg.contains('reservation')) {
      return l == 'TR'
          ? 'Rezervasyon yapmak için ana sayfadan AI Tatil Planlayıcı\'yı kullanabilir veya doğrudan odalarımıza göz atabilirsiniz. Hangi tür bir oda arıyorsunuz?'
          : 'To make a booking, you can use our AI Vacation Planner from the home page or browse our rooms directly. What type of room are you looking for?';
    }

    // Prices
    if (msg.contains('price') ||
        msg.contains('cost') ||
        msg.contains('fiyat') ||
        msg.contains('ücret')) {
      return l == 'TR'
          ? 'Odalarımızın fiyatları:\n• Garden Room: \$380/gece\n• Ocean View Suite: \$450/gece\n• Lagoon Suite: \$780/gece\n• Sunset Suite: \$920/gece\n• Beach Villa: \$1,450/gece\n• Royal Villa: \$2,200/gece\n\nKupon kodları ile %10-30 arası indirim kazanabilirsiniz!'
          : 'Our room prices:\n• Garden Room: \$380/night\n• Ocean View Suite: \$450/night\n• Lagoon Suite: \$780/night\n• Sunset Suite: \$920/night\n• Beach Villa: \$1,450/night\n• Royal Villa: \$2,200/night\n\nGet 10-30% off with our coupon codes!';
    }

    // Coupons
    if (msg.contains('coupon') ||
        msg.contains('discount') ||
        msg.contains('kupon') ||
        msg.contains('indirim')) {
      return l == 'TR'
          ? 'Mevcut kupon kodlarımız:\n🎁 WELCOME10 - %10 indirim\n🎁 SUMMER20 - %20 indirim\n🎁 VIP15 - %15 indirim\n🎁 HOLIDAY25 - %25 indirim\n🎁 ONENEST30 - %30 indirim\n\nProfil sayfasından tüm kuponları görebilirsiniz!'
          : 'Our available coupon codes:\n🎁 WELCOME10 - 10% off\n🎁 SUMMER20 - 20% off\n🎁 VIP15 - 15% off\n🎁 HOLIDAY25 - 25% off\n🎁 ONENEST30 - 30% off\n\nCheck all coupons from the profile page!';
    }

    // Spa
    if (msg.contains('spa') ||
        msg.contains('massage') ||
        msg.contains('masaj')) {
      return l == 'TR'
          ? 'Spa hizmetlerimiz:\n💆 Bali Masajı - 60 dk, \$120\n💆 Sıcak Taş Terapisi - 90 dk, \$180\n💆 Çift Spa - 120 dk, \$350\n\nSpa saatleri: 09:00-21:00'
          : 'Our spa services:\n💆 Balinese Massage - 60 min, \$120\n💆 Hot Stone Therapy - 90 min, \$180\n💆 Couple Retreat - 120 min, \$350\n\nSpa hours: 9AM-9PM';
    }

    // Restaurant
    if (msg.contains('restaurant') ||
        msg.contains('food') ||
        msg.contains('eat') ||
        msg.contains('restoran') ||
        msg.contains('yemek')) {
      return l == 'TR'
          ? 'Restoranlarımız:\n🍽️ Ocean Grill - Deniz ürünleri, 12:00-22:00\n🍽️ Sunset Lounge - Uluslararası mutfak, 18:00-23:00\n🍽️ Beach Bar - Kokteyl & Atıştırmalıklar, 10:00-00:00'
          : 'Our restaurants:\n🍽️ Ocean Grill - Seafood, 12:00-22:00\n🍽️ Sunset Lounge - International, 18:00-23:00\n🍽️ Beach Bar - Cocktails & Snacks, 10:00-00:00';
    }

    // Location
    if (msg.contains('location') ||
        msg.contains('where') ||
        msg.contains('konum') ||
        msg.contains('nerede')) {
      return l == 'TR'
          ? 'OneNest Hotel Maldivler\'in kalbinde yer almaktadır. 🏝️ Harita için ana sayfadan "Konumumuz" bölümüne bakabilirsiniz.'
          : 'OneNest Hotel is located in the heart of Maldives. 🏝️ Check our "Location" section on the home page for the map.';
    }

    // AI Planner
    if (msg.contains('plan') ||
        msg.contains('ai') ||
        msg.contains('recommend')) {
      return l == 'TR'
          ? '🤖 AI Tatil Planlayıcımızı denediniz mi? Sadece 5 soru ile size en uygun odayı, tarihi ve kuponu otomatik buluyoruz! Ana sayfadan başlayabilirsiniz.'
          : '🤖 Have you tried our AI Vacation Planner? Just 5 questions and we\'ll automatically find the perfect room, dates, and coupon for you! Start from the home page.';
    }

    // Default
    return l == 'TR'
        ? 'Size şu konularda yardımcı olabilirim:\n• Rezervasyon\n• Oda fiyatları\n• Kupon kodları\n• Spa ve restoranlar\n• Konum\n• AI Tatil Planlayıcı\n\nNe hakkında bilgi almak istersiniz?'
        : 'I can help you with:\n• Booking\n• Room prices\n• Coupon codes\n• Spa and restaurants\n• Location\n• AI Vacation Planner\n\nWhat would you like to know?';
  }
}

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text.replaceAll(' ', '');
    if (text.length > 16) return oldValue;
    final buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      if ((i + 1) % 4 == 0 && i + 1 != text.length) buffer.write(' ');
    }
    return TextEditingValue(
        text: buffer.toString(),
        selection: TextSelection.collapsed(offset: buffer.length));
  }
}

class ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text.replaceAll('/', '');
    if (text.length > 4) return oldValue;
    final buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      if (i == 1 && text.length > 2) buffer.write('/');
    }
    return TextEditingValue(
        text: buffer.toString(),
        selection: TextSelection.collapsed(offset: buffer.length));
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.web);
  AuthService().init();

  // Load saved data
  await BookingService().load();
  await UserProfile().load();
  await LoyaltyService().load();

  runApp(const OneNestApp());
}

class OneNestApp extends StatefulWidget {
  const OneNestApp({super.key});
  @override
  State<OneNestApp> createState() => _OneNestAppState();
}

class _OneNestAppState extends State<OneNestApp> {
  final ThemeNotifier _theme = ThemeNotifier();
  final LanguageService _lang = LanguageService();
  @override
  void initState() {
    super.initState();
    _theme.addListener(_r);
    _lang.addListener(_r);
  }

  void _r() => setState(() {});
  @override
  Widget build(BuildContext context) {
    final d = _theme.isDark;
    return MaterialApp(
      title: 'OneNest',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: d ? Brightness.dark : Brightness.light,
          primaryColor: AppColors.accent,
          scaffoldBackgroundColor: AppColors.background(d),
          appBarTheme: AppBarTheme(
              backgroundColor: AppColors.background(d),
              elevation: 0,
              iconTheme: IconThemeData(color: AppColors.text(d)),
              titleTextStyle: TextStyle(
                  color: AppColors.text(d),
                  fontSize: 18,
                  fontWeight: FontWeight.w600)),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: AppColors.card(d),
              selectedItemColor: AppColors.accent,
              unselectedItemColor: AppColors.textSecondary(d))),
      home: SplashScreen(theme: _theme, lang: _lang),
    );
  }
}

class SplashScreen extends StatefulWidget {
  final ThemeNotifier theme;
  final LanguageService lang;
  const SplashScreen({super.key, required this.theme, required this.lang});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        final a = AuthService();
        Navigator.pushReplacement(
            context,
            FadeRoute(
                page: a.isLoggedIn
                    ? (a.isEmailVerified
                        ? MainScreen(theme: widget.theme, lang: widget.lang)
                        : VerifyEmailScreen(
                            theme: widget.theme, lang: widget.lang))
                    : WelcomeScreen(theme: widget.theme, lang: widget.lang)));
      }
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.accent, width: 1.5)),
            child: Icon(Icons.villa, size: 40, color: AppColors.accent)),
        const SizedBox(height: 24),
        const Text('OneNest',
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w300,
                color: Colors.white,
                letterSpacing: 6)),
        const SizedBox(height: 8),
        Text('MALDIVES',
            style: TextStyle(
                fontSize: 11, color: AppColors.accent, letterSpacing: 4))
      ])));
}

class WelcomeScreen extends StatelessWidget {
  final ThemeNotifier theme;
  final LanguageService lang;
  const WelcomeScreen({super.key, required this.theme, required this.lang});
  @override
  Widget build(BuildContext context) => Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1573843981267-be1999ff37cd?w=1200'),
                  fit: BoxFit.cover)),
          child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.black.withOpacity(0.2),
                    Colors.black.withOpacity(0.8)
                  ])),
              child: SafeArea(
                  child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: Column(children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              _lb('EN'),
                              const SizedBox(width: 8),
                              _lb('TR')
                            ]),
                        const Spacer(),
                        Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: AppColors.accent, width: 1.5)),
                            child: Icon(Icons.villa,
                                size: 36, color: AppColors.accent)),
                        const SizedBox(height: 20),
                        const Text('OneNest',
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                                letterSpacing: 4)),
                        Text('MALDIVES',
                            style: TextStyle(
                                fontSize: 11,
                                color: AppColors.accent,
                                letterSpacing: 4)),
                        const SizedBox(height: 12),
                        Text(lang.get('discover'),
                            style: const TextStyle(
                                fontSize: 13, color: Colors.white70)),
                        const Spacer(),
                        SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () => Navigator.push(
                                    context,
                                    FadeRoute(
                                        page: SignInScreen(
                                            theme: theme, lang: lang))),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.accent,
                                    foregroundColor: Colors.black,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 14),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    elevation: 0),
                                child: Text(lang.get('sign_in'),
                                    style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1)))),
                        const SizedBox(height: 12),
                        SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                                onPressed: () => Navigator.push(
                                    context,
                                    FadeRoute(
                                        page: SignUpScreen(
                                            theme: theme, lang: lang))),
                                style: OutlinedButton.styleFrom(
                                    side:
                                        const BorderSide(color: Colors.white54),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 14),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                                child: Text(lang.get('sign_up'),
                                    style: const TextStyle(
                                        fontSize: 13,
                                        color: Colors.white,
                                        letterSpacing: 1)))),
                        const SizedBox(height: 32)
                      ]))))));
  Widget _lb(String l) {
    final s = lang.currentLanguage == l;
    return GestureDetector(
        onTap: () => lang.setLanguage(l),
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
                color: s ? AppColors.accent : Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(4)),
            child: Text(l,
                style: TextStyle(
                    color: s ? Colors.black : Colors.white70,
                    fontSize: 11,
                    fontWeight: FontWeight.w600))));
  }
}

class SignInScreen extends StatefulWidget {
  final ThemeNotifier theme;
  final LanguageService lang;
  const SignInScreen({super.key, required this.theme, required this.lang});
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _eC = TextEditingController();
  final _pC = TextEditingController();
  bool _obs = true;
  @override
  Widget build(BuildContext context) {
    final d = widget.theme.isDark;
    final l = widget.lang;
    return Scaffold(
        backgroundColor: AppColors.background(d),
        appBar: AppBar(backgroundColor: Colors.transparent),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(32),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(l.get('welcome_back'),
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w300,
                      color: AppColors.text(d))),
              const SizedBox(height: 40),
              _tf(_eC, l.get('email'), Icons.email_outlined, d),
              const SizedBox(height: 16),
              _tf(_pC, l.get('password'), Icons.lock_outlined, d, isP: true),
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {
                        if (_eC.text.isNotEmpty)
                          AuthService().resetPassword(_eC.text);
                      },
                      child: Text(l.get('forgot_password'),
                          style: TextStyle(
                              color: AppColors.textSecondary(d),
                              fontSize: 12)))),
              const SizedBox(height: 24),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: _signIn,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.accent,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 0),
                      child: Text(l.get('sign_in'),
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w600)))),
              const SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(l.get('no_account'),
                    style: TextStyle(
                        color: AppColors.textSecondary(d), fontSize: 12)),
                TextButton(
                    onPressed: () => Navigator.pushReplacement(
                        context,
                        FadeRoute(
                            page: SignUpScreen(
                                theme: widget.theme, lang: widget.lang))),
                    child: Text(l.get('sign_up'),
                        style: TextStyle(
                            color: AppColors.accent,
                            fontWeight: FontWeight.w600,
                            fontSize: 12)))
              ])
            ])));
  }

  Widget _tf(TextEditingController c, String lb, IconData ic, bool d,
          {bool isP = false}) =>
      TextField(
          controller: c,
          obscureText: isP ? _obs : false,
          style: TextStyle(color: AppColors.text(d), fontSize: 14),
          decoration: InputDecoration(
              labelText: lb,
              labelStyle:
                  TextStyle(color: AppColors.textSecondary(d), fontSize: 13),
              prefixIcon: Icon(ic, color: AppColors.textSecondary(d), size: 20),
              suffixIcon: isP
                  ? IconButton(
                      icon: Icon(
                          _obs
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: AppColors.textSecondary(d),
                          size: 20),
                      onPressed: () => setState(() => _obs = !_obs))
                  : null,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                      color: AppColors.textSecondary(d).withOpacity(0.3))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppColors.accent)),
              filled: true,
              fillColor: AppColors.card(d)));
  void _signIn() async {
    final ok = await AuthService().signIn(_eC.text, _pC.text);
    if (ok && mounted) {
      final a = AuthService();
      Navigator.pushAndRemoveUntil(
          context,
          FadeRoute(
              page: a.isEmailVerified
                  ? MainScreen(theme: widget.theme, lang: widget.lang)
                  : VerifyEmailScreen(theme: widget.theme, lang: widget.lang)),
          (r) => false);
    } else if (mounted)
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(AuthService().error ?? 'Error'),
          backgroundColor: Colors.red));
  }
}

class SignUpScreen extends StatefulWidget {
  final ThemeNotifier theme;
  final LanguageService lang;
  const SignUpScreen({super.key, required this.theme, required this.lang});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nC = TextEditingController();
  final _eC = TextEditingController();
  final _pC = TextEditingController();
  bool _obs = true;
  @override
  Widget build(BuildContext context) {
    final d = widget.theme.isDark;
    final l = widget.lang;
    return Scaffold(
        backgroundColor: AppColors.background(d),
        appBar: AppBar(backgroundColor: Colors.transparent),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(32),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(l.get('create_account'),
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w300,
                      color: AppColors.text(d))),
              const SizedBox(height: 40),
              _tf(_nC, 'Full Name', Icons.person_outlined, d),
              const SizedBox(height: 16),
              _tf(_eC, l.get('email'), Icons.email_outlined, d),
              const SizedBox(height: 16),
              _tf(_pC, l.get('password'), Icons.lock_outlined, d, isP: true),
              const SizedBox(height: 32),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: _signUp,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.accent,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 0),
                      child: Text(l.get('sign_up'),
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w600)))),
              const SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(l.get('have_account'),
                    style: TextStyle(
                        color: AppColors.textSecondary(d), fontSize: 12)),
                TextButton(
                    onPressed: () => Navigator.pushReplacement(
                        context,
                        FadeRoute(
                            page: SignInScreen(
                                theme: widget.theme, lang: widget.lang))),
                    child: Text(l.get('sign_in'),
                        style: TextStyle(
                            color: AppColors.accent,
                            fontWeight: FontWeight.w600,
                            fontSize: 12)))
              ])
            ])));
  }

  Widget _tf(TextEditingController c, String lb, IconData ic, bool d,
          {bool isP = false}) =>
      TextField(
          controller: c,
          obscureText: isP ? _obs : false,
          style: TextStyle(color: AppColors.text(d), fontSize: 14),
          decoration: InputDecoration(
              labelText: lb,
              labelStyle:
                  TextStyle(color: AppColors.textSecondary(d), fontSize: 13),
              prefixIcon: Icon(ic, color: AppColors.textSecondary(d), size: 20),
              suffixIcon: isP
                  ? IconButton(
                      icon: Icon(
                          _obs
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: AppColors.textSecondary(d),
                          size: 20),
                      onPressed: () => setState(() => _obs = !_obs))
                  : null,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                      color: AppColors.textSecondary(d).withOpacity(0.3))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppColors.accent)),
              filled: true,
              fillColor: AppColors.card(d)));
  void _signUp() async {
    final ok = await AuthService().signUp(_eC.text, _pC.text);
    if (ok && mounted) {
      UserProfile().name = _nC.text;
      Navigator.pushReplacement(
          context,
          FadeRoute(
              page: VerifyEmailScreen(theme: widget.theme, lang: widget.lang)));
    } else if (mounted)
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(AuthService().error ?? 'Error'),
          backgroundColor: Colors.red));
  }
}

class VerifyEmailScreen extends StatefulWidget {
  final ThemeNotifier theme;
  final LanguageService lang;
  const VerifyEmailScreen({super.key, required this.theme, required this.lang});
  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  Timer? _t;
  bool _canResend = true;

  @override
  void initState() {
    super.initState();
    _sendEmail();
    _t = Timer.periodic(const Duration(seconds: 3), (_) async {
      await AuthService().reloadUser();
      if (AuthService().isEmailVerified && mounted) {
        _t?.cancel();
        Navigator.pushAndRemoveUntil(
            context,
            FadeRoute(page: MainScreen(theme: widget.theme, lang: widget.lang)),
            (r) => false);
      }
    });
  }

  void _sendEmail() async {
    final success = await AuthService().resendVerification();
    if (mounted) {
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(widget.lang.currentLanguage == 'TR'
                ? 'Doğrulama e-postası gönderildi ✓'
                : 'Verification email sent ✓'),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 2),
          ),
        );
        setState(() => _canResend = false);
        await Future.delayed(const Duration(seconds: 60));
        if (mounted) setState(() => _canResend = true);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(widget.lang.currentLanguage == 'TR'
                ? 'Hata oluştu'
                : 'Error occurred'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _t?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final d = widget.theme.isDark;
    final l = widget.lang;
    return Scaffold(
        backgroundColor: AppColors.background(d),
        body: Center(
            child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Icon(Icons.mark_email_unread_outlined,
                      size: 56, color: AppColors.accent),
                  const SizedBox(height: 24),
                  Text(l.get('verify_email'),
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w300,
                          color: AppColors.text(d))),
                  const SizedBox(height: 12),
                  Text(l.get('check_inbox'),
                      style: TextStyle(
                          color: AppColors.textSecondary(d), fontSize: 13)),
                  const SizedBox(height: 8),
                  Text(AuthService().user?.email ?? '',
                      style: TextStyle(color: AppColors.accent, fontSize: 12)),
                  const SizedBox(height: 24),
                  SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                          strokeWidth: 2, color: AppColors.accent)),
                  const SizedBox(height: 24),
                  ElevatedButton(
                      onPressed: _canResend ? _sendEmail : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            _canResend ? AppColors.accent : Colors.grey,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 12),
                      ),
                      child: Text(
                          _canResend
                              ? l.get('resend')
                              : (l.currentLanguage == 'TR'
                                  ? 'Bekleyin...'
                                  : 'Wait...'),
                          style: const TextStyle(fontSize: 13))),
                  const SizedBox(height: 8),
                  TextButton(
                      onPressed: () async {
                        await AuthService().signOut();
                        if (mounted)
                          Navigator.pushAndRemoveUntil(
                              context,
                              FadeRoute(
                                  page: WelcomeScreen(
                                      theme: widget.theme, lang: widget.lang)),
                              (r) => false);
                      },
                      child: Text(l.get('sign_out'),
                          style: TextStyle(color: AppColors.textSecondary(d))))
                ]))));
  }
}

class MainScreen extends StatefulWidget {
  final ThemeNotifier theme;
  final LanguageService lang;
  const MainScreen({super.key, required this.theme, required this.lang});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _idx = 0;
  final Set<String> _favs = {};
  final Set<String> _likes = {};

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = AuthService().user?.uid;
    if (userId == null) return;

    final favsList = prefs.getStringList('favorites_$userId') ?? [];
    final likesList = prefs.getStringList('likes_$userId') ?? [];
    setState(() {
      _favs.addAll(favsList);
      _likes.addAll(likesList);
    });
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = AuthService().user?.uid;
    if (userId == null) return;

    await prefs.setStringList('favorites_$userId', _favs.toList());
    await prefs.setStringList('likes_$userId', _likes.toList());
  }

  void _toggleFav(String id) {
    setState(() {
      _favs.contains(id) ? _favs.remove(id) : _favs.add(id);
    });
    _saveFavorites();
  }

  void _toggleLike(String id) {
    setState(() {
      _likes.contains(id) ? _likes.remove(id) : _likes.add(id);
    });
    _saveFavorites();
  }

  @override
  Widget build(BuildContext context) {
    final d = widget.theme.isDark;
    final l = widget.lang;
    final tabs = [
      HomeTab(
          theme: widget.theme,
          lang: widget.lang,
          favs: _favs,
          likes: _likes,
          onFav: _toggleFav,
          onLike: _toggleLike),
      SearchTab(
          theme: widget.theme,
          lang: widget.lang,
          favs: _favs,
          likes: _likes,
          onFav: _toggleFav,
          onLike: _toggleLike),
      BookingsTab(theme: widget.theme, lang: widget.lang),
      BookmarkTab(
          theme: widget.theme,
          lang: widget.lang,
          favs: _favs,
          onFav: _toggleFav),
      ProfileTab(
          theme: widget.theme, lang: widget.lang, favsCount: _favs.length),
    ];
    return Scaffold(
      body: IndexedStack(index: _idx, children: tabs),
      bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: AppColors.card(d),
              border: Border(
                  top: BorderSide(
                      color: AppColors.textSecondary(d).withOpacity(0.1)))),
          child: BottomNavigationBar(
              currentIndex: _idx,
              onTap: (i) => setState(() => _idx = i),
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              elevation: 0,
              selectedFontSize: 10,
              unselectedFontSize: 10,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined, size: 22),
                    activeIcon: Icon(Icons.home, size: 22),
                    label: l.get('home')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search, size: 22), label: l.get('search')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.calendar_today_outlined, size: 22),
                    label: l.get('bookings')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.bookmark_outline, size: 22),
                    activeIcon: Icon(Icons.bookmark, size: 22),
                    label: l.get('favorites')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline, size: 22),
                    activeIcon: Icon(Icons.person, size: 22),
                    label: l.get('profile'))
              ])),
      floatingActionButton: FloatingActionButton(
          onPressed: () => showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (c) => ChatSheet(isDark: d, lang: l)),
          backgroundColor: AppColors.accent,
          elevation: 2,
          child: Icon(Icons.chat_outlined, color: Colors.black, size: 22)),
    );
  }
}

class ChatSheet extends StatefulWidget {
  final bool isDark;
  final LanguageService lang;
  const ChatSheet({super.key, required this.isDark, required this.lang});
  @override
  State<ChatSheet> createState() => _ChatSheetState();
}

class _ChatSheetState extends State<ChatSheet> {
  final _c = TextEditingController();
  final List<Map<String, String>> _msgs = [
    {'sender': 'bot', 'text': 'Hello! 🌴 How can I help?'}
  ];
  bool _isLoading = false;

  void _send() async {
    if (_c.text.trim().isEmpty) return;
    final userMsg = _c.text.trim();
    setState(() {
      _msgs.add({'sender': 'user', 'text': userMsg});
      _isLoading = true;
    });
    _c.clear();

    final botResponse =
        await ChatService.getResponse(userMsg, widget.lang.currentLanguage);

    setState(() {
      _msgs.add({'sender': 'bot', 'text': botResponse});
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final d = widget.isDark;
    return Container(
        height: MediaQuery.of(context).size.height * 0.65,
        decoration: BoxDecoration(
            color: AppColors.background(d),
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(16))),
        child: Column(children: [
          Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: AppColors.card(d),
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(16))),
              child: Row(children: [
                Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                        color: AppColors.accent.withOpacity(0.1),
                        shape: BoxShape.circle),
                    child: Icon(Icons.support_agent,
                        color: AppColors.accent, size: 18)),
                const SizedBox(width: 12),
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text(widget.lang.get('ai_assistant'),
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: AppColors.text(d))),
                      Row(children: [
                        Container(
                            width: 6,
                            height: 6,
                            decoration: const BoxDecoration(
                                color: Colors.green, shape: BoxShape.circle)),
                        const SizedBox(width: 4),
                        Text('Online',
                            style: TextStyle(
                                color: AppColors.textSecondary(d),
                                fontSize: 10))
                      ])
                    ])),
                IconButton(
                    icon: Icon(Icons.close,
                        color: AppColors.textSecondary(d), size: 20),
                    onPressed: () => Navigator.pop(context))
              ])),
          Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _msgs.length + (_isLoading ? 1 : 0),
                  itemBuilder: (c, i) {
                    if (_isLoading && i == _msgs.length) {
                      return Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              margin: const EdgeInsets.only(bottom: 8),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 10),
                              decoration: BoxDecoration(
                                  color: AppColors.card(d),
                                  borderRadius: BorderRadius.circular(14)),
                              child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                        width: 12,
                                        height: 12,
                                        child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            color: AppColors.accent)),
                                    const SizedBox(width: 8),
                                    Text('Yazıyor...',
                                        style: TextStyle(
                                            color: AppColors.text(d),
                                            fontSize: 13))
                                  ])));
                    }
                    final m = _msgs[i];
                    final isU = m['sender'] == 'user';
                    return Align(
                        alignment:
                            isU ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 10),
                            constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.7),
                            decoration: BoxDecoration(
                                color:
                                    isU ? AppColors.accent : AppColors.card(d),
                                borderRadius: BorderRadius.circular(14)),
                            child: Text(m['text']!,
                                style: TextStyle(
                                    color:
                                        isU ? Colors.black : AppColors.text(d),
                                    fontSize: 13))));
                  })),
          Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: AppColors.card(d),
                  border: Border(
                      top: BorderSide(
                          color: AppColors.textSecondary(d).withOpacity(0.1)))),
              child: Row(children: [
                Expanded(
                    child: TextField(
                        controller: _c,
                        enabled: !_isLoading,
                        style:
                            TextStyle(color: AppColors.text(d), fontSize: 13),
                        decoration: InputDecoration(
                            hintText: widget.lang.get('type_message'),
                            hintStyle: TextStyle(
                                color: AppColors.textSecondary(d),
                                fontSize: 13),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none),
                            filled: true,
                            fillColor: AppColors.background(d),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10)),
                        onSubmitted: (_) => _send())),
                const SizedBox(width: 8),
                GestureDetector(
                    onTap: _isLoading ? null : _send,
                    child: Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                            color: _isLoading ? Colors.grey : AppColors.accent,
                            shape: BoxShape.circle),
                        child: const Icon(Icons.send,
                            color: Colors.black, size: 16)))
              ])),
        ]));
  }
}

// Animated Counter Widget
class AnimatedCounter extends StatefulWidget {
  final int end;
  final String suffix;
  final Duration duration;
  final TextStyle style;
  const AnimatedCounter(
      {super.key,
      required this.end,
      this.suffix = '',
      this.duration = const Duration(milliseconds: 1500),
      required this.style});
  @override
  State<AnimatedCounter> createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<AnimatedCounter>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = IntTween(begin: 0, end: widget.end)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
      animation: _animation,
      builder: (c, _) =>
          Text('${_animation.value}${widget.suffix}', style: widget.style));
}

class HomeTab extends StatelessWidget {
  final ThemeNotifier theme;
  final LanguageService lang;
  final Set<String> favs, likes;
  final Function(String) onFav, onLike;
  const HomeTab(
      {super.key,
      required this.theme,
      required this.lang,
      required this.favs,
      required this.likes,
      required this.onFav,
      required this.onLike});

  void _showRoomDetail(BuildContext context, Room r) {
    showDialog(
        context: context,
        builder: (ctx) => RoomDetailModal(room: r, theme: theme, lang: lang));
  }

  @override
  Widget build(BuildContext context) {
    final d = theme.isDark;
    final l = lang;
    return Scaffold(
        backgroundColor: AppColors.background(d),
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // 1. Hero Section
          Container(
              height: 280,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1573843981267-be1999ff37cd?w=1200'),
                      fit: BoxFit.cover)),
              child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Colors.black.withOpacity(0.3),
                        Colors.black.withOpacity(0.7)
                      ])),
                  child: SafeArea(
                      child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(children: [
                                        Icon(Icons.villa,
                                            color: AppColors.accent, size: 22),
                                        const SizedBox(width: 8),
                                        const Text('OneNest',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500))
                                      ]),
                                      Row(children: [
                                        GestureDetector(
                                            onTap: () => Navigator.push(
                                                context,
                                                FadeRoute(
                                                    page: NotificationsScreen(
                                                        theme: theme,
                                                        lang: lang))),
                                            child: Stack(children: [
                                              Container(
                                                  width: 34,
                                                  height: 34,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white
                                                          .withOpacity(0.15),
                                                      shape: BoxShape.circle),
                                                  child: const Icon(
                                                      Icons
                                                          .notifications_outlined,
                                                      color: Colors.white,
                                                      size: 18)),
                                              if (NotificationService()
                                                      .unreadCount >
                                                  0)
                                                Positioned(
                                                    right: 0,
                                                    top: 0,
                                                    child: Container(
                                                        width: 16,
                                                        height: 16,
                                                        decoration:
                                                            const BoxDecoration(
                                                                color:
                                                                    Colors.red,
                                                                shape: BoxShape
                                                                    .circle),
                                                        child: Center(
                                                            child: Text(
                                                                '${NotificationService().unreadCount}',
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize: 9,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)))))
                                            ])),
                                        const SizedBox(width: 8),
                                        _lc('EN', l),
                                        const SizedBox(width: 6),
                                        _lc('TR', l),
                                        const SizedBox(width: 8),
                                        GestureDetector(
                                            onTap: () => theme.toggle(),
                                            child: Container(
                                                width: 34,
                                                height: 34,
                                                decoration: BoxDecoration(
                                                    color: Colors.white
                                                        .withOpacity(0.15),
                                                    shape: BoxShape.circle),
                                                child: Icon(
                                                    d
                                                        ? Icons
                                                            .light_mode_outlined
                                                        : Icons
                                                            .dark_mode_outlined,
                                                    color: Colors.white,
                                                    size: 16))),
                                      ]),
                                    ]),
                                const Spacer(),
                                Text(l.get('explore'),
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white)),
                                const SizedBox(height: 4),
                                Text(l.get('discover'),
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.white70)),
                              ]))))),

          // AI Vacation Planner - Featured Section
          Container(
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.accent, AppColors.accent.withOpacity(0.8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: AppColors.accent.withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                )
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => Navigator.push(
                    context,
                    FadeRoute(
                        page:
                            AIVacationPlannerScreen(theme: theme, lang: lang))),
                borderRadius: BorderRadius.circular(16),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.psychology_outlined,
                            color: Colors.black, size: 32),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l.get('ai_planner'),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              l.get('plan_vacation'),
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios,
                          color: Colors.black, size: 16),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // 2. About Us Section with Images
          Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _tt(l.get('about_us'), d),
                    const SizedBox(height: 12),
                    SizedBox(
                        height: 160,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: aboutImages.length,
                            itemBuilder: (c, i) => Container(
                                width: 240,
                                margin: const EdgeInsets.only(right: 12),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(aboutImages[i],
                                        fit: BoxFit.cover))))),
                    const SizedBox(height: 12),
                    Text(l.get('about_desc'),
                        style: TextStyle(
                            color: AppColors.textSecondary(d),
                            fontSize: 13,
                            height: 1.5)),
                  ])),

          // 3. Stats Section - Why Choose Us
          Container(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                AppColors.accent.withOpacity(0.1),
                AppColors.accent.withOpacity(0.05)
              ])),
              child: Column(children: [
                _tt(l.get('stats_title'), d),
                const SizedBox(height: 20),
                Row(children: [
                  _statCard(15000, '+', l.get('happy_guests'),
                      Icons.people_outline, d),
                  const SizedBox(width: 12),
                  _statCard(85, '+', l.get('countries'), Icons.public, d),
                ]),
                const SizedBox(height: 12),
                Row(children: [
                  _statCard(
                      25, '+', l.get('awards'), Icons.emoji_events_outlined, d),
                  const SizedBox(width: 12),
                  _statCard(
                      10, '+', l.get('years_exp'), Icons.verified_outlined, d),
                ]),
              ])),

          // 4. Map / Location Section
          Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: AppColors.card(d),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.05), blurRadius: 10)
                  ]),
              child: Column(children: [
                ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Stack(children: [
                      Image.network(
                          'https://images.unsplash.com/photo-1514282401047-d79a71a590e8?w=800',
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover),
                      Positioned.fill(
                          child: Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.5)
                          ])))),
                      Positioned(
                          bottom: 12,
                          left: 12,
                          child: Row(children: [
                            Icon(Icons.location_on,
                                color: Colors.white, size: 20),
                            const SizedBox(width: 6),
                            const Text('Maldives, Indian Ocean',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14))
                          ])),
                    ])),
                Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(children: [
                      Row(children: [
                        Icon(Icons.map_outlined,
                            color: AppColors.accent, size: 20),
                        const SizedBox(width: 10),
                        Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              Text(l.get('our_location'),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: AppColors.text(d))),
                              Text('North Malé Atoll, Maldives',
                                  style: TextStyle(
                                      color: AppColors.textSecondary(d),
                                      fontSize: 12))
                            ]))
                      ]),
                      const SizedBox(height: 12),
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                              onPressed: () =>
                                  UrlLauncherService.openMap(4.1755, 73.5093),
                              icon: Icon(Icons.directions, size: 18),
                              label: Text(l.get('view_map')),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.accent,
                                  foregroundColor: Colors.black,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(8))))),
                    ])),
              ])),

          // 5. Luxury Rooms Section
          Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _tt(l.get('luxury_rooms'), d),
                    const SizedBox(height: 12),
                    ...rooms.map((r) => _roomCard(context, r, d, l))
                  ])),

          // 6. Spa Section
          Container(
              padding: const EdgeInsets.all(20),
              color: AppColors.surface(d),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _tt(l.get('spa'), d),
                    const SizedBox(height: 12),
                    SizedBox(
                        height: 180,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: spaServices.length,
                            itemBuilder: (c, i) {
                              final s = spaServices[i];
                              return Container(
                                  width: 200,
                                  margin: const EdgeInsets.only(right: 12),
                                  decoration: BoxDecoration(
                                      color: AppColors.card(d),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                            borderRadius:
                                                const BorderRadius.vertical(
                                                    top: Radius.circular(12)),
                                            child: Image.network(s['image']!,
                                                height: 100,
                                                width: double.infinity,
                                                fit: BoxFit.cover)),
                                        Padding(
                                            padding: const EdgeInsets.all(12),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(s['name']!,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 13,
                                                          color: AppColors.text(
                                                              d))),
                                                  const SizedBox(height: 4),
                                                  Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(s['duration']!,
                                                            style: TextStyle(
                                                                color: AppColors
                                                                    .textSecondary(
                                                                        d),
                                                                fontSize: 11)),
                                                        Text(s['price']!,
                                                            style: TextStyle(
                                                                color: AppColors
                                                                    .accent,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 13))
                                                      ])
                                                ]))
                                      ]));
                            })),
                  ])),

          // 7. Restaurant Section
          Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _tt(l.get('restaurant'), d),
                    const SizedBox(height: 12),
                    ...restaurantItems.map((r) => Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                            color: AppColors.card(d),
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(children: [
                          ClipRRect(
                              borderRadius: const BorderRadius.horizontal(
                                  left: Radius.circular(12)),
                              child: Image.network(r['image']!,
                                  width: 100, height: 80, fit: BoxFit.cover)),
                          Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(r['name']!,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14,
                                                color: AppColors.text(d))),
                                        const SizedBox(height: 4),
                                        Text(r['type']!,
                                            style: TextStyle(
                                                color: AppColors.accent,
                                                fontSize: 12)),
                                        const SizedBox(height: 4),
                                        Row(children: [
                                          Icon(Icons.access_time,
                                              size: 12,
                                              color:
                                                  AppColors.textSecondary(d)),
                                          const SizedBox(width: 4),
                                          Text(r['hours']!,
                                              style: TextStyle(
                                                  color:
                                                      AppColors.textSecondary(
                                                          d),
                                                  fontSize: 11))
                                        ])
                                      ])))
                        ]))),
                  ])),

          // 8. Reviews Section
          Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _tt(l.get('guest_reviews'), d),
                    const SizedBox(height: 12),
                    SizedBox(
                        height: 90,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: reviews.length,
                            itemBuilder: (c, i) {
                              final rv = reviews[i];
                              return Container(
                                  width: 200,
                                  margin: const EdgeInsets.only(right: 10),
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      color: AppColors.card(d),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(children: [
                                          CircleAvatar(
                                              radius: 12,
                                              backgroundColor: AppColors.accent
                                                  .withOpacity(0.1),
                                              child: Text(rv.name[0],
                                                  style: TextStyle(
                                                      color: AppColors.accent,
                                                      fontSize: 10))),
                                          const SizedBox(width: 8),
                                          Expanded(
                                              child: Text(rv.name,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 11,
                                                      color:
                                                          AppColors.text(d)))),
                                          Icon(Icons.star,
                                              color: AppColors.accent,
                                              size: 12),
                                          Text(' ${rv.rating}',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: AppColors.text(d)))
                                        ]),
                                        const SizedBox(height: 8),
                                        Text(rv.comment,
                                            style: TextStyle(
                                                fontSize: 10,
                                                color:
                                                    AppColors.textSecondary(d)),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis)
                                      ]));
                            }))
                  ])),

          // 9. Contact Section
          Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                  color: AppColors.card(d),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l.get('contact_us'),
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.text(d))),
                    const SizedBox(height: 10),
                    GestureDetector(
                        onTap: () => UrlLauncherService.call('+960 123 4567'),
                        child: Row(children: [
                          Icon(Icons.phone_outlined,
                              color: AppColors.accent, size: 16),
                          const SizedBox(width: 8),
                          Text('+960 123 4567',
                              style: TextStyle(
                                  color: AppColors.textSecondary(d),
                                  fontSize: 12))
                        ])),
                    const SizedBox(height: 8),
                    GestureDetector(
                        onTap: () =>
                            UrlLauncherService.email('info@onenest.mv'),
                        child: Row(children: [
                          Icon(Icons.email_outlined,
                              color: AppColors.accent, size: 16),
                          const SizedBox(width: 8),
                          Text('info@onenest.mv',
                              style: TextStyle(
                                  color: AppColors.textSecondary(d),
                                  fontSize: 12))
                        ]))
                  ])),
          const SizedBox(height: 80),
        ])));
  }

  Widget _statCard(
      int value, String suffix, String label, IconData icon, bool d) {
    return Expanded(
        child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: AppColors.card(d),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.05), blurRadius: 10)
                ]),
            child: Column(children: [
              Icon(icon, color: AppColors.accent, size: 28),
              const SizedBox(height: 8),
              AnimatedCounter(
                  end: value,
                  suffix: suffix,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: AppColors.text(d))),
              const SizedBox(height: 4),
              Text(label,
                  style: TextStyle(
                      color: AppColors.textSecondary(d), fontSize: 11),
                  textAlign: TextAlign.center),
            ])));
  }

  Widget _roomCard(BuildContext context, Room r, bool d, LanguageService l) {
    return Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
            color: AppColors.card(d),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)
            ]),
        child: Column(children: [
          Stack(children: [
            ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(r.image,
                    height: 180, width: double.infinity, fit: BoxFit.cover)),
            Positioned(
                left: 12,
                right: 12,
                bottom: 12,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                      width: 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4))),
                  Container(
                      width: 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(4))),
                  Container(
                      width: 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(4)))
                ])),
            Positioned(
                left: 12,
                top: 12,
                child: GestureDetector(
                    onTap: () => onLike(r.id),
                    child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Icon(
                            likes.contains(r.id)
                                ? Icons.favorite
                                : Icons.favorite_outline,
                            color: Colors.red,
                            size: 18)))),
            Positioned(
                right: 12,
                top: 12,
                child: GestureDetector(
                    onTap: () => onFav(r.id),
                    child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Icon(
                            favs.contains(r.id)
                                ? Icons.bookmark
                                : Icons.bookmark_outline,
                            color: AppColors.accent,
                            size: 18)))),
          ]),
          Padding(
              padding: const EdgeInsets.all(16),
              child: Row(children: [
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text(r.name,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.text(d))),
                      const SizedBox(height: 4),
                      GestureDetector(
                          onTap: () => _showRoomDetail(context, r),
                          child: Text(
                              l.currentLanguage == 'TR'
                                  ? 'Oda Detayları'
                                  : 'Room Details',
                              style: TextStyle(
                                  color: AppColors.textSecondary(d),
                                  fontSize: 12,
                                  decoration: TextDecoration.underline))),
                    ])),
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Text('Rates from',
                      style: TextStyle(
                          color: AppColors.textSecondary(d), fontSize: 11)),
                  Row(children: [
                    Text('${r.price.toInt()}',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: AppColors.text(d))),
                    Text(' EUR / Night',
                        style: TextStyle(
                            color: AppColors.textSecondary(d), fontSize: 11))
                  ]),
                ]),
                const SizedBox(width: 12),
                ElevatedButton(
                    onPressed: () => Navigator.push(
                        context,
                        FadeRoute(
                            page: BookingScreen(
                                room: r, theme: theme, lang: lang))),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.text(d),
                        foregroundColor: AppColors.background(d),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: Text('+ ${l.get('view_rates')}',
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600))),
              ])),
        ]));
  }

  Widget _lc(String x, LanguageService l) {
    final s = l.currentLanguage == x;
    return GestureDetector(
        onTap: () => l.setLanguage(x),
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
                color: s ? AppColors.accent : Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(4)),
            child: Text(x,
                style: TextStyle(
                    color: s ? Colors.black : Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w600))));
  }

  Widget _tt(String t, bool d) => Row(children: [
        Container(
            width: 3,
            height: 16,
            decoration: BoxDecoration(
                color: AppColors.accent,
                borderRadius: BorderRadius.circular(2))),
        const SizedBox(width: 8),
        Text(t,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.text(d)))
      ]);
}

class RoomDetailModal extends StatefulWidget {
  final Room room;
  final ThemeNotifier theme;
  final LanguageService lang;
  const RoomDetailModal(
      {super.key, required this.room, required this.theme, required this.lang});
  @override
  State<RoomDetailModal> createState() => _RoomDetailModalState();
}

class _RoomDetailModalState extends State<RoomDetailModal> {
  int _imgIdx = 0;
  final PageController _pageC = PageController();

  @override
  void initState() {
    super.initState();
    // Track this room view
    BookingProtectionService().trackView(widget.room.id, widget.room.price);
  }

  @override
  Widget build(BuildContext context) {
    final d = widget.theme.isDark;
    final l = widget.lang;
    final r = widget.room;
    return Dialog(
        insetPadding: const EdgeInsets.all(16),
        backgroundColor: AppColors.background(d),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
            constraints: BoxConstraints(
                maxWidth: 800,
                maxHeight: MediaQuery.of(context).size.height * 0.9),
            child: Column(children: [
              Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text(r.name,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.text(d)))),
                        IconButton(
                            icon: Icon(Icons.close, color: AppColors.text(d)),
                            onPressed: () => Navigator.pop(context))
                      ])),
              Expanded(
                  child: SingleChildScrollView(
                      child: Column(children: [
                SizedBox(
                    height: 280,
                    child: Stack(children: [
                      PageView.builder(
                          controller: _pageC,
                          itemCount: r.images.length,
                          onPageChanged: (i) => setState(() => _imgIdx = i),
                          itemBuilder: (c, i) => Image.network(r.images[i],
                              fit: BoxFit.cover, width: double.infinity)),
                      Positioned(
                          left: 8,
                          top: 0,
                          bottom: 0,
                          child: Center(
                              child: IconButton(
                                  onPressed: _imgIdx > 0
                                      ? () => _pageC.previousPage(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          curve: Curves.ease)
                                      : null,
                                  icon: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: Colors.black54,
                                          shape: BoxShape.circle),
                                      child: Icon(Icons.chevron_left,
                                          color: Colors.white))))),
                      Positioned(
                          right: 8,
                          top: 0,
                          bottom: 0,
                          child: Center(
                              child: IconButton(
                                  onPressed: _imgIdx < r.images.length - 1
                                      ? () => _pageC.nextPage(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          curve: Curves.ease)
                                      : null,
                                  icon: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: Colors.black54,
                                          shape: BoxShape.circle),
                                      child: Icon(Icons.chevron_right,
                                          color: Colors.white))))),
                      Positioned(
                          bottom: 12,
                          left: 0,
                          right: 0,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                  r.images.length,
                                  (i) => Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 3),
                                      width: _imgIdx == i ? 12 : 8,
                                      height: 8,
                                      decoration: BoxDecoration(
                                          color: _imgIdx == i
                                              ? Colors.white
                                              : Colors.white54,
                                          borderRadius:
                                              BorderRadius.circular(4)))))),
                    ])),
                Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: _infoSection(Icons.home_outlined,
                                    l.get('room_overview'), [r.name], d)),
                            Expanded(
                                child: _infoSection(
                                    Icons.bed_outlined,
                                    l.get('beds_bedding'),
                                    [
                                      '${l.get('max_occupancy')}: ${r.maxOccupancy}',
                                      r.bedType
                                    ],
                                    d)),
                            Expanded(
                                child: _infoSection(
                                    Icons.meeting_room_outlined,
                                    l.get('room_features'),
                                    [r.roomSize, 'Air-conditioned', 'WiFi'],
                                    d)),
                          ]),
                      const SizedBox(height: 20),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: _infoSection(Icons.bathtub_outlined,
                                    l.get('bath_features'), r.bathFeatures, d)),
                            Expanded(
                                flex: 2,
                                child: _infoSection(Icons.room_service_outlined,
                                    l.get('amenities'), r.amenities, d)),
                          ]),
                    ])),
              ]))),
              Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: AppColors.card(d),
                      border: Border(
                          top: BorderSide(
                              color: AppColors.textSecondary(d)
                                  .withOpacity(0.1)))),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Rates from',
                                  style: TextStyle(
                                      color: AppColors.textSecondary(d),
                                      fontSize: 11)),
                              Row(children: [
                                Text('${r.price.toInt()}',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.text(d))),
                                Text(' EUR / Night',
                                    style: TextStyle(
                                        color: AppColors.textSecondary(d),
                                        fontSize: 11))
                              ])
                            ]),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  FadeRoute(
                                      page: BookingScreen(
                                          room: r,
                                          theme: widget.theme,
                                          lang: widget.lang)));
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.accent,
                                foregroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 14),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            child: Text(l.get('book_now'),
                                style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600))),
                      ])),
            ])));
  }

  Widget _infoSection(
          IconData icon, String title, List<String> items, bool d) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Icon(icon, size: 18, color: AppColors.textSecondary(d)),
          const SizedBox(width: 8),
          Text(title,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  color: AppColors.text(d)))
        ]),
        const SizedBox(height: 8),
        ...items.map((item) => Padding(
            padding: const EdgeInsets.only(left: 26, bottom: 4),
            child: Text(item,
                style: TextStyle(
                    color: AppColors.textSecondary(d), fontSize: 12))))
      ]);
}

class SearchTab extends StatefulWidget {
  final ThemeNotifier theme;
  final LanguageService lang;
  final Set<String> favs, likes;
  final Function(String) onFav, onLike;
  const SearchTab(
      {super.key,
      required this.theme,
      required this.lang,
      required this.favs,
      required this.likes,
      required this.onFav,
      required this.onLike});
  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  String _q = '';
  @override
  Widget build(BuildContext context) {
    final d = widget.theme.isDark;
    final l = widget.lang;
    final filtered = rooms
        .where((r) => r.name.toLowerCase().contains(_q.toLowerCase()))
        .toList();
    return Scaffold(
        backgroundColor: AppColors.background(d),
        appBar: AppBar(title: Text(l.get('search'))),
        body: Column(children: [
          Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                  onChanged: (v) => setState(() => _q = v),
                  style: TextStyle(color: AppColors.text(d), fontSize: 13),
                  decoration: InputDecoration(
                      hintText: '${l.get('search')}...',
                      hintStyle: TextStyle(color: AppColors.textSecondary(d)),
                      prefixIcon: Icon(Icons.search,
                          color: AppColors.textSecondary(d), size: 20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor: AppColors.card(d),
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 10)))),
          Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: filtered.length,
                  itemBuilder: (c, i) {
                    final r = filtered[i];
                    return GestureDetector(
                        onTap: () => showDialog(
                            context: context,
                            builder: (ctx) => RoomDetailModal(
                                room: r,
                                theme: widget.theme,
                                lang: widget.lang)),
                        child: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                                color: AppColors.card(d),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(children: [
                              ClipRRect(
                                  borderRadius: const BorderRadius.horizontal(
                                      left: Radius.circular(10)),
                                  child: Image.network(r.image,
                                      width: 90,
                                      height: 90,
                                      fit: BoxFit.cover)),
                              Expanded(
                                  child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(r.name,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 13,
                                                    color: AppColors.text(d))),
                                            const SizedBox(height: 3),
                                            Row(children: [
                                              Icon(Icons.star,
                                                  color: AppColors.accent,
                                                  size: 12),
                                              Text(' ${r.rating}',
                                                  style: TextStyle(
                                                      color: AppColors
                                                          .textSecondary(d),
                                                      fontSize: 11))
                                            ]),
                                            const SizedBox(height: 6),
                                            Text(
                                                '\$${r.price.toInt()}${l.get('per_night')}',
                                                style: TextStyle(
                                                    color: AppColors.accent,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 13))
                                          ]))),
                              Column(children: [
                                IconButton(
                                    icon: Icon(
                                        widget.likes.contains(r.id)
                                            ? Icons.favorite
                                            : Icons.favorite_outline,
                                        color: Colors.red,
                                        size: 18),
                                    onPressed: () => widget.onLike(r.id)),
                                IconButton(
                                    icon: Icon(
                                        widget.favs.contains(r.id)
                                            ? Icons.bookmark
                                            : Icons.bookmark_outline,
                                        color: AppColors.accent,
                                        size: 18),
                                    onPressed: () => widget.onFav(r.id))
                              ])
                            ])));
                  })),
        ]));
  }
}

class BookingsTab extends StatefulWidget {
  final ThemeNotifier theme;
  final LanguageService lang;
  const BookingsTab({super.key, required this.theme, required this.lang});
  @override
  State<BookingsTab> createState() => _BookingsTabState();
}

class _BookingsTabState extends State<BookingsTab> {
  void _cancelBooking(Booking b) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
                backgroundColor: AppColors.card(widget.theme.isDark),
                title: Text(widget.lang.get('cancel'),
                    style:
                        TextStyle(color: AppColors.text(widget.theme.isDark))),
                content: Text(widget.lang.get('cancel_warning'),
                    style: TextStyle(
                        color: AppColors.textSecondary(widget.theme.isDark))),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(ctx),
                      child: Text(
                          widget.lang.currentLanguage == 'TR' ? 'Vazgeç' : 'No',
                          style: TextStyle(
                              color: AppColors.textSecondary(
                                  widget.theme.isDark)))),
                  TextButton(
                      onPressed: () {
                        BookingService().cancelBooking(b.id);
                        Navigator.pop(ctx);
                        setState(() {});
                      },
                      child: Text(widget.lang.get('cancel'),
                          style: const TextStyle(color: Colors.red)))
                ]));
  }

  @override
  Widget build(BuildContext context) {
    final d = widget.theme.isDark;
    final l = widget.lang;
    final bks = BookingService().bookings;
    return Scaffold(
        backgroundColor: AppColors.background(d),
        appBar: AppBar(title: Text(l.get('bookings'))),
        body: bks.isEmpty
            ? Center(
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                Icon(Icons.calendar_today_outlined,
                    size: 40, color: AppColors.textSecondary(d)),
                const SizedBox(height: 12),
                Text(
                    l.currentLanguage == 'TR'
                        ? 'Henüz rezervasyon yok'
                        : 'No bookings yet',
                    style: TextStyle(
                        color: AppColors.textSecondary(d), fontSize: 13))
              ]))
            : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: bks.length,
                itemBuilder: (c, i) {
                  final b = bks[i];
                  return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          color: AppColors.card(d),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(children: [
                        ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(10)),
                            child: Image.network(b.roomImage,
                                height: 100,
                                width: double.infinity,
                                fit: BoxFit.cover)),
                        Padding(
                            padding: const EdgeInsets.all(14),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(b.roomName,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 13,
                                                color: AppColors.text(d))),
                                        Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 3),
                                            decoration: BoxDecoration(
                                                color: b.cancelled
                                                    ? Colors.red
                                                    : Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                            child: Text(
                                                b.cancelled
                                                    ? (l.currentLanguage == 'TR'
                                                        ? 'İptal'
                                                        : 'Cancelled')
                                                    : b.status,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10)))
                                      ]),
                                  const SizedBox(height: 6),
                                  Text(
                                      '${b.checkIn.day}/${b.checkIn.month} - ${b.checkOut.day}/${b.checkOut.month}',
                                      style: TextStyle(
                                          color: AppColors.textSecondary(d),
                                          fontSize: 12)),
                                  const SizedBox(height: 4),
                                  Text(
                                      '${b.adults} ${l.get('adults')}, ${b.children} ${l.get('children')}',
                                      style: TextStyle(
                                          color: AppColors.textSecondary(d),
                                          fontSize: 11)),
                                  const SizedBox(height: 6),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            '\$${b.totalPrice.toStringAsFixed(0)}',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.accent)),
                                        if (!b.cancelled)
                                          TextButton(
                                              onPressed: () =>
                                                  _cancelBooking(b),
                                              child: Text(l.get('cancel'),
                                                  style: const TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 12)))
                                      ])
                                ]))
                      ]));
                }));
  }
}

class BookmarkTab extends StatelessWidget {
  final ThemeNotifier theme;
  final LanguageService lang;
  final Set<String> favs;
  final Function(String) onFav;
  const BookmarkTab(
      {super.key,
      required this.theme,
      required this.lang,
      required this.favs,
      required this.onFav});
  @override
  Widget build(BuildContext context) {
    final d = theme.isDark;
    final l = lang;
    final favRooms = rooms.where((r) => favs.contains(r.id)).toList();
    return Scaffold(
        backgroundColor: AppColors.background(d),
        appBar: AppBar(title: Text(l.get('favorites'))),
        body: favRooms.isEmpty
            ? Center(
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                Icon(Icons.bookmark_outline,
                    size: 40, color: AppColors.textSecondary(d)),
                const SizedBox(height: 12),
                Text(
                    l.currentLanguage == 'TR'
                        ? 'Henüz favori yok'
                        : 'No favorites yet',
                    style: TextStyle(
                        color: AppColors.textSecondary(d), fontSize: 13))
              ]))
            : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: favRooms.length,
                itemBuilder: (c, i) {
                  final r = favRooms[i];
                  return GestureDetector(
                      onTap: () => showDialog(
                          context: context,
                          builder: (ctx) => RoomDetailModal(
                              room: r, theme: theme, lang: lang)),
                      child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              color: AppColors.card(d),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(children: [
                            ClipRRect(
                                borderRadius: const BorderRadius.horizontal(
                                    left: Radius.circular(10)),
                                child: Image.network(r.image,
                                    width: 90, height: 90, fit: BoxFit.cover)),
                            Expanded(
                                child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(r.name,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 13,
                                                  color: AppColors.text(d))),
                                          const SizedBox(height: 3),
                                          Row(children: [
                                            Icon(Icons.star,
                                                color: AppColors.accent,
                                                size: 12),
                                            Text(' ${r.rating}',
                                                style: TextStyle(
                                                    color:
                                                        AppColors.textSecondary(
                                                            d),
                                                    fontSize: 11))
                                          ]),
                                          const SizedBox(height: 6),
                                          Text(
                                              '\$${r.price.toInt()}${l.get('per_night')}',
                                              style: TextStyle(
                                                  color: AppColors.accent,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 13))
                                        ]))),
                            IconButton(
                                icon: Icon(Icons.bookmark,
                                    color: AppColors.accent, size: 18),
                                onPressed: () => onFav(r.id))
                          ])));
                }));
  }
}

class ProfileTab extends StatelessWidget {
  final ThemeNotifier theme;
  final LanguageService lang;
  final int favsCount;
  const ProfileTab(
      {super.key,
      required this.theme,
      required this.lang,
      required this.favsCount});
  @override
  Widget build(BuildContext context) {
    final d = theme.isDark;
    final l = lang;
    final u = AuthService().user;
    final ly = LoyaltyService();
    final bkC = BookingService().bookings.length;
    return Scaffold(
        backgroundColor: AppColors.background(d),
        body: SingleChildScrollView(
            child: Column(children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
              child: Column(children: [
                CircleAvatar(
                    radius: 36,
                    backgroundColor: AppColors.accent.withOpacity(0.1),
                    child: Text(
                        (u?.email?.substring(0, 1).toUpperCase() ?? 'G'),
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w300,
                            color: AppColors.accent))),
                const SizedBox(height: 12),
                Text(
                    UserProfile().name.isNotEmpty
                        ? UserProfile().name
                        : (u?.email?.split('@').first ?? 'Guest'),
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.text(d))),
                const SizedBox(height: 4),
                Text(u?.email ?? '',
                    style: TextStyle(
                        color: AppColors.textSecondary(d), fontSize: 12)),
                const SizedBox(height: 10),
                Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        color: ly.tierColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                        border:
                            Border.all(color: ly.tierColor.withOpacity(0.3))),
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      Icon(Icons.workspace_premium_outlined,
                          color: ly.tierColor, size: 14),
                      const SizedBox(width: 5),
                      Text(ly.tier,
                          style: TextStyle(
                              color: ly.tierColor,
                              fontSize: 11,
                              fontWeight: FontWeight.w500))
                    ]))
              ])),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(children: [
                _sc(d, '${ly.points}', l.get('your_points')),
                const SizedBox(width: 10),
                _sc(d, '$bkC', l.get('total_bookings')),
                const SizedBox(width: 10),
                _sc(d, '$favsCount', l.get('saved_rooms'))
              ])),
          const SizedBox(height: 20),

          // 🌿 ECO MODE BUTTON
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap: () => Navigator.push(context,
                  FadeRoute(page: EcoModeScreen(theme: theme, lang: lang))),
              child: Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.green.shade700, Colors.teal.shade600]),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.eco, color: Colors.white, size: 24),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(l.get('eco_mode'),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                          Text(
                            UserProfile().ecoMode.enabled
                                ? '✓ ${l.get('enable_eco')}'
                                : l.get('eco_subtitle'),
                            style: const TextStyle(
                                color: Colors.white70, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.chevron_right, color: Colors.white),
                  ],
                ),
              ),
            ),
          ),

          // 📊 TIER PROGRESS CARD
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.card(d),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: ly.tierColor),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.stars, color: ly.tierColor, size: 24),
                      const SizedBox(width: 8),
                      Text('${ly.tier} ${l.get('tier_progress')}',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.text(d))),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: LinearProgressIndicator(
                      value: ly.tierProgress,
                      backgroundColor: Colors.grey.shade200,
                      valueColor: AlwaysStoppedAnimation<Color>(ly.tierColor),
                      minHeight: 10,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${ly.pointsToNextTier} ${l.get('points_to_next')} ${ly.nextTier}',
                    style: TextStyle(
                        fontSize: 12, color: AppColors.textSecondary(d)),
                  ),
                ],
              ),
            ),
          ),

          // 🏆 ACHIEVEMENTS BUTTON
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  FadeRoute(
                      page: AchievementsScreen(theme: theme, lang: lang))),
              child: Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.orange.shade400,
                    Colors.deepOrange.shade600
                  ]),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.emoji_events,
                        color: Colors.white, size: 24),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(l.get('achievements'),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                          Text(
                            '${ly.achievements.where((a) => a.unlocked).length}/${ly.achievements.length} ${l.get('unlocked')}',
                            style: const TextStyle(
                                color: Colors.white70, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.chevron_right, color: Colors.white),
                  ],
                ),
              ),
            ),
          ),

          Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: AppColors.card(d),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(children: [
                _mi(
                    d,
                    Icons.person_outline,
                    l.get('edit_profile'),
                    () => Navigator.push(
                        context,
                        FadeRoute(
                            page:
                                EditProfileScreen(theme: theme, lang: lang)))),
                _dv(d),
                _mi(
                    d,
                    Icons.card_giftcard_outlined,
                    l.get('coupons'),
                    () => Navigator.push(
                        context,
                        FadeRoute(
                            page: CouponsScreen(theme: theme, lang: lang)))),
                _dv(d),
                _mi(
                    d,
                    Icons.notifications_outlined,
                    l.get('notifications'),
                    () => Navigator.push(
                        context,
                        FadeRoute(
                            page: NotificationsScreen(
                                theme: theme, lang: lang)))),
                _dv(d),
                _mi(
                    d,
                    Icons.language,
                    l.get('language'),
                    () => lang.setLanguage(
                        lang.currentLanguage == 'EN' ? 'TR' : 'EN'),
                    tr: Text(lang.currentLanguage,
                        style:
                            TextStyle(color: AppColors.accent, fontSize: 12))),
                _dv(d),
                _mi(d, Icons.dark_mode_outlined, l.get('dark_mode'),
                    () => theme.toggle(),
                    tr: Switch(
                        value: d,
                        onChanged: (_) => theme.toggle(),
                        activeColor: AppColors.accent)),
                _dv(d),
                _mi(
                    d,
                    Icons.help_outline,
                    l.get('help'),
                    () => Navigator.push(context,
                        FadeRoute(page: HelpScreen(theme: theme, lang: lang)))),
                _dv(d),
                _mi(
                    d,
                    Icons.privacy_tip_outlined,
                    l.get('privacy'),
                    () => Navigator.push(
                        context,
                        FadeRoute(
                            page: PrivacyScreen(theme: theme, lang: lang)))),
              ])),
          const SizedBox(height: 16),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                      onPressed: () async {
                        await AuthService().signOut();
                        if (context.mounted)
                          Navigator.pushAndRemoveUntil(
                              context,
                              FadeRoute(
                                  page:
                                      WelcomeScreen(theme: theme, lang: lang)),
                              (r) => false);
                      },
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.red.shade400),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: Text(l.get('sign_out'),
                          style: TextStyle(
                              color: Colors.red.shade400, fontSize: 13))))),
          Padding(
              padding: const EdgeInsets.all(16),
              child: Text('${l.get('version')} 17.0',
                  style: TextStyle(
                      color: AppColors.textSecondary(d), fontSize: 11))),
          const SizedBox(height: 60),
        ])));
  }

  Widget _sc(bool d, String v, String x) => Expanded(
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
              color: AppColors.card(d),
              borderRadius: BorderRadius.circular(10)),
          child: Column(children: [
            Text(v,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.text(d))),
            const SizedBox(height: 3),
            Text(x,
                style:
                    TextStyle(fontSize: 9, color: AppColors.textSecondary(d)),
                textAlign: TextAlign.center)
          ])));
  Widget _mi(bool d, IconData ic, String t, VoidCallback onTap, {Widget? tr}) =>
      ListTile(
          leading: Icon(ic, color: AppColors.accent, size: 18),
          title:
              Text(t, style: TextStyle(color: AppColors.text(d), fontSize: 13)),
          trailing: tr ??
              Icon(Icons.chevron_right,
                  color: AppColors.textSecondary(d), size: 18),
          onTap: onTap,
          contentPadding: const EdgeInsets.symmetric(horizontal: 14),
          visualDensity: VisualDensity.compact,
          dense: true);
  Widget _dv(bool d) => Divider(
      height: 1,
      indent: 48,
      color: AppColors.textSecondary(d).withOpacity(0.1));
}

class EditProfileScreen extends StatefulWidget {
  final ThemeNotifier theme;
  final LanguageService lang;
  const EditProfileScreen({super.key, required this.theme, required this.lang});
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _nameC, _phoneC;
  @override
  void initState() {
    super.initState();
    _nameC = TextEditingController(text: UserProfile().name);
    _phoneC = TextEditingController(text: UserProfile().phone);
  }

  @override
  Widget build(BuildContext context) {
    final d = widget.theme.isDark;
    final l = widget.lang;
    return Scaffold(
        backgroundColor: AppColors.background(d),
        appBar: AppBar(title: Text(l.get('edit_profile'))),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              TextField(
                  controller: _nameC,
                  style: TextStyle(color: AppColors.text(d)),
                  decoration: InputDecoration(
                      labelText: l.get('name'),
                      prefixIcon:
                          Icon(Icons.person_outlined, color: AppColors.accent),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      filled: true,
                      fillColor: AppColors.card(d))),
              const SizedBox(height: 16),
              TextField(
                  controller: _phoneC,
                  style: TextStyle(color: AppColors.text(d)),
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      labelText: l.get('phone'),
                      prefixIcon:
                          Icon(Icons.phone_outlined, color: AppColors.accent),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      filled: true,
                      fillColor: AppColors.card(d))),
              const Spacer(),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () async {
                        UserProfile().name = _nameC.text;
                        UserProfile().phone = _phoneC.text;
                        await UserProfile().save();
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(l.currentLanguage == 'TR'
                                  ? 'Profil güncellendi!'
                                  : 'Profile updated!'),
                              backgroundColor: Colors.green));
                          Navigator.pop(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.accent,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: Text(l.get('save'),
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w600)))),
            ])));
  }
}

class NotificationsScreen extends StatefulWidget {
  final ThemeNotifier theme;
  final LanguageService lang;
  const NotificationsScreen(
      {super.key, required this.theme, required this.lang});
  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  void initState() {
    super.initState();
    NotificationService().markAllRead();
  }

  @override
  Widget build(BuildContext context) {
    final d = widget.theme.isDark;
    final l = widget.lang;
    final notifs = NotificationService().notifs;
    return Scaffold(
        backgroundColor: AppColors.background(d),
        appBar: AppBar(title: Text(l.get('notifications'))),
        body: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: notifs.length,
            itemBuilder: (c, i) {
              final n = notifs[i];
              return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                      color: AppColors.card(d),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(children: [
                    Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: AppColors.accent.withOpacity(0.1),
                            shape: BoxShape.circle),
                        child: Icon(Icons.notifications_outlined,
                            color: AppColors.accent, size: 20)),
                    const SizedBox(width: 12),
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Text(n.title,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.text(d),
                                  fontSize: 13)),
                          const SizedBox(height: 4),
                          Text(n.body,
                              style: TextStyle(
                                  color: AppColors.textSecondary(d),
                                  fontSize: 12))
                        ]))
                  ]));
            }));
  }
}

class HelpScreen extends StatelessWidget {
  final ThemeNotifier theme;
  final LanguageService lang;
  const HelpScreen({super.key, required this.theme, required this.lang});
  @override
  Widget build(BuildContext context) {
    final d = theme.isDark;
    final l = lang;
    return Scaffold(
        backgroundColor: AppColors.background(d),
        appBar: AppBar(title: Text(l.get('help'))),
        body: ListView(padding: const EdgeInsets.all(16), children: [
          Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: AppColors.card(d),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(children: [
                Text(l.get('contact_us'),
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: AppColors.text(d))),
                const SizedBox(height: 12),
                ListTile(
                    leading: Icon(Icons.phone, color: AppColors.accent),
                    title: Text('+960 123 4567',
                        style:
                            TextStyle(color: AppColors.text(d), fontSize: 13)),
                    onTap: () => UrlLauncherService.call('+960 123 4567')),
                ListTile(
                    leading: Icon(Icons.email, color: AppColors.accent),
                    title: Text('support@onenest.mv',
                        style:
                            TextStyle(color: AppColors.text(d), fontSize: 13)),
                    onTap: () => UrlLauncherService.email('support@onenest.mv'))
              ])),
        ]));
  }
}

class PrivacyScreen extends StatelessWidget {
  final ThemeNotifier theme;
  final LanguageService lang;
  const PrivacyScreen({super.key, required this.theme, required this.lang});
  @override
  Widget build(BuildContext context) {
    final d = theme.isDark;
    final l = lang;
    return Scaffold(
        backgroundColor: AppColors.background(d),
        appBar: AppBar(title: Text(l.get('privacy'))),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Text(
                l.currentLanguage == 'TR'
                    ? 'Gizlilik Politikası\n\nOneNest olarak gizliliğinize önem veriyoruz. Kişisel bilgileriniz güvenli bir şekilde saklanır.'
                    : 'Privacy Policy\n\nAt OneNest, we value your privacy. Your personal information is securely stored.',
                style: TextStyle(
                    color: AppColors.textSecondary(d),
                    fontSize: 13,
                    height: 1.6))));
  }
}

class BookingScreen extends StatefulWidget {
  final Room room;
  final ThemeNotifier theme;
  final LanguageService lang;
  final DateTime? initialCheckIn;
  final DateTime? initialCheckOut;
  const BookingScreen(
      {super.key,
      required this.room,
      required this.theme,
      required this.lang,
      this.initialCheckIn,
      this.initialCheckOut});
  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  late DateTime _in;
  late DateTime _out;
  int _adults = 2, _children = 0;
  String _couponCode = '';
  Coupon? _appliedCoupon;

  @override
  void initState() {
    super.initState();
    _in = widget.initialCheckIn ?? DateTime.now().add(const Duration(days: 1));
    _out =
        widget.initialCheckOut ?? DateTime.now().add(const Duration(days: 3));
  }

  int get _nights => _out.difference(_in).inDays;
  double get _baseTotal => widget.room.price * _nights;
  double get _loyaltyDiscount => _baseTotal * LoyaltyService().discountPercent;
  double get _couponDiscount => _appliedCoupon != null
      ? (_baseTotal - _loyaltyDiscount) * _appliedCoupon!.discount
      : 0;
  double get _total => _baseTotal - _loyaltyDiscount - _couponDiscount;

  void _applyCoupon() {
    final coupon = coupons
        .where((c) => c.code.toUpperCase() == _couponCode.toUpperCase())
        .firstOrNull;
    setState(() {
      if (coupon != null) {
        _appliedCoupon = coupon;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('${coupon.desc} applied! 🎉'),
            backgroundColor: Colors.green));
      } else {
        _appliedCoupon = null;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Invalid coupon code'), backgroundColor: Colors.red));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final d = widget.theme.isDark;
    final l = widget.lang;
    final protectionData = BookingProtectionService().getProtectionData(
        widget.room.id, widget.room.available, widget.room.price);

    return Scaffold(
        backgroundColor: AppColors.background(d),
        appBar: AppBar(title: Text(l.get('book_now'))),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: AppColors.card(d),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(widget.room.image,
                            width: 60, height: 60, fit: BoxFit.cover)),
                    const SizedBox(width: 12),
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Text(widget.room.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                  color: AppColors.text(d))),
                          Row(children: [
                            Icon(Icons.star, color: AppColors.accent, size: 12),
                            Text(' ${widget.room.rating}',
                                style: TextStyle(
                                    color: AppColors.textSecondary(d),
                                    fontSize: 11))
                          ])
                        ]))
                  ])),

              // Smart Booking Protection - DÜRÜST & ŞEFFAFif (protectionData['showWarning'] || protectionData['views24h'] > 5)
              Container(
                margin: const EdgeInsets.only(top: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: protectionData['riskLevel'] == 'high'
                        ? [Colors.orange.shade50, Colors.red.shade50]
                        : protectionData['riskLevel'] == 'medium'
                            ? [Colors.blue.shade50, Colors.cyan.shade50]
                            : [Colors.green.shade50, Colors.teal.shade50],
                  ),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: protectionData['riskLevel'] == 'high'
                        ? Colors.orange.shade200
                        : protectionData['riskLevel'] == 'medium'
                            ? Colors.blue.shade200
                            : Colors.green.shade200,
                    width: 1.5,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: protectionData['riskLevel'] == 'high'
                                ? Colors.orange.withOpacity(0.2)
                                : protectionData['riskLevel'] == 'medium'
                                    ? Colors.blue.withOpacity(0.2)
                                    : Colors.green.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.insights,
                            color: protectionData['riskLevel'] == 'high'
                                ? Colors.orange.shade700
                                : protectionData['riskLevel'] == 'medium'
                                    ? Colors.blue.shade700
                                    : Colors.green.shade700,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                l.get('smart_booking'),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: protectionData['riskLevel'] == 'high'
                                      ? Colors.orange.shade900
                                      : protectionData['riskLevel'] == 'medium'
                                          ? Colors.blue.shade900
                                          : Colors.green.shade900,
                                ),
                              ),
                              Text(
                                l.get('based_on_data'),
                                style: TextStyle(
                                  fontSize: 10,
                                  color: AppColors.textSecondary(d),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Real Data Points
                    _buildDataPoint(
                      Icons.visibility_outlined,
                      '${protectionData['views24h']} ${l.get('views_24h')}',
                      protectionData['views24h'] > 15
                          ? Colors.orange.shade700
                          : Colors.blue.shade700,
                      d,
                    ),
                    const SizedBox(height: 8),
                    _buildDataPoint(
                      Icons.meeting_room_outlined,
                      '${widget.room.available} ${l.get('rooms_left')}',
                      widget.room.available <= 2
                          ? Colors.red.shade700
                          : Colors.green.shade700,
                      d,
                    ),
                    const SizedBox(height: 8),
                    _buildDataPoint(
                      Icons.trending_up_outlined,
                      protectionData['riskMessage'],
                      protectionData['riskLevel'] == 'high'
                          ? Colors.orange.shade700
                          : Colors.blue.shade700,
                      d,
                    ),
                    const SizedBox(height: 8),
                    _buildDataPoint(
                      Icons.psychology_outlined,
                      '${protectionData['probability']}% ${l.get('booking_chance')}',
                      protectionData['probability'] > 60
                          ? Colors.orange.shade700
                          : Colors.blue.shade700,
                      d,
                    ),

                    // Honest disclaimer
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.verified_outlined,
                            size: 14,
                            color: Colors.green.shade700,
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              l.currentLanguage == 'TR'
                                  ? 'Gerçek veriye dayalı tahminler - asla sahte geri sayım yok'
                                  : 'Real data-based predictions - never fake countdowns',
                              style: TextStyle(
                                fontSize: 9,
                                color: Colors.green.shade700,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              Text('Check-in / Check-out',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: AppColors.text(d))),
              const SizedBox(height: 10),
              Row(children: [
                Expanded(
                    child: _dt('Check-in', _in, d, () async {
                  final x = await showDatePicker(
                      context: context,
                      initialDate: _in,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 365)));
                  if (x != null) setState(() => _in = x);
                })),
                const SizedBox(width: 10),
                Expanded(
                    child: _dt('Check-out', _out, d, () async {
                  final x = await showDatePicker(
                      context: context,
                      initialDate: _out,
                      firstDate: _in.add(const Duration(days: 1)),
                      lastDate: DateTime.now().add(const Duration(days: 365)));
                  if (x != null) setState(() => _out = x);
                }))
              ]),
              const SizedBox(height: 20),
              Text(l.get('guests'),
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: AppColors.text(d))),
              const SizedBox(height: 10),
              Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                      color: AppColors.card(d),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(l.get('adults'),
                              style: TextStyle(
                                  color: AppColors.text(d), fontSize: 13)),
                          Row(children: [
                            IconButton(
                                onPressed: _adults > 1
                                    ? () => setState(() => _adults--)
                                    : null,
                                icon: Icon(Icons.remove_circle_outline,
                                    color: _adults > 1
                                        ? AppColors.accent
                                        : AppColors.textSecondary(d))),
                            Text('$_adults',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.text(d))),
                            IconButton(
                                onPressed: _adults < 6
                                    ? () => setState(() => _adults++)
                                    : null,
                                icon: Icon(Icons.add_circle_outline,
                                    color: _adults < 6
                                        ? AppColors.accent
                                        : AppColors.textSecondary(d)))
                          ])
                        ]),
                    const Divider(),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(l.get('children'),
                              style: TextStyle(
                                  color: AppColors.text(d), fontSize: 13)),
                          Row(children: [
                            IconButton(
                                onPressed: _children > 0
                                    ? () => setState(() => _children--)
                                    : null,
                                icon: Icon(Icons.remove_circle_outline,
                                    color: _children > 0
                                        ? AppColors.accent
                                        : AppColors.textSecondary(d))),
                            Text('$_children',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.text(d))),
                            IconButton(
                                onPressed: _children < 4
                                    ? () => setState(() => _children++)
                                    : null,
                                icon: Icon(Icons.add_circle_outline,
                                    color: _children < 4
                                        ? AppColors.accent
                                        : AppColors.textSecondary(d)))
                          ])
                        ])
                  ])),
              const SizedBox(height: 20),
              Text(l.get('coupon'),
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: AppColors.text(d))),
              const SizedBox(height: 10),
              Row(children: [
                Expanded(
                    child: TextField(
                        onChanged: (v) => _couponCode = v,
                        style:
                            TextStyle(color: AppColors.text(d), fontSize: 13),
                        decoration: InputDecoration(
                            hintText: 'WELCOME10',
                            hintStyle:
                                TextStyle(color: AppColors.textSecondary(d)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none),
                            filled: true,
                            fillColor: AppColors.card(d),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 12)))),
                const SizedBox(width: 10),
                ElevatedButton(
                    onPressed: _applyCoupon,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.accent,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: Text(l.get('apply'),
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w600)))
              ]),
              if (_appliedCoupon != null)
                Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(children: [
                      Icon(Icons.check_circle, color: Colors.green, size: 16),
                      const SizedBox(width: 6),
                      Text('${_appliedCoupon!.code} - ${_appliedCoupon!.desc}',
                          style: const TextStyle(
                              color: Colors.green, fontSize: 12))
                    ])),
              const SizedBox(height: 20),
              Text(l.get('summary'),
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: AppColors.text(d))),
              const SizedBox(height: 10),
              Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                      color: AppColors.card(d),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(children: [
                    _pr('$_nights nights × \$${widget.room.price.toInt()}',
                        '\$${_baseTotal.toInt()}', d),
                    if (LoyaltyService().discountPercent > 0) ...[
                      const SizedBox(height: 6),
                      _pr('${LoyaltyService().tier} Discount',
                          '-\$${_loyaltyDiscount.toInt()}', d,
                          disc: true)
                    ],
                    if (_appliedCoupon != null) ...[
                      const SizedBox(height: 6),
                      _pr('Coupon (${_appliedCoupon!.desc})',
                          '-\$${_couponDiscount.toInt()}', d,
                          disc: true)
                    ],
                    const SizedBox(height: 6),
                    _pr('${l.get('guests')}', '$_adults + $_children', d),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Divider(
                            color:
                                AppColors.textSecondary(d).withOpacity(0.2))),
                    _pr('Total', '\$${_total.toInt()}', d, total: true),
                  ])),
              const SizedBox(height: 24),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => Navigator.push(
                          context,
                          FadeRoute(
                              page: PaymentScreen(
                                  room: widget.room,
                                  theme: widget.theme,
                                  lang: widget.lang,
                                  checkIn: _in,
                                  checkOut: _out,
                                  adults: _adults,
                                  children: _children,
                                  total: _total))),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.accent,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 0),
                      child: Text(l.get('payment'),
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w600)))),
            ])));
  }

  Widget _dt(String x, DateTime dt, bool d, VoidCallback onTap) =>
      GestureDetector(
          onTap: onTap,
          child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: AppColors.card(d),
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(x,
                        style: TextStyle(
                            color: AppColors.textSecondary(d), fontSize: 11)),
                    const SizedBox(height: 3),
                    Text('${dt.day}/${dt.month}/${dt.year}',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: AppColors.text(d)))
                  ])));
  Widget _pr(String x, String v, bool d,
          {bool total = false, bool disc = false}) =>
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(x,
            style: TextStyle(
                color: disc ? Colors.green : AppColors.text(d),
                fontWeight: total ? FontWeight.w600 : FontWeight.normal,
                fontSize: total ? 15 : 13)),
        Text(v,
            style: TextStyle(
                color: disc
                    ? Colors.green
                    : (total ? AppColors.accent : AppColors.text(d)),
                fontWeight: total ? FontWeight.w600 : FontWeight.normal,
                fontSize: total ? 15 : 13))
      ]);

  Widget _buildDataPoint(IconData icon, String text, Color color, bool d) {
    return Row(
      children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class PaymentScreen extends StatefulWidget {
  final Room room;
  final ThemeNotifier theme;
  final LanguageService lang;
  final DateTime checkIn, checkOut;
  final int adults, children;
  final double total;
  const PaymentScreen(
      {super.key,
      required this.room,
      required this.theme,
      required this.lang,
      required this.checkIn,
      required this.checkOut,
      required this.adults,
      required this.children,
      required this.total});
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _cardC = TextEditingController();
  final _expC = TextEditingController();
  final _cvvC = TextEditingController();
  final _nameC = TextEditingController();

  // Deposit calculation (20% of total or $100 minimum)
  double get _deposit => widget.total * 0.20 < 100 ? 100 : widget.total * 0.20;
  double get _totalWithDeposit => widget.total + _deposit;

  @override
  Widget build(BuildContext context) {
    final d = widget.theme.isDark;
    final l = widget.lang;
    return Scaffold(
        backgroundColor: AppColors.background(d),
        appBar: AppBar(title: Text(l.get('payment'))),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border:
                          Border.all(color: Colors.orange.withOpacity(0.3))),
                  child: Row(children: [
                    Icon(Icons.warning_amber_outlined,
                        color: Colors.orange, size: 20),
                    const SizedBox(width: 10),
                    Expanded(
                        child: Text(l.get('cancel_warning'),
                            style: TextStyle(
                                color: Colors.orange.shade800, fontSize: 11)))
                  ])),
              const SizedBox(height: 20),
              Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                      color: AppColors.card(d),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(l.get('summary'),
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColors.text(d))),
                        const SizedBox(height: 12),
                        Row(children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.network(widget.room.image,
                                  width: 50, height: 50, fit: BoxFit.cover)),
                          const SizedBox(width: 12),
                          Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                Text(widget.room.name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13,
                                        color: AppColors.text(d))),
                                Text(
                                    '${widget.checkIn.day}/${widget.checkIn.month} - ${widget.checkOut.day}/${widget.checkOut.month}',
                                    style: TextStyle(
                                        color: AppColors.textSecondary(d),
                                        fontSize: 11))
                              ]))
                        ]),
                        const SizedBox(height: 12),
                        Divider(
                            color: AppColors.textSecondary(d).withOpacity(0.2)),
                        const SizedBox(height: 8),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(l.get('subtotal'),
                                  style: TextStyle(
                                      color: AppColors.textSecondary(d),
                                      fontSize: 13)),
                              Text('\$${widget.total.toInt()}',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.text(d)))
                            ]),
                        const SizedBox(height: 8),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(l.get('deposit'),
                                        style: TextStyle(
                                            color: AppColors.textSecondary(d),
                                            fontSize: 13)),
                                    Text(l.get('deposit_desc'),
                                        style: TextStyle(
                                            color: AppColors.textSecondary(d),
                                            fontSize: 10)),
                                  ]),
                              Text('\$${_deposit.toInt()}',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.text(d))),
                            ]),
                        const SizedBox(height: 8),
                        Divider(
                            color: AppColors.textSecondary(d).withOpacity(0.2)),
                        const SizedBox(height: 8),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  '${widget.adults} ${l.get('adults')}, ${widget.children} ${l.get('children')}',
                                  style: TextStyle(
                                      color: AppColors.textSecondary(d),
                                      fontSize: 12)),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(l.get('total_cost'),
                                        style: TextStyle(
                                            color: AppColors.textSecondary(d),
                                            fontSize: 11)),
                                    Text('\$${_totalWithDeposit.toInt()}',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.accent))
                                  ])
                            ]),
                      ])),
              const SizedBox(height: 24),
              Text(l.get('card_holder'),
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: AppColors.text(d))),
              const SizedBox(height: 8),
              TextField(
                  controller: _nameC,
                  style: TextStyle(color: AppColors.text(d)),
                  textCapitalization: TextCapitalization.characters,
                  decoration: InputDecoration(
                      hintText: 'JOHN DOE',
                      hintStyle: TextStyle(color: AppColors.textSecondary(d)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor: AppColors.card(d),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 14))),
              const SizedBox(height: 16),
              Text(l.get('card_number'),
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: AppColors.text(d))),
              const SizedBox(height: 8),
              TextField(
                  controller: _cardC,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CardNumberFormatter()
                  ],
                  style: TextStyle(color: AppColors.text(d), letterSpacing: 2),
                  decoration: InputDecoration(
                      hintText: '4242 4242 4242 4242',
                      hintStyle: TextStyle(color: AppColors.textSecondary(d)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor: AppColors.card(d),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 14),
                      prefixIcon:
                          Icon(Icons.credit_card, color: AppColors.accent))),
              const SizedBox(height: 16),
              Row(children: [
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text(l.get('expiry'),
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: AppColors.text(d))),
                      const SizedBox(height: 8),
                      TextField(
                          controller: _expC,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            ExpiryDateFormatter()
                          ],
                          style: TextStyle(color: AppColors.text(d)),
                          decoration: InputDecoration(
                              hintText: 'MM/YY',
                              hintStyle:
                                  TextStyle(color: AppColors.textSecondary(d)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none),
                              filled: true,
                              fillColor: AppColors.card(d),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 14)))
                    ])),
                const SizedBox(width: 16),
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text(l.get('cvv'),
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: AppColors.text(d))),
                      const SizedBox(height: 8),
                      TextField(
                          controller: _cvvC,
                          obscureText: true,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(3)
                          ],
                          style: TextStyle(color: AppColors.text(d)),
                          decoration: InputDecoration(
                              hintText: '123',
                              hintStyle:
                                  TextStyle(color: AppColors.textSecondary(d)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none),
                              filled: true,
                              fillColor: AppColors.card(d),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 14)))
                    ])),
              ]),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blue.withOpacity(0.3)),
                ),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, color: Colors.blue, size: 18),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        l.currentLanguage == 'TR'
                            ? 'Depozito check-out sırasında iade edilecektir'
                            : 'Deposit will be refunded at check-out',
                        style: TextStyle(
                            color: Colors.blue.shade800, fontSize: 11),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    // Sadece DEPOSIT ödeniyor, total değil!
                    final booking = Booking(
                      id: DateTime.now().millisecondsSinceEpoch.toString(),
                      roomId: widget.room.id,
                      roomName: widget.room.name,
                      roomImage: widget.room.image,
                      checkIn: widget.checkIn,
                      checkOut: widget.checkOut,
                      totalPrice: _deposit, // SADECE DEPOSIT
                      status: 'Confirmed',
                      adults: widget.adults,
                      children: widget.children,
                    );

                    await BookingService().addBooking(booking);

                    if (mounted) {
                      final remainingAmount = widget.total - _deposit;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            l.currentLanguage == 'TR'
                                ? '✅ Depozito ödendi! Kalan \$${remainingAmount.toInt()} otelde ödenecek.'
                                : '✅ Deposit paid! Remaining \$${remainingAmount.toInt()} at hotel.',
                          ),
                          backgroundColor: Colors.green,
                          duration: const Duration(seconds: 4),
                        ),
                      );
                      Navigator.popUntil(context, (r) => r.isFirst);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accent,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    elevation: 0,
                  ),
                  child: Column(
                    children: [
                      Text(
                        '${l.get('pay_deposit')}: \$${_deposit.toInt()}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${l.get('remaining_at_hotel')}: \$${(widget.total - _deposit).toInt()}',
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                Icon(Icons.lock_outline,
                    size: 14, color: AppColors.textSecondary(d)),
                const SizedBox(width: 6),
                Text(
                    l.currentLanguage == 'TR'
                        ? 'Güvenli ödeme'
                        : 'Secure payment',
                    style: TextStyle(
                        color: AppColors.textSecondary(d), fontSize: 12))
              ])),
            ])));
  }
}

class CouponsScreen extends StatelessWidget {
  final ThemeNotifier theme;
  final LanguageService lang;
  const CouponsScreen({super.key, required this.theme, required this.lang});

  @override
  Widget build(BuildContext context) {
    final d = theme.isDark;
    final l = lang;

    return Scaffold(
      backgroundColor: AppColors.background(d),
      appBar: AppBar(
        title: Text(l.get('coupons')),
        backgroundColor: AppColors.background(d),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.accent.withOpacity(0.2),
                    AppColors.accent.withOpacity(0.05)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.accent.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.accent.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.card_giftcard,
                        color: AppColors.accent, size: 28),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l.get('available_coupons'),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.text(d),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          l.get('use_code'),
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary(d),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: coupons
                    .map((coupon) => _buildCouponCard(context, coupon, d, l))
                    .toList(),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildCouponCard(
      BuildContext context, Coupon coupon, bool d, LanguageService l) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.card(d),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.accent.withOpacity(0.2)),
      ),
      child: Stack(
        children: [
          // Decorative pattern
          Positioned(
            right: -20,
            top: -20,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: AppColors.accent.withOpacity(0.05),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Discount badge
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.accent,
                        AppColors.accent.withOpacity(0.7)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${(coupon.discount * 100).toInt()}%',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const Text(
                        'OFF',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                // Coupon details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        coupon.code,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppColors.text(d),
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        coupon.desc,
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.textSecondary(d),
                        ),
                      ),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: () {
                          Clipboard.setData(ClipboardData(text: coupon.code));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(l.get('code_copied')),
                              backgroundColor: Colors.green,
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppColors.accent.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                color: AppColors.accent.withOpacity(0.3)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.copy,
                                  size: 14, color: AppColors.accent),
                              const SizedBox(width: 6),
                              Text(
                                l.get('copy_code'),
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.accent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// AI Vacation Planner Screen
class AIVacationPlannerScreen extends StatefulWidget {
  final ThemeNotifier theme;
  final LanguageService lang;
  const AIVacationPlannerScreen(
      {super.key, required this.theme, required this.lang});
  @override
  State<AIVacationPlannerScreen> createState() =>
      _AIVacationPlannerScreenState();
}

class _AIVacationPlannerScreenState extends State<AIVacationPlannerScreen> {
  int _currentStep = 0;
  int _days = 3;
  String _travelWith = 'couple';
  String _purpose = 'relaxation';
  String _budget = 'moderate';
  List<String> _specialRequests = [];

  @override
  Widget build(BuildContext context) {
    final d = widget.theme.isDark;
    final l = widget.lang;

    return Scaffold(
      backgroundColor: AppColors.background(d),
      appBar: AppBar(
        title: Text(l.get('ai_planner')),
        backgroundColor: AppColors.background(d),
      ),
      body: Column(
        children: [
          // Progress indicator
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: List.generate(5, (index) {
                return Expanded(
                  child: Container(
                    height: 4,
                    margin: EdgeInsets.only(right: index < 4 ? 8 : 0),
                    decoration: BoxDecoration(
                      color: index <= _currentStep
                          ? AppColors.accent
                          : AppColors.textSecondary(d).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                );
              }),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: _buildStep(d, l),
            ),
          ),

          // Navigation buttons
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.card(d),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -5))
              ],
            ),
            child: Row(
              children: [
                if (_currentStep > 0)
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => setState(() => _currentStep--),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: BorderSide(color: AppColors.accent),
                      ),
                      child: Text(l.get('previous')),
                    ),
                  ),
                if (_currentStep > 0) const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_currentStep < 4) {
                        setState(() => _currentStep++);
                      } else {
                        _generatePlan();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accent,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                        _currentStep < 4 ? l.get('next') : l.get('get_plan')),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStep(bool d, LanguageService l) {
    switch (_currentStep) {
      case 0:
        return _buildDaysStep(d, l);
      case 1:
        return _buildTravelWithStep(d, l);
      case 2:
        return _buildPurposeStep(d, l);
      case 3:
        return _buildBudgetStep(d, l);
      case 4:
        return _buildSpecialRequestsStep(d, l);
      default:
        return Container();
    }
  }

  Widget _buildDaysStep(bool d, LanguageService l) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l.get('how_many_days'),
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: AppColors.text(d)),
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: _days > 1 ? () => setState(() => _days--) : null,
              icon: const Icon(Icons.remove_circle_outline),
              iconSize: 40,
              color: AppColors.accent,
            ),
            const SizedBox(width: 30),
            Text(
              '$_days',
              style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: AppColors.accent),
            ),
            const SizedBox(width: 30),
            IconButton(
              onPressed: _days < 30 ? () => setState(() => _days++) : null,
              icon: const Icon(Icons.add_circle_outline),
              iconSize: 40,
              color: AppColors.accent,
            ),
          ],
        ),
        Center(
          child: Text(
            l.get('days'),
            style: TextStyle(fontSize: 16, color: AppColors.textSecondary(d)),
          ),
        ),
      ],
    );
  }

  Widget _buildTravelWithStep(bool d, LanguageService l) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l.get('traveling_with'),
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: AppColors.text(d)),
        ),
        const SizedBox(height: 20),
        _buildOption('couple', Icons.favorite_outline, l.get('couple'), d),
        _buildOption('family', Icons.family_restroom, l.get('family'), d),
        _buildOption('solo', Icons.person_outline, l.get('solo'), d),
        _buildOption('friends', Icons.groups_outlined, l.get('friends'), d),
      ],
    );
  }

  Widget _buildPurposeStep(bool d, LanguageService l) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l.get('purpose'),
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: AppColors.text(d)),
        ),
        const SizedBox(height: 20),
        _buildOption('relaxation', Icons.spa_outlined, l.get('relaxation'), d,
            isPurpose: true),
        _buildOption(
            'honeymoon', Icons.celebration_outlined, l.get('honeymoon'), d,
            isPurpose: true),
        _buildOption('adventure', Icons.hiking_outlined, l.get('adventure'), d,
            isPurpose: true),
        _buildOption(
            'business', Icons.business_center_outlined, l.get('business'), d,
            isPurpose: true),
      ],
    );
  }

  Widget _buildBudgetStep(bool d, LanguageService l) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l.get('budget'),
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: AppColors.text(d)),
        ),
        const SizedBox(height: 20),
        _buildOption('luxury', Icons.diamond_outlined, l.get('luxury'), d,
            isBudget: true),
        _buildOption('moderate', Icons.stars_outlined, l.get('moderate'), d,
            isBudget: true),
        _buildOption('budget_friendly', Icons.savings_outlined,
            l.get('budget_friendly'), d,
            isBudget: true),
      ],
    );
  }

  Widget _buildSpecialRequestsStep(bool d, LanguageService l) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l.get('special_requests'),
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: AppColors.text(d)),
        ),
        const SizedBox(height: 8),
        Text(
          l.currentLanguage == 'TR'
              ? 'Birden fazla seçebilirsiniz'
              : 'Select multiple options',
          style: TextStyle(fontSize: 14, color: AppColors.textSecondary(d)),
        ),
        const SizedBox(height: 20),
        _buildMultiOption(
            'quiet', Icons.volume_off_outlined, l.get('quiet'), d),
        _buildMultiOption(
            'ocean_view', Icons.waves_outlined, l.get('ocean_view'), d),
        _buildMultiOption('family_friendly', Icons.child_care_outlined,
            l.get('family_friendly'), d),
        _buildMultiOption(
            'spa_access', Icons.hot_tub_outlined, l.get('spa_access'), d),
      ],
    );
  }

  Widget _buildOption(String value, IconData icon, String label, bool d,
      {bool isPurpose = false, bool isBudget = false}) {
    final isSelected = isPurpose
        ? _purpose == value
        : (isBudget ? _budget == value : _travelWith == value);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isPurpose) {
            _purpose = value;
          } else if (isBudget) {
            _budget = value;
          } else {
            _travelWith = value;
          }
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.accent.withOpacity(0.1)
              : AppColors.card(d),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? AppColors.accent
                : AppColors.textSecondary(d).withOpacity(0.2),
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.accent
                    : AppColors.textSecondary(d).withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon,
                  color: isSelected ? Colors.black : AppColors.textSecondary(d),
                  size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  color: AppColors.text(d),
                ),
              ),
            ),
            if (isSelected)
              Icon(Icons.check_circle, color: AppColors.accent, size: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildMultiOption(String value, IconData icon, String label, bool d) {
    final isSelected = _specialRequests.contains(value);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            _specialRequests.remove(value);
          } else {
            _specialRequests.add(value);
          }
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.accent.withOpacity(0.1)
              : AppColors.card(d),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? AppColors.accent
                : AppColors.textSecondary(d).withOpacity(0.2),
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.accent
                    : AppColors.textSecondary(d).withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon,
                  color: isSelected ? Colors.black : AppColors.textSecondary(d),
                  size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  color: AppColors.text(d),
                ),
              ),
            ),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.accent : Colors.transparent,
                border: Border.all(
                    color: isSelected
                        ? AppColors.accent
                        : AppColors.textSecondary(d)),
                borderRadius: BorderRadius.circular(6),
              ),
              child: isSelected
                  ? const Icon(Icons.check, color: Colors.black, size: 16)
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  void _generatePlan() {
    final plan = VacationPlannerService.createPlan(
      days: _days,
      travelWith: _travelWith,
      purpose: _purpose,
      budget: _budget,
      specialRequests: _specialRequests,
    );

    Navigator.push(
      context,
      FadeRoute(
        page: VacationPlanResultScreen(
          plan: plan,
          theme: widget.theme,
          lang: widget.lang,
        ),
      ),
    );
  }
}

// Vacation Plan Result Screen
class VacationPlanResultScreen extends StatelessWidget {
  final VacationPlan plan;
  final ThemeNotifier theme;
  final LanguageService lang;

  const VacationPlanResultScreen({
    super.key,
    required this.plan,
    required this.theme,
    required this.lang,
  });

  @override
  Widget build(BuildContext context) {
    final d = theme.isDark;
    final l = lang;

    return Scaffold(
      backgroundColor: AppColors.background(d),
      appBar: AppBar(
        title: Text(l.get('your_plan')),
        backgroundColor: AppColors.background(d),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Success animation
            Container(
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.accent.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.check_circle_outline,
                        size: 80, color: AppColors.accent),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    l.currentLanguage == 'TR'
                        ? 'Planınız Hazır!'
                        : 'Your Plan is Ready!',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: AppColors.text(d)),
                  ),
                ],
              ),
            ),

            // Room card
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: AppColors.card(d),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1), blurRadius: 10)
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(16)),
                    child: Image.network(plan.room.image,
                        height: 200, width: double.infinity, fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l.get('recommended_room'),
                          style: TextStyle(
                              fontSize: 12,
                              color: AppColors.accent,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          plan.room.name,
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: AppColors.text(d)),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Icon(Icons.star, color: AppColors.accent, size: 16),
                            const SizedBox(width: 4),
                            Text('${plan.room.rating}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.text(d))),
                            const SizedBox(width: 16),
                            Icon(Icons.king_bed_outlined,
                                size: 16, color: AppColors.textSecondary(d)),
                            const SizedBox(width: 4),
                            Text(plan.room.bedType,
                                style: TextStyle(
                                    color: AppColors.textSecondary(d),
                                    fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Pricing breakdown
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.card(d),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  _priceRow(
                      '\$${plan.room.price.toInt()} × ${plan.days} ${l.get('days')}',
                      '\$${plan.originalPrice.toInt()}',
                      d,
                      false),
                  if (plan.appliedCoupon != null) ...[
                    const SizedBox(height: 8),
                    _priceRow(
                        '${plan.appliedCoupon!.code} (${plan.appliedCoupon!.desc})',
                        '-\$${(plan.originalPrice * plan.appliedCoupon!.discount).toInt()}',
                        d,
                        true),
                  ],
                  if (LoyaltyService().discountPercent > 0) ...[
                    const SizedBox(height: 8),
                    _priceRow(
                        '${LoyaltyService().tier} Discount',
                        '-\$${(plan.originalPrice * LoyaltyService().discountPercent).toInt()}',
                        d,
                        true),
                  ],
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Divider(
                        color: AppColors.textSecondary(d).withOpacity(0.2)),
                  ),
                  _priceRow(l.get('total_cost'), '\$${plan.finalPrice.toInt()}',
                      d, false,
                      isTotal: true),
                ],
              ),
            ),

            // Savings badge
            if (plan.savings > 0)
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.green.shade400, Colors.green.shade600],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.celebration_outlined,
                        color: Colors.white, size: 24),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l.get('you_save'),
                          style: const TextStyle(
                              color: Colors.white70, fontSize: 12),
                        ),
                        Text(
                          '\$${plan.savings.toInt()} (${plan.savingsPercent.toInt()}%)',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

            // Why this room
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.card(d),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.lightbulb_outline,
                          color: AppColors.accent, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        l.get('why_this'),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.text(d)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    plan.reason,
                    style: TextStyle(
                        color: AppColors.textSecondary(d),
                        fontSize: 14,
                        height: 1.5),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Book button
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      FadeRoute(
                        page: BookingScreen(
                          room: plan.room,
                          theme: theme,
                          lang: lang,
                          initialCheckIn:
                              DateTime.now().add(const Duration(days: 7)),
                          initialCheckOut:
                              DateTime.now().add(Duration(days: 7 + plan.days)),
                        ),
                      ),
                      (route) => route.isFirst,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accent,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Text(
                    l.get('book_this_plan'),
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _priceRow(String label, String value, bool d, bool isDiscount,
      {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: isDiscount ? Colors.green : AppColors.text(d),
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: isDiscount
                ? Colors.green
                : (isTotal ? AppColors.accent : AppColors.text(d)),
            fontSize: isTotal ? 20 : 14,
            fontWeight: isTotal ? FontWeight.w700 : FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

// 🌿 ECO MODE SCREEN
class EcoModeScreen extends StatefulWidget {
  final ThemeNotifier theme;
  final LanguageService lang;
  const EcoModeScreen({super.key, required this.theme, required this.lang});
  @override
  State<EcoModeScreen> createState() => _EcoModeScreenState();
}

class _EcoModeScreenState extends State<EcoModeScreen> {
  @override
  Widget build(BuildContext context) {
    final d = widget.theme.isDark;
    final l = widget.lang;
    final eco = UserProfile().ecoMode;

    return Scaffold(
      backgroundColor: AppColors.background(d),
      appBar: AppBar(
        title: Text(l.get('eco_mode')),
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green.shade700, Colors.teal.shade600],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Icon(Icons.eco, size: 60, color: Colors.white),
                  const SizedBox(height: 16),
                  Text(l.get('eco_title'),
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  const SizedBox(height: 8),
                  Text(l.get('eco_subtitle'),
                      style:
                          const TextStyle(fontSize: 14, color: Colors.white70),
                      textAlign: TextAlign.center),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: AppColors.card(d),
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  SwitchListTile(
                    title: Text(l.get('skip_cleaning'),
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.text(d))),
                    subtitle: Text('${l.get('co2_saved')}: 3kg/day',
                        style: TextStyle(
                            fontSize: 12, color: AppColors.textSecondary(d))),
                    value: eco.enabled,
                    activeColor: Colors.green,
                    onChanged: (val) async {
                      setState(() {
                        eco.enabled = val;
                        if (val) {
                          eco.bonusPoints = 200;
                          eco.totalSavings += 3;
                          LoyaltyService().addPoints(200);
                        }
                      });
                      await UserProfile().save();
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.water_drop, color: Colors.blue),
                    title: Text(l.get('reuse_towels'),
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.text(d))),
                    subtitle: Text('${l.get('water_saved')}: 40L/day',
                        style: TextStyle(
                            fontSize: 12, color: AppColors.textSecondary(d))),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            if (eco.enabled) ...[
              Text(l.get('your_impact'),
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.text(d))),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.green.shade200)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _impactStat(Icons.eco, '${eco.totalSavings}kg',
                            l.get('co2_saved'), Colors.green),
                        _impactStat(
                            Icons.water_drop,
                            '${eco.totalSavings * 8}L',
                            l.get('water_saved'),
                            Colors.blue),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Divider(color: Colors.green.shade200),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.stars, color: Colors.orange, size: 24),
                        const SizedBox(width: 8),
                        Text('+${eco.bonusPoints} ${l.get('eco_bonus')}',
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _impactStat(IconData icon, String value, String label, Color color) {
    return Column(
      children: [
        Icon(icon, size: 40, color: color),
        const SizedBox(height: 8),
        Text(value,
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: color)),
        Text(label,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade700)),
      ],
    );
  }
}

// 🏆 ACHIEVEMENTS SCREEN
class AchievementsScreen extends StatelessWidget {
  final ThemeNotifier theme;
  final LanguageService lang;
  const AchievementsScreen(
      {super.key, required this.theme, required this.lang});

  @override
  Widget build(BuildContext context) {
    final d = theme.isDark;
    final l = lang;
    final achievements = LoyaltyService().achievements;
    final points = LoyaltyService().points;

    return Scaffold(
      backgroundColor: AppColors.background(d),
      appBar: AppBar(
          title: Text(l.get('achievements')),
          backgroundColor: AppColors.accent,
          foregroundColor: Colors.black),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: achievements.length,
        itemBuilder: (context, index) {
          final achievement = achievements[index];
          final isUnlocked = achievement.unlocked;
          final progress = isUnlocked
              ? 1.0
              : (points / achievement.requiredPoints).clamp(0.0, 1.0);

          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.card(d),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                  color: isUnlocked ? AppColors.accent : Colors.grey.shade300,
                  width: 2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isUnlocked
                            ? AppColors.accent.withOpacity(0.2)
                            : Colors.grey.shade200,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(achievement.icon,
                          size: 32,
                          color: isUnlocked ? AppColors.accent : Colors.grey),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l.currentLanguage == 'TR'
                                ? achievement.nameTr
                                : achievement.name,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.text(d)),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            l.currentLanguage == 'TR'
                                ? achievement.descriptionTr
                                : achievement.description,
                            style: TextStyle(
                                fontSize: 12,
                                color: AppColors.textSecondary(d)),
                          ),
                        ],
                      ),
                    ),
                    if (isUnlocked)
                      const Icon(Icons.check_circle,
                          color: Colors.green, size: 28),
                  ],
                ),
                const SizedBox(height: 12),
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey.shade200,
                  valueColor: AlwaysStoppedAnimation<Color>(
                      isUnlocked ? Colors.green : AppColors.accent),
                  minHeight: 8,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      isUnlocked
                          ? l.get('unlocked')
                          : '${l.get('progress')}: ${(progress * 100).toInt()}%',
                      style: TextStyle(
                          fontSize: 11,
                          color: AppColors.textSecondary(d),
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: isUnlocked
                            ? Colors.green.shade100
                            : Colors.orange.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '${l.get('reward')}: ${l.currentLanguage == 'TR' ? achievement.rewardTr : achievement.reward}',
                        style: TextStyle(
                            fontSize: 10,
                            color: isUnlocked
                                ? Colors.green.shade900
                                : Colors.orange.shade900,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class FadeRoute extends PageRouteBuilder {
  final Widget page;
  FadeRoute({required this.page})
      : super(
            pageBuilder: (c, a, s) => page,
            transitionsBuilder: (c, a, s, ch) =>
                FadeTransition(opacity: a, child: ch),
            transitionDuration: const Duration(milliseconds: 200));
}
