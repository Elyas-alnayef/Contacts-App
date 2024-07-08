// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CompanyEntityAdapter extends TypeAdapter<CompanyEntity> {
  @override
  final int typeId = 1;

  @override
  CompanyEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CompanyEntity(
      companName: fields[0] as String,
      street1: fields[1] as String,
      street2: fields[2] as String,
      zip: fields[3] as String,
      vatNumber: fields[4] as String,
      state: fields[5] as String,
      city: fields[6] as String,
      countryName: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CompanyEntity obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.companName)
      ..writeByte(1)
      ..write(obj.street1)
      ..writeByte(2)
      ..write(obj.street2)
      ..writeByte(3)
      ..write(obj.zip)
      ..writeByte(4)
      ..write(obj.vatNumber)
      ..writeByte(5)
      ..write(obj.state)
      ..writeByte(6)
      ..write(obj.city)
      ..writeByte(7)
      ..write(obj.countryName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompanyEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
