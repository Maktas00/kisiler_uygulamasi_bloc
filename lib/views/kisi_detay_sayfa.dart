import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi_bloc/cubit/kisi_detay_cubit.dart';
import 'package:kisiler_uygulamasi_bloc/entity/kisiler.dart';

class KisiDetaySayfa extends StatefulWidget {
  Kisiler kisi;


  KisiDetaySayfa({required this.kisi});

  @override
  State<KisiDetaySayfa> createState() => _KisiDetaySayfaState();
}

class _KisiDetaySayfaState extends State<KisiDetaySayfa> {
  var tfkisiad=TextEditingController();
  var tfkisitel=TextEditingController();

  @override
  void initState() {
    super.initState();
    var kisi=widget.kisi;
    tfkisiad.text=kisi.kisi_ad;
    tfkisitel.text=kisi.kisi_tel;


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kişi Detay"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50,right: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfkisiad,decoration: const InputDecoration(hintText: "Kişi Ad"),),
              TextField(controller: tfkisitel,decoration: const InputDecoration(hintText: "Kişi Tel"),),
              ElevatedButton(onPressed: (){
                context.read<KisiDetayCubit>().guncelle(widget.kisi.kisi_id, tfkisiad.text, tfkisitel.text);

              }, child: const Text("GÜNCELLE"))

            ],
          ),
        ),
      ),
    );
  }
}
