import 'package:flutter/material.dart';
import 'package:mvrs/screens/bottom_navigation_screens/widgets/vehicle_card.dart';

class VehicleCardGrid extends StatelessWidget {
  final List<Map<String, dynamic>> carList = [
    {
      'name': 'Tesla Model S',
      'imageUrl':
          'https://hips.hearstapps.com/hmg-prod/images/2024-tesla-model-s-107-6572200e43fa1.jpg?crop=0.497xw:0.560xh;0.243xw,0.232xh&resize=768:*',
      'rent': 120,
    },
    {
      'name': 'BMW i8',
      'imageUrl':
          'https://www.shutterstock.com/image-photo/kuala-lumpur-malaysia-april-7-600nw-2143397457.jpg',
      'rent': 200,
    },
    {
      'name': 'Thar',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpBe_O3wM7b3hfln5TYnbfTO7QpabGBt4w_Q&s',
      'rent': 90,
    },
    {
      'name': 'Nissan GT-R',
      'imageUrl':
          'https://cdni.autocarindia.com/Utils/ImageResizer.ashx?n=https://cdni.autocarindia.com/ExtraImages/20240628064514_Untitled%20design%20_%202024_06_28T184501.816.jpg',
      'rent': 150,
    },
    {
      'name': 'Ford Mustang',
      'imageUrl':
          'https://upload.wikimedia.org/wikipedia/commons/7/7f/1965_Ford_Mustang_2D_Hardtop_Front.jpg',
      'rent': 180,
    },
    {
      'name': 'Chevrolet',
      'imageUrl':
          'https://images.thequint.com/thequint%2F2016-02%2F15ee3c7d-b1d0-4354-a635-30d0f51d828f%2FCruze-hero.jpg',
      'rent': 170,
    },
    {
      'name': 'Porsche 911',
      'imageUrl':
          'https://assets.porsche.com/dwaas-infohub/-/media/Project/DealerWebsites/SharedDealersWebsite/Master-Model-Page/911-Turbo/General-Model/General-model_911-Turbo.jpg?rev=5efc15cd5f68412c8ed778e0c199ed16',
      'rent': 300,
    },
    {
      'name': 'Lamborghini Huracan',
      'imageUrl':
          'https://stimg.cardekho.com/images/carexteriorimages/930x620/Lamborghini/Huracan-EVO/10643/1690010999692/front-left-side-47.jpg',
      'rent': 500,
    },
    {
      'name': 'Ferrari 488',
      'imageUrl':
          'https://sbraceengineering.co.uk/wp-content/uploads/Ferrari-488-GTB.jpg',
      'rent': 450,
    },
    {
      'name': 'Maserati Ghibli',
      'imageUrl':
          'https://imgd-ct.aeplcdn.com/664x415/n/j0irpsa_1476670.jpg?q=80',
      'rent': 220,
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
      itemCount: carList.length,
      itemBuilder: (context, index) {
        final car = carList[index];
        return VehicleCard(
          carImageUrl: car['imageUrl'],
          carName: car['name'],
          rentAmount: car['rent'],
          onBookPressed: () {
            print('${car['name']} Book button pressed');
          },
        );
      },
    );
  }
}
