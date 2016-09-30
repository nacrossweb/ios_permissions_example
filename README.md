# iOS Location Permissions

## Types of access

There are two levels of access you can request.  It is important to choose the one appropriate to your app and users expectations as this will likely impact whether or not they will allow your app access at all.

## Requesting access to a users location

An app that only requires access whilst the app is *running* should do the following.

 - Add the following lines to the `Info.plist`
```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>This is a very clear and convincing explanation of why this app needs to know the users location</string>
```
 - At an appropriate time trigger a request for permission to make use of the users current location (whilst the app is running in the foreground)
```swift
manager.requestWhenInUseAuthorization()
```

An app that requires access even while the app is *not running* should do the following.

1. Add the following lines to the `Info.plist`

```xml
<key>NSLocationAlwaysUsageDescription</key>
<string>This is a very clear and even more convincing explanation of why this app needs to know the users location whilst in the app is in the background, because users do not want to be tracked!</string>
```
 - At an appropriate time trigger a request for permission to make use of the users current location (whilst the app is running or in the background)
```swift
manager.requestAlwaysAuthorization()
```
## Authorisation Status

In order to provide the best user experience it is often necessary to determine the current authorisation status.  This can be done by calling the following method.

```swift
CLLocationManager.authorizationStatus()
```

It will return one of the following statuses
 - **Not Determined:**  Authorisation has not yet been requested or denied
 - **Authorized When In Use:** Authorisation has been provided to use location services whilst the app is running
 - **Authorized Always:**  Authorisation has been provided to use location services whilst app is not running
 - **Restricted:**  The user may not be able to grant permission due to device restrictions such as parental controls
 - **Denied:**  Authorisation has been denied and location services may not be used at anytime

## Requesting elevated permissions

Once the user has denied permission to use location services, the app may not request permission be granted again.  The only exception to this is when a user has previously granted your app permission to use location services whilst in use, you may subsequently request that the app be allowed to use location services always.  It should be noted that if the user decides not to allow this, any future requests to elevate permissions will not be presented to user.

## Handling authorisation denial

When a user has denied your app access to thier location it is important to provide appropriate feedback given possibley critical features of your app will not work.  In combination with proper user feedback it is often helpful to guide the user to where they might authorise the app should they change thier mind.  This can be done by launching the app settings screen where on recent versions of iOS the user may update the authorisation status of the app.

```swift
if CLLocationManager.authorizationStatus() == .Denied {
  if let appSettings = NSURL(string: UIApplicationOpenSettingsURLString) {
    UIApplication.sharedApplication().openURL(appSettings)
  }
}
```
