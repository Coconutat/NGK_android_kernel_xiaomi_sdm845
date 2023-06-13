#!/system/bin/sh

# SILVER Cluster
echo "schedutil" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo "300000" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo "300000" > /sys/module/cpu_input_boost/parameters/remove_input_boost_freq_lp
echo "1516800" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
echo 5000 > /sys/devices/system/cpu/cpu0/cpufreq/schedutil/up_rate_limit_us
echo 5000 > /sys/devices/system/cpu/cpu0/cpufreq/schedutil/down_rate_limit_us
#echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/schedutil/iowait_boost_enable
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/schedutil/exp_util
# GOLD Cluster
echo "schedutil" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
echo "825600" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
echo "825600" > /sys/module/cpu_input_boost/parameters/remove_input_boost_freq_perf
echo "1689600" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
echo 5000 > /sys/devices/system/cpu/cpu4/cpufreq/schedutil/up_rate_limit_us
echo 5000 > /sys/devices/system/cpu/cpu4/cpufreq/schedutil/down_rate_limit_us
#echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/schedutil/iowait_boost_enable
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/schedutil/exp_util

#Dynamic Schedtune Boost
echo "300000" > /sys/module/cpu_input_boost/parameters/input_boost_freq_lp
echo "825600" > /sys/module/cpu_input_boost/parameters/input_boost_freq_hp
echo 0 > /sys/module/cpu_input_boost/parameters/input_boost_duration
echo 0 > /sys/module/cpu_input_boost/parameters/dynamic_stune_boost_duration
echo 0 > /sys/module/cpu_input_boost/parameters/dynamic_stune_boost

#Schedtune
#echo 0 > /dev/stune/top-app/schedtune.sched_boost
#echo 0 > /dev/stune/top-app/schedtune.sched_boost_enabled
echo 0 > /dev/stune/top-app/schedtune.prefer_idle
echo 0 > /dev/stune/top-app/schedtune.boost
echo 0 > /dev/stune/foreground/schedtune.prefer_idle
echo 0 > /dev/stune/foreground/schedtune.boost
echo -10 > /dev/stune/background/schedtune.boost
echo 0 > /dev/stune/schedtune.prefer_idle

#IO Scheduler
echo "noop" > /sys/block/mmcblk0/queue/scheduler
echo "noop" > /sys/block/sda/queue/scheduler
echo "noop" > /sys/block/sdb/queue/scheduler
echo "noop" > /sys/block/sdc/queue/scheduler
echo "noop" > /sys/block/sdd/queue/scheduler
echo "noop" > /sys/block/sde/queue/scheduler
echo "noop" > /sys/block/sdf/queue/scheduler

#GPU
echo "257" > /sys/class/kgsl/kgsl-3d0/max_clock_mhz
echo "257000000" > /sys/class/kgsl/kgsl-3d0/devfreq/max_freq
echo "257000000" > /sys/class/kgsl/kgsl-3d0/max_gpuclk
echo "160" > /sys/class/kgsl/kgsl-3d0/min_clock_mhz
echo "160000000" > /sys/class/kgsl/kgsl-3d0/devfreq/min_freq
echo "160000000" > /sys/class/kgsl/kgsl-3d0/min_gpuclk
echo "0" > /sys/class/kgsl/kgsl-3d0/devfreq/adrenoboost
echo "1" > /sys/class/kgsl/kgsl-3d0/throttling
echo 1 > /sys/class/kgsl/kgsl-3d0/bus_split
echo 0 > /sys/class/kgsl/kgsl-3d0/force_bus_on
echo 0 > /sys/class/kgsl/kgsl-3d0/force_rail_on
echo 0 > /sys/class/kgsl/kgsl-3d0/force_clk_on

#LKM
echo "18432,23040,27648,32256,85296,120640" > /sys/module/lowmemorykiller/parameters/minfree
