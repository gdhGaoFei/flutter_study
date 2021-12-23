String getYYYYmmDD(DateTime result) {
  var selYear = result.year;
  var selMonth = result.month;
  var selDay = result.day;

  var month = selMonth < 10 ? "0" + selMonth.toString() : selMonth.toString();
  var day = selDay < 10 ? "0" + selDay.toString() : selDay.toString();

  // var month = sprintf("%d", selMonth);
  var ymd = selYear.toString() + "-" + month + "-" + day;
  return ymd;
}
