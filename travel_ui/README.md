# travel_ui

UI/UX exam

## AspectRatio

The widget first tries the largest width permitted by the layout constraints. The height of the widget is determined by applying the given aspect ratio to the width, expressed as a ratio of width to height.

https://api.flutter.dev/flutter/widgets/AspectRatio-class.html

## 適用前
```
//ない場合、
ClipRRect(
    borderRadius: BorderRadius.circular(20.0),
    child: Image(
    image: AssetImage('assets/images/banner.jpeg'),
    fit: BoxFit.cover,
),
```
<img src="https://github.com/lhs7091/flutter_mobile_exam/blob/main/travel_ui/assets/images/not_Aspect.png" width="30%"></img>

## 適用後
```
//ある場合、
AspectRatio(
    aspectRatio: 1.5 / 1,
    child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image(
        image: AssetImage('assets/images/banner.jpeg'),
        fit: BoxFit.cover,
        ),
    ),
),
```
<img src="https://github.com/lhs7091/flutter_mobile_exam/blob/main/travel_ui/assets/images/is_Aspect.png" width="30%"></img>
