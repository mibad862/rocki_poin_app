'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "4404a253c27e4a0c8dd0341dcdc33ce2",
"assets/AssetManifest.bin.json": "2e6464bed0ee4d496ed960773efb7b56",
"assets/AssetManifest.json": "8f466d1643b8162b362395000dc2e206",
"assets/assets/fonts/Inter-Regular.ttf": "ea5879884a95551632e9eb1bba5b2128",
"assets/assets/fonts/Lato-Regular.ttf": "122dd68d69fe9587e062d20d9ff5de2a",
"assets/assets/fonts/Poppins-Regular.ttf": "093ee89be9ede30383f39a899c485a82",
"assets/assets/images/achivement_screen_img1.svg": "1ddb29e80d114e11871564c667fb66a8",
"assets/assets/images/achivement_screen_img10.svg": "72a39d24ebfcf36bf988abd75419fbda",
"assets/assets/images/achivement_screen_img11.svg": "49d1fba5340757856143069da55f7a6b",
"assets/assets/images/achivement_screen_img12.svg": "8be1e0d531a9d7a26c1d73a8e512cd01",
"assets/assets/images/achivement_screen_img2.svg": "ffd2380c6a0c4ccc60945ebbeb9e1f9c",
"assets/assets/images/achivement_screen_img3.svg": "5fb884cb80ed677b89acfebd3539559c",
"assets/assets/images/achivement_screen_img4.svg": "e34a3dfece3f4b58c2bf6bcc57c4166c",
"assets/assets/images/achivement_screen_img5.svg": "b835b895d83e7bbdc7a55d1132b9eb4e",
"assets/assets/images/achivement_screen_img6.svg": "7272611849491436686a9641587f1159",
"assets/assets/images/achivement_screen_img7.svg": "b2dcebd450309540edcaf4c0ea329c32",
"assets/assets/images/achivement_screen_img8.svg": "80f6569ea676fc9330280487b2428722",
"assets/assets/images/achivement_screen_img9.svg": "9099246fe7874b0f5be3c8d66a2b2fdc",
"assets/assets/images/Block.svg": "742c1508d40d9f70d5f67f341fb81f6d",
"assets/assets/images/bottom_sheet_img1.svg": "0208cac6b7a5b1ccd455ebcae2f72ee7",
"assets/assets/images/bottom_sheet_img2.svg": "bc7618bcf8c35cbe3cfeaf504ae8482c",
"assets/assets/images/bottom_sheet_img3.png": "98d407e432ddec5dd6e8c4ae6ab8fbc3",
"assets/assets/images/bot_nav_bar_img1.svg": "651fe6210812de28a20c9a741778bea4",
"assets/assets/images/bot_nav_bar_img2.svg": "1a0fe02e58c23c7c20d90f8ab248b3af",
"assets/assets/images/bot_nav_bar_img3.svg": "fb08433d120b11e72e8c40df6bac43be",
"assets/assets/images/bot_nav_bar_img4.svg": "9323cb735902c1b3e180a9b075f4ac92",
"assets/assets/images/bot_nav_bar_img5.svg": "671b495681124e1f7d35157cc494bdea",
"assets/assets/images/dashboard_cover.png": "5df3446f5e3e59ad7a556f9d28b4f524",
"assets/assets/images/dashboard_img1.jpg": "bc07005eae1157c21e8c2ba927ec0f9f",
"assets/assets/images/dashboard_img1.svg": "36acf25fa51ecd201da9daff35774160",
"assets/assets/images/dashboard_img2.png": "f0e2c19a67758b160f96588ec6f4b14a",
"assets/assets/images/dashboard_img2.svg": "85029da168f20e3fd0100d05c6a31aac",
"assets/assets/images/dashboard_img3.svg": "30300045c04e3a857bdcda6220383fd5",
"assets/assets/images/dashboard_img4.svg": "4767a827fe77ccdc8a2dd350c93c255e",
"assets/assets/images/dashboard_img5.svg": "1408e08dd70c7713280ace720f9c2523",
"assets/assets/images/dashboard_img6.svg": "c7956dec7c9fe4bdb014813d80186f87",
"assets/assets/images/dashboard_img7.png": "1f55a3a5692e8459ae256d954f8860c7",
"assets/assets/images/dashboard_img7.svg": "1d7f0376d82b1e4ef9de3e0acbecf286",
"assets/assets/images/dashboard_img8.png": "fd1b0ec07e3f4516a0ea00c8c9af6075",
"assets/assets/images/dialogue_img1.svg": "993db68646356428cbb1623f91f757ad",
"assets/assets/images/gold_diamond.png": "564b916aa9e8fda5a80e6469496be343",
"assets/assets/images/gold_diamond.svg": "e482480612fe42ef82bdd2f51971c05d",
"assets/assets/images/home_screen_img1.png": "ff61be0512fb34dfc75d76002afcb4f7",
"assets/assets/images/home_screen_img1.svg": "2653e47882bb950616b0728f4e4476bf",
"assets/assets/images/home_screen_img10.png": "3520d8083b9093dc939e430418c524cc",
"assets/assets/images/home_screen_img11.png": "a6e76e3a668dca598b7c3774e22ca59c",
"assets/assets/images/home_screen_img12.png": "d0ef1a69131aa25842b32f60bf74ee64",
"assets/assets/images/home_screen_img13.png": "635bef762a8e7a2c75205bed79341764",
"assets/assets/images/home_screen_img14.png": "4f53973f01d553639337c94bb8da4e37",
"assets/assets/images/home_screen_img15.png": "a72f063d6edfe90696f33b35739153fb",
"assets/assets/images/home_screen_img16.svg": "74e76102527890316ce87fef276b2a92",
"assets/assets/images/home_screen_img2.png": "a72a5c8d6971113ab28f54c66fb8e39f",
"assets/assets/images/home_screen_img3.png": "df24823d779f31a44be00b01db5fe823",
"assets/assets/images/home_screen_img4.png": "a36260c7aa7424e4efaa688af1d365df",
"assets/assets/images/home_screen_img5.png": "4865edd829b2029bc7cd7e439accbfa0",
"assets/assets/images/home_screen_img5.svg": "43edd396b590eee825a43f52d8f8de8b",
"assets/assets/images/home_screen_img6.png": "8bfa754bfe7b1616c0808729f3900b84",
"assets/assets/images/home_screen_img6.svg": "d2281cd6c31e577986bbee8460ca7e9e",
"assets/assets/images/home_screen_img7.png": "9fef99af8d654e9adc2513d48f14d87a",
"assets/assets/images/home_screen_img7.svg": "c16a123582bb326de1636d246f0cced6",
"assets/assets/images/home_screen_img8.png": "96f74aab4f9cb72417fc2dafbfe6c946",
"assets/assets/images/home_screen_img9.png": "b282563cc0fc5323ba76bddfac33ed59",
"assets/assets/images/home_screen_img_cover.png": "3b8400995bc7cbe0eba1be906353df42",
"assets/assets/images/homImgFourteen.svg": "9604bf181fa81ae5624a7ebaecc5c48e",
"assets/assets/images/homImgnewTwo.svg": "b15babad406c476e8dfc97c98ab19aa4",
"assets/assets/images/homImgTwo.svg": "b206e35ab08ac66642773ca62783b995",
"assets/assets/images/pngfind%25201_prev_ui.png": "90a724c80e43f20fd2de99cfe90449a5",
"assets/assets/images/profile_img10.svg": "33ad6dc3a79aaa5f2d5d86a70b68f839",
"assets/assets/images/profile_img11.svg": "db5eb1cbc6d9284a0324a0d1ec4a9956",
"assets/assets/images/profile_img1_cover.png": "c60a47467802b4f3573f4890344f84e0",
"assets/assets/images/profile_img2.jpg": "eb014a004669dae88474b55718a0ef1e",
"assets/assets/images/profile_img3.svg": "ca2d928b06c84d728a1eede7d642f5d5",
"assets/assets/images/profile_img4.svg": "2b1191c20408392be923d7fba72ac947",
"assets/assets/images/profile_img5.svg": "861e8304448689aea0fb7e076a8caecb",
"assets/assets/images/profile_img6.svg": "2b1191c20408392be923d7fba72ac947",
"assets/assets/images/profile_img7.svg": "637faabf5c8a80be7279ba802f24840f",
"assets/assets/images/silver_diamond.png": "0f71d970f37b17a75d65bc5e5972f589",
"assets/assets/images/silver_diamond.svg": "29aae86583cec415442d1ace1e25eb5d",
"assets/assets/images/splash_screen_img1.jpg": "381575c8ee32a01c179b766f00c0fd38",
"assets/assets/images/splash_screen_img1.png": "08bb2e81600c83f298738cd7d517d26f",
"assets/assets/images/team_screen_avatar.png": "48177a5fde4448cfa580245635e5dcf9",
"assets/assets/images/team_screen_avatar.svg": "e53193d7d0348457cd519ec6ffdb9a4e",
"assets/assets/images/team_screen_img1.svg": "078e21da27bb32d6f8510e44ae048b1c",
"assets/assets/images/team_screen_img2.svg": "79872d2c9e6853d845de3cbea0826607",
"assets/assets/images/team_screen_img3.png": "d1b085deac3c0f452745fdec0da01c68",
"assets/assets/images/team_screen_img3.svg": "36615beec68c98cd1d5888e738454a85",
"assets/assets/images/team_screen_img4.svg": "6e4e47737a9dc6ccd9cdf959dd2e8271",
"assets/assets/images/team_screen_img5.svg": "cd69a04da37fd254133dd5b485ddb2ca",
"assets/assets/images/team_screen_online.svg": "31290757da53e27f33f6eb0c1fd72e59",
"assets/assets/images/welcome_screen_img1.png": "fdc9c9731fb4b16be545947746f2c4f5",
"assets/assets/images/welcome_screen_img2.png": "77318bf0ddff113c304e599dff60d122",
"assets/assets/images/welcome_screen_img3.png": "aeb70fbf0d5e089b364dbf139d0edf2c",
"assets/FontManifest.json": "c0b97f210dbf724193e79d11f2e54051",
"assets/fonts/MaterialIcons-Regular.otf": "1f168d4a1600d8f316f2ffd87920d85a",
"assets/NOTICES": "e9c24624987ec1b8adc76e44d004647f",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "69d940085b8b0961f36b5ecfdf4bb7dd",
"/": "69d940085b8b0961f36b5ecfdf4bb7dd",
"main.dart.js": "e642fd77e326ab600c75c7e6885359aa",
"manifest.json": "b08d6260537a80cefa2808cad5dc636e",
"version.json": "b013eb4296617ceebd98d45fc3bbf53d"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
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
