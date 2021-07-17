#!/system/bin/sh


# find necessary modules for touchscreen, etc. to ensure no mismatch with kernel
copy-modules()
{
    if grep -Fq twrpfastboot /proc/cmdline
    then
        echo "using ramdisk modules (fastboot boot)"
        return
    fi

    # may need e.g. /lib/modules/5.4-gki/ and modules.load vs. modules.load.recovery checked for future-proof OOS as well?
    if [ -f /lib/modules/modules.load.recovery -a -f /lib/modules/touchscreen.ko ] && lsmod | grep -Fq touchscreen
    then
        echo "using vendor_boot modules"
        exit 0
    fi

    suffix=$(getprop ro.boot.slot_suffix)
    if [ -z "$suffix" ]
    then
        suffix="_$(getprop ro.boot.slot)"
    fi

    echo "using vendor$suffix modules"
    mkdir /v
    mount -t ext4 -o ro /dev/block/mapper/vendor$suffix /v
    rm -f /vendor/lib/modules/*
    cp -afR /v/lib/modules/* /vendor/lib/modules/
    umount /v
    rmdir /v
}

# hack around touchscreen modules not included in OOS vendor_boot
install-touch()
{
    # may need e.g. /lib/modules/5.4-gki/ and modules.load vs. modules.load.recovery checked for future-proof OOS as well?
    if [ -f /lib/modules/modules.load.recovery -a -f /lib/modules/touchscreen.ko ] && lsmod | grep -Fq touchscreen
    then
        echo "vendor_boot touchscreen modules already loaded"
        exit 0
    fi

    if [ ! -f /vendor/lib/modules/touchscreen.ko ]
    then
        echo "! vendor touchscreen modules not found"
        exit 1
    fi

    echo "loading vendor touchscreen modules"
    for module in $(modprobe -D -d /vendor/lib/modules touchscreen aw8697 | grep modules)
    do
        insmod /vendor/lib/modules/$(basename $module)
    done
}

copy-modules
install-touch

exit 0



