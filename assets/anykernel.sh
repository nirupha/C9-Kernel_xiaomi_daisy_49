### AnyKernel3 Ramdisk Mod Script
### daisy (Mi A2 Lite / Redmi 6 Pro / SDM625) - A/B device

properties() { '
kernel.string=C9 Custom Kernel for Mi A2 Lite (daisy)
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=daisy
device.name2=Daisy
device.name3=DAISY
device.name4=sakura
device.name5=Sakura
device.name6=SAKURA
supported.versions=
supported.patchlevels=
'; } # end properties

# shell variables
# Daisy is A/B device — block is named with slot suffix (boot_a / boot_b)
block=auto;
is_slot_device=1;
ramdisk_compression=auto;
patch_vbmeta_flag=auto;

# Banner
ui_print " ";
ui_print "**************************************";
ui_print "*  C9 Custom Kernel for Mi A2 Lite   *";
ui_print "*  Codename: Aurora                  *";
ui_print "*  Built by JorianPonomaref          *";
ui_print "*  Base: kernel 4.9 + KSUN-Next      *";
ui_print "*  Hooks: kucingoranye/kernel_patches *";
ui_print "*  Device: daisy / sakura (A/B)      *";
ui_print "**************************************";
ui_print " ";

## AnyKernel install
. tools/ak3-core.sh;

split_boot;
flash_boot;
## end install
