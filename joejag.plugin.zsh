# Converts an image into a web suitable image. Vastly reduces size, while keeping a good enough quality
function webize() {
  filename=$(basename $1)
  convert $1 -resize "600x" -unsharp 2x0.5+0.7+0 -quality 98 ${filename%%.*}_web.jpg;
}
