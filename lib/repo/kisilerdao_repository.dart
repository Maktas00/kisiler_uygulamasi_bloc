import 'package:kisiler_uygulamasi_bloc/entity/kisiler.dart';

class KisilerDaoRepository{
  Future<void> kisiKayit(String kisi_ad,String kisi_tel) async{
    print("Kişi kayıt :  $kisi_ad - $kisi_tel");

  }
  Future<void> kisiguncelle(String kisi_id,String kisi_ad,String kisi_tel) async{
    print("Kişi kayıt : $kisi_id - $kisi_ad - $kisi_tel");

  }
  Future<List<Kisiler>> tumKisileriAl() async{
    var KisilerListesi=<Kisiler>[];
    var k1=Kisiler(kisi_id: "1", kisi_ad: "Ahmet", kisi_tel: "1111");
    var k2=Kisiler(kisi_id: "2", kisi_ad: "Zeynep", kisi_tel: "2222");
    var k3=Kisiler(kisi_id: "3", kisi_ad: "Beyza", kisi_tel: "3333");
    KisilerListesi.add(k1);
    KisilerListesi.add(k2);
    KisilerListesi.add(k3);

    return KisilerListesi;



  }
  Future<List<Kisiler>> kisiAra(String aramakelimesi) async{
    var KisilerListesi=<Kisiler>[];
    var k1=Kisiler(kisi_id: "1", kisi_ad: "Ahmet", kisi_tel: "1111");
    KisilerListesi.add(k1);

    return KisilerListesi;



  }
  Future<void> kisiSil(String kisi_id) async{
    print("Kişi sil : $kisi_id");

  }

}
