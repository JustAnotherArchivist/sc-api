# Extract duration, number of tracks, and total original upload size from WARCs
for n in 0000{1..7}; do zgrep -Po 'duration":\d+,' soundcloud-api-tracks-${n}.warc.gz | sed 's/[^0-9]//g' | awk '{ sum += $0; n += 1 } END { printf "Total duration: %.0f\nNumber of tracks: %d\n", sum, n }' > pproc-out/${n}; zgrep -Po 'original_content_size":\d+,' soundcloud-api-tracks-${n}.warc.gz | sed 's/[^0-9]//g' | awk '{ sum += $0 } END { printf "Total original size: %.0f\n", sum }' >> pproc-out/${n}; done

# Extract list of 'trackId originalSize downloadable' from WARCs
for i in 000{00..18}; do echo $(date) ${i}; zgrep -Po '((?<="kind":"track","id":)[^,]+|(?<=original_content_size":)[^,]+|(?<=downloadable":)[^,]+)(?=,)' soundcloud-api-tracks-${i}.warc.gz | awk '(NR % 3) == 2 { size=$0 } (NR % 3) == 1 { trackid=$0 } (NR % 3) == 0 { printf trackid " " size " " $0 "\n" }' > pproc-out/${i}.dlable; done; date

# Post process those lists to get statistics
for f in pproc-out/*.dlable; do echo $f; awk '{ dlable[$3]++; dlablesize[$3] += $2 } END { printf "downloadable: %.0f tracks / %.0f bytes\n", dlable["true"], dlablesize["true"]; printf "not downloadable: %.0f tracks / %.0f bytes\n", dlable["false"], dlablesize["false"] }' $f; echo; done
awk '{ dlable[$3]++; dlablesize[$3] += $2 } END { printf "downloadable: %.0f tracks / %.0f bytes\n", dlable["true"], dlablesize["true"]; printf "not downloadable: %.0f tracks / %.0f bytes\n", dlable["false"], dlablesize["false"] }' pproc-out/*.dlable

# tohours DURATION_IN_MS -> hours
function tohours { echo "$(echo "scale=1; ${1} / 3600000" | bc) h"; }

# sizeest DURATION_IN_MS -> estimate of size at 128 kbit/s in bytes
function sizeest { echo "${1} / 1000 * 128000 / 8" | bc; }

# tosize SIZE_IN_BYTES -> TiB or PiB
function tosize { if [[ $1 -gt $((1024*1024*1024*1024*1024)) ]]; then echo "$(echo "scale=3; ${1} / (1024*1024*1024*1024*1024)" | bc) PiB"; else echo "$(echo "scale=3; ${1} / (1024*1024*1024*1024)" | bc) TiB"; fi; }

# Size of WARCs in GiB
echo "scale=3; $(du -B 1048576 -c tracks/*.warc.gz | tail -1 | awk '{ print $1 }') / 1024" | bc
echo "scale=3; $(du -B 1048576 -c users/*.warc.gz | tail -1 | awk '{ print $1 }') / 1024" | bc

# Find gzip records at the end of a WARC to quickly have a look at those WARC records (without having to decompress the entire file)
tail -c1000000 soundcloud-api-tracks-00000.warc.gz | LANG=C grep -obUaP $'\x1f\x8b'
# Example output line: '984241:�', so:
tail -c1000000 soundcloud-api-tracks-00000.warc.gz | tail -c+984242 | zless
