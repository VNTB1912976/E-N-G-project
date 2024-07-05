import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _VChit = prefs.getInt('ff_VChit') ?? _VChit;
    });
    _safeInit(() {
      _currentconnect = prefs.getString('ff_currentconnect') ?? _currentconnect;
    });
    _safeInit(() {
      _curentid = prefs.getString('ff_curentid') ?? _curentid;
    });
    _safeInit(() {
      _VCtho = prefs.getInt('ff_VCtho') ?? _VCtho;
    });
    _safeInit(() {
      _timetho = prefs.getInt('ff_timetho') ?? _timetho;
    });
    _safeInit(() {
      _timehit = prefs.getInt('ff_timehit') ?? _timehit;
    });
    _safeInit(() {
      _solanhit = prefs.getInt('ff_solanhit') ?? _solanhit;
    });
    _safeInit(() {
      _solantho = prefs.getInt('ff_solantho') ?? _solantho;
    });
    _safeInit(() {
      _loaigiatri = prefs.getInt('ff_loaigiatri') ?? _loaigiatri;
    });
    _safeInit(() {
      _listVChit =
          prefs.getStringList('ff_listVChit')?.map(int.parse).toList() ??
              _listVChit;
    });
    _safeInit(() {
      _listTimehit =
          prefs.getStringList('ff_listTimehit')?.map(int.parse).toList() ??
              _listTimehit;
    });
    _safeInit(() {
      _listSolanhit =
          prefs.getStringList('ff_listSolanhit')?.map(int.parse).toList() ??
              _listSolanhit;
    });
    _safeInit(() {
      _listVCtho =
          prefs.getStringList('ff_listVCtho')?.map(int.parse).toList() ??
              _listVCtho;
    });
    _safeInit(() {
      _listTimetho =
          prefs.getStringList('ff_listTimetho')?.map(int.parse).toList() ??
              _listTimetho;
    });
    _safeInit(() {
      _listSolantho =
          prefs.getStringList('ff_listSolantho')?.map(int.parse).toList() ??
              _listSolantho;
    });
    _safeInit(() {
      _ngayhomtruoc = prefs.getInt('ff_ngayhomtruoc') ?? _ngayhomtruoc;
    });
    _safeInit(() {
      _ngayhomnay = prefs.getInt('ff_ngayhomnay') ?? _ngayhomnay;
    });
    _safeInit(() {
      _solantaphomnay = prefs.getInt('ff_solantaphomnay') ?? _solantaphomnay;
    });
    _safeInit(() {
      _solantapluyenhomnay2 =
          prefs.getInt('ff_solantapluyenhomnay2') ?? _solantapluyenhomnay2;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _VChit = 0;
  int get VChit => _VChit;
  set VChit(int value) {
    _VChit = value;
    prefs.setInt('ff_VChit', value);
  }

  String _currentconnect = '';
  String get currentconnect => _currentconnect;
  set currentconnect(String value) {
    _currentconnect = value;
    prefs.setString('ff_currentconnect', value);
  }

  String _curentid = '';
  String get curentid => _curentid;
  set curentid(String value) {
    _curentid = value;
    prefs.setString('ff_curentid', value);
  }

  int _VCtho = 0;
  int get VCtho => _VCtho;
  set VCtho(int value) {
    _VCtho = value;
    prefs.setInt('ff_VCtho', value);
  }

  int _timetho = 0;
  int get timetho => _timetho;
  set timetho(int value) {
    _timetho = value;
    prefs.setInt('ff_timetho', value);
  }

  int _timehit = 0;
  int get timehit => _timehit;
  set timehit(int value) {
    _timehit = value;
    prefs.setInt('ff_timehit', value);
  }

  int _solanhit = 0;
  int get solanhit => _solanhit;
  set solanhit(int value) {
    _solanhit = value;
    prefs.setInt('ff_solanhit', value);
  }

  int _solantho = 0;
  int get solantho => _solantho;
  set solantho(int value) {
    _solantho = value;
    prefs.setInt('ff_solantho', value);
  }

  int _loaigiatri = 0;
  int get loaigiatri => _loaigiatri;
  set loaigiatri(int value) {
    _loaigiatri = value;
    prefs.setInt('ff_loaigiatri', value);
  }

  int _checknull = 0;
  int get checknull => _checknull;
  set checknull(int value) {
    _checknull = value;
  }

  int _checknull4 = 0;
  int get checknull4 => _checknull4;
  set checknull4(int value) {
    _checknull4 = value;
  }

  List<int> _listVChit = [0];
  List<int> get listVChit => _listVChit;
  set listVChit(List<int> value) {
    _listVChit = value;
    prefs.setStringList(
        'ff_listVChit', value.map((x) => x.toString()).toList());
  }

  void addToListVChit(int value) {
    listVChit.add(value);
    prefs.setStringList(
        'ff_listVChit', _listVChit.map((x) => x.toString()).toList());
  }

  void removeFromListVChit(int value) {
    listVChit.remove(value);
    prefs.setStringList(
        'ff_listVChit', _listVChit.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromListVChit(int index) {
    listVChit.removeAt(index);
    prefs.setStringList(
        'ff_listVChit', _listVChit.map((x) => x.toString()).toList());
  }

  void updateListVChitAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    listVChit[index] = updateFn(_listVChit[index]);
    prefs.setStringList(
        'ff_listVChit', _listVChit.map((x) => x.toString()).toList());
  }

  void insertAtIndexInListVChit(int index, int value) {
    listVChit.insert(index, value);
    prefs.setStringList(
        'ff_listVChit', _listVChit.map((x) => x.toString()).toList());
  }

  List<int> _listTimehit = [0];
  List<int> get listTimehit => _listTimehit;
  set listTimehit(List<int> value) {
    _listTimehit = value;
    prefs.setStringList(
        'ff_listTimehit', value.map((x) => x.toString()).toList());
  }

  void addToListTimehit(int value) {
    listTimehit.add(value);
    prefs.setStringList(
        'ff_listTimehit', _listTimehit.map((x) => x.toString()).toList());
  }

  void removeFromListTimehit(int value) {
    listTimehit.remove(value);
    prefs.setStringList(
        'ff_listTimehit', _listTimehit.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromListTimehit(int index) {
    listTimehit.removeAt(index);
    prefs.setStringList(
        'ff_listTimehit', _listTimehit.map((x) => x.toString()).toList());
  }

  void updateListTimehitAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    listTimehit[index] = updateFn(_listTimehit[index]);
    prefs.setStringList(
        'ff_listTimehit', _listTimehit.map((x) => x.toString()).toList());
  }

  void insertAtIndexInListTimehit(int index, int value) {
    listTimehit.insert(index, value);
    prefs.setStringList(
        'ff_listTimehit', _listTimehit.map((x) => x.toString()).toList());
  }

  List<int> _listSolanhit = [0];
  List<int> get listSolanhit => _listSolanhit;
  set listSolanhit(List<int> value) {
    _listSolanhit = value;
    prefs.setStringList(
        'ff_listSolanhit', value.map((x) => x.toString()).toList());
  }

  void addToListSolanhit(int value) {
    listSolanhit.add(value);
    prefs.setStringList(
        'ff_listSolanhit', _listSolanhit.map((x) => x.toString()).toList());
  }

  void removeFromListSolanhit(int value) {
    listSolanhit.remove(value);
    prefs.setStringList(
        'ff_listSolanhit', _listSolanhit.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromListSolanhit(int index) {
    listSolanhit.removeAt(index);
    prefs.setStringList(
        'ff_listSolanhit', _listSolanhit.map((x) => x.toString()).toList());
  }

  void updateListSolanhitAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    listSolanhit[index] = updateFn(_listSolanhit[index]);
    prefs.setStringList(
        'ff_listSolanhit', _listSolanhit.map((x) => x.toString()).toList());
  }

  void insertAtIndexInListSolanhit(int index, int value) {
    listSolanhit.insert(index, value);
    prefs.setStringList(
        'ff_listSolanhit', _listSolanhit.map((x) => x.toString()).toList());
  }

  List<int> _listVCtho = [0];
  List<int> get listVCtho => _listVCtho;
  set listVCtho(List<int> value) {
    _listVCtho = value;
    prefs.setStringList(
        'ff_listVCtho', value.map((x) => x.toString()).toList());
  }

  void addToListVCtho(int value) {
    listVCtho.add(value);
    prefs.setStringList(
        'ff_listVCtho', _listVCtho.map((x) => x.toString()).toList());
  }

  void removeFromListVCtho(int value) {
    listVCtho.remove(value);
    prefs.setStringList(
        'ff_listVCtho', _listVCtho.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromListVCtho(int index) {
    listVCtho.removeAt(index);
    prefs.setStringList(
        'ff_listVCtho', _listVCtho.map((x) => x.toString()).toList());
  }

  void updateListVCthoAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    listVCtho[index] = updateFn(_listVCtho[index]);
    prefs.setStringList(
        'ff_listVCtho', _listVCtho.map((x) => x.toString()).toList());
  }

  void insertAtIndexInListVCtho(int index, int value) {
    listVCtho.insert(index, value);
    prefs.setStringList(
        'ff_listVCtho', _listVCtho.map((x) => x.toString()).toList());
  }

  List<int> _listTimetho = [0];
  List<int> get listTimetho => _listTimetho;
  set listTimetho(List<int> value) {
    _listTimetho = value;
    prefs.setStringList(
        'ff_listTimetho', value.map((x) => x.toString()).toList());
  }

  void addToListTimetho(int value) {
    listTimetho.add(value);
    prefs.setStringList(
        'ff_listTimetho', _listTimetho.map((x) => x.toString()).toList());
  }

  void removeFromListTimetho(int value) {
    listTimetho.remove(value);
    prefs.setStringList(
        'ff_listTimetho', _listTimetho.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromListTimetho(int index) {
    listTimetho.removeAt(index);
    prefs.setStringList(
        'ff_listTimetho', _listTimetho.map((x) => x.toString()).toList());
  }

  void updateListTimethoAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    listTimetho[index] = updateFn(_listTimetho[index]);
    prefs.setStringList(
        'ff_listTimetho', _listTimetho.map((x) => x.toString()).toList());
  }

  void insertAtIndexInListTimetho(int index, int value) {
    listTimetho.insert(index, value);
    prefs.setStringList(
        'ff_listTimetho', _listTimetho.map((x) => x.toString()).toList());
  }

  List<int> _listSolantho = [0];
  List<int> get listSolantho => _listSolantho;
  set listSolantho(List<int> value) {
    _listSolantho = value;
    prefs.setStringList(
        'ff_listSolantho', value.map((x) => x.toString()).toList());
  }

  void addToListSolantho(int value) {
    listSolantho.add(value);
    prefs.setStringList(
        'ff_listSolantho', _listSolantho.map((x) => x.toString()).toList());
  }

  void removeFromListSolantho(int value) {
    listSolantho.remove(value);
    prefs.setStringList(
        'ff_listSolantho', _listSolantho.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromListSolantho(int index) {
    listSolantho.removeAt(index);
    prefs.setStringList(
        'ff_listSolantho', _listSolantho.map((x) => x.toString()).toList());
  }

  void updateListSolanthoAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    listSolantho[index] = updateFn(_listSolantho[index]);
    prefs.setStringList(
        'ff_listSolantho', _listSolantho.map((x) => x.toString()).toList());
  }

  void insertAtIndexInListSolantho(int index, int value) {
    listSolantho.insert(index, value);
    prefs.setStringList(
        'ff_listSolantho', _listSolantho.map((x) => x.toString()).toList());
  }

  int _kiemtraketnoimoi = 0;
  int get kiemtraketnoimoi => _kiemtraketnoimoi;
  set kiemtraketnoimoi(int value) {
    _kiemtraketnoimoi = value;
  }

  int _ngayhomtruoc = 0;
  int get ngayhomtruoc => _ngayhomtruoc;
  set ngayhomtruoc(int value) {
    _ngayhomtruoc = value;
    prefs.setInt('ff_ngayhomtruoc', value);
  }

  int _ngayhomnay = 0;
  int get ngayhomnay => _ngayhomnay;
  set ngayhomnay(int value) {
    _ngayhomnay = value;
    prefs.setInt('ff_ngayhomnay', value);
  }

  int _solantaphomnay = 0;
  int get solantaphomnay => _solantaphomnay;
  set solantaphomnay(int value) {
    _solantaphomnay = value;
    prefs.setInt('ff_solantaphomnay', value);
  }

  int _solantapluyenhomnay2 = 0;
  int get solantapluyenhomnay2 => _solantapluyenhomnay2;
  set solantapluyenhomnay2(int value) {
    _solantapluyenhomnay2 = value;
    prefs.setInt('ff_solantapluyenhomnay2', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
