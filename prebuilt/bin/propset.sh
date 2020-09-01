#!/system/bin/sh
    resetprop ro.build.tags release-keys
    resetprop ro.boot.vbmeta.device_state locked
    resetprop ro.boot.verifiedbootstate green
    resetprop ro.boot.flash.locked 1
    resetprop ro.boot.veritymode enforcing
    resetprop ro.boot.warranty_bit 0
    resetprop ro.warranty_bit 0
    resetprop ro.debuggable 0
    resetprop ro.secure 1
    resetprop ro.build.type user
    resetprop ro.build.selinux 0
