import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ResponsiveSizingX on num {
  double get rh => toDouble().h;

  double get rw => toDouble().w;

  double get rsp => toDouble().sp;
}
