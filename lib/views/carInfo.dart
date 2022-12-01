import 'package:flutter/material.dart';
import 'package:opdracht7/models/post.dart';
import '../services/remote_service.dart';

class CarInfo extends StatefulWidget {
  const CarInfo({super.key, required this.carInfo});

  final String carInfo;

  @override
  State<CarInfo> createState() => _CarInfoState();
}

class _CarInfoState extends State<CarInfo> {
  List<Post>? posts;
  var isLoaded = false;

  String kentekenNietGevonden = 'Kan het opgegeven kenteken niet vinden';

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    posts = await RemoteService().getPosts(widget.carInfo);
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.carInfo),
      ),
      body: Center(
          child: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: posts?.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.time_to_leave),
                  ),
                  title: Text(
                    "Merk:  ${posts![index].merk}",
                    style: const TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Kenteken:  ${posts![index].kenteken}'),
                          Text('Type:  ${posts![index].type}'),
                          Text('EersteKleur:  ${posts![index].eersteKleur}'),
                          Text('TweedeKleur:  ${posts![index].tweedeKleur}'),
                          Text(
                              'DatumEersteToelating:  ${posts![index].datumEersteToelating}'),
                          Text(
                              'VervaldatumAPK:  ${posts![index].vervaldatumApk}'),
                          Text(
                              'AantalZitplaatsen:  ${posts![index].aantalZitplaatsen}'),
                          Text(
                              'Handelsbenaming:  ${posts![index].handelsbenaming}'),
                          Text('Inrichting:  ${posts![index].inrichting}'),
                          Text(
                              'Voertuigsoort:  ${posts![index].voertuigsoort}'),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      )),
    );
  }
}
