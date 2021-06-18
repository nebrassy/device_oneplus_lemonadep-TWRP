#!/system/bin/sh
# automatically set device props for unified tree shared-hardware models/variants


load_op9pro()
{
    resetprop "ro.build.product" "OnePlus9Pro"
    resetprop "ro.display.series" "OnePlus 9 Pro 5G"
    resetprop "ro.product.device" "OnePlus9Pro"
    resetprop "ro.product.model" "OnePlus 9 Pro 5G"
    resetprop "ro.product.name" "OnePlus9Pro"
    resetprop "ro.product.odm.device" "OnePlus9Pro"
    resetprop "ro.product.odm.model" "OnePlus 9 Pro 5G"
    resetprop "ro.product.odm.name" "OnePlus9Pro"
    resetprop "ro.product.product.device" "OnePlus9Pro"
    resetprop "ro.product.product.model" "OnePlus 9 Pro 5G"
    resetprop "ro.product.product.name" "OnePlus9Pro"
    resetprop "ro.product.system.device" "OnePlus9Pro"
    resetprop "ro.product.system.model" "OnePlus 9 Pro 5G"
    resetprop "ro.product.system.name" "OnePlus9Pro"
    resetprop "ro.product.system_ext.device" "OnePlus9Pro"
    resetprop "ro.product.system_ext.model" "OnePlus 9 Pro 5G"
    resetprop "ro.product.system_ext.name" "OnePlus9Pro"
    resetprop "ro.product.vendor.device" "OnePlus9Pro"
    resetprop "ro.product.vendor.model" "OnePlus 9 Pro 5G"
    resetprop "ro.product.vendor.name" "OnePlus9Pro"
}

load_op9()
{
    resetprop "ro.build.product" "OnePlus9"
    resetprop "ro.display.series" "OnePlus 9 5G"
    resetprop "ro.product.device" "OnePlus9"
    resetprop "ro.product.model" "OnePlus 9 5G"
    resetprop "ro.product.name" "OnePlus9"
    resetprop "ro.product.odm.device" "OnePlus9"
    resetprop "ro.product.odm.model" "OnePlus 9 5G"
    resetprop "ro.product.odm.name" "OnePlus9"
    resetprop "ro.product.product.device" "OnePlus9"
    resetprop "ro.product.product.model" "OnePlus 9 5G"
    resetprop "ro.product.product.name" "OnePlus9"
    resetprop "ro.product.system.device" "OnePlus9"
    resetprop "ro.product.system.model" "OnePlus 9 5G"
    resetprop "ro.product.system.name" "OnePlus9"
    resetprop "ro.product.system_ext.device" "OnePlus9"
    resetprop "ro.product.system_ext.model" "OnePlus 9 5G"
    resetprop "ro.product.system_ext.name" "OnePlus9"
    resetprop "ro.product.vendor.device" "OnePlus9"
    resetprop "ro.product.vendor.model" "OnePlus 9 5G"
    resetprop "ro.product.vendor.name" "OnePlus9"
}

project=$(getprop ro.boot.project_codename)
echo "Running unified/variant script with $project..." >> /tmp/recovery.log

case $project in
    lemonadep*)
        load_op9pro
        ;;
    *)
        load_op9
        ;;
esac

exit 0


