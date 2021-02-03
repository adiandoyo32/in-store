part of 'package:in_store_flutter/screens/screens.dart';

class ProductGrid extends StatefulWidget {
  @override
  _ProductGridState createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  @override
  void initState() {
    super.initState();
    _loadProduct();
  }

  void _loadProduct() async {
    context.read<ProductCubit>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {
          if (state is ProductError) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('error'),
              ),
            );
          }
        },
        builder: (BuildContext context, state) {
          if (state is ProductLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductLoaded) {
            return GridView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: state.products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12.0,
                crossAxisSpacing: 12.0,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                return ProductCard(
                  product: state.products[index],
                  press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetail(
                        product: state.products[index],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Text("fuck off");
          }
        },
      ),
    );
  }
}
