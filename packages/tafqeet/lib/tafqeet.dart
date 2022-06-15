/// Support for doing something awesome.
/*
  -- Purpose :       Return amount numbers in arabic words
  --   تقوم هذة المكتبة بتفقيط الملبالغ للغة العربية
  --
  -- USAGE :         TAFQEET.GET_TAFQEET(23456.02)
  --
  -- Author  :       Khaled Flehan damascus syria

اسم العدد  	عدد   الاصفار	
مليون 	6 أصفار  	10⁶
بليون/مليار 	9 أصفار  	10⁹
تريليون 	12 صفر  10¹²
كوادريليون  	15 صفر 	10¹⁵ 


  فقط مائة وأحد عشر كوادريليوناً 
  ومائتان وإثنان وعشرون تريليوناً 
  وثلاثمائة وثلاثة وثلاثون ملياراً 
  وأربعمائة وأربعة وأربعون مليوناً
   وخمسمائة وخمسة وخمسون ألفاً 
  وستمائة وأربعة وستون
   ريالاً سعودياً لا غير
  -- Created :       06/05/2003 03:16:33 ص
  -- Modifications :
--
--
dependancies, changed names

*/

/// More dartdocs go here.

library tafqeet;

export 'package:tafqeet/src/model/unit_code.dart';
export 'package:tafqeet/src/tafqeet_multi.dart';


// TODO: Export any libraries intended for clients of this package.
