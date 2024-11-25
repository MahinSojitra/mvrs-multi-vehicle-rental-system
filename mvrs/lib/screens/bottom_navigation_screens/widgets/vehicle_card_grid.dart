import 'package:flutter/material.dart';
import 'package:mvrs/screens/bottom_navigation_screens/widgets/vehicle_card.dart';
import 'package:mvrs/screens/ride_summary_screen.dart';

class VehicleCardGrid extends StatelessWidget {
  final List<Map<String, dynamic>> vehicleList = [
    {
      'tripCode': "TRIPMAJJK101",
      'model': 'Tesla Model S',
      'imageUrl':
          'https://hips.hearstapps.com/hmg-prod/images/2024-tesla-model-s-107-6572200e43fa1.jpg?crop=0.497xw:0.560xh;0.243xw,0.232xh&resize=768:*',
      'tripStartDate': DateTime(2025, 6, 1, 10, 30),
      'tripEndDate': DateTime(2025, 6, 1, 12, 30),
      'rent': 520.0,
    },
    {
      'tripCode': "TRIPMAJJK102",
      'model': 'BMW i8',
      'imageUrl':
          'https://www.shutterstock.com/image-photo/kuala-lumpur-malaysia-april-7-600nw-2143397457.jpg',
      'tripStartDate': DateTime(2024, 12, 1, 12, 00),
      'tripEndDate': DateTime(2024, 12, 1, 5, 30),
      'rent': 2000.0,
    },
    {
      'tripCode': "TRIPMAJJK103",
      'model': 'Thar',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpBe_O3wM7b3hfln5TYnbfTO7QpabGBt4w_Q&s',
      'tripStartDate': DateTime(2024, 9, 30, 5, 00),
      'tripEndDate': DateTime(2024, 9, 30, 6, 00),
      'rent': 1090.0,
    },
    {
      'tripCode': "TRIPMAJJK104",
      'model': 'Nissan GT-R',
      'imageUrl':
          'https://cdni.autocarindia.com/Utils/ImageResizer.ashx?n=https://cdni.autocarindia.com/ExtraImages/20240628064514_Untitled%20design%20_%202024_06_28T184501.816.jpg',
      'tripStartDate': DateTime(2024, 12, 12, 10, 00),
      'tripEndDate': DateTime(2024, 12, 13, 12, 00),
      'rent': 20890.0,
    },
    {
      'tripCode': "TRIPMAJJK105",
      'model': 'Ford Mustang',
      'imageUrl':
          'https://upload.wikimedia.org/wikipedia/commons/7/7f/1965_Ford_Mustang_2D_Hardtop_Front.jpg',
      'tripStartDate': DateTime(2024, 12, 5, 4, 20),
      'tripEndDate': DateTime(2024, 12, 5, 5, 00),
      'rent': 1000.0,
    },
    {
      'tripCode': "TRIPMAJJK106",
      'model': 'Chevrolet',
      'imageUrl':
          'https://images.thequint.com/thequint%2F2016-02%2F15ee3c7d-b1d0-4354-a635-30d0f51d828f%2FCruze-hero.jpg',
      'tripStartDate': DateTime(2024, 12, 2, 10, 20),
      'tripEndDate': DateTime(2024, 12, 2, 1, 00),
      'rent': 1700.0,
    },
    {
      'tripCode': "TRIPMAJJK107",
      'model': 'Porsche 911',
      'imageUrl':
          'https://assets.porsche.com/dwaas-infohub/-/media/Project/DealerWebsites/SharedDealersWebsite/Master-Model-Page/911-Turbo/General-Model/General-model_911-Turbo.jpg?rev=5efc15cd5f68412c8ed778e0c199ed16',
      'tripStartDate': DateTime(2024, 12, 2, 10, 20),
      'tripEndDate': DateTime(2024, 12, 2, 1, 00),
      'rent': 2300.0,
    },
    {
      'tripCode': "TRIPMAJJK108",
      'model': 'Lamborghini Huracan',
      'imageUrl':
          'https://stimg.cardekho.com/images/carexteriorimages/930x620/Lamborghini/Huracan-EVO/10643/1690010999692/front-left-side-47.jpg',
      'tripStartDate': DateTime(2025, 12, 23, 10, 20),
      'tripEndDate': DateTime(2025, 12, 23, 1, 00),
      'rent': 5000.0,
    },
    {
      'tripCode': "TRIPMAJJK109",
      'model': 'Ferrari 488',
      'imageUrl':
          'https://sbraceengineering.co.uk/wp-content/uploads/Ferrari-488-GTB.jpg',
      'tripStartDate': DateTime(2025, 12, 23, 10, 20),
      'tripEndDate': DateTime(2025, 12, 23, 1, 00),
      'rent': 11000.0,
    },
    {
      'tripCode': "TRIPMAJJK110",
      'model': 'Maserati Ghibli',
      'imageUrl':
          'https://imgd-ct.aeplcdn.com/664x415/n/j0irpsa_1476670.jpg?q=80',
      'tripStartDate': DateTime(2025, 3, 16, 10, 00),
      'tripEndDate': DateTime(2025, 3, 16, 5, 00),
      'rent': 22000.0,
    },
  ];

  VehicleCardGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.7, // Adjust this for card height/width ratio
      ),
      itemCount: vehicleList.length,
      itemBuilder: (context, index) {
        final vehicle = vehicleList[index];
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
