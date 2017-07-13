The API's terms of service ban everything we want to do, so we'll have to use another application's credentials for archival. Several tools (e.g. youtube-dl and VLC) use the official website's credentials to access the API. That `client_id` is likely also not affected by the per-client rate limit. We may want to make the requests look like browser's requests at least on first sight (i.e. user agent). The `client_id` is `2t9loNQH90kzJcsFCODdigxfp325aq4z`, and sending the `app_version` (currently `1499947877`) along might also be a good idea.

URLs:

* Track info: `https://api.soundcloud.com/tracks/318511652?client_id=2t9loNQH90kzJcsFCODdigxfp325aq4z&app_version=1499947877`
	* You can also retrieve multiple tracks at once: `https://api.soundcloud.com/tracks?client_id=2t9loNQH90kzJcsFCODdigxfp325aq4z&app_version=1499947877&ids=311984582,311984583,311984584`. By adding `&limit=200` (or any higher value), you get up to 200 results (default: 50).
	* Track comments: `https://api.soundcloud.com/tracks/318511652/comments?threaded=1&client_id=2t9loNQH90kzJcsFCODdigxfp325aq4z&limit=20&offset=0&linked_partitioning=1&app_version=1499947877`
	* Track "favoriters" (people who marked a track as a favourite): `https://api.soundcloud.com/tracks/318511652/favoriters?client_id=2t9loNQH90kzJcsFCODdigxfp325aq4z&app_version=1499947877`
	* Undocumented subresources requested by the browser when accessing a track page:
		* `https://api.soundcloud.com/tracks/318511652/related?anon_user_id=4154688&client_id=2t9loNQH90kzJcsFCODdigxfp325aq4z&limit=10&offset=0&linked_partitioning=1&app_version=1499947877`
		* `https://api-v2.soundcloud.com/tracks/318511652/albums?representation=mini&client_id=2t9loNQH90kzJcsFCODdigxfp325aq4z&limit=10&offset=0&linked_partitioning=1&app_version=1499947877`
		* `https://api-v2.soundcloud.com/tracks/318511652/playlists_without_albums?representation=mini&client_id=2t9loNQH90kzJcsFCODdigxfp325aq4z&limit=10&offset=0&linked_partitioning=1&app_version=1499947877` and `https://api-v2.soundcloud.com/tracks/318511652/playlists_without_albums?offset=10&limit=10&client_id=2t9loNQH90kzJcsFCODdigxfp325aq4z&app_version=1499947877`
		* `https://api-v2.soundcloud.com/tracks/318511652/likers?client_id=2t9loNQH90kzJcsFCODdigxfp325aq4z&limit=9&offset=0&linked_partitioning=1&app_version=1499947877`
		* `https://api-v2.soundcloud.com/tracks/318511652/reposters?client_id=2t9loNQH90kzJcsFCODdigxfp325aq4z&limit=9&offset=0&linked_partitioning=1&app_version=1499947877`
* Track stream (redirect to MP3 file): `https://api.soundcloud.com/tracks/318511652/stream?client_id=2t9loNQH90kzJcsFCODdigxfp325aq4z&app_version=1499947877`
* Track streams (list of streamable URLs): `https://api.soundcloud.com/tracks/318511652/streams?client_id=2t9loNQH90kzJcsFCODdigxfp325aq4z&app_version=1499947877`
* Track download (**requires authentication**): `https://api.soundcloud.com/tracks/318511652/download?client_id=2t9loNQH90kzJcsFCODdigxfp325aq4z&app_version=1499947877`
* Playlists: `https://api.soundcloud.com/playlists/308952747?representation=full&client_id=2t9loNQH90kzJcsFCODdigxfp325aq4z&app_version=1499947877`
	* Possibly with `representation=id` to get only the IDs, not the full track details. `compact` is useless in our case. (`full` isn't in the official docs.)
* User: `https://api.soundcloud.com/users/311984582?client_id=2t9loNQH90kzJcsFCODdigxfp325aq4z&app_version=1499947877`
	* Retrieving multiple profiles at once is possible as well (undocumented): `https://api.soundcloud.com/users?client_id=2t9loNQH90kzJcsFCODdigxfp325aq4z&app_version=1499947877&ids=311984582,311984583`. Same `&limit` as for `/tracks`, i.e. add `&limit=200` for maximum efficiency.
	* There are various subresources: tracks, playlists, comments, favourites, followers, followings (people the person is following), web profiles. See official docs.

The maximum IDs as of 2017-07-07 are below 333M, 337M, and 319M for tracks, playlists, and users, respectively.

# Misc
* "All requests that result in access to a playable stream are subject to a limit of 15,000 requests per any 24-hour time window."
* In addition to `api.soundcloud.com`, there's `api-v2.soundcloud.com` and `api.soundcloud.com/app/v2`, which all seem to have the same endpoints and return the same data.

# Links
[Official API docs](https://developers.soundcloud.com/docs/api/reference)