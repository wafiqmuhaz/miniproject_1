import 'package:flutter/material.dart';
import 'package:miniproject_1/model/product_model.dart';

class ListViewWidget extends StatelessWidget {
  final List<ProductModel> data;
  final double? iconSize;
  final int? quantity;

  const ListViewWidget({Key? key, required this.data, this.iconSize, this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      itemCount: data.length,
      itemBuilder: (context, int index) {
        final item = data[index];
        return Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    offset: const Offset(2, 2),
                    blurRadius: 3,
                  ),
                ],
              ),
              child: ListTile(
                leading: Image.network(
                  item.image, 
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
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
                      style:
                          const TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Price: ${item.price.toString()}',
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black),
                        ),
                        Text(
                          'Quantity: ${item.price.toString()}',
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black),
                        ),
                      ],
                    )
                    
                  ],
                ),
                onTap: () {
                 
                },
              ),
            ),
          ],
        );
      },
    );
  }


}
