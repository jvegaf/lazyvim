#=====================================================
# Environment Variables
#=====================================================
SCRIPT_NAME="${0##*/}"
LOG_FILE="${SCRIPT_NAME%.*}.log"

#=====================================================
# Functions
#=====================================================
function _logger() {
  /bin/echo "$(date '+%Y/%m/%d %H:%M:%S') ${1}" >>"${LOG_FILE}"
}

{{_cursor_}}
