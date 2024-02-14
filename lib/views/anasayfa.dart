import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi_bloc/cubit/anasayfa_cubit.dart';
import 'package:kisiler_uygulamasi_bloc/entity/kisiler.dart';
import 'package:kisiler_uygulamasi_bloc/views/kisi_detay_sayfa.dart';
import 'package:kisiler_uygulamasi_bloc/views/kisi_kayit_sayfa.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  bool aramaYapiliyorMu=false;
  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().kisileriYukle();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyorMu ?
         TextField(decoration: const InputDecoration(hintText: "Ara"),
        onChanged:(aramaSonucu){
          context.read<AnasayfaCubit>().ara(aramaSonucu);

             },
         )


        :const Text("Kişiler"),
        actions: [
          aramaYapiliyorMu ?
          IconButton(onPressed: (){
            context.read<AnasayfaCubit>().kisileriYukle();
            setState(() {
              aramaYapiliyorMu=false;
            });

          },
              icon: Icon(Icons.cancel)):
          IconButton(onPressed: (){
           setState(() {
             aramaYapiliyorMu=true;
           });

          },
              icon: Icon(Icons.search)),
        ],
      ),
      body: BlocBuilder<AnasayfaCubit,List<Kisiler>>(

        builder: (context,kisilerListesi){
          if(kisilerListesi.isNotEmpty) {
            return ListView.builder(
                itemCount: kisilerListesi.length,
                itemBuilder: (context, indeks) {
                  var kisi = kisilerListesi[indeks];
                  return GestureDetector(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>KisiDetaySayfa(kisi: kisi)))
        .then((value) {print("Anasayfaya Dönüldü"); });
    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("${kisi.kisi_ad} - ${kisi.kisi_tel}"),
                            Spacer(),
                            IconButton(onPressed: (){
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text("${kisi.kisi_ad} silinsin mi?"),
                                    action: SnackBarAction(
                                      label: "Evet",
                                      onPressed: (){
                                        context.read<AnasayfaCubit>().sil(kisi.kisi_id);
                                      },
                                    ),
                                  ),

                              );
                    
                            }, icon: const Icon(Icons.delete_outline),color: Colors.black54,),
                          ],
                        ),
                      ),
                    ),
                  );
                }
            );
          }


          else{
            return const Center();
          }

        },

      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const KisiKayitSayfa()))
                .then((value){print("Anasayfaya Dönüldü");});

          },
        child: const Icon(Icons.add),
      ),
    );
  }
}
