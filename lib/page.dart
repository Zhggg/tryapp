import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tryapp/category_model.dart';
import 'package:tryapp/category_provider.dart';

class Okay extends ConsumerStatefulWidget {
  const Okay({super.key});

  @override
  ConsumerState<Okay> createState() => _OkayState();
}

class _OkayState extends ConsumerState<Okay> {
  int selectedCategoryIndex = -1;
  @override
  Widget build(BuildContext context) {
    final cProvider = ref.watch(categoryProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("data"),
      ),
      body: cProvider.when(
        data: (cProvider) {
          List<CategoryModel> categoryList = cProvider.map((e) => e).toList();
          return Column(
            children: [
              const Text('Categories'),
              Expanded(
                child: ListView.builder(
                  itemCount: categoryList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        categoryList[index].categoryName,
                      ),
                      
                      onTap: () {
                        setState(() {
                          selectedCategoryIndex = index;
                        });
                      },
                    );
                  },
                ),
              ),
              const Text('Products'),
              Expanded(
                child: selectedCategoryIndex != -1
                    ? ListView.builder(
                        itemCount:
                            categoryList[selectedCategoryIndex].products.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(categoryList[selectedCategoryIndex]
                                .products[index]
                                .productName),
                          );
                        },
                      )
                    : const Center(
                        child: Text('Select a category to see products.'),
                      ),
              ),
            ],
          );
        },
        error: (err, s) => Text(err.toString()),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
