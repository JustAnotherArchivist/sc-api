The following table lists the number of tracks, their cumulative duration, an estimated stream size (at 128 kbit/s), and total original/download size for track ID ranges as discovered during the initial API grab:

<!--
| From ID | To ID | Number of tracks | Duration | Stream size | Download size |
|---|---|---|---|---|---|
| 1 | 27.9M | 7365468 | 3147517310682 ms | 50360276960000 | 137590393185905 |
| 27.9M | 52.3M | 7446996 | 2644745617728 ms | 42315929872000 | 122941239142282 |
| 52.3M | 74.8M | 7415742 | 2511823757137 ms | 40189180112000 | 115300350559087 |
| 74.8M | 95.7M | 7467899 | 2628177856925 ms | 42050845696000 | 120228970390786 |
| 95.7M | 113.5M | 6734967 | 2332917063965 ms | 37326673008000 | 101470158687380 |
| 113.5M | 133.3M | 7583197 | 2883981565625 ms | 46143705040000 | 125928821184565 |
| 133.3M | 152.6M | 7634374 | 2947270224343 ms | 47156323584000 | 131048047775718 |
| 152.6M | 171.3M | 7471819 | 3136420328845 ms | 50182725248000 | 135301271099097 |
| 171.3M | 190.1M | 7597259 | 3354706638874 ms | 53675306208000 | 148819758868559 |
| 190.1M | 208.5M | 7607345 | 3455602600144 ms | 55289641600000 | 157916180280576 |
| 208.5M | 226.3M | 7532171 | 3735549240198 ms | 59768787840000 | 167045800421531 |
| ... | ... | ... | ... | ... | ... |
-->

| From ID | To ID | Number of tracks | Duration | Stream size | Download size |
|---|---|---|---|---|---|
| 1 | 27.9M | 7.37M | 874 kh | 45.8 TiB | 125.1 TiB |
| 27.9M | 52.3M | 7.45M | 735 kh | 38.5 TiB | 111.8 TiB |
| 52.3M | 74.8M | 7.42M | 698 kh | 36.6 TiB | 104.9 TiB |
| 74.8M | 95.7M | 7.47M | 730 kh | 38.2 TiB | 109.3 TiB |
| 95.7M | 113.5M | 6.73M | 648 kh | 33.9 TiB | 92.3 TiB |
| 113.5M | 133.3M | 7.58M | 801 kh | 42.0 TiB | 114.5 TiB |
| 133.3M | 152.6M | 7.63M | 819 kh | 42.9 TiB | 119.2 TiB |
| 152.6M | 171.3M | 7.47M | 871 kh | 45.6 TiB | 123.1 TiB |
| 171.3M | 190.1M | 7.60M | 932 kh | 48.8 TiB | 135.3 TiB |
| 190.1M | 208.5M | 7.61M | 960 kh | 50.3 TiB | 143.6 TiB |
| 208.5M | 226.3M | 7.53M | 1038 kh | 54.4 TiB | 151.9 TiB |
| ... | ... | ... | ... | ... | ... |

Remarks:
* The range limits (first two columns) are only approximate numbers.
* This data was derived without  `grep`, `sed`, and `awk` rather than properly parsing the JSON, so it may have errors.
* The "download size" includes tracks which are not downloadable. I currently don't have a way to filter these out.
