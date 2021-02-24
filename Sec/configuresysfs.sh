#!/bin/bash
###################################################################
#Script Name  : configuresysfs.sh
#Description  : Configures the sysFS to archieve a hardened
#               kernel configuration.
#Args         : None
#Author       : LamdaLamdaLamda
#Email        : 25778959+LamdaLamdaLamda@users.noreply.github.com
###################################################################
if test "$(id -u)" -ne 0
then
  echo -e "[\u2715] Missing privileges..."
  exit 1
fi

echo -e "\u2328 Restricting access to kernel logs"
sysctl -w kernel.dmesg_restrict=1 1>/dev/nul

echo -e "\u2328 Restricting access to kernel pointer"
sysctl -w kernel.kptr_restrict=1 1>/dev/nul

echo -e "\u2328 Activating kernel ExecShield-protection"
sysctl -w kernel.exec-shield=2 1>/dev/nul

echo -e "\u2328 Activating memory space randomise"
sysctl -w kernel.randomize_va_space=2 1>/dev/nul

echo -e "\u2328 Setting kernel panic timeout for reboot"
sysctl -w kernel.panic=20 1>/dev/nul

echo -e "\u2328 Enabling swap on 40% of RAM usage"
sysctl -w vm.swappiness=60 1>/dev/nul

echo -e "\u2328 Enable hard/softlink protecion"
sysctl -w fs.protected_hardlinks=1 1>/dev/nul
sysctl -w fs.protected_symlinks=1 1>/dev/nul

echo -e "\u2328 Dumpable"
sysctl -w fs.suid_dumpable=0 1>/dev/nul

echo -e "\u2328 PID will be appended after filename"
sysctl -w kernel.core_uses_pid=1 1>/dev/nul

echo -e "\u2328 Changing the maximum number of guard pages"
sysctl -w vm.max_map_count=524240 1>/dev/nul

echo -e "\u2328 Diabling unprivileged BPF"
sysctl -w kernel.unprivileged_bpf_disabled=1 1>/dev/nul

echo -e "\u2328 Enabling JIT-hardening for BPF"
sysctl -w net.core.bpf_jit_harden=2 1>/dev/nul

echo -e "\u2328 Restrict loading TTY line disciplines"
sysctl -w vm.unprivileged_userfaultfd=0 1>/dev/nul

echo -e "\u2328 Activating SYN cookies"
echo 1 > /proc/sys/net/ipv4/tcp_syncookies

echo -e "\u2328 Ignoring ICMP-Echo requests"
echo 0 > /proc/sys/net/ipv4/icmp_echo_ignore_all

echo -e "\u2328 Ignoring ICMP-Echo broadcasts"
echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts

echo -e "\u2328 Deactivate log of error responses"
echo 1 > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses

echo -e "\u2328 Disable IP forwarding"
echo 1 > /proc/sys/net/ipv4/ip_forward
echo 0 > /proc/sys/net/ipv4/ip_forward

echo -e "\u2328 Disable ICMP forwarding"
for i in /proc/sys/net/ipv4/conf/*/accept_redirects; do echo 0 > "$i"; done
for i in /proc/sys/net/ipv4/conf/*/send_redirects; do echo 0 > "$i"; done

echo -e "\u2328 Disable source-routed packets"
for i in /proc/sys/net/ipv4/conf/*/accept_source_route; do echo 0 > "$i"; done

echo -e "\u2328 Disable multicast routing"
for i in /proc/sys/net/ipv4/conf/*/mc_forwarding; do echo 0 > "$i"; done

echo -e "\u2328 Disable ARP proxy"
for i in /proc/sys/net/ipv4/conf/*/proxy_arp; do echo 0 > "$i"; done

echo -e "\u2328 Enable secure redirects"
for i in /proc/sys/net/ipv4/conf/*/secure_redirects; do echo 1 > "$i"; done

echo -e "\u2328 Disable bootp relay"
for i in /proc/sys/net/ipv4/conf/*/bootp_relay; do echo 0 > "$i"; done

echo -e "\u2328 Applying changes"
sysctl -p
