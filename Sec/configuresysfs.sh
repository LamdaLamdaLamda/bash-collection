#!/bin/bash
###################################################################
#Script Name  : configuresysfs.sh
#Description  : Configures the sysFS to archieve a hardened
#               kernel configuration (except for the network part).
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

echo -e "\u2328 Applying changes"
sysctl -p
