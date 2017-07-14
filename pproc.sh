# Extract duration, number of tracks, and total original upload size from WARCs
for n in 0000{1..7}; do zgrep -Po 'duration":\d+,' soundcloud-api-tracks-${n}.warc.gz | sed 's/[^0-9]//g' | awk '{ sum += $0; n += 1 } END { printf "Total duration: %.0f\nNumber of tracks: %d\n", sum, n }' > pproc-out/${n}; zgrep -Po 'original_content_size":\d+,' soundcloud-api-tracks-${n}.warc.gz | sed 's/[^0-9]//g' | awk '{ sum += $0 } END { printf "Total original size: %.0f\n", sum }' >> pproc-out/${n}; done

# tohours DURATION_IN_MS -> hours
function tohours { echo "$(echo "scale=1; ${1} / 3600000" | bc) h"; }

# sizeest DURATION_IN_MS -> estimate of size at 128 kbit/s in bytes
function sizeest { echo "${1} / 1000 * 128000 / 8" | bc; }

# tosize SIZE_IN_BYTES -> TiB or PiB
function tosize { if [[ $1 -gt $((1024*1024*1024*1024*1024)) ]]; then echo "$(echo "scale=3; ${1} / (1024*1024*1024*1024*1024)" | bc) PiB"; else echo "$(echo "scale=3; ${1} / (1024*1024*1024*1024)" | bc) TiB"; fi; }

# Size of WARCs in GiB
echo "scale=3; $(du -B 1048576 -c tracks/*.warc.gz | tail -1 | awk '{ print $1 }') / 1024" | bc
echo "scale=3; $(du -B 1048576 -c users/*.warc.gz | tail -1 | awk '{ print $1 }') / 1024" | bc
