set -e

FIRST_RUN_DIR=/first-run.d

# If any .sh files exist for first-run configs, then run them
if find "$FIRST_RUN_DIR" -mindepth 1 -print -quit | grep -q .; then
    for f in /first-run.d/*; do
        case "$f" in
            *.sh)  echo "$0: running $f"; "$f" ;;
            *)     echo "$0: ignoring $f" ;;
        esac
        rm "$f"
        echo
    done
else
    echo $FIRST_RUN_DIR is empty '(or non-existent)'
fi

exec /usr/bin/supervisord -c /etc/supervisord.conf
