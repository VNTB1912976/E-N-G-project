import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BreathOutRecord extends FirestoreRecord {
  BreathOutRecord._(
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

  // "num" field.
  int? _num;
  int get num => _num ?? 0;
  bool hasNum() => _num != null;

  // "train_time" field.
  int? _trainTime;
  int get trainTime => _trainTime ?? 0;
  bool hasTrainTime() => _trainTime != null;

  // "vc" field.
  int? _vc;
  int get vc => _vc ?? 0;
  bool hasVc() => _vc != null;

  void _initializeFields() {
    _createTime = snapshotData['create_time'] as DateTime?;
    _uid = snapshotData['uid'] as DocumentReference?;
    _num = castToType<int>(snapshotData['num']);
    _trainTime = castToType<int>(snapshotData['train_time']);
    _vc = castToType<int>(snapshotData['vc']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('breathOut');

  static Stream<BreathOutRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BreathOutRecord.fromSnapshot(s));

  static Future<BreathOutRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BreathOutRecord.fromSnapshot(s));

  static BreathOutRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BreathOutRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BreathOutRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BreathOutRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BreathOutRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BreathOutRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBreathOutRecordData({
  DateTime? createTime,
  DocumentReference? uid,
  int? num,
  int? trainTime,
  int? vc,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_time': createTime,
      'uid': uid,
      'num': num,
      'train_time': trainTime,
      'vc': vc,
    }.withoutNulls,
  );

  return firestoreData;
}

class BreathOutRecordDocumentEquality implements Equality<BreathOutRecord> {
  const BreathOutRecordDocumentEquality();

  @override
  bool equals(BreathOutRecord? e1, BreathOutRecord? e2) {
    return e1?.createTime == e2?.createTime &&
        e1?.uid == e2?.uid &&
        e1?.num == e2?.num &&
        e1?.trainTime == e2?.trainTime &&
        e1?.vc == e2?.vc;
  }

  @override
  int hash(BreathOutRecord? e) => const ListEquality()
      .hash([e?.createTime, e?.uid, e?.num, e?.trainTime, e?.vc]);

  @override
  bool isValidKey(Object? o) => o is BreathOutRecord;
}
