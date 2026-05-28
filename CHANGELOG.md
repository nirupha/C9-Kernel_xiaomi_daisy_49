C9-Kernel-linux version-4.9
Codename: Aurora
Type: Stable

Changelog R1.0 :

_• First public release of C9-Kernel for Xiaomi Mi A2 Lite (Daisy)._
_• Compiled using Proton Clang (kdrag0n) latest._
_• Bump version to Linux 4.9.312 (CIP-LTS)._
_• Base on crdroidandroid/android_kernel_xiaomi_daisy @ branch 12.1 (commit 136eaf15, last commit on 12.1 branch)._
_• Source matches LinkBoi00 Sleepy kernel commit identifier (compatibility verified with crDroid 7.61 / Android 11 ROM)._
_• Integrate KernelSU-Next legacy as non-GKI root solution._
_• Force KSU_VERSION to 33129 to match Manager v3.2.0-spoofed bundled ksud._
_• Apply manual hooks from kucingoranye/kernel_patches (4.4_4.9 patch series):_
_  → ksu_handle_execveat in fs/exec.c (su detection on exec syscall)._
_  → ksu_handle_stat in fs/stat.c (vfs_statx hook)._
_  → ksu_handle_faccessat in fs/open.c (path access intercept)._
_  → ksu_handle_vfs_read in fs/read_write.c (vfs_read intercept)._
_  → ksu_handle_sys_reboot in kernel/reboot.c (KSUN driver requirement)._
_  → is_ksu_transition in security/selinux/hooks.c (SELinux NNP/nosuid bypass for ksud)._
_• Add C9 branding: CONFIG_LOCALVERSION="-C9-Aurora-KSUN-R1.0"._
_• Build identity: JorianPonomaref@daisy-actions._
_• AnyKernel3 flashable zip with A/B device support (auto-flash to active slot)._
_• Custom banner for Mi A2 Lite (daisy / sakura unified)._

Known Issues :

_• Shamiko module not supported (deprecated for KSU; use Zygisk Next built-in DenyList instead)._
_• Volume-key safe-mode trigger not active (input.c hook may be skipped due to context drift)._
_• SUSFS not enabled in this build._

Compatible ROM :

_• crDroid 7.61 (Android 11) — base ROM tested by builder._
_• Other AOSP A11 ROMs that use kernel 4.9 base from crdroidandroid/android_kernel_xiaomi_daisy._

Credits :

_• Base kernel by crdroidandroid (crDroid team)._
_• KernelSU-Next driver by KernelSU-Next/KernelSU-Next._
_• Hook patches by kucingoranye._
_• Zygisk Next by 5ec1cff & Nullptr._
_• AnyKernel3 by osm0sis._
