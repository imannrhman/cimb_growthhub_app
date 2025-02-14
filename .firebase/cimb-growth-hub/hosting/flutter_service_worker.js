'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"android-icon-144x144.png": "fec362a6f5dbf10f3f99a2a02cea0857",
"android-icon-192x192.png": "641d6352067bcc07bcdc09ac91d22133",
"android-icon-36x36.png": "352c01f9768fa2ae1a8bf6872861ef43",
"android-icon-48x48.png": "3d2a5cd89a91f0c5fcd4d7880f9eb12b",
"android-icon-72x72.png": "960f197bc7672b99e29c8821e2bfbd18",
"android-icon-96x96.png": "9d0cf2b9877bf8192b28736627d9032e",
"apple-icon-114x114.png": "3d896e71c740df92fbaa0a3076c36792",
"apple-icon-120x120.png": "d447ba7d6f6fcd6330e4e30c7a7c8f3f",
"apple-icon-144x144.png": "fec362a6f5dbf10f3f99a2a02cea0857",
"apple-icon-152x152.png": "2c1aee04aff363623b251e8d5fb9fc19",
"apple-icon-180x180.png": "a1ba441fe4317fa9a8bb46df9380c9d5",
"apple-icon-57x57.png": "0629ecd961a49e780aa5ab7bbc756297",
"apple-icon-60x60.png": "37964b60e7a51f12c5be4c47e1f9102b",
"apple-icon-72x72.png": "960f197bc7672b99e29c8821e2bfbd18",
"apple-icon-76x76.png": "9d8d4ff1c1708a8c2b70155d13ba4267",
"apple-icon-precomposed.png": "5f48bf3022a3dc3c0c501c2938c56808",
"apple-icon.png": "5f48bf3022a3dc3c0c501c2938c56808",
"assets/AssetManifest.bin": "377025e65e61528f9b863f96878cf8a8",
"assets/AssetManifest.bin.json": "88d7ca30af7e63f27d87fb6c781ea3b1",
"assets/AssetManifest.json": "a16d9e9ea2bf62b5bc1e571045eda5b2",
"assets/assets/illustration/1.jpg": "c9508d53610d7e940cfd3736add0637a",
"assets/assets/illustration/10.jpg": "252cb839e60e63fa9569d7e6b11f1d2d",
"assets/assets/illustration/11.jpg": "c0758c704391bead1497d673529ef50a",
"assets/assets/illustration/12.jpg": "edb90bc042ce151185c29fb623da5ae2",
"assets/assets/illustration/2.jpg": "847642eeec51c6db30856f05aed7651c",
"assets/assets/illustration/3.jpg": "883642fdcdd79e64d62df3cd3587cef4",
"assets/assets/illustration/4.jpg": "36006929a4a3e4c17d5629b1454a1032",
"assets/assets/illustration/5.jpg": "c0758c704391bead1497d673529ef50a",
"assets/assets/illustration/6.jpg": "d7e3dc9387133023c8593a58e251c620",
"assets/assets/illustration/7.jpg": "1badd8a07cf6e3ed80634047421d2743",
"assets/assets/illustration/8.jpg": "c482d5d4f7a6dcf3c3601b9012dc16a8",
"assets/assets/illustration/9.jpg": "73f194365f79f3da86dc19f3fc7ae79a",
"assets/assets/images/cimb.png": "89c1768ca3b8bb840b167353afddbf62",
"assets/assets/images/task.png": "aa6fa702fcc10129acf060889e2e8be0",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "942d3a911bd0bc64c68c9a6821d21479",
"assets/NOTICES": "545fec42e0b7d8b37936b5ce7114d57b",
"assets/packages/awesome_dialog/assets/flare/error.flr": "e3b124665e57682dab45f4ee8a16b3c9",
"assets/packages/awesome_dialog/assets/flare/info.flr": "bc654ba9a96055d7309f0922746fe7a7",
"assets/packages/awesome_dialog/assets/flare/info2.flr": "21af33cb65751b76639d98e106835cfb",
"assets/packages/awesome_dialog/assets/flare/info_without_loop.flr": "cf106e19d7dee9846bbc1ac29296a43f",
"assets/packages/awesome_dialog/assets/flare/question.flr": "1c31ec57688a19de5899338f898290f0",
"assets/packages/awesome_dialog/assets/flare/succes.flr": "ebae20460b624d738bb48269fb492edf",
"assets/packages/awesome_dialog/assets/flare/succes_without_loop.flr": "3d8b3b3552370677bf3fb55d0d56a152",
"assets/packages/awesome_dialog/assets/flare/warning.flr": "68898234dacef62093ae95ff4772509b",
"assets/packages/awesome_dialog/assets/flare/warning_without_loop.flr": "c84f528c7e7afe91a929898988012291",
"assets/packages/awesome_dialog/assets/rive/error.riv": "e74e21f8b53de4b541dd037c667027c1",
"assets/packages/awesome_dialog/assets/rive/info.riv": "2a425920b11404228f613bc51b30b2fb",
"assets/packages/awesome_dialog/assets/rive/info_reverse.riv": "c6e814d66c0e469f1574a2f171a13a76",
"assets/packages/awesome_dialog/assets/rive/question.riv": "00f02da4d08c2960079d4cd8211c930c",
"assets/packages/awesome_dialog/assets/rive/success.riv": "73618ab4166b406e130c2042dc595f42",
"assets/packages/awesome_dialog/assets/rive/warning.riv": "0becf971559a68f9a74c8f0c6e0f8335",
"assets/packages/awesome_snackbar_content/assets/back.svg": "ba1c3aebba280f23f5509bd42dab958d",
"assets/packages/awesome_snackbar_content/assets/bubbles.svg": "1df6817bf509ee4e615fe821bc6dabd9",
"assets/packages/awesome_snackbar_content/assets/types/failure.svg": "cb9e759ee55687836e9c1f20480dd9c8",
"assets/packages/awesome_snackbar_content/assets/types/help.svg": "7fb350b5c30bde7deeb3160f591461ff",
"assets/packages/awesome_snackbar_content/assets/types/success.svg": "6e273a8f41cd45839b2e3a36747189ac",
"assets/packages/awesome_snackbar_content/assets/types/warning.svg": "cfcc5fcb570129febe890f2e117615e0",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"browserconfig.xml": "653d077300a12f09a69caeea7a8947f8",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon-16x16.png": "83d5cd22dadc53624199281755584ae0",
"favicon-32x32.png": "9972d7fc88e4e93420369b2a04a15b2c",
"favicon-96x96.png": "9d0cf2b9877bf8192b28736627d9032e",
"favicon.ico": "a834b6f09dd4166c5940599254899bd9",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"flutter_bootstrap.js": "3b72c45e5a676f0b3d3f5e2061c79ff5",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "96529e52d2352f7e09928a4b0fd7a875",
"/": "96529e52d2352f7e09928a4b0fd7a875",
"main.dart.js": "20d4cff21c9070782234b686ef865249",
"manifest.json": "b58fcfa7628c9205cb11a1b2c3e8f99a",
"ms-icon-144x144.png": "fec362a6f5dbf10f3f99a2a02cea0857",
"ms-icon-150x150.png": "85158d043b17fd55fec0222a63e0fc51",
"ms-icon-310x310.png": "62f9f5ec9a7abce4a8c92ed2b0fd7872",
"ms-icon-70x70.png": "fe05fa70bb48bb8d7b6aa941646b95a0",
"version.json": "907d21faea6b09e1d14a57d556ba447c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
