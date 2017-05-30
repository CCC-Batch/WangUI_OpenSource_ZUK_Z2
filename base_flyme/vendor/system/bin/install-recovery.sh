#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 12996608 749f17c7aa3960f5d46d695052cef10363ec28c2 10063872 c10c737ae399a7e93254091b460f71220e159311
fi

if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:12996608:749f17c7aa3960f5d46d695052cef10363ec28c2; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/bootdevice/by-name/boot:10063872:c10c737ae399a7e93254091b460f71220e159311 EMMC:/dev/block/bootdevice/by-name/recovery 749f17c7aa3960f5d46d695052cef10363ec28c2 12996608 c10c737ae399a7e93254091b460f71220e159311:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
