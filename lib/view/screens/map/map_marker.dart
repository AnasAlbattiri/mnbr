import 'package:latlong2/latlong.dart';

class MapMarker {
  final String image;
  final String title;
  final String address;
  final LatLng location;
  final String circle;
  final String list;
  final String birthDate;
  final String education;
  final String email;
  final String about;


  MapMarker({
    required this.image,
    required this.title,
    required this.address,
    required this.location,
    required this.circle,
    required this.list,
    required this.birthDate,
    required this.education,
    required this.email,
    required this.about,
  });
}

final locations = [
  LatLng(32.0028, 35.9404),
  LatLng(31.9265158, 35.9056737),
  LatLng(31.8694, 36.0065),
];

final mapMarkers = [
  MapMarker(
    image: 'assets/images/unknown1.jpg',
    title: 'أنس قطوش 💻',
    address: 'عمان، طبربور',
    location: locations[0],
    circle: 'الدائرة الأولى',
    list: 'الكرامة',
    birthDate: '25 تشرين الأول 2003 م',
    education: 'يدرس هندسة البرمجيات في جامعة عجلون الوطنية',
    email: 'anaswalbattiri@gmail.com',
    about: 'طالب هندسة برمجيات حاصل على أكثر من 10 دورات تقنية، وعلى أكثر من 5 دورات في المهارات الحياتية مثل مهارات التواصل الاجتماعي والقيادة وتحديد الأهداف واتخاذ القرار، وحاصل على شهادة من ورشة "من فكرة اجعلها فرصة" من جامعة الإسراء، وحاصل على دورة في اللغة الإنجليزية، واتم بناء اكثر من 7 تطبيقات على الهاتف الذكي، وقارئ لأكثر من 35 كتاب منها التقنية والنفسية والمالية.',
  ),
  MapMarker(
    image: 'assets/images/unknown1.jpg',
    title: 'غيث البلبيسي ☽',
    address: 'عمان، حي نزال',
    location: locations[1],
    circle: 'الدائرة الخامسة',
    list: 'الإصلاح',
    birthDate: '14 تشرين الثاني 2003 م',
    education: 'يدرس علم الحاسوب في جامعة الشرق الأوسط',
    email: 'ghaithehab@hotmail.com',
    about: 'غيث البلبيسي طالب جامعي، أدرس علم الحاسوب في جامعة الشرق الأوسط وأنمو بشغف في مجال التكنولوجيا. أعشق استكشاف مجالات متعددة في العلوم الحاسوبية وأسعى إلى تعلم المزيد وتطوير مهاراتي.',
  ),
  MapMarker(
    image: 'assets/images/unknown1.jpg',
    title: 'زيد الرقاد ⚖️',
    address: 'عمان، سحاب',
    location: locations[2],
    circle: 'الدائرة الثالثة',
    list: 'تقدم',
    birthDate: '28 شباط 1998 م',
    education: 'يدرس قانون في جامعة الشرق الأوسط',
    email: 'Zaidalraggad98@gmail.com',
    about: 'طالب قانون وناشط مجتمعي متطوع منذ ٩ سنوات وحاصل على العديد من الدورات السياسيه من المعهد الهولندي الديموقراطية متعدده الاحزاب. والمعهد الديموقراطي ومدرسه ناومن للسياسه. خريج برامج مثل خطى الحسين وحقق وانا اشارك. حاصل على مركز الاول بالمحاكم الصوريه. والمركز الثاني بفن المناظرات عل مستوى الجامعات.',
  ),
];
