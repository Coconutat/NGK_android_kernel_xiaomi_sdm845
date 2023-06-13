#!/system/bin/sh

# SILVER Cluster
echo "schedutil" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo "748800" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo "748800" > /sys/module/cpu_input_boost/parameters/remove_input_boost_freq_lp
echo "1766400" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
echo 500 > /sys/devices/system/cpu/cpu0/cpufreq/schedutil/up_rate_limit_us
echo 25000 > /sys/devices/system/cpu/cpu0/cpufreq/schedutil/down_rate_limit_us
#echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/schedutil/iowait_boost_enable
echo 1 > /sys/devices/system/cpu/cpu0/cpufreq/schedutil/exp_util

# GOLD Cluster
echo "schedutil" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
echo "1056000" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
echo "1056000" > /sys/module/cpu_input_boost/parameters/remove_input_boost_freq_perf
echo "2803200" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
echo 500 > /sys/devices/system/cpu/cpu4/cpufreq/schedutil/up_rate_limit_us
echo 25000 > /sys/devices/system/cpu/cpu4/cpufreq/schedutil/down_rate_limit_us
#echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/schedutil/iowait_boost_enable
echo 1 > /sys/devices/system/cpu/cpu4/cpufreq/schedutil/exp_util

#Dynamic Schedtune Boost
echo "748800" > /sys/module/cpu_input_boost/parameters/input_boost_freq_lp
echo "1056000" > /sys/module/cpu_input_boost/parameters/input_boost_freq_hp
echo 256 > /sys/module/cpu_input_boost/parameters/input_boost_duration
echo 2000 > /sys/module/cpu_input_boost/parameters/dynamic_stune_boost_duration
echo 50 > /sys/module/cpu_input_boost/parameters/dynamic_stune_boost

#Schedtune
#echo 1 > /dev/stune/top-app/schedtune.sched_boost
#echo 1 > /dev/stune/top-app/schedtune.sched_boost_enabled
echo 1 > /dev/stune/top-app/schedtune.prefer_idle
echo 15 > /dev/stune/top-app/schedtune.boost
echo 1 > /dev/stune/foreground/schedtune.prefer_idle
echo 1 > /dev/stune/foreground/schedtune.boost
echo -10 > /dev/stune/background/schedtune.boost
echo 1 > /dev/stune/schedtune.prefer_idle

#IO Scheduler
echo "deadline" > /sys/block/mmcblk0/queue/scheduler
echo "deadline" > /sys/block/sda/queue/scheduler
echo "deadline" > /sys/block/sdb/queue/scheduler
echo "deadline" > /sys/block/sdc/queue/scheduler
echo "deadline" > /sys/block/sdd/queue/scheduler
echo "deadline" > /sys/block/sde/queue/scheduler
echo "deadline" > /sys/block/sdf/queue/scheduler

#GPU
echo "800" > /sys/class/kgsl/kgsl-3d0/max_clock_mhz
echo "800000000" > /sys/class/kgsl/kgsl-3d0/devfreq/max_freq
echo "800000000" > /sys/class/kgsl/kgsl-3d0/max_gpuclk
echo "342" > /sys/class/kgsl/kgsl-3d0/min_clock_mhz
echo "342000000" > /sys/class/kgsl/kgsl-3d0/devfreq/min_freq
echo "342000000" > /sys/class/kgsl/kgsl-3d0/min_gpuclk
echo "2" > /sys/class/kgsl/kgsl-3d0/devfreq/adrenoboost
echo "0" > /sys/class/kgsl/kgsl-3d0/throttling
echo 0 > /sys/class/kgsl/kgsl-3d0/bus_split
echo 1 > /sys/class/kgsl/kgsl-3d0/force_bus_on
echo 1 > /sys/class/kgsl/kgsl-3d0/force_rail_on
echo 1 > /sys/class/kgsl/kgsl-3d0/force_clk_on

#LKM
echo "33792,45056,56320,123904,168960,180224" > /sys/module/lowmemorykiller/parameters/minfree
