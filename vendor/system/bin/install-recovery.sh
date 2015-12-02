#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 7391232 a3718cde1a2b1fab2c58fc8a525f9e5cde71e637 4638720 2e5e79f2145c0c61ca450edd6bdc0c6bd39ac1d9
fi

if ! applypatch -c EMMC:/dev/block/platform/dw_mmc.0/by-name/RECOVERY:7391232:a3718cde1a2b1fab2c58fc8a525f9e5cde71e637; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/dw_mmc.0/by-name/BOOT:4638720:2e5e79f2145c0c61ca450edd6bdc0c6bd39ac1d9 EMMC:/dev/block/platform/dw_mmc.0/by-name/RECOVERY a3718cde1a2b1fab2c58fc8a525f9e5cde71e637 7391232 2e5e79f2145c0c61ca450edd6bdc0c6bd39ac1d9:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
