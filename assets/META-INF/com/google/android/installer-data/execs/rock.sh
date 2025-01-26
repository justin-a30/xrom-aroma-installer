#!/sbin/sh
# SPECIFY VAR
file_getprop() { grep "^$2=" "$1" | cut -d= -f2-; }
RES="/tmp/result.txt"
EXPINS="
<i>Express installation</i>
<*><i>Selected none to install right away, and decrease bugs</i></*>"
EXPINS_SKIP="
<i>Modify current system</i>
<*>Modifications</*>"
MODINS="
<i>Personalized installation</i>

<*>Modifications</*>"
W23FE="<*> - Wallpaper: S23 FE</*>"
W21FE="<*> - Wallpaper: S21 FE</*>"
BSTOCK="<*> - Boot animation: Stock</*>"
BATT="<*> - Boot animation: AT&T</*>"
BKTC="<*> - Boot animation: KTC</*>"
BSKT="<*> - Boot animation: SKT</*>"
LBT="<*> - Live blur: Enable</*>"
LBF="<*> - Live blur: Disable</*>"
DSE="<*> - Dual Speaker: Enable</*>"
DSD="<*> - Dual Speaker: Disable</*>"

MSGDEB="
<*>Debloat</*>"
MSGDOFV="<*> - Dual Out Focus Viewer: Remove</*>"
MSGDEX="<*> - Dex: Remove</*>"
MSGOCR="<*> - OCR System: Remove</*>"
MSGQS="<*> - QuickShare: Remove</*>"
MSGDW="<*> - Digital Wellbeing: Remove</*>"
MSGNFC="<*> - NFC Support: Remove</*>"
MSGGOS="<*> - Game Optimizing Services: Remove</*>"
MSGWT="<*> - Weather: Remove</*>"

INSTALL=$(file_getprop "/tmp/installer-tmp/install.prop" "selected")

dofv=$(file_getprop "/tmp/installer-tmp/bloat.prop" "dofv")
dex=$(file_getprop "/tmp/installer-tmp/bloat.prop" "dex")
ocr=$(file_getprop "/tmp/installer-tmp/bloat.prop" "ocr")
qs=$(file_getprop "/tmp/installer-tmp/bloat.prop" "qs")
dw=$(file_getprop "/tmp/installer-tmp/bloat.prop" "dw")
nfc=$(file_getprop "/tmp/installer-tmp/bloat.prop" "nfs")
gos=$(file_getprop "/tmp/installer-tmp/bloat.prop" "gos")
weather=$(file_getprop "/tmp/installer-tmp/bloat.prop" "weather")

wall=$(file_getprop "/tmp/installer-tmp/prefs.prop" "wall")
bootanim=$(file_getprop "/tmp/installer-tmp/prefs.prop" "bootanim")
blur=$(file_getprop "/tmp/installer-tmp/prefs.prop" "blur")
ds=$(file_getprop "/tmp/installer-tmp/prefs.prop" "ds")
# action!
touch ${RES}
echo "<b><#selectbg_g>SUMARRY</#></b>" > ${RES}
if [[ "$INSTALL" == "1" ]]; then
    echo "$EXPINS" >> ${RES}
elif [[ "$INSTALL" == "3" ]]; then
    echo "$EXPINS_SKIP" >> ${RES}
else
    echo "$MODINS" >> ${RES}

    if [[ "$wall" == "s23fe" ]]; then
        echo "$W23FE" >> ${RES}
    elif [[ "$wall" == "s21fe" ]]; then
        echo "$W21FE" >> ${RES}
    fi

    if [[ "$bootanim" == "default" ]]; then
        echo "$BSTOCK" >> ${RES}
    elif [[ "$bootanim" == "att" ]]; then
        echo "$BATT" >> ${RES}
    elif [[ "$bootanim" == "ktc" ]]; then
        echo "$BKTC" >> ${RES}
    elif [[ "$bootanim" == "skt" ]]; then
        echo "$BSKT" >> ${RES}
    fi
    
    if [[ "$blur" == "yes" ]]; then
        echo "$LBT" >> ${RES}
    elif [[ "$blur" == "no" ]]; then
        echo "$LBF" >> ${RES}
    fi

    if [[ "$ds" == "yes" ]]; then
        echo "$DSE" >> ${RES}
    elif [[ "$ds" == "no" ]]; then
        echo "$DSD" >> ${RES}
    fi
    
    echo "$MSGDEB" >> ${RES}

    if [[ "$dofv" == "1" ]]; then
        echo "$MSGDOFV" >> ${RES}
    fi

    if [[ "$dex" == "1" ]]; then
        echo "$MSGDEX" >> ${RES}
    fi

    if [[ "$ocr" == "1" ]]; then
        echo "$MSGOCR" >> ${RES}
    fi

    if [[ "$qs" == "1" ]]; then
        echo "$MSGQS" >> ${RES}
    fi

    if [[ "$dw" == "1" ]]; then
        echo "$MSGDW" >> ${RES}
    fi

    if [[ "$nfc" == "1" ]]; then
        echo "$MSGNFC" >> ${RES}
    fi

    if [[ "$gos" == "1" ]]; then
        echo "$MSGGOS" >> ${RES}
    fi

    if [[ "$weather" == "1" ]]; then
        echo "$MSGWT" >> ${RES}
    fi

fi
