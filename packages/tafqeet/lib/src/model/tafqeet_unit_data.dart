import 'dart:ffi';

import 'package:tafqeet/src/tafqeet_multi.dart';
import 'package:tafqeet/tafqeet.dart';

TafqeetUnit unitUsa = TafqeetUnit(
    country: 'أميريكياً',
    unit: 'دولاراً',
    unitMultiple: 'دولارين',
    unitPlural: 'دولارات',
    currncyFrcDigits: 2,
    unitFrc: 'سنت',
    unitFrcMultiple: 'سنتين',
    unitFrcPlural: 'سنتات',
    unitGender: 'M',
    unitFrcGender: 'M');

//====

TafqeetUnit unitSA = TafqeetUnit(
    country: 'سعودياً',
    unit: 'ريالاً',
    unitMultiple: 'ريالين',
    unitPlural: 'ريالات',
    currncyFrcDigits: 2,
    unitFrc: 'هللة',
    unitFrcMultiple: 'هللاتين',
    unitFrcPlural: 'هللات',
    unitGender: 'M',
    unitFrcGender: 'F');

var tafSA = TafqeetMulti('20.01', unitSA);

//====

TafqeetUnit unitDK = TafqeetUnit(
    country: 'كويتياً',
    unit: 'ديناراً',
    unitMultiple: 'دينارين',
    unitPlural: 'دنانير',
    currncyFrcDigits: 3,
    unitFrc: 'فلس',
    unitFrcMultiple: 'فلسين',
    unitFrcPlural: 'فلوس',
    unitGender: 'M',
    unitFrcGender: 'M');

TafqeetUnit unitKG = TafqeetUnit(
    country: '',
    unit: 'كيلو غراماً',
    unitMultiple: 'أثنين كيلو غراماً',
    unitPlural: 'كيلو غرامات',
    currncyFrcDigits: 3,
    unitFrc: 'غرام',
    unitFrcMultiple: 'غرامين',
    unitFrcPlural: 'غرامات',
    unitGender: 'M',
    unitFrcGender: 'M');

TafqeetUnit unitOnce = TafqeetUnit(
    country: '',
    unit: 'أونصة',
    unitMultiple: 'أونصتين',
    unitPlural: 'أونصات',
    currncyFrcDigits: 0,
    unitFrc: '',
    unitFrcMultiple: '',
    unitFrcPlural: '',
    unitGender: 'F',
    unitFrcGender: 'F');

TafqeetUnit unitKM = TafqeetUnit(
    country: '',
    unit: 'متراً',
    unitMultiple: 'أثنين متراً',
    unitPlural: 'مترات',
    currncyFrcDigits: 2,
    unitFrc: 'سنتميتراً',
    unitFrcMultiple: 'سنتيمتران',
    unitFrcPlural: 'سنتيمترات',
    unitGender: 'M',
    unitFrcGender: 'M');

TafqeetUnit unitSY = TafqeetUnit(
    country: 'سورية',
    unit: 'ليرة',
    unitMultiple: 'ليرتين',
    unitPlural: 'ليرات',
    currncyFrcDigits: 2,
    unitFrc: 'قرشاً',
    unitFrcMultiple: 'قرشان',
    unitFrcPlural: 'قروش',
    unitGender: 'F',
    unitFrcGender: 'M');
