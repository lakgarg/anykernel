# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() {
kernel.string=Hydrogen-1.1
do.devicecheck=1
do.modules=0
do.cleanup=1
do.cleanuponabort=0
device.name1=bullhead
} # end properties

# shell variables
block=/dev/block/platform/soc.0/f9824900.sdhci/by-name/boot;
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



# init.sphinx.rc
insert_line init.bullhead.rc "init.sphinx.rc" after "import init.bullhead.ramdump.rc" "import init.sphinx.rc";

# end ramdisk changes

write_boot;

## end install

