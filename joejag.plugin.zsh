# Converts an image into a web suitable image. Vastly reduces size, while keeping a good enough quality
function webize() {
  filename=$(basename $1)
  convert $1 -resize "600x" -unsharp 2x0.5+0.7+0 -quality 98 ${filename%%.*}_web.jpg;
}

# Clone all an individuals projects on Github
function github_clone_by_user() {
  username=$1
  curl https://api.github.com/users/$username/repos | ruby -rubygems -e 'require "json"; JSON.load(STDIN.read).each { |repo| %x[git clone #{repo["ssh_url"]} ]}'
}

# Clone all an organisations projects onn Github
function github_clone_by_org() {
  org=$1
  curl https://api.github.com/orgs/$org/repos| ruby -rubygems -e 'require "json"; JSON.load(STDIN.read).each { |repo| %x[git clone #{repo["ssh_url"]} ]}'
}

