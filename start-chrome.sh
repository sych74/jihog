#!/bin/bash

server=$1
[ -z "$server" ] && server="https://alpha2.jitsi.net/"
video=$2
[ -z "$video" ] && video="/usr/share/jitsi-meet-torture/resources/FourPeople_1280x720_30.y4m"

#DISPLAY=:99 
xvfb-run --server-args='-screen 0, 1024x768x24' \
    /usr/bin/google-chrome --disable-background-networking --disable-client-side-phishing-detection --disable-default-apps --disable-dev-shm-usage --disable-gpu --disable-hang-monitor --disable-infobars --disable-plugins --disable-popup-blocking \
    --disable-prompt-on-repost --disable-sync --disable-web-resources --enable-automation --enable-logging --ignore-certificate-errors --log-level=0 --metrics-recording-only --mute-audio --no-first-run \
    --password-store=basic --use-fake-device-for-media-stream --use-fake-ui-for-media-stream --use-file-for-fake-audio-capture=/usr/share/jitsi-meet-torture/resources/fakeAudioStream.wav --use-file-for-fake-video-capture=$video \
    --use-mock-keychain \
    "$server$1#config.testing.testMode=true&config.disableNS=true&config.disableAEC=true&config.p2p.enabled=false&config.startWithAudioMuted=false&config.requireDisplayName=false&config.gatherStats=true&config.debug=true&config.disable1On1Mode=false&config.alwaysVisibleToolbar=true&config.p2p.useStunTurn=true"
