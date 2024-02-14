import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi_bloc/entity/kisiler.dart';
import 'package:kisiler_uygulamasi_bloc/repo/kisilerdao_repository.dart';

class AnasayfaCubit extends Cubit<List<Kisiler>>{
  AnasayfaCubit():super(<Kisiler>[]);

  var krepo=KisilerDaoRepository();
  Future<void> kisileriYukle() async{
    var liste=await krepo.tumKisileriAl();
    emit(liste);
  }
  Future<void> ara(String aramakelimesi) async{
    var liste=await krepo.kisiAra(aramakelimesi);
    emit(liste);
  }
  Future<void> sil(String kisi_id) async{
    await krepo.kisiSil(kisi_id);
    await kisileriYukle();

  }

}