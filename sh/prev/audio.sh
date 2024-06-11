# audio: ffmpegthumbnailer ffmpeg

audio() {
	ffmpegthumbnailer -i "$f" -s 0 -q 50% -t 10 -o "$cache_f" 2>/dev/null
}

if exists ffmpegthumbnailer; then
	convert_and_show_image audio
elif exists ffmpeg; then
	x="$(ffmpeg -hide_banner -i "$f" 2>&1)"
	printf '%s\n' "$x"
	y=$((y + $(printf '%s\n' "$x" | wc -l)))
fi
