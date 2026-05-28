# C9 Kernel Builder · Xiaomi Mi A2 Lite (Daisy / 4.9)

[![Build C9 Kernel KSUN (Daisy)](https://github.com/rianrizkifauzi/C9-Kernel_xiaomi_daisy_49/actions/workflows/build.yml/badge.svg?branch=main)](https://github.com/rianrizkifauzi/C9-Kernel_xiaomi_daisy_49/actions/workflows/build.yml)

Automated GitHub Actions builder untuk **C9 Custom Kernel** — Linux 4.9.x untuk **Xiaomi Mi A2 Lite** (Daisy / Redmi 6 Pro Sakura / SDM625) dengan KernelSU-Next root integration.

> **Download:** [C9-Kernel_releases](https://github.com/rianrizkifauzi/C9-Kernel_releases)
> **Changelog:** [CHANGELOG.md](CHANGELOG.md)

---

## Specs

| Field | Value |
|---|---|
| Codename | `Aurora` |
| Version | `R1.0` |
| Device | Xiaomi Mi A2 Lite (daisy) / Redmi 6 Pro (sakura) |
| SoC | Qualcomm SDM625 (MSM8953) |
| Boot type | A/B device (slot_a + slot_b) |
| Kernel | Linux 4.9.312 |
| Base source | [crdroidandroid/android_kernel_xiaomi_daisy](https://github.com/crdroidandroid/android_kernel_xiaomi_daisy) `12.1` |
| Toolchain | [Proton Clang](https://github.com/kdrag0n/proton-clang) |
| Root | KernelSU-Next legacy branch |
| KSU_VERSION | 33129 |
| Hooks | Manual hook from [kucingoranye/kernel_patches](https://github.com/kucingoranye/kernel_patches) |

---

## Hook integration

6 manual hooks injected via `patch -p1` (kernel-4.4_4.9 patch series, compatible with kernel 4.9):

| File | Hook | Purpose |
|---|---|---|
| `fs/exec.c` | `ksu_handle_execveat` | Intercept exec syscall (su detection) |
| `fs/stat.c` | `ksu_handle_stat` | vfs_statx hook (path hiding base) |
| `fs/open.c` | `ksu_handle_faccessat` | faccessat hook |
| `fs/read_write.c` | `ksu_handle_vfs_read` | vfs_read hook |
| `kernel/reboot.c` | `ksu_handle_sys_reboot` | sys_reboot hook (KSUN requirement) |
| `security/selinux/hooks.c` | `is_ksu_transition` | NNP/nosuid bypass for ksud spawn |

---

## Trigger build

### From GitHub UI

1. Tab **[Actions](../../actions/workflows/build.yml)**
2. Klik **Run workflow**
3. Defaults sudah work untuk daisy + crDroid 7.x — tinggal `Run workflow`
4. Tunggu ~10-12 menit
5. Download zip dari [releases repo](https://github.com/rianrizkifauzi/C9-Kernel_releases/releases)

### Customize build

| Input | Default | Description |
|---|---|---|
| `kernel_repo` | `crdroidandroid/android_kernel_xiaomi_daisy` | Source kernel repo |
| `kernel_branch` | `12.1` | Branch name |
| `kernel_commit` | `136eaf15` | Pin commit (or `head`) |
| `defconfig` | `msm8953_defconfig` | Defconfig (shared daisy/sakura/msm8953) |
| `ksun_repo` | `KernelSU-Next/KernelSU-Next` | KSU implementation |
| `ksun_branch` | `legacy` | KSU branch |
| `hook_strategy` | `kucingoranye_patch` | Hook injection method |
| `enable_susfs` | `false` | Enable SUSFS patches |
| `kernel_codename` | `Aurora` | San-style codename branding |
| `kernel_relver` | `R1.0` | San-style release version |

---

## Output naming (San-Kernel style)

Format zip: `C9-Kernel-<Codename>-<RelVer>-<DeviceLabel>-KSUN.zip`

Example: `C9-Kernel-Aurora-R1.0-Daisy-KSUN.zip`

Release tag: `<codename>-<relver>-<device>` (e.g. `Aurora-R1.0-daisy`)
Release name: `C9-Kernel-<Codename>-<RelVer>-<DeviceLabel>-4.9`

---

## Installation (A/B device)

Mi A2 Lite is A/B device — kernel zip auto-flash to **active slot** via AnyKernel3.

1. Boot to **OFOX / TWRP recovery**
2. **Install** → pilih `C9-Kernel-Aurora-R1.0-Daisy-KSUN.zip` → swipe
3. Reboot → System
4. Buka **KernelSU-Next Manager** → konfirmasi "Working"

**Catatan:** Kalau lo flash di slot aktif tapi system boot ke slot lain (kadang bisa terjadi setelah update), reboot ke recovery, switch slot, terus install kernel zip lagi di slot kedua.

---

## Compatible ROM

Tested base: **crDroid 7.61 (Android 11)** dengan kernel 4.9.312 dari `crdroidandroid/android_kernel_xiaomi_daisy`.

Other ROMs yang share kernel base sama (LinkBoi00 Sleepy, etc) **kemungkinan compatible**, tapi belum tested. Backup boot.img sebelum flash.

---

## Credits

- **crdroidandroid** ([android_kernel_xiaomi_daisy](https://github.com/crdroidandroid/android_kernel_xiaomi_daisy)) — base kernel source
- **KernelSU-Next** ([upstream](https://github.com/KernelSU-Next/KernelSU-Next))
- **kucingoranye** ([kernel_patches](https://github.com/kucingoranye/kernel_patches)) — manual hook
- **Dr-TSNG / 5ec1cff** ([ZygiskNext](https://github.com/Dr-TSNG/ZygiskNext))
- **kdrag0n** ([proton-clang](https://github.com/kdrag0n/proton-clang))
- **AnyKernel3** ([osm0sis](https://github.com/osm0sis/AnyKernel3))
- **LinkBoi00** (Sleepy kernel reference)

Built by **JorianPonomaref**.

---

## License

Build scripts under MIT. Kernel source under **GPL-2.0** (inherited from upstream).
