# shopping_cart

Shopping cart UI

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Dialog Alert

Displays an iOS-style dialog above the current contents of the app, with iOS-style entrance and exit animations, modal barrier color, and modal barrier behavior (by default, the dialog is not dismissible with a tap on the barrier).

```
ElevatedButton(
    onPressed: () {
        showCupertinoDialog(
            context: context,
            builder: (context) {
            return CupertinoAlertDialog(
                title: Text('add to cart?'),
                actions: [
                    CupertinoDialogAction(
                        onPressed: () {
                        Navigator.pop(context);
                        },
                        child: Text('Confirm'),
                    ),
                ],
            );
        },
    );
},
```

<p float="left">
  <img src="https://github.com/lhs7091/flutter_mobile_exam/blob/main/shopping_cart/result/1.png" width="200" />
  <img src="https://github.com/lhs7091/flutter_mobile_exam/blob/main/shopping_cart/result/2.png" width="200" /> 
</p>