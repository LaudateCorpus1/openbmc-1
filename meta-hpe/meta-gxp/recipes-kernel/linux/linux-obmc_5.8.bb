KBRANCH ?= "dev-5.8-gxp-openbmc"
LINUX_VERSION ?= "5.8.17"
SRCREV="00490832d2e324a73b7d794c242aebef08ba3d4b"

require linux-obmc.inc
require conf/machine/include/fitimage-sign.inc

SRC_URI += "file://phosphor-gpio-keys.scc"
SRC_URI += "file://phosphor-gpio-keys.cfg"

# OpenBMC loads in kernel features via other mechanisms so this check
# in the kernel-yocto.bbclass is not required
KERNEL_DANGLING_FEATURES_WARN_ONLY="1"
