import 'package:flutter/material.dart';
import 'package:mvrs/screens/bottom_navigation_screens/widgets/vehicle_card.dart';
import 'package:mvrs/screens/ride_summary_screen.dart';

// ignore: must_be_immutable
class VehicleCardGrid extends StatelessWidget {
  final String searchCity;
  final DateTime journeyStartDate;
  final DateTime journeyEndDate;
  final String vehicleType;

  VehicleCardGrid({
    super.key,
    required this.searchCity,
    required this.journeyStartDate,
    required this.journeyEndDate,
    required this.vehicleType,
  });

  List<Map<String, dynamic>> vehicleList = [
    {
      'tripCode': "TRIPMAJJK101",
      'maker': 'Tesla',
      'year': '2023',
      'color': 'Blue',
      'model': 'Tesla Model S',
      'imageUrl':
          'https://hips.hearstapps.com/hmg-prod/images/2024-tesla-model-s-107-6572200e43fa1.jpg?crop=0.497xw:0.560xh;0.243xw,0.232xh&resize=768:*',
      'tripStartDate': DateTime(2025, 6, 1, 10, 30),
      'tripEndDate': DateTime(2025, 6, 1, 12, 30),
      'rent': 520.0,
      'type': 'Car',
    },
    {
      'tripCode': "TRIPMAJJK102",
      'model': 'BMW i8',
      'maker': 'BMW',
      'year': '2023',
      'color': 'White',
      'imageUrl':
          'https://www.shutterstock.com/image-photo/kuala-lumpur-malaysia-april-7-600nw-2143397457.jpg',
      'tripStartDate': DateTime(2024, 12, 1, 12, 00),
      'tripEndDate': DateTime(2024, 12, 1, 5, 30),
      'rent': 2000.0,
      'type': 'Car',
    },
    {
      'tripCode': "TRIPMAJJK103",
      'model': 'Thar',
      'maker': 'Mahindra',
      'year': '2023',
      'color': 'Black',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpBe_O3wM7b3hfln5TYnbfTO7QpabGBt4w_Q&s',
      'tripStartDate': DateTime(2024, 9, 30, 5, 00),
      'tripEndDate': DateTime(2024, 9, 30, 6, 00),
      'rent': 1090.0,
      'type': 'Car',
    },
    {
      'tripCode': "TRIPMAJJK104",
      'model': 'Nissan GT-R',
      'maker': 'Nissan',
      'year': '2023',
      'color': 'Red',
      'imageUrl':
          'https://cdni.autocarindia.com/Utils/ImageResizer.ashx?n=https://cdni.autocarindia.com/ExtraImages/20240628064514_Untitled%20design%20_%202024_06_28T184501.816.jpg',
      'tripStartDate': DateTime(2024, 12, 12, 10, 00),
      'tripEndDate': DateTime(2024, 12, 13, 12, 00),
      'rent': 20890.0,
      'type': 'Car',
    },
    {
      'tripCode': "TRIPMAJJK105",
      'model': 'Ford Mustang',
      'maker': 'Ford',
      'year': '2023',
      'color': 'Red',
      'imageUrl':
          'https://upload.wikimedia.org/wikipedia/commons/7/7f/1965_Ford_Mustang_2D_Hardtop_Front.jpg',
      'tripStartDate': DateTime(2024, 12, 5, 4, 20),
      'tripEndDate': DateTime(2024, 12, 5, 5, 00),
      'rent': 1000.0,
      'type': 'Car',
    },
    {
      'tripCode': "TRIPMAJJK106",
      'model': 'Chevrolet',
      'maker': 'Chevrolet',
      'year': '2023',
      'color': 'Red',
      'imageUrl':
          'https://images.thequint.com/thequint%2F2016-02%2F15ee3c7d-b1d0-4354-a635-30d0f51d828f%2FCruze-hero.jpg',
      'tripStartDate': DateTime(2024, 12, 2, 10, 20),
      'tripEndDate': DateTime(2024, 12, 2, 1, 00),
      'rent': 1700.0,
      'type': 'Car',
    },
    {
      'tripCode': "TRIPMAJJK107",
      'model': 'Porsche 911',
      'maker': 'Porsche',
      'year': '2023',
      'color': 'Black',
      'imageUrl':
          'https://assets.porsche.com/dwaas-infohub/-/media/Project/DealerWebsites/SharedDealersWebsite/Master-Model-Page/911-Turbo/General-Model/General-model_911-Turbo.jpg?rev=5efc15cd5f68412c8ed778e0c199ed16',
      'tripStartDate': DateTime(2024, 12, 2, 10, 20),
      'tripEndDate': DateTime(2024, 12, 2, 1, 00),
      'rent': 2300.0,
      'type': 'Car',
    },
    {
      'tripCode': "TRIPMAJJK108",
      'model': 'Lamborghini Huracan',
      'maker': 'Lamborghini',
      'year': '2023',
      'color': 'Red',
      'imageUrl':
          'https://stimg.cardekho.com/images/carexteriorimages/930x620/Lamborghini/Huracan-EVO/10643/1690010999692/front-left-side-47.jpg',
      'tripStartDate': DateTime(2025, 12, 23, 10, 20),
      'tripEndDate': DateTime(2025, 12, 23, 1, 00),
      'rent': 5000.0,
      'type': 'Car',
    },
    {
      'tripCode': "TRIPMAJJK109",
      'model': 'Ferrari 488',
      'maker': 'Ferrari',
      'year': '2023',
      'color': 'Red',
      'imageUrl':
          'https://sbraceengineering.co.uk/wp-content/uploads/Ferrari-488-GTB.jpg',
      'tripStartDate': DateTime(2025, 12, 23, 10, 20),
      'tripEndDate': DateTime(2025, 12, 23, 1, 00),
      'rent': 11000.0,
      'type': 'Car',
    },
    {
      'tripCode': "TRIPMAJJK110",
      'model': 'Maserati Ghibli',
      'maker': 'Maserati',
      'year': '2023',
      'color': 'Blue',
      'imageUrl':
          'https://hips.hearstapps.com/hmg-prod/images/2024-maserati-ghibli-ultima-101-64f8ca592013e.jpg?crop=0.515xw:0.411xh;0.254xw,0.346xh&resize=1200:*',
      'tripStartDate': DateTime(2025, 3, 16, 10, 00),
      'tripEndDate': DateTime(2025, 3, 16, 5, 00),
      'rent': 22000.0,
      'type': 'Car',
    },
    {
      'tripCode': "TRIPMAJJK111",
      'model': 'Maserati Levante',
      'maker': 'Maserati',
      'year': '2023',
      'color': 'Black',
      'imageUrl':
          'https://stimg.cardekho.com/images/carexteriorimages/930x620/Maserati/Levante/7547/1582365134672/front-left-side-47.jpg',
      'tripStartDate': DateTime(2025, 4, 10, 14, 0),
      'tripEndDate': DateTime(2025, 4, 12, 10, 0),
      'rent': 35000.0,
      'type': 'Car',
    },
    {
      'tripCode': "TRIPAUDI007",
      'model': 'Audi A6',
      'maker': 'Audi',
      'year': '2022',
      'color': 'Silver',
      'imageUrl':
          'https://hips.hearstapps.com/hmg-prod/images/2024-audi-a6-106-64761a1a30f1d.jpg?crop=0.598xw:0.468xh;0.109xw,0.334xh&resize=2048:*',
      'tripStartDate': DateTime(2025, 5, 1, 9, 0),
      'tripEndDate': DateTime(2025, 5, 3, 9, 0),
      'rent': 15000.0,
      'type': 'Car',
    },
    {
      'tripCode': "TRIPBMW123",
      'model': 'BMW X5',
      'maker': 'BMW',
      'year': '2024',
      'color': 'Black',
      'imageUrl':
          'https://hips.hearstapps.com/hmg-prod/images/2024-bmw-x5-m60i-102-6602d48787fb7.jpg?crop=0.772xw:0.651xh;0.0897xw,0.171xh&resize=2048:*',
      'tripStartDate': DateTime(2025, 6, 15, 16, 0),
      'tripEndDate': DateTime(2025, 6, 15, 20, 0),
      'rent': 22000.0,
      'type': 'Car',
    },
    {
      'tripCode': "TRIPBENZ456",
      'model': 'Mercedes-Benz S-Class',
      'maker': 'Mercedes-Benz',
      'year': '2023',
      'color': 'Black',
      'imageUrl':
          'https://stimg.cardekho.com/images/carexteriorimages/930x620/Mercedes-Benz/S-Class/10853/1690451611932/front-left-side-47.jpg',
      'tripStartDate': DateTime(2025, 7, 20, 7, 0),
      'tripEndDate': DateTime(2025, 7, 20, 15, 0),
      'rent': 18000.0,
      'type': 'Car',
    },
    {
      'tripCode': "TRIPJAG001",
      'model': 'Jaguar F-PACE',
      'maker': 'Jaguar',
      'year': '2024',
      'color': 'Blue',
      'imageUrl':
          'https://images.news18.com/ibnlive/uploads/2020/12/1606981128_jaguar-f-pace-svr.png?im=FitAndFill=(1200,675)',
      'tripStartDate': DateTime(2025, 8, 5, 8, 0),
      'tripEndDate': DateTime(2025, 8, 5, 18, 0),
      'rent': 25000.0,
      'type': 'Car',
    },
    {
      'tripCode': "TRIPSUB000",
      'model': 'Subaru WRX',
      'maker': 'Subaru',
      'year': '2022',
      'color': 'Yellow',
      'imageUrl': 'https://i.redd.it/xhvg4zlb99py.jpg',
      'tripStartDate': DateTime(2025, 9, 10, 12, 0),
      'tripEndDate': DateTime(2025, 9, 12, 12, 0),
      'rent': 13000.0,
      'type': 'Car',
    },
    {
      'tripCode': "TRIPLEX001",
      'model': 'Lexus RX',
      'maker': 'Lexus',
      'year': '2023',
      'color': 'Gold',
      'imageUrl':
          'https://cdni.autocarindia.com/Utils/ImageResizer.ashx?n=https://cdni.autocarindia.com/ExtraImages/20230117121618_Lexus%20RX%203.jpg&w=700&c=1',
      'tripStartDate': DateTime(2025, 9, 25, 15, 0),
      'tripEndDate': DateTime(2025, 9, 26, 10, 0),
      'rent': 16000.0,
      'type': 'Car',
    },
    {
      'tripCode': "TRIPPORSCHE999",
      'model': 'Porsche 911',
      'maker': 'Porsche',
      'year': '2023',
      'color': 'Grey',
      'imageUrl': 'https://images.pistonheads.com/nimg/47680/blobid0.jpg',
      'tripStartDate': DateTime(2025, 10, 5, 14, 0),
      'tripEndDate': DateTime(2025, 10, 6, 14, 0),
      'rent': 45000.0,
      'type': 'Car',
    },
    {
      'tripCode': "TRIPYAMAHA001",
      'model': 'Yamaha YZF-R1',
      'maker': 'Yamaha',
      'year': '2024',
      'color': 'Black',
      'imageUrl':
          'https://imgd.aeplcdn.com/1056x594/n/bw/models/colors/yamaha-yzf-r1-2018-tech-black-1512471351531.jpg?20190103151915&q=80',
      'tripStartDate': DateTime(2025, 3, 1, 10, 0),
      'tripEndDate': DateTime(2025, 3, 1, 18, 0),
      'rent': 1500.0,
      'type': 'Motorcycle',
    },
    {
      'tripCode': "TRIPHONDA002",
      'model': 'Honda CBR1000RR',
      'maker': 'Honda',
      'year': '2023',
      'color': 'Red',
      'imageUrl':
          'https://imgd.aeplcdn.com/664x374/n/bw/models/colors/honda-select-model-grand-prix-red-1649152806836.jpg?q=80',
      'tripStartDate': DateTime(2025, 4, 10, 12, 0),
      'tripEndDate': DateTime(2025, 4, 12, 10, 0),
      'rent': 2200.0,
      'type': 'Motorcycle',
    },
    {
      'tripCode': "TRIPSUZUKI003",
      'model': 'Suzuki GSX-R1000',
      'maker': 'Suzuki',
      'year': '2022',
      'color': 'Black',
      'imageUrl':
          'https://imgd.aeplcdn.com/1280x720/bw/ec/29684/Suzuki-GSXR1000-Front-threequarter-100078.jpg?v=201711021421',
      'tripStartDate': DateTime(2025, 5, 5, 9, 0),
      'tripEndDate': DateTime(2025, 5, 5, 18, 0),
      'rent': 1700.0,
      'type': 'Motorcycle',
    },
    {
      'tripCode': "TRIPKAWASAKI004",
      'model': 'Kawasaki Ninja ZX-10R',
      'maker': 'Kawasaki',
      'year': '2023',
      'color': 'Green',
      'imageUrl':
          'https://cdni.autocarindia.com/Utils/ImageResizer.ashx?n=https://cdni.autocarindia.com/Galleries/20160609115020_DSC_2453.jpg&w=772&h=511&q=75&c=1',
      'tripStartDate': DateTime(2025, 6, 1, 14, 0),
      'tripEndDate': DateTime(2025, 6, 1, 22, 0),
      'rent': 2000.0,
      'type': 'Motorcycle',
    },
    {
      'tripCode': "TRIPDUCATI005",
      'model': 'Ducati Panigale V4',
      'maker': 'Ducati',
      'year': '2023',
      'color': 'Red',
      'imageUrl':
          'https://www.roadracingworld.com/wp-content/uploads/2022/07/DUCATI_PANIGALE_V4S_STATIC_001_UC355519_High_1657552868-e1657552884731.jpg',
      'tripStartDate': DateTime(2025, 7, 10, 15, 0),
      'tripEndDate': DateTime(2025, 7, 10, 23, 0),
      'rent': 2500.0,
      'type': 'Motorcycle',
    },
    {
      'tripCode': "TRIPBMW006",
      'model': 'BMW S1000RR',
      'maker': 'BMW',
      'year': '2023',
      'color': 'White',
      'imageUrl':
          'https://imgd.aeplcdn.com/1056x594/n/bw/models/colors/bmw-select-model-light-white-1677058607620.jpg?q=80',
      'tripStartDate': DateTime(2025, 8, 5, 11, 0),
      'tripEndDate': DateTime(2025, 8, 5, 20, 0),
      'rent': 2100.0,
      'type': 'Motorcycle',
    },
    {
      'tripCode': "TRIPYAMAHA007",
      'model': 'Yamaha MT-09',
      'maker': 'Yamaha',
      'year': '2024',
      'color': 'Silver',
      'imageUrl':
          'https://motofomo.com/wp-content/uploads/2023/10/2024-Yamaha-MT-09-SP-Studio-LHS.jpg',
      'tripStartDate': DateTime(2025, 8, 15, 10, 0),
      'tripEndDate': DateTime(2025, 8, 15, 17, 0),
      'rent': 1200.0,
      'type': 'Motorcycle',
    },
    {
      'tripCode': "TRIPHONDA008",
      'model': 'Honda CB1000R',
      'maker': 'Honda',
      'year': '2023',
      'color': 'Silver',
      'imageUrl':
          'https://imgd.aeplcdn.com/664x374/bw/models/honda-cb1000r-standard20200805183004.jpg?q=80',
      'tripStartDate': DateTime(2025, 9, 1, 8, 0),
      'tripEndDate': DateTime(2025, 9, 1, 16, 0),
      'rent': 1300.0,
      'type': 'Motorcycle',
    },
    {
      'tripCode': "TRIPSUZUKI009",
      'model': 'Suzuki V-Strom 650',
      'maker': 'Suzuki',
      'year': '2022',
      'color': 'Black-White',
      'imageUrl':
          'https://imgd.aeplcdn.com/664x374/n/cw/ec/137659/v-strom-650-right-front-three-quarter.png?isig=0&q=80',
      'tripStartDate': DateTime(2025, 9, 10, 14, 0),
      'tripEndDate': DateTime(2025, 9, 12, 12, 0),
      'rent': 1800.0,
      'type': 'Motorcycle',
    },
    {
      'tripCode': "TRIPKAWASAKI010",
      'model': 'Kawasaki Z900',
      'maker': 'Kawasaki',
      'year': '2024',
      'color': 'Black',
      'imageUrl':
          'https://imgd.aeplcdn.com/664x374/n/cw/ec/171021/z900-right-front-three-quarter.jpeg?isig=0&q=80',
      'tripStartDate': DateTime(2025, 10, 5, 16, 0),
      'tripEndDate': DateTime(2025, 10, 5, 22, 0),
      'rent': 1600.0,
      'type': 'Motorcycle',
    },
    {
      'tripCode': "TRIPDUCATI011",
      'model': 'Ducati Monster 1200',
      'maker': 'Ducati',
      'year': '2023',
      'color': 'Black',
      'imageUrl':
          'https://imgd.aeplcdn.com/664x374/bw/models/ducati-monster-1200-s.jpg?20190103151915&q=80',
      'tripStartDate': DateTime(2025, 10, 10, 11, 0),
      'tripEndDate': DateTime(2025, 10, 10, 19, 0),
      'rent': 1800.0,
      'type': 'Motorcycle',
    },
    {
      'tripCode': "TRIPBMW012",
      'model': 'BMW R1250GS',
      'maker': 'BMW',
      'year': '2024',
      'color': 'Black',
      'imageUrl':
          'https://imgd.aeplcdn.com/476x268/bw/models/bmw-r-1250-gs-standard20200731223837.jpg',
      'tripStartDate': DateTime(2025, 10, 15, 9, 0),
      'tripEndDate': DateTime(2025, 10, 15, 17, 0),
      'rent': 2300.0,
      'type': 'Motorcycle',
    },
    {
      'tripCode': "TRIPYAMAHA013",
      'model': 'Yamaha FZ-09',
      'maker': 'Yamaha',
      'year': '2023',
      'color': 'Black',
      'imageUrl':
          'https://imgd.aeplcdn.com/1280x720/n/cw/ec/146943/mt-09-left-front-three-quarter.jpeg?isig=0',
      'tripStartDate': DateTime(2025, 11, 1, 13, 0),
      'tripEndDate': DateTime(2025, 11, 1, 21, 0),
      'rent': 1100.0,
      'type': 'Motorcycle',
    },
    {
      'tripCode': "TRIPHONDA014",
      'model': 'Honda CRF1100L Africa Twin',
      'maker': 'Honda',
      'year': '2024',
      'color': 'Red',
      'imageUrl':
          'https://cdn.shopify.com/s/files/1/0951/1406/files/2022-honda-africa-twin-updates-lone-rider-2.jpg?v=1632925717',
      'tripStartDate': DateTime(2025, 11, 5, 7, 0),
      'tripEndDate': DateTime(2025, 11, 5, 15, 0),
      'rent': 1900.0,
      'type': 'Motorcycle',
    },
    {
      'tripCode': "TRIPSUZUKI015",
      'model': 'Suzuki Hayabusa',
      'maker': 'Suzuki',
      'year': '2023',
      'color': 'Black',
      'imageUrl':
          'https://cdni.autocarindia.com/Utils/ImageResizer.ashx?n=http://img.haymarketsac.in/autocarpro/79c74841-e421-46a7-83e6-77bacae70482_Untitled.jpg&w=750&h=490&q=75&c=1',
      'tripStartDate': DateTime(2025, 11, 10, 14, 0),
      'tripEndDate': DateTime(2025, 11, 10, 22, 0),
      'rent': 2400.0,
      'type': 'Motorcycle',
    },
    {
      'tripCode': "TRIPKAWASAKI016",
      'model': 'Kawasaki Versys 650',
      'maker': 'Kawasaki',
      'year': '2024',
      'color': 'Green',
      'imageUrl':
          'https://mcn-images.bauersecure.com/wp-images/186018/1440x960/kawasaki-versys-650-01.jpg?mode=max&quality=90&scale=down',
      'tripStartDate': DateTime(2025, 11, 15, 9, 0),
      'tripEndDate': DateTime(2025, 11, 15, 18, 0),
      'rent': 1600.0,
      'type': 'Motorcycle',
    },
    {
      'tripCode': "TRIPDUCATI017",
      'model': 'Ducati Scrambler',
      'maker': 'Ducati',
      'year': '2024',
      'color': 'Yellow',
      'imageUrl':
          'https://imgd.aeplcdn.com/1056x594/n/bw/models/colors/ducati-select-model-62-yellow-1695208704579.png?q=80',
      'tripStartDate': DateTime(2025, 12, 1, 10, 0),
      'tripEndDate': DateTime(2025, 12, 1, 18, 0),
      'rent': 1300.0,
      'type': 'Motorcycle',
    },
    {
      'tripCode': "TRIPVOLVO001",
      'model': 'Volvo 9700',
      'maker': 'Volvo',
      'year': '2023',
      'color': 'White',
      'imageUrl':
          'https://assets.volvo.com/is/image/VolvoInformationTechnologyAB/volvo-9700-uscan-45-degree-side-view-1860x1050?qlt=82&wid=1024&ts=1724340963595&dpr=off&fit=constrain',
      'tripStartDate': DateTime(2025, 3, 1, 8, 0),
      'tripEndDate': DateTime(2025, 3, 1, 18, 0),
      'rent': 5000.0,
      'type': 'Bus',
    },
    {
      'tripCode': "TRIPMERCEDES002",
      'model': 'Mercedes-Benz Sprinter 516',
      'maker': 'Mercedes-Benz',
      'year': '2024',
      'color': 'White',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQr30mPOnfogYa-WU6faozy-4F2yrM4xy4uLQ&s',
      'tripStartDate': DateTime(2025, 4, 5, 10, 0),
      'tripEndDate': DateTime(2025, 4, 5, 20, 0),
      'rent': 3000.0,
      'type': 'Bus',
    },
    {
      'tripCode': "TRIPISUZU003",
      'model': 'Isuzu Bus NLR 45',
      'maker': 'Isuzu',
      'year': '2023',
      'color': 'Yellow',
      'imageUrl':
          'https://thumbs.dreamstime.com/b/yellow-isuzu-elf-nlr-microbus-trans-jawa-toll-road-boyolali-indonesia-july-converted-minibus-336491900.jpg',
      'tripStartDate': DateTime(2025, 5, 10, 12, 0),
      'tripEndDate': DateTime(2025, 5, 10, 16, 0),
      'rent': 2500.0,
      'type': 'Bus',
    },
    {
      'tripCode': "TRIPSCANIA004",
      'model': 'Scania Touring Bus',
      'maker': 'Scania',
      'year': '2024',
      'color': 'Silver',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUyxv-6qBe18_iqNEMIF2RTOE0NK47C47kzQ&s',
      'tripStartDate': DateTime(2025, 6, 1, 9, 0),
      'tripEndDate': DateTime(2025, 6, 1, 22, 0),
      'rent': 7000.0,
      'type': 'Bus',
    },
    {
      'tripCode': "TRIPMERCEDES006",
      'model': 'Mercedes-Benz Tourismo',
      'maker': 'Mercedes-Benz',
      'year': '2023',
      'color': 'Silver',
      'imageUrl':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Mercedes-Benz_Tourismo_demonstrator.JPG/1200px-Mercedes-Benz_Tourismo_demonstrator.JPG',
      'tripStartDate': DateTime(2025, 7, 10, 10, 0),
      'tripEndDate': DateTime(2025, 7, 10, 18, 0),
      'rent': 6000.0,
      'type': 'Bus',
    },
    {
      'tripCode': "TRIPVOLVO007",
      'model': 'Volvo 9900',
      'maker': 'Volvo',
      'year': '2023',
      'color': 'Red',
      'imageUrl':
          'https://images.hyperportal.org/eyJrZXkiOiJiYnMvY0NXb1BnYnN2VkRMX2hsc3JKaFl4IiwiZWRpdHMiOnsicmVzaXplIjp7ImZpdCI6Imluc2lkZSIsIndpdGhvdXRFbmxhcmdlbWVudCI6dHJ1ZX19fQ==',
      'tripStartDate': DateTime(2025, 8, 5, 9, 0),
      'tripEndDate': DateTime(2025, 8, 5, 21, 0),
      'rent': 7500.0,
      'type': 'Bus',
    },
    {
      'tripCode': "TRIPMAN004",
      'model': 'MAN Lion\'s Coach',
      'maker': 'MAN',
      'year': '2024',
      'color': 'Silver',
      'imageUrl':
          'https://images.hyperportal.org/eyJrZXkiOiJiYnMveFdLQUFMeGZhdXl2WHJPTG9yVUdtIiwiZWRpdHMiOnsicmVzaXplIjp7ImZpdCI6Imluc2lkZSIsIndpdGhvdXRFbmxhcmdlbWVudCI6dHJ1ZX19fQ==',
      'tripStartDate': DateTime(2025, 9, 1, 7, 0),
      'tripEndDate': DateTime(2025, 9, 1, 19, 0),
      'rent': 7200.0,
      'type': 'Bus',
    },
    {
      'tripCode': "TRIPVOLVO009",
      'model': 'Volvo B11R',
      'maker': 'Volvo',
      'year': '2023',
      'color': 'White',
      'imageUrl':
          'https://www.volvobuses.com/content/dam/volvo-buses/markets/uk/classic/news/2018/1860x1050-volvo-B11R-vehicle-of-choice-for-J&B-travel.jpg',
      'tripStartDate': DateTime(2025, 9, 20, 11, 0),
      'tripEndDate': DateTime(2025, 9, 20, 23, 0),
      'rent': 8000.0,
      'type': 'Bus',
    },
    {
      'tripCode': "TRIPTATA010",
      'model': 'Tata Magic Iris Bus',
      'maker': 'Tata Motors',
      'year': '2024',
      'color': 'Yellow',
      'imageUrl': 'https://pbs.twimg.com/media/BDJR4zRCIAA7EwF.png:large',
      'tripStartDate': DateTime(2025, 10, 1, 10, 0),
      'tripEndDate': DateTime(2025, 10, 1, 14, 0),
      'rent': 2000.0,
      'type': 'Bus',
    },
    {
      'tripCode': "TRIPMERCEDES001",
      'model': 'Mercedes-Benz Sprinter 3500',
      'maker': 'Mercedes-Benz',
      'year': '2024',
      'color': 'White',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaCaJXH9D3zRhfjhv2o3ThNb9J5zU3fYNF3g&s',
      'tripStartDate': DateTime(2025, 3, 1, 8, 0),
      'tripEndDate': DateTime(2025, 3, 1, 20, 0),
      'rent': 1800.0,
      'type': 'Truck',
    },
    {
      'tripCode': "TRIPFORD002",
      'model': 'Ford Transit 350',
      'maker': 'Ford',
      'year': '2023',
      'color': 'White',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_Vlbkr0jSc0pil1EuLFdcWekFoWuwJ-xwVg&s',
      'tripStartDate': DateTime(2025, 4, 10, 10, 0),
      'tripEndDate': DateTime(2025, 4, 10, 18, 0),
      'rent': 1500.0,
      'type': 'Truck',
    },
    {
      'tripCode': "TRIPISUZU003",
      'model': 'Isuzu NPR 75/45',
      'maker': 'Isuzu',
      'year': '2023',
      'color': 'White',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7zTI5Z0n9Cd9lJxGnD39vf4ynTDUb7fEdcg&s',
      'tripStartDate': DateTime(2025, 5, 5, 9, 0),
      'tripEndDate': DateTime(2025, 5, 5, 17, 0),
      'rent': 2500.0,
      'type': 'Truck',
    },
    {
      'tripCode': "TRIPTATA004",
      'model': 'Tata LPT 1618',
      'maker': 'Tata Motors',
      'year': '2023',
      'color': 'Multicolor',
      'imageUrl':
          'https://4.imimg.com/data4/TJ/HN/GLADMIN-29933743/1-500x500.jpg',
      'tripStartDate': DateTime(2025, 6, 1, 7, 0),
      'tripEndDate': DateTime(2025, 6, 1, 19, 0),
      'rent': 4000.0,
      'type': 'Truck',
    },
    {
      'tripCode': "TRIPMITSUBISHI005",
      'model': 'Mitsubishi Fuso Canter',
      'maker': 'Mitsubishi',
      'year': '2024',
      'color': 'Red',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSWb_hyjhAaUELrFVbQM43I-WoopTCMp19MA&s',
      'tripStartDate': DateTime(2025, 7, 15, 10, 0),
      'tripEndDate': DateTime(2025, 7, 15, 16, 0),
      'rent': 2300.0,
      'type': 'Truck',
    }
  ];

  List<Map<String, dynamic>> filterByType(String filterType) {
    return vehicleList
        .where((vehicle) => vehicle['type'] == filterType)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.7, // Adjust this for card height/width ratio
      ),
      itemCount: filterByType(vehicleType).length,
      itemBuilder: (context, index) {
        final vehicle = filterByType(vehicleType)[index];
        return VehicleCard(
          tripCode: vehicle['tripCode'],
          carImageUrl: vehicle['imageUrl'],
          carModel: vehicle['model'],
          rentAmount: vehicle['rent'],
          onBookPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RideSummaryScreen(
                  tripCode: vehicle['tripCode'],
                  model: vehicle['model'],
                  maker: vehicle['maker'],
                  year: vehicle['year'],
                  color: vehicle['color'],
                  imageUrl: vehicle['imageUrl'],
                  tripStartDate: vehicle['tripStartDate'],
                  tripEndDate: vehicle['tripEndDate'],
                  rentAmount: vehicle['rent'],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
