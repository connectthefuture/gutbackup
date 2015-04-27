pd() {
  echo "$@"
}

say() {
  echo "$@"
}

error() {
  echo "$@" >&2
}

error_exit() {
  echo "$@" >&2
  exit 1
}

debug() {
  echo "$@"
}


absolutename() {
	readlink -m "$1"
}

filename() {
	base=$(basename "$1")
	echo ${base%.*}
}

extname() {
	base=$(basename "$1")
	[[ "$base" =~ \. ]] && echo "${base##*.}" || echo ""
}
