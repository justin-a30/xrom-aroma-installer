#!/sbin/sh
# First, set some variables
cfg=/tmp/installer-tmp/compat.prop
devsupport=0
bootloader=$(getprop ro.boot.bootloader)
# Now, setup busybox and its environment
cp /tmp/installer-tmp/busybox /tmp/busybox
chmod 777 /tmp/busybox
# Make a custom command
## Append property to file
append() {
    local content="$1"
    echo "$content" >>"$cfg"
}
## Get substring 
is_substring() {
    local substring=$1
    local string=$2

    case "$string" in
    *"$substring"*) return 0 ;;
    *) return 1 ;;
    esac
}
# Renew cfg file
rm -f $cfg
touch $cfg
# GET BACK TO WORK !!!!
## A40 check (a40)
if is_substring "A405" "$bootloader"; then
    echo "<#selectbg_g><b>A40 bootloader</#> detected</b>"
    echo "<#selectbg_g><b>Device is supported!</b></#>"
    append "devid=a40"
    devsupport="1"
    exit 1
fi
## In case it can't find one...
if [ "$devsupport" == "0" ]; then
    echo "Hm? This is not <b>A40.</b>"
    echo "<#ff0000><b>Unknown device.</b></#>"
    exit 55
fi
exit 1
