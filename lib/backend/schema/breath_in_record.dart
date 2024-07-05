import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BreathInRecord extends FirestoreRecord {
  BreathInRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "create_time" field.
  DateTime? _createTime;
  DateTime? get createTime => _createTime;
  bool hasCreateTime() => _createTime != null;

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  // "train_time" field.
  int? _trainTime;
  int get trainTime => _trainTime ?? 0;
  bool hasTrainTime() => _trainTime != null;

  // "vc" field.
  int? _vc;
  int get vc => _vc ?? 0;
  bool hasVc() => _vc != null;

  // "num" field.
  int? _num;
  int get num => _num ?? 0;
  bool hasNum() => _num != null;

  void _initializeFields() {
    _createTime = snapshotData['create_time'] as DateTime?;
    _uid = snapshotData['uid'] as DocumentReference?;
    _trainTime = castToType<int>(snapshotData['train_time']);
    _vc = castToType<int>(snapshotData['vc']);
    _num = castToType<int>(snapshotData['num']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('breathIn');

  static Stream<BreathInRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BreathInRecord.fromSnapshot(s));

  static Future<BreathInRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BreathInRecord.fromSnapshot(s));

  static BreathInRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BreathInRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BreathInRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BreathInRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BreathInRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BreathInRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBreathInRecordData({
  DateTime? createTime,
  DocumentReference? uid,
  int? trainTime,
  int? vc,
  int? num,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_time': createTime,
      'uid': uid,
      'train_time': trainTime,
      'vc': vc,
      'num': num,
    }.withoutNulls,
  );

  return firestoreData;
}

class BreathInRecordDocumentEquality implements Equality<BreathInRecord> {
  const BreathInRecordDocumentEquality();

  @override
  bool equals(BreathInRecord? e1, BreathInRecord? e2) {
    return e1?.createTime == e2?.createTime &&
        e1?.uid == e2?.uid &&
        e1?.trainTime == e2?.trainTime &&
        e1?.vc == e2?.vc &&
        e1?.num == e2?.num;
  }

  @override
  int hash(BreathInRecord? e) => const ListEquality()
      .hash([e?.createTime, e?.uid, e?.trainTime, e?.vc, e?.num]);

  @override
  bool isValidKey(Object? o) => o is BreathInRecord;
}
