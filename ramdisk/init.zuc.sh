#!/system/bin/sh

sysctl -e -w kernel.random.read_wakeup_threshold=64 2>/dev/null
sysctl -e -w kernel.random.write_wakeup_threshold=128 2>/dev/null

echo "0" > /dev/stune/foreground/schedtune.boost 
echo "10" > /dev/stune/top-app/schedtune.boost
echo "0" > /dev/stune/background/schedtune.boost

echo "0" > /dev/stune/foreground/schedtune.sched_boost
echo "10" > /dev/stune/top-app/schedtune.sched_boost
echo "0" > /dev/stune/background/schedtune.sched_boost

echo "1" > /sys/kernel/dyn_fsync/Dyn_fsync_active

echo "1" > /sys/kernel/fp_boost/enabled

echo "1" > /sys/module/adreno_idler/parameters/adreno_idler_active
echo "10" > /sys/module/adreno_idler/parameters/adreno_idler_downdifferential
echo "30" > /sys/module/adreno_idler/parameters/adreno_idler_idlewait
echo "2000" > /sys/module/adreno_idler/parameters/adreno_idler_idleworkload

echo "400000000" > /sys/module/governor_msm_adreno_tz/parameters/boost_freq
echo "750" > /sys/module/governor_msm_adreno_tz/parameters/boost_duration

echo "0" > /sys/module/msm_hotplug/msm_enabled
echo "1500" > /sys/module/msm_hotplug/boost_lock_duration
echo "5" > /sys/module/msm_hotplug/cpus_boosted
echo "100" > /sys/module/msm_hotplug/fast_lane_load
echo "500" > /sys/module/msm_hotplug/lock_duration
echo "8" > /sys/module/msm_hotplug/max_cpus_online
echo "4" > /sys/module/msm_hotplug/min_cpus_online
echo "15" > /sys/module/msm_hotplug/offline_load
echo "1" > /sys/module/msm_hotplug/update_rates
echo "2" > /sys/module/msm_hotplug/max_cpus_online_susp

setprop dalvik.vm.heapminfree 2m

echo "wlan_pno_wl;wlan_ipa;wcnss_filter_lock;[timerfd];hal_bluetooth_lock;IPA_WS;sensor_ind;wlan;netmgr_wl;qcom_rx_wakelock;wlan_wow_wl;wlan_extscan_wl;" > /sys/class/misc/boeffla_wakelock_blocker/wakelock_blocker

for i in $(ls /sys/class/scsi_disk/); do
 echo "temporary none" > /sys/class/scsi_disk/"$i"/cache_type;
done
