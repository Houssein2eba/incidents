import 'package:get/get.dart';

class AllTranslations extends Translations {
  @override
 Map<String, Map<String, String>> get keys => {
    "ar": {
      // OnBoarding texts
      "1": "ساعدنا في تحسين مدينتك",
      "2": "أبلغ عن المشاكل العامة مثل الحفر أو النفايات أو أعمدة الإنارة المعطلة بكل سهولة",
      "3": "صوّر وأرسل خلال ثوانٍ",
      "4": "التقط صورة للمشكلة،وأرسل بلاغك بسرعة",
      "5": "نحن نستمع ونتصرف",
      "6": "تصل بلاغاتك إلى الجهات المختصة التي تتابع وتصلح",
      
      // Navigation
      "start": "ابدأ",
      "next": "التالي",
      
      // Home Page
      "incident_reporter": "مُبلغ الحوادث",
      "report_incident": "الإبلاغ عن حادث",
      "date": "التاريخ",
      "category": "الفئة",
      "select_image": "اختر صورة",
      "description": "الوصف",
      "submit_report": "إرسال التقرير",
      
      // Image Picker
      "tap_to_add_photo": "انقر لإضافة صورة",
      "add_more_photos": "إضافة المزيد",
      "take_photo": "التقاط صورة",
      "choose_gallery": "اختيار من المعرض",
      "photo_count": "(%s/%s)",
      
      // Categories
      "fire": "حريق",
      "theft": "سرقة",
      "accident": "حادث",
      "medical": "طبي",
      "other": "آخر",
      
      // Error messages
      "error": "خطأ",
      "max_images_error": "الحد الأقصى %s صور مسموح بها",
      "permission_error": "لم يتم منح إذن الكاميرا أو التخزين",
      "no_image_error": "لم يتم اختيار صورة",
      
      // Description placeholder
      "enter_description": "أدخل وصف الحادث"
    },
    "fr": {
      // OnBoarding texts
      "1": "Aidez-nous à améliorer votre ville",
      "2": "Rapportez des problèmes généraux comme les hautes tempêtes ou les nuages ou des colonnes d'énergie éteintes avec facilité",
      "3": "Envoyez et envoyez rapidement",
      "4": "Prendre une photo de la panne et envoyer votre signalement rapidement",
      "5": "Nous écoutons et nous agissons",
      "6": "Rapportez-nous vos signalements",
      
      // Navigation
      "start": "Commencer",
      "next": "Suivant",
      
      // Home Page
      "incident_reporter": "Rapporteur d'incidents",
      "report_incident": "Signaler un incident",
      "date": "Date",
      "category": "Catégorie",
      "select_image": "Sélectionner une image",
      "description": "Description",
      "submit_report": "Soumettre le rapport",
      
      // Image Picker
      "tap_to_add_photo": "Appuyez pour ajouter une photo",
      "add_more_photos": "Ajouter plus",
      "take_photo": "Prendre une photo",
      "choose_gallery": "Choisir dans la galerie",
      "photo_count": "(%s/%s)",
      
      // Categories
      "fire": "Incendie",
      "theft": "Vol",
      "accident": "Accident",
      "medical": "Médical", 
      "other": "Autre",
      
      // Error messages
      "error": "Erreur",
      "max_images_error": "Maximum %s images autorisées",
      "permission_error": "Permission de caméra ou de stockage non accordée",
      "no_image_error": "Aucune image sélectionnée",
      
      // Description placeholder
      "enter_description": "Entrez la description de l'incident"
    }
  };
}