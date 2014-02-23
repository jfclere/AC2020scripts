#!/bin/sh
#
# Runs tests across all concurrency levels.
#
SCRIPT_DIR=`dirname "${0}"`

REPORT_BASE_DIR=${1:-.}
TIME_LIMIT=${2:-300}
SLEEP_TIME=${2:-5}

LENGTH_ESTIMATE=`expr 14 '*' 6 '*' '(' "${TIME_LIMIT}" + "${SLEEP_TIME}" ')' / 60`
echo "Expect this test to last ${LENGTH_ESTIMATE} minutes."

for c in 1 40 80 160 250 ; do
 echo Making directory "${REPORT_BASE_DIR}/c${c}"
 mkdir -p "${REPORT_BASE_DIR}/c${c}"
 "${SCRIPT_DIR}/runurltests.sh" "${TIME_LIMIT}" ${c} "${REPORT_BASE_DIR}/c${c}" "${SLEEP_TIME}"
done
