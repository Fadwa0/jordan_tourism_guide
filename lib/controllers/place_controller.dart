import '../models/place_model.dart';
import '../models/category_model.dart';

class PlaceController {
  final List<CategoryModel> categories = [
    CategoryModel(
      title: 'Historical',
      description: 'Ancient ruins and historical monuments from thousands of years ago.',
    ),
    CategoryModel(
      title: 'Nature',
      description: 'Beautiful natural landscapes and outdoor adventures.',
    ),
    CategoryModel(
      title: 'Religious',
      description: 'Sacred sites and places of religious significance.',
    ),
    CategoryModel(
      title: 'Adventure',
      description: 'Thrilling experiences for adventure seekers.',
    ),
  ];

  final List<PlaceModel> places = [
    // ── Historical ───────────────────────────────────────────────────────────
    PlaceModel(
      name: 'Petra',
      category: 'Historical',
      location: 'Ma\'an Governorate, Southern Jordan',
      description:
          'Petra is Jordan\'s most iconic landmark and one of the New Seven Wonders of the World. '
          'Known as the "Rose City", it was carved directly into the rose-red sandstone cliffs by the Nabataean people around the 4th century BC. '
          'The most famous structure is the Treasury (Al-Khazneh), a breathtaking facade that greets visitors at the end of the Siq canyon. '
          'Petra was a major trading hub and is now a UNESCO World Heritage Site visited by millions each year.',
      imageUrl: 'assets/images/petra.jpg',
      isAsset: true,
      rating: 4.9,
      visitInfo: 'Open daily 6:00 AM – 6:00 PM. Entry fee: 50 JOD (includes 2-day pass). '
          'Wear comfortable walking shoes. Best visited in spring or autumn.',
    ),
    PlaceModel(
      name: 'Jerash',
      category: 'Historical',
      location: 'Jerash Governorate, Northern Jordan',
      description:
          'Jerash is home to one of the best-preserved Roman cities in the world. '
          'Walking through Jerash feels like stepping back into ancient Rome, with its grand colonnaded streets, '
          'oval-shaped forum, two Roman theatres, and dozens of temples and churches. '
          'The city dates back over 6,500 years and reached its peak during the Roman period. '
          'Every year, the famous Jerash Festival of Culture and Arts brings the ancient city to life.',
      imageUrl: 'assets/images/jerash.jpg',   // ← حط صورة jerash.jpg في assets/images/
      isAsset: true,
      rating: 4.8,
      visitInfo: 'Open daily 8:00 AM – 5:00 PM. Entry fee: 10 JOD. '
          'The Roman Army and Chariot Experience show runs twice daily. Allow 3–4 hours for a full visit.',
    ),
    PlaceModel(
      name: 'Ajloun Castle',
      category: 'Historical',
      location: 'Ajloun Governorate, Northern Jordan',
      description:
          'Ajloun Castle (Qala\'at Ar-Rabad) is a magnificent 12th-century Islamic castle built by one of Saladin\'s generals. '
          'Perched on a hilltop 1,250 meters above sea level, it offers stunning panoramic views of the Jordan Valley and surrounding forests. '
          'The castle was built to defend the region against Crusader attacks and to protect the iron mines in the area. '
          'It is a remarkable example of Islamic military architecture.',
      imageUrl: 'assets/images/ajloun.jpg',
      isAsset: true,
      rating: 4.5,
      visitInfo: 'Open daily 8:00 AM – 4:00 PM (winter), 8:00 AM – 6:00 PM (summer). '
          'Entry fee: 3 JOD. The surrounding Ajloun Forest Reserve is perfect for hiking.',
    ),
    PlaceModel(
      name: 'Amman Citadel',
      category: 'Historical',
      location: 'Jabal Al-Qal\'a, Amman',
      description:
          'The Amman Citadel sits on top of Jabal al-Qal\'a and has been inhabited since the Bronze Age. '
          'It contains ruins from Romans, Byzantines, and Umayyads. '
          'The most impressive structure is the Umayyad Palace, a large Islamic complex from the 8th century. '
          'The National Archaeological Museum houses ancient artifacts and Dead Sea Scrolls fragments.',
      imageUrl: 'assets/images/amman_citadel.jpg',
      isAsset: true,
      rating: 4.6,
      visitInfo: 'Open daily 8:00 AM – 5:00 PM. Entry fee: 3.5 JOD. '
          'Combine your visit with a walk to the nearby Roman Theatre in downtown Amman.',
    ),

    // ── Nature ───────────────────────────────────────────────────────────────
    PlaceModel(
      name: 'Wadi Rum',
      category: 'Nature',
      location: 'Aqaba Governorate, Southern Jordan',
      description:
          'Wadi Rum, also known as the Valley of the Moon, is a stunning desert valley cut into the sandstone and granite rock in southern Jordan. '
          'The landscape is dramatic with towering cliffs, natural arches, and vast red sand dunes. '
          'It is famous for being the filming location of movies like "The Martian" and "Lawrence of Arabia". '
          'Visitors can enjoy jeep tours, camel rides, rock climbing, and stargazing.',
      imageUrl: 'assets/images/wadi_rum.jpg',
      isAsset: true,
      rating: 4.8,
      visitInfo: 'Best visited year-round. Guided jeep tours start at 25 JOD. '
          'Overnight camping in Bedouin tents is highly recommended.',
    ),
    PlaceModel(
      name: 'Dead Sea',
      category: 'Nature',
      location: 'Jordan Valley, Western Jordan',
      description:
          'The Dead Sea is one of the world\'s most unique natural wonders, sitting at the lowest point on Earth at 430 meters below sea level. '
          'Its extremely high salt concentration (around 34%) makes it impossible to sink. '
          'The mineral-rich mud is famous for its healing and beautifying properties. '
          'The serene landscape with the Judean Hills makes it truly unforgettable.',
      imageUrl: 'assets/images/dead_sea.jpg',  // ← حط صورة dead_sea.jpg في assets/images/
      isAsset: true,
      rating: 4.7,
      visitInfo: 'Open year-round. Best visited in winter to avoid extreme heat. '
          'Avoid shaving 24 hours before swimming. Do not let water touch your eyes.',
    ),

    // ── Religious ─────────────────────────────────────────────────────────────
    PlaceModel(
      name: 'Mount Nebo',
      category: 'Religious',
      location: 'Madaba Governorate, Western Jordan',
      description:
          'Mount Nebo is one of the most revered sites in Jordan, believed to be where Moses saw the Promised Land. '
          'It stands 817 meters above sea level with a breathtaking view over the Jordan Valley and the Dead Sea. '
          'The summit houses an ancient Byzantine church with beautifully preserved 6th-century mosaics. '
          'It is considered one of Christianity\'s most sacred pilgrimage sites.',
      imageUrl: 'assets/images/mount_nebo.jpg',  // ← حط صورة mount_nebo.jpg في assets/images/
      isAsset: true,
      rating: 4.6,
      visitInfo: 'Open daily 8:00 AM – 5:00 PM. Entry fee: 3 JOD. '
          'Best visited in the morning for the clearest views.',
    ),
    PlaceModel(
      name: 'Baptism Site',
      category: 'Religious',
      location: 'Al-Maghtas, Jordan River Valley',
      description:
          'The Baptism Site of Jesus Christ — also known as Bethany Beyond the Jordan — is a UNESCO World Heritage Site. '
          'It is widely believed to be where John the Baptist baptised Jesus Christ. '
          'Archaeological excavations uncovered churches, pools, and hermit caves from the Byzantine period. '
          'Pilgrims from across the world visit to pray and touch the waters of the Jordan River.',
      imageUrl: 'assets/images/baptism_site.jpg',  // ← حط صورة baptism_site.jpg في assets/images/
      isAsset: true,
      rating: 4.5,
      visitInfo: 'Open daily 8:00 AM – 5:00 PM. Entry fee: 12 JOD (includes guided tour). '
          'Dress modestly. Guided tours run hourly.',
    ),

    // ── Adventure ─────────────────────────────────────────────────────────────
    PlaceModel(
      name: 'Aqaba Beach',
      category: 'Adventure',
      location: 'Aqaba Governorate, Southern Jordan',
      description:
          'Aqaba is Jordan\'s only coastal city at the northern tip of the Red Sea. '
          'Its crystal-clear waters are world-famous for scuba diving and snorkelling with vibrant coral reefs. '
          'Visitors enjoy water sports like kitesurfing, glass-bottom boat tours, and deep-sea fishing. '
          'The city also offers a lively waterfront promenade and excellent seafood restaurants.',
      imageUrl: 'assets/images/aqaba.jpg',  // ← حط صورة aqaba.jpg في assets/images/
      isAsset: true,
      rating: 4.7,
      visitInfo: 'Best visited October – April. '
          'Diving trips start from 35 JOD per person. Many beach clubs offer day passes with water sports.',
    ),
    PlaceModel(
      name: 'Dana Reserve',
      category: 'Adventure',
      location: 'Tafilah Governorate, Southern Jordan',
      description:
          'Dana Biosphere Reserve is Jordan\'s largest nature reserve, covering over 300 km² of varied terrain — '
          'from sandstone cliffs to desert wadis and fertile valleys. '
          'It is a paradise for hikers with over 800 plant species, 215 bird species, and 38 mammal species. '
          'Several well-marked hiking trails range from easy walks to multi-day treks.',
      imageUrl: 'assets/images/dana.jpg',  // ← حط صورة dana.jpg في assets/images/
      isAsset: true,
      rating: 4.6,
      visitInfo: 'Open year-round; best in spring and autumn. '
          'Guided hikes from 20 JOD per person.',
    ),
  ];

  List<PlaceModel> searchPlaces(String query) {
    if (query.isEmpty) return places;
    final lowerQuery = query.toLowerCase();
    return places.where((place) {
      return place.name.toLowerCase().contains(lowerQuery) ||
          place.category.toLowerCase().contains(lowerQuery) ||
          place.location.toLowerCase().contains(lowerQuery);
    }).toList();
  }

  List<PlaceModel> getFeaturedPlaces() {
    return places.where((place) => place.rating >= 4.7).take(4).toList();
  }
}
