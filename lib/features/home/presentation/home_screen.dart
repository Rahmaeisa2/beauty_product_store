import 'package:beauty_product_store/features/home/presentation/widgets/category_list.dart';
import 'package:beauty_product_store/features/home/presentation/widgets/header_widget.dart';
import 'package:beauty_product_store/features/home/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';
import '../../../core/di/service_locator.dart';
import '../../location/presentation/cubit/location_cibit.dart';
import '../../location/presentation/cubit/location_state.dart';
import '../../location/presentation/screen/map_picker.dart';
import '../data/category_model.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final products = [
    {
      'name': 'Gentle Cleanser',
      'image': 'https://dummyjson.com/image/200x200',
      'price': 18.0,
    },
    {
      'name': 'Gentle Cleanser',
      'image': 'https://dummyjson.com/image/200x200',
      'price': 18.0,
    }, {
      'name': 'Gentle Cleanser',
      'image': 'https://dummyjson.com/image/200x200',
      'price': 18.0,
    }, {
      'name': 'Gentle Cleanser',
      'image': 'https://dummyjson.com/image/200x200',
      'price': 18.0,
    },
    {
      'name': 'Daily Moisturizer',
      'image': 'https://dummyjson.com/image/200x200',
      'price': 24.0,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:BlocProvider(
          create: (_) => getIt<LocationCubit>()..fetchCurrentLocation(),
          child: BlocBuilder<LocationCubit, LocationState>(
            builder: (context, state) {
              if (state is LocationLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is LocationSuccess) {
                print(state.location.long);
                return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.location_on_outlined),
                       Flexible(
                        child: TextButton(onPressed: ()async {
                          final selectedPosition = await Navigator.push<LatLng>(
                            context,
                            MaterialPageRoute(
                                builder: (_) => MapPickerScreen(
                                  location: state.location,
                                ),
                              ),
                            );
                                                  },
                          child: Text(
                            state.location.address,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 18
                            ),
                          ),
                        ),)
                    ],
                );
              }

              if (state is LocationFailure) {
                return Center(
                  child: Text(
                    'Location Error:\n${state.message}',
                    textAlign: TextAlign.center,
                  ),
                );
              }

              return const Center(child: Text('Waiting for location...'));
            },
          ),
        ) ,


        actions: [
          IconButton(
            onPressed: () {
              // Open search screen
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              // Open cart screen
            },
            icon: const Icon(Icons.shopping_bag_outlined),
          ),
        ],
      ),

      body:SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Category" , style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(
                  height: 7,
                ),
                const SizedBox(height: 12),
                CategoryList(
                  categories: categories,
                  onCategoryTap: (category) {
                  },
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(16),
                  itemCount: products.length,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.68,
                  ),
                  itemBuilder: (context, index) {
                    final product = products[index];
            
                    return ProductCard(
                      name: product['name'] as String,
                      image: product['image'] as String,
                      price: product['price'] as double,
                    );
                  },
                )
              ],
            )
          ],
        ),
      ));
  }}