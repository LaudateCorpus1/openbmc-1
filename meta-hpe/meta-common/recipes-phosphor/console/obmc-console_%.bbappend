FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " file://80-gxp-obmc-console-uart.rules"

do_install_append() {
        install -d ${D}/lib/udev/rules.d
        rm -f ${D}/lib/udev/rules.d/80-obmc-console-uart.rules
        install -m 0644 ${WORKDIR}/80-gxp-obmc-console-uart.rules ${D}/lib/udev/rules.d
}

