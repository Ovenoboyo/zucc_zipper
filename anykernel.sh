# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=zucc-karnul
do.devicecheck=1
do.modules=0
do.cleanup=1
do.cleanuponabort=1
device.name1=vince
device.name2=Redmi Note 5
device.name3=randi nude 5
device.name4=randi nude 5 plus
device.name5=Redmi Note 5 plus
'; } # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. /tmp/anykernel/tools/ak2-core.sh;


## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
chmod -R 750 $ramdisk/*;
chown -R root:root $ramdisk/*;


## AnyKernel install
dump_boot;

# begin ramdisk changes

insert_line fstab.qcom "/dev/block/zram0" after "/dev/block/bootdevice/by-name/config		/frp			emmc	defaults							defaults" "/dev/block/zram0                                        none                swap    defaults                    zramsize=536870912,max_comp_streams=4"
# end ramdisk changes

write_boot;

## end install

