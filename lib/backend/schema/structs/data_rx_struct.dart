// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DataRxStruct extends FFFirebaseStruct {
  DataRxStruct({
    int? datatho,
    int? datatho1,
    int? datatho2,
    String? currentnameconnect,
    String? currentidconect,
    int? datahit,
    int? datahit1,
    int? aatahit2,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _datatho = datatho,
        _datatho1 = datatho1,
        _datatho2 = datatho2,
        _currentnameconnect = currentnameconnect,
        _currentidconect = currentidconect,
        _datahit = datahit,
        _datahit1 = datahit1,
        _aatahit2 = aatahit2,
        super(firestoreUtilData);

  // "Datatho" field.
  int? _datatho;
  int get datatho => _datatho ?? 0;
  set datatho(int? val) => _datatho = val;

  void incrementDatatho(int amount) => datatho = datatho + amount;

  bool hasDatatho() => _datatho != null;

  // "Datatho1" field.
  int? _datatho1;
  int get datatho1 => _datatho1 ?? 0;
  set datatho1(int? val) => _datatho1 = val;

  void incrementDatatho1(int amount) => datatho1 = datatho1 + amount;

  bool hasDatatho1() => _datatho1 != null;

  // "Datatho2" field.
  int? _datatho2;
  int get datatho2 => _datatho2 ?? 0;
  set datatho2(int? val) => _datatho2 = val;

  void incrementDatatho2(int amount) => datatho2 = datatho2 + amount;

  bool hasDatatho2() => _datatho2 != null;

  // "currentnameconnect" field.
  String? _currentnameconnect;
  String get currentnameconnect => _currentnameconnect ?? '';
  set currentnameconnect(String? val) => _currentnameconnect = val;

  bool hasCurrentnameconnect() => _currentnameconnect != null;

  // "currentidconect" field.
  String? _currentidconect;
  String get currentidconect => _currentidconect ?? '';
  set currentidconect(String? val) => _currentidconect = val;

  bool hasCurrentidconect() => _currentidconect != null;

  // "Datahit" field.
  int? _datahit;
  int get datahit => _datahit ?? 0;
  set datahit(int? val) => _datahit = val;

  void incrementDatahit(int amount) => datahit = datahit + amount;

  bool hasDatahit() => _datahit != null;

  // "datahit1" field.
  int? _datahit1;
  int get datahit1 => _datahit1 ?? 0;
  set datahit1(int? val) => _datahit1 = val;

  void incrementDatahit1(int amount) => datahit1 = datahit1 + amount;

  bool hasDatahit1() => _datahit1 != null;

  // "aatahit2" field.
  int? _aatahit2;
  int get aatahit2 => _aatahit2 ?? 0;
  set aatahit2(int? val) => _aatahit2 = val;

  void incrementAatahit2(int amount) => aatahit2 = aatahit2 + amount;

  bool hasAatahit2() => _aatahit2 != null;

  static DataRxStruct fromMap(Map<String, dynamic> data) => DataRxStruct(
        datatho: castToType<int>(data['Datatho']),
        datatho1: castToType<int>(data['Datatho1']),
        datatho2: castToType<int>(data['Datatho2']),
        currentnameconnect: data['currentnameconnect'] as String?,
        currentidconect: data['currentidconect'] as String?,
        datahit: castToType<int>(data['Datahit']),
        datahit1: castToType<int>(data['datahit1']),
        aatahit2: castToType<int>(data['aatahit2']),
      );

  static DataRxStruct? maybeFromMap(dynamic data) =>
      data is Map ? DataRxStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Datatho': _datatho,
        'Datatho1': _datatho1,
        'Datatho2': _datatho2,
        'currentnameconnect': _currentnameconnect,
        'currentidconect': _currentidconect,
        'Datahit': _datahit,
        'datahit1': _datahit1,
        'aatahit2': _aatahit2,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Datatho': serializeParam(
          _datatho,
          ParamType.int,
        ),
        'Datatho1': serializeParam(
          _datatho1,
          ParamType.int,
        ),
        'Datatho2': serializeParam(
          _datatho2,
          ParamType.int,
        ),
        'currentnameconnect': serializeParam(
          _currentnameconnect,
          ParamType.String,
        ),
        'currentidconect': serializeParam(
          _currentidconect,
          ParamType.String,
        ),
        'Datahit': serializeParam(
          _datahit,
          ParamType.int,
        ),
        'datahit1': serializeParam(
          _datahit1,
          ParamType.int,
        ),
        'aatahit2': serializeParam(
          _aatahit2,
          ParamType.int,
        ),
      }.withoutNulls;

  static DataRxStruct fromSerializableMap(Map<String, dynamic> data) =>
      DataRxStruct(
        datatho: deserializeParam(
          data['Datatho'],
          ParamType.int,
          false,
        ),
        datatho1: deserializeParam(
          data['Datatho1'],
          ParamType.int,
          false,
        ),
        datatho2: deserializeParam(
          data['Datatho2'],
          ParamType.int,
          false,
        ),
        currentnameconnect: deserializeParam(
          data['currentnameconnect'],
          ParamType.String,
          false,
        ),
        currentidconect: deserializeParam(
          data['currentidconect'],
          ParamType.String,
          false,
        ),
        datahit: deserializeParam(
          data['Datahit'],
          ParamType.int,
          false,
        ),
        datahit1: deserializeParam(
          data['datahit1'],
          ParamType.int,
          false,
        ),
        aatahit2: deserializeParam(
          data['aatahit2'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'DataRxStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DataRxStruct &&
        datatho == other.datatho &&
        datatho1 == other.datatho1 &&
        datatho2 == other.datatho2 &&
        currentnameconnect == other.currentnameconnect &&
        currentidconect == other.currentidconect &&
        datahit == other.datahit &&
        datahit1 == other.datahit1 &&
        aatahit2 == other.aatahit2;
  }

  @override
  int get hashCode => const ListEquality().hash([
        datatho,
        datatho1,
        datatho2,
        currentnameconnect,
        currentidconect,
        datahit,
        datahit1,
        aatahit2
      ]);
}

DataRxStruct createDataRxStruct({
  int? datatho,
  int? datatho1,
  int? datatho2,
  String? currentnameconnect,
  String? currentidconect,
  int? datahit,
  int? datahit1,
  int? aatahit2,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DataRxStruct(
      datatho: datatho,
      datatho1: datatho1,
      datatho2: datatho2,
      currentnameconnect: currentnameconnect,
      currentidconect: currentidconect,
      datahit: datahit,
      datahit1: datahit1,
      aatahit2: aatahit2,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DataRxStruct? updateDataRxStruct(
  DataRxStruct? dataRx, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dataRx
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDataRxStructData(
  Map<String, dynamic> firestoreData,
  DataRxStruct? dataRx,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dataRx == null) {
    return;
  }
  if (dataRx.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dataRx.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dataRxData = getDataRxFirestoreData(dataRx, forFieldValue);
  final nestedData = dataRxData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dataRx.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDataRxFirestoreData(
  DataRxStruct? dataRx, [
  bool forFieldValue = false,
]) {
  if (dataRx == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dataRx.toMap());

  // Add any Firestore field values
  dataRx.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDataRxListFirestoreData(
  List<DataRxStruct>? dataRxs,
) =>
    dataRxs?.map((e) => getDataRxFirestoreData(e, true)).toList() ?? [];
