#!/bin/sh

DINIT_SERVICE=tmpfiles

. @SCRIPT_PATH@/common.sh

systemd-tmpfiles "$@"

RET=$?
case "$RET" in
	65) exit 0 ;; # DATERR
	73) exit 0 ;; # CANTCREAT
	*) exit $RET ;;
esac
