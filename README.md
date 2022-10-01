# **Booking hotels app**

We have made this app with clean architecture and I used cubit as state management at the presentation layer.

## Brief explanation

With this app you can browse in hotels and search for specific hotel and there is a map view to find the exact location of the hotel on the map. You can see a video [in this link](https://drive.google.com/drive/folders/1JkvEUWO9Eu4MhOyQ2Mi8gDVlOMutxHKS?usp=sharing).

## Screenshots

  Welcome Page                 |   Onboarding Page        |  Register Page | Login Page 
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/MOHAB28/booking_app/blob/master/screenshots/welcome_screen.jpg?raw=true)|![](https://github.com/MOHAB28/booking_app/blob/master/screenshots/onboarding_screen.jpg?raw=true)|![](https://github.com/MOHAB28/booking_app/blob/master/screenshots/register_screen.jpg?raw=true)|![](https://github.com/MOHAB28/booking_app/blob/master/screenshots/login_screen.jpg?raw=true)

  Explore Page Dark                 |   Explore Page Dark AR        |  Map Page | Profile Page 
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/MOHAB28/booking_app/blob/master/screenshots/explore_screen_dark.jpg?raw=true)|![](https://github.com/MOHAB28/booking_app/blob/master/screenshots/explore_screen_light_ar.jpg?raw=true)|![](https://github.com/MOHAB28/booking_app/blob/master/screenshots/map_screen_part_1.jpg?raw=true)|![](https://github.com/MOHAB28/booking_app/blob/master/screenshots/pofile_screen.jpg?raw=true)

## Dependencies

```yaml
  dio: ^4.0.6
  flutter_bloc: ^8.1.1
  get_it: ^7.2.0
  dartz: ^0.10.1
  internet_connection_checker: ^0.0.1+4
  equatable: ^2.0.5
  smooth_page_indicator: ^1.0.0+2
  font_awesome_flutter: ^10.2.1
  google_maps_flutter: ^2.1.6
  flutter_rating_bar: ^4.0.1
  shared_preferences: ^2.0.15
  another_flushbar: ^1.12.29
  flutter_phoenix: ^1.1.0
  easy_localization: ^3.0.1
  geolocator: ^9.0.2
  image_picker: ^0.8.5+3
  bloc: ^8.1.0
```


## Directory Structure for project

```
├───core
│   ├───error
│   ├───network
│   ├───resources
│   ├───usecase
│   └───utils
└───features
    ├───booking
    │   ├───data
    │   │   ├───datasources
    │   │   ├───models
    │   │   └───repositories
    │   ├───domain
    │   │   ├───entities
    │   │   ├───repositories
    │   │   └───usecases
    │   └───presentation
    │       ├───cubit
    │       ├───pages
    │       └───widgets
    ├───facilities
    │   ├───data
    │   │   ├───datasources
    │   │   ├───models
    │   │   └───repositories
    │   ├───domain
    │   │   ├───entities
    │   │   ├───repositories
    │   │   └───usecases
    │   └───presentation
    │       ├───cubit
    │       ├───pages
    │       └───widgets
    ├───get_hotels
    │   ├───data
    │   │   ├───datasources
    │   │   ├───models
    │   │   └───repositories
    │   ├───domain
    │   │   ├───entities
    │   │   ├───repositories
    │   │   └───usecases
    │   └───presentation
    │       ├───cubit
    │       └───pages
    │           ├───layout
    │           ├───screens
    │           └───widgets
    │               └───static_hotel_data
    ├───login
    │   ├───data
    │   │   ├───datasources
    │   │   ├───models
    │   │   └───repositories
    │   ├───domain
    │   │   ├───entities
    │   │   ├───repositories
    │   │   └───usecases
    │   └───presentation
    │       ├───cubit
    │       ├───pages
    │       │   └───onboarding
    │       │       ├───models
    │       │       ├───view
    │       │       └───view_model
    │       └───widgets
    ├───profile
    │   ├───data
    │   │   ├───datasources
    │   │   ├───models
    │   │   └───repositories
    │   ├───domain
    │   │   ├───entities
    │   │   ├───repositories
    │   │   └───usecases
    │   └───presentation
    │       ├───cubit
    │       │   └───profile
    │       ├───pages
    │       └───widgets
    │           └───edit_profile_widgets
    ├───register
    │   ├───data
    │   │   ├───datasources
    │   │   └───repositories
    │   ├───domain
    │   │   ├───repositories
    │   │   └───usecases
    │   └───presentation
    │       ├───cubit
    │       └───pages
    └───search
        ├───data
        │   ├───datasources
        │   └───repositories
        ├───domain
        │   ├───repositories
        │   └───usecases
        └───presentation
            ├───cubit
            ├───pages
            │   └───main_page
            │       └───screens
            └───widgets
```
