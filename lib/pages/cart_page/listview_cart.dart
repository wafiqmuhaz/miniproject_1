import 'package:flutter/material.dart';
import 'package:miniproject_1/model/cart_model.dart';
import 'package:miniproject_1/model/product_model.dart';

class ListViewWidget extends StatelessWidget {
  final List<ProductModel> data;
  final double? iconSize;
  final List<Products> cartProduct;

  const ListViewWidget(
      {Key? key, required this.data, this.iconSize, required this.cartProduct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      itemCount: data.length,
      itemBuilder: (context, int index) {
        final item = data[index];
        
        return Column(
          children: [
            ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              leading: SizedBox(
                width: 80,
                height: 80,
                child: Image.network(
                  item.image,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                item.title,
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.category,
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price: ${item.price.toString()}',
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      buttonAddMinQuantity(id:item.id)
                    ],
                  )
                ],
              ),
              onTap: () {},
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => const Divider(),
    );
  }

  int getQuantity(int producId) {
    return cartProduct
        .firstWhere((item) => item.productId == producId)
        .quantity;
  }

   buttonAddMinQuantity({required int id})  {
    final quantity = getQuantity(id);
    
    return Row(
    
        children: [
          IconButton(onPressed: () => {}, icon: const Icon(Icons.add)),
          const SizedBox(
            width: 5,
          ),
          Text(
            quantity.toString(),
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
          const SizedBox(
            width: 5,
          ),
          IconButton(onPressed: () => {}, icon: const Icon(Icons.minimize_rounded)),
        ],
      );

  }
  }
