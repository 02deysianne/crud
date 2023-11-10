import 'package:crud/tarefa_model.dart';
import 'package:hive/hive.dart';

class TarefaBox {
  addTarefa(Tarefa tarefa) async {
    var box = await Hive.box<Tarefa>('tarefa');
    box.add(tarefa);
  }

  List<Tarefa> mostrarTarefas() {
    var box = Hive.box<Tarefa>('tarefa');
    return box.values.toList();
  }

  deletarTarefa(int index) async {
    var box = await Hive.box<Tarefa>('tarefa');
    await box.deleteAt(index);
  }

  editTarefa(int index, Tarefa novaTarefa) async {
    final box = await Hive.box<Tarefa>('Tarefa');
    await box.putAt(index, novaTarefa);
  }
}
