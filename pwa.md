# Progressive Web App Tutorial

## The Setup
Create a directory for the app and add js, css, and images subdirectories. It should look like this when you’re finished:

```
  /PWA-app
    /css
    /js
    /images
```

## Writing the App Interface

Create a file named index.html in your project root folder
```html
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Hello World</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<body>
</body>
</html>
```

Next, create a file named style.css in the css folder and add a reference in then main.html file
```html
<head>
  ...
  <link rel="stylesheet" href="css/style.css">
<head>
```

Next, create a file named scripts.js in the js folder

## Add a Service Worker

> The location of the service worker is important! For security reasons, a service worker can only control the pages that are in its same directory or its subdirectories. This means that if you place the service worker file in a scripts directory it will only be able to interact with pages in the scripts directory or below.

Create a file named sw.js. Now we need to register the service worker, create a file named main.js in the js folder and enter the following code:

```js
window.onload = () => {
  'use strict';

  if ('serviceWorker' in navigator) {
    navigator.serviceWorker
    .register('./sw.js')
    .then(() => console.log('Service Worker Registered'));;
  }
}
```

Add the code to your app by including the script just before the closing </body> tag in index.html.

```
</div>
  <script src="js/main.js"></script>
</body>
```

### Cache Content

```js
var cacheName = 'hello-pwa';
var filesToCache = [
  '/',
  '/index.html',
  '/css/style.css',
  '/js/main.js'
];

/* Start the service worker and cache all of the app's content */
self.addEventListener('install', function(event) {
  event.waitUntil(
    caches.open(cacheName).then(function(cache) {
      return cache.addAll(filesToCache);
    })
  );
});

/* Serve cached content when offline */
self.addEventListener('fetch', function(event) {
  event.respondWith(
    caches.match(event.request).then(function(response) {
      return response || fetch(event.request);
    })
  );
});
```

The first lines of the script declares two variables: cacheName and filesToCache. cacheName is used to create an offline cache in the browser and give us access to it from Javascript. filesToCache is an array containing a list of all of the files that need to be cached. These files should be written in the form of URLs. Notice that the first one is simply “/”, the base URL. This is so the browser caches index.html even if the user doesn’t directly type in that file name.

Next, we add a function to install the service worker and create the browser cache using cacheName. Once the cache is created it adds all of the files listed in the filesToCache array. (Please note that while this code works for demonstration purposes it is not intended for production as it will stop if it fails to load even one of the files.)
Finally, we add a function to load in the cached files when the browser is offline.

```js
self.addEventListener('activate', (event) => {
  event.waitUntil(
    caches.keys().then((keyList) => {
      return Promise.all(keyList.map((key) => {
        if (key !== CACHE_NAME) {
          console.log('[ServiceWorker] Removing old cache', key);
          return caches.delete(key);
        }
      }));
    })
  );
});
```

We'll use the activate event to clean up any old data in our cache. This code ensures that your service worker updates its cache whenever any of the app shell files change. In order for this to work, you'd need to increment the CACHE_NAME variable at the top of your service worker file.

## Add a Manifest

The manifest is a json file that is used to specify how the app will look and behave on devices

Save a file named manifest.json in your root folder and add the following content:

```json
{
  "name": "Hello World",
  "short_name": "Hello",
  "lang": "en-US",
  "start_url": "/index.html",
  "display": "standalone",
  "background_color": "white",
  "theme_color": "white"
}
```

To add the manifest to your app, link to it inside the index.html head tag like this:
```html
<head>
...
<link rel="manifest" href="/manifest.json">
...
</head>
```

You should also declare the theme color to match the one set in your manifest by adding a meta tag inside the head:
```
<head>
...
<meta name="theme-color" content="white"/>
...
</head>
```
