/// 日期格式
 enum Dateformat {
   YYYYMMDD, // 2021-05-10 
   YYYYMMDDHHMM, // 2021-05-10 18:18
   YYYYMMDDHHMMSS, // 2021-05-10 18:18:18
 }
 
 class AppTools {
   /// 将时间戳转化为日期格式
   static String timestampConversion(String timestamp, {Dateformat dateformat}){
     String _tempTimestamp = timestamp;
     if (timestamp.length != 13) {
       _tempTimestamp = _tempTimestamp + "000";
     } 
 
     DateTime _timestamp = DateTime.fromMillisecondsSinceEpoch(int.parse(_tempTimestamp));
     String tempString = _timestamp.toLocal().toString();
     tempString = tempString.substring(0, tempString.length - 4);
 
     if (dateformat == Dateformat.YYYYMMDD) {
       tempString = tempString.substring(0, 10);
     } else if (dateformat == Dateformat.YYYYMMDDHHMM) {
       tempString = tempString.substring(0, tempString.length - 3);
     } 
 
     return tempString;
   }
 
   /// 数组转字符串
   static String listToString(List list, {String split = ""}){
     if (list == null) {
       return null;
     }
     String result;
     list.forEach((element) {
       if (result == null) {
         result = element;
       } else {
         result = "$result$split$element";
       }
     });
     return result.toString();
   }
 
 }