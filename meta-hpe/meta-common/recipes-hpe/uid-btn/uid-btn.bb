SUMMARY = "HPE ID Button"
PR = "r1"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://${HPEBASE}/COPYING.apache-2.0;md5=34400b68072d710fecd0a2940a0d1658"

inherit obmc-phosphor-systemd

DEPENDS += "virtual/obmc-gpio-monitor"
RDEPENDS_${PN} += "virtual/obmc-gpio-monitor"

SYSTEMD_ENVIRONMENT_FILE_${PN} += "obmc/gpio/uid_btn"

UID_BTN_GPIO = "uid_btn"
TMPL_GPIO = "phosphor-gpio-monitor@.service"
TGT_GPIO = "multi-user.target.requires"
INSTFMT_GPIO = "phosphor-gpio-monitor@{0}.service"
FMT_GPIO = "../${TMPL_GPIO}:${TGT_GPIO}/${INSTFMT_GPIO}"
SYSTEMD_LINK_${PN} += "${@compose_list(d, 'FMT_GPIO', 'UID_BTN_GPIO')}"

UID_BTN_SERVICE = "uid-btn.service"
SYSTEMD_SERVICE_${PN} += "${UID_BTN_SERVICE}"

SRC_URI += "file://uid-btn.sh"
SRC_URI += "file://uid-btn.service"

do_install() {
	install -d ${D}${bindir}
	install -m 755 ${WORKDIR}/uid-btn.sh ${D}${bindir}
}
