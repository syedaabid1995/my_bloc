// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoginRegisterResponseAdapter extends TypeAdapter<LoginRegisterResponse> {
  @override
  final int typeId = 1;

  @override
  LoginRegisterResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoginRegisterResponse(
      success: fields[0] as bool?,
      data: (fields[1] as List?)?.cast<Data>(),
      isSettingsDone: fields[2] as bool?,
    )
      ..message = fields[3] as String?
      ..shouldRememberUser = fields[4] as bool?;
  }

  @override
  void write(BinaryWriter writer, LoginRegisterResponse obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.success)
      ..writeByte(1)
      ..write(obj.data)
      ..writeByte(2)
      ..write(obj.isSettingsDone)
      ..writeByte(3)
      ..write(obj.message)
      ..writeByte(4)
      ..write(obj.shouldRememberUser);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginRegisterResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
