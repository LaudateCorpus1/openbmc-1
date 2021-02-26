LICENSE = "CLOSED"
LIC_FILES_CHKSUM = ""

# TODO:  Manually copy the U-Boot signing key here:
HPE_GXP_KEY_FILES_DIR = "${COREBASE}/meta-hpe/meta-gxp/recipes-bsp/image/files"

inherit deploy

do_deploy () {
  install -d ${DEPLOYDIR}

  # Copy in the bootblock
  install -m 644 ${HPE_GXP_KEY_FILES_DIR}/gxp-bootblock.bin ${DEPLOYDIR}/gxp-bootblock.bin

  # Copy in files from the files subdirectory
  install -m 644 ${HPE_GXP_KEY_FILES_DIR}/header.sig ${DEPLOYDIR}/hpe-uboot-header.section
}

addtask deploy before do_build after do_compile

