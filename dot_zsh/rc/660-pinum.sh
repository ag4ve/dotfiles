
# pi numbers, truncate to last numbers
pinum () {
  local num="$1"
  local offset="$2"

  if [[ -z "$num" ]] ; then
    return
  fi
  if [[ -z "$offset" ]] ; then
    offset="0"
  fi

  python -c "\
import sys,gmpy2; \
num = int(sys.argv[1]); \
offset = int(sys.argv[2]); \
print(str(gmpy2.const_pi(1048576))[offset:num + offset]) \
" "$num" "$offset"

}

