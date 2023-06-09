import 'package:e_commerce/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

class ApiPage extends StatefulWidget {
  const ApiPage({super.key});

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  List apiList = [];

  @override
  void initState() {
    Provider.of<TCMBBilgiAmacliKurlarProvider>(context, listen: false)
        .fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(),
      floatingActionButton: floatActionButton(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Consumer<TCMBBilgiAmacliKurlarProvider>(
            builder: (context, value, child) =>
                value.tcbmBilgiAmacliKurlar!.isEmpty
                    ? loadingListWidget()
                    : ListView.builder(
                        itemCount: value.tcbmBilgiAmacliKurlar!.length,
                        itemBuilder: (context, index) => Card(
                          elevation: 2.0,
                          child: ListTile(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            title: Text(
                                'Name: ${value.tcbmBilgiAmacliKurlar![index].isim}'),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Kod:  ${value.tcbmBilgiAmacliKurlar![index].kod}',
                                ),
                                Text(
                                  'Exchange Rate:  ${value.tcbmBilgiAmacliKurlar![index].exchangeRate}',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
          ),
        ),
      ),
    );
  }

  AppBar appBarWidget() {
    return AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      title: const Text(
        'API\'s of TCMB CURRECY RATES',
        style: TextStyle(
          fontSize: 20.0,
          color: Color(0xff0a1034),
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.start,
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: Color(0xff0a1034),
          size: 24,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  Center loadingListWidget() {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 200.0),
          LoadingAnimationWidget.discreteCircle(
            color: Colors.blue,
            size: 50.0,
          ),
          const SizedBox(height: 20.0),
          const Text('LOADING LIST'),
        ],
      ),
    );
  }

  FloatingActionButton floatActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Provider.of<TCMBBilgiAmacliKurlarProvider>(context, listen: false)
            .fetchData();
      },
      backgroundColor: const Color.fromARGB(255, 9, 70, 121),
      tooltip: 'Refresh',
      child: const Icon(Icons.refresh),
    );
  }
}
