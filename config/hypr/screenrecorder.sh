#!/usr/bin/env bash
set -u

STATE_DIR="${XDG_RUNTIME_DIR:-/tmp}/wfrec"
PIDFILE="$STATE_DIR/pid"
RAWFILE="$STATE_DIR/raw"
OUTDIR="$HOME/Downloads"

mkdir -p "$STATE_DIR" "$OUTDIR"

notify() {
    notify-send -t 30000 "$1" "$2"
}

cleanup_state() {
    rm -f "$PIDFILE" "$RAWFILE"
}

if [ -f "$PIDFILE" ]; then
    PID="$(cat "$PIDFILE" 2>/dev/null || true)"
    RAW="$(cat "$RAWFILE" 2>/dev/null || true)"

    if [ -n "${PID:-}" ] && kill -0 "$PID" 2>/dev/null; then
        kill -INT "$PID"
        while kill -0 "$PID" 2>/dev/null; do
            sleep 0.1
        done
    fi

    rm -f "$PIDFILE"

    if [ -n "${RAW:-}" ] && [ -f "$RAW" ]; then
        GIF="${RAW%.mkv}.gif"

        ffmpeg -y -i "$RAW" \
            -vf "fps=10,scale=800:-1:flags=lanczos,palettegen" \
            "$STATE_DIR/palette.png" >/dev/null 2>&1

        ffmpeg -y -i "$RAW" -i "$STATE_DIR/palette.png" \
            -lavfi "fps=10,scale=800:-1:flags=lanczos[x];[x][1:v]paletteuse" \
            -loop 0 "$GIF" >/dev/null 2>&1

        if [ -f "$GIF" ]; then
            wl-copy -t text/uri-list "file://$(realpath "$GIF")"
            notify "Recording stopped" "GIF copied as a file link."
        else
            notify "Recording stopped" "GIF conversion failed."
        fi
    else
        notify "Recording stopped" "No recording file found."
    fi

    cleanup_state
    exit 0
fi

GEOM="$(slurp)"
[ -n "$GEOM" ] || exit 1

RAW="$OUTDIR/clip_$(date +%s).mkv"
printf '%s\n' "$RAW" > "$RAWFILE"

nohup wf-recorder -g "$GEOM" -f "$RAW" >/dev/null 2>&1 &
PID=$!
printf '%s\n' "$PID" > "$PIDFILE"

sleep 0.3
if ! kill -0 "$PID" 2>/dev/null; then
    notify "Recording failed" "wf-recorder exited immediately."
    cleanup_state
    exit 1
fi

notify "Recording started" "Run the same keybind again to stop."
