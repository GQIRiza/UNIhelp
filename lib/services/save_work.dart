import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unihelp/models/work.dart';

void saveWorkToFirestore(Work work) {
  // Сохранение данных в Firestore
  FirebaseFirestore.instance.collection('works').add({
    'workName': work.workName,
    'workDescription': work.workDescription,
    'fileLink': work.fileLink,
    'selectedUni': work.selectedUni,
    'selectedDiscipline': work.selectedDiscipline,
    'selectedType': work.selectedType,
    'selectedDateTime': work.selectedDateTime,
    'userUid': work.userUid,
  }).then((value) {
    // Действия после успешного сохранения данных
    print('Данные успешно сохранены в базе данных Firestore');
  }).catchError((error) {
    // Обработка ошибок при сохранении данных
    print('Ошибка при сохранении данных: $error');
  });
}
