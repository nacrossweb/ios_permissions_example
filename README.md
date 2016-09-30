# iOS Location Permissions

## Types of access

There are two levels of access you can request it is important to choose the one appropriate to your app and users expectations as this will likely impact whether or not they will allow your app access at all.

## Requesting access to a users location

An app that only requires access whilst the app is running should do the following.

 - Add the following lines to the `Info.plist`
```
<key>NSLocationWhenInUseUsageDescription</key>
<string>This is a very clear and convincing explanation of why this app needs to know the users location</string>
```
 - Trigger a request for permission to make use of the users current location (whilst the app is running in the foreground) at an appropriate time.
```
manager.requestWhenInUseAuthorization()
```

An app that only requires access whilst the app is running should do the following.

1. Add the following lines to the `Info.plist`

```
<key>NSLocationAlwaysUsageDescription</key>
<string>This is a very clear and even more convincing explanation of why this app needs to know the users location whilst in the app is in the background, because users do not want to be tracked!</string>
```
 - Trigger a request for permission to make use of the users current location (whilst the app is running or in the background) at an appropriate time.
```
manager.requestAlwaysAuthorization()
```
## Authorisation Status

In order to provide the best user experience it is often necessary to determine the current authorisation status.  This can bee done by calling the following method.

```
CLLocationManager.authorizationStatus()
```

 - CLAuthorizationStatus
  - **NotDetermined:**  Authorisation has not yet been requested or denied
  - **AuthorizedWhenInUse:** Authorisation has been provided to use location services whilst the app is running
  - **AuthorizedAlways:**  Authorisation has been provided to use location services whilst app is not running
  - **Restricted:**  The user may not be able to grant permission due to device restrictions such as parental controls
  - **Denied:**  Authorisation has been denied and location services may not be used at anytime
