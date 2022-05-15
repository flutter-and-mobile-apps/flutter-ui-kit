import 'package:flutter/cupertino.dart';
import 'package:gameappui/konstants.dart';

class RPSCustomPainter extends CustomPainter {
  final bool isDrawerOpened;

  RPSCustomPainter(this.isDrawerOpened);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = kNavColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(0, size.height * 0.5);
    //x1,y1 is the ref. point x2,y2 is the target point
    //path0.quadraticBezierTo(x1, y1, x2, y2)
    path0.quadraticBezierTo(
        0, size.height * 0.25, size.width * .20, size.height * 0.2);
    path0.lineTo(size.width * .75, size.height * .15);

    path0.quadraticBezierTo(
        size.width * .77, size.height * .2, size.width * .81, size.height * .5);
    path0.arcToPoint(Offset(size.width * .95, 7),
        radius: Radius.circular(20.0), clockwise: false);
    path0.quadraticBezierTo(size.width * .97, 0, size.width, 0);
    path0.lineTo(size.width, size.height);

    // path0.lineTo(0, size.height);
    if (isDrawerOpened) {
      path0.lineTo(size.width * .1, size.height);
      path0.quadraticBezierTo(0, size.height, 0, size.height * 0.75);
    } else {
      path0.lineTo(0, size.height);
    }

    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
