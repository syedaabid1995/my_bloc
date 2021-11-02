// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataAdapter extends TypeAdapter<Data> {
  @override
  final int typeId = 2;

  @override
  Data read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Data(
      userid: fields[0] as String?,
      roleid: fields[1] as String?,
      firstname: fields[2] as String?,
      lastname: fields[3] as String?,
      emailid: fields[4] as String?,
      phone: fields[5] as String?,
      username: fields[6] as String?,
      expirydate: fields[7] as String?,
      isEcomUser: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Data obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.userid)
      ..writeByte(1)
      ..write(obj.roleid)
      ..writeByte(2)
      ..write(obj.firstname)
      ..writeByte(3)
      ..write(obj.lastname)
      ..writeByte(4)
      ..write(obj.emailid)
      ..writeByte(5)
      ..write(obj.phone)
      ..writeByte(6)
      ..write(obj.username)
      ..writeByte(7)
      ..write(obj.expirydate)
      ..writeByte(8)
      ..write(obj.isEcomUser);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
