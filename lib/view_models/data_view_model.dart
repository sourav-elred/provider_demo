import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataState {
  final String currentData;
  final List<String> dataList;
  DataState(this.currentData, this.dataList);
}

final dataNotifierProvider =
    StateNotifierProvider<DataNotifier, DataState>((ref) {
  return DataNotifier();
});

class DataNotifier extends StateNotifier<DataState> {
  DataNotifier() : super(DataState('Initial Data', []));

  void updateData(String newData) {
    state = DataState(newData, [...state.dataList, newData]);
  }

  void clearData() {
    state = DataState('No Data', []);
  }

  void removeDataAt(int index) {
    List<String> updatedList = List.from(state.dataList)..removeAt(index);
    String newCurrentData =
        updatedList.isNotEmpty ? updatedList.last : 'No Data';
    state = DataState(newCurrentData, updatedList);
  }
}
