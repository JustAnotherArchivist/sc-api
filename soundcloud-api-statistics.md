The following table lists the number of tracks, their cumulative duration, an estimated stream size (at 128 kbit/s), and total original/download size for track ID ranges as discovered during the initial API grab:

<!--
| From ID | To ID | Number of tracks | Duration | Stream size | Download size |
|---|---|---|---|---|---|
| 1 | 27.9M | 139633 | 3147517310682 ms | 50360276960000 | 137590393185905 |
| 27.9M | 52.3M | 7446996 | 2644745617728 ms | 42315929872000 | 122941239142282 |
| 52.3M | 74.8M | 7415742 | 2511823757137 ms | 40189180112000 | 115300350559087 |
| 74.8M | 95.7M | 7467899 | 2628177856925 ms | 42050845696000 | 120228970390786 |
| 95.7M | 113.5M | 6734967 | 2332917063965 ms | 37326673008000 | 101470158687380 |
| 113.5M | 133.3M | 7583197 | 2883981565625 ms | 46143705040000 | 125928821184565 |
| 133.3M | 152.6M | 7634374 | 2947270224343 ms | 47156323584000 | 131048047775718 |
| 152.6M | 171.3M | 7471819 | 3136420328845 ms | 50182725248000 | 135301271099097 |
| ... | ... | ... | ... | ... | ... |
-->

| From ID | To ID | Number of tracks | Duration | Stream size | Download size |
|---|---|---|---|---|---|
| 1 | 27.9M | 0.14M | 874310.3 h | 45.802 TiB | 125.137 TiB |
| 27.9M | 52.3M | 7.45M | 734651.5 h | 38.486 TiB | 111.814 TiB |
| 52.3M | 74.8M | 7.42M | 697728.8 h | 36.551 TiB | 104.865 TiB |
| 74.8M | 95.7M | 7.47M | 730049.4 h | 38.245 TiB | 109.347 TiB |
| 95.7M | 113.5M | 6.73M | 648032.5 h | 33.948 TiB | 92.286 TiB |
| 113.5M | 133.3M | 7.58M | 801105.9 h | 41.967 TiB | 114.531 TiB |
| 133.3M | 152.6M | 7.63M | 818686.1 h | 42.888 TiB | 119.187 TiB |
| 152.6M | 171.3M | 7.47M | 871227.8 h | 45.640 TiB | 123.055 TiB |
| ... | ... | ... | ... | ... | ... |

Remarks:
* The range limits (first two columns) are only approximate numbers.
* This data was derived without  `grep`, `sed`, and `awk` rather than properly parsing the JSON, so it may have errors.
* The "download size" includes tracks which are not downloadable. I currently don't have a way to filter these out.