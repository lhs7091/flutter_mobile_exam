# profile_info

A new Flutter project.

## TabView

Working with tabs is a common pattern in apps that follow the Material Design guidelines.

Flutter includes a convenient way to create tab layouts as part of the material library.

- [Tabs](https://flutter.dev/docs/cookbook/design/tabs)

## Example

<p float="left">
  <img src="https://github.com/lhs7091/flutter_mobile_exam/blob/main/profile_info/assets/images/1.png" width="200" />
  <img src="https://github.com/lhs7091/flutter_mobile_exam/blob/main/profile_info/assets/images/2.png" width="200" /> 
</p>

## Code

```
TabBarView(
    controller: _tabController,
    children: [
        GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                crossAxisCount: 3,
            ),
            itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.network(
                        'https://cdn.pixabay.com/photo/2020/11/26/15/28/woman-5779323__480.jpg',
                        fit: BoxFit.cover,
                    ),
                );
            },
        ),
        Image.asset('assets/images/profile.jpeg')
    ],
),
```
