# music_ui_exam

Music UI/UX

## BackdropFilter

The filter will be applied to all the area within its parent or ancestor widget's clip. If there's no clip, the filter will be applied to the full screen.

- [Lab: BackdropFilter Manual](https://api.flutter.dev/flutter/widgets/BackdropFilter-class.html)

### Before
<img src="https://github.com/lhs7091/flutter_mobile_exam/blob/main/music_ui_exam/assets/images/before_back_filter.png" width="30%"></img>

### After
```
BackdropFilter(
    filter: ImageFilter.blur(
        sigmaX: 0.0,
        sigmaY: 0.0,
    ),
    child: Container(
        color: Colors.black.withOpacity(0.8),
    ),
),
```
<img src="https://github.com/lhs7091/flutter_mobile_exam/blob/main/music_ui_exam/assets/images/after_back_filter.png" width="30%"></img>

## Wrap

A widget that displays its children in multiple horizontal or vertical runs.

A Wrap lays out each child and attempts to place the child adjacent to the previous child in the main axis, given by direction, leaving spacing space in between. If there is not enough space to fit the child, Wrap creates a new run adjacent to the existing children in the cross axis.

After all the children have been allocated to runs, the children within the runs are positioned according to the alignment in the main axis and according to the crossAxisAlignment in the cross axis.

The runs themselves are then positioned in the cross axis according to the runSpacing and runAlignment.

- [Lab: Wrap Manual](https://api.flutter.dev/flutter/widgets/Wrap-class.html)

### Row widget
```
Row(
    children: [
        buildCardWidget(),
        buildCardWidget(),
        buildCardWidget(),
        buildCardWidget(),
        buildCardWidget(),
        buildCardWidget(),
    ],
),
```
<img src="https://github.com/lhs7091/flutter_mobile_exam/blob/main/music_ui_exam/assets/images/row_example.png" width="30%"></img>

### Wrap widget 
```
Row(
    children: [
        buildCardWidget(),
        buildCardWidget(),
        buildCardWidget(),
        buildCardWidget(),
        buildCardWidget(),
        buildCardWidget(),
    ],
),
```
<img src="https://github.com/lhs7091/flutter_mobile_exam/blob/main/music_ui_exam/assets/images/wrap_example.png" width="30%"></img>
