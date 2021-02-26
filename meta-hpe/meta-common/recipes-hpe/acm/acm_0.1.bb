SUMMARY = "Apollo Chassis Manager"
DESCRIPTION = "A service for communicating to Apollo Chassis Manager"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
BRANCH = "main"
SRC_URI = "git://github.com/HewlettPackard/openbmc-acm.git;branch=${BRANCH}"
SRCREV = "26d36d9fbcd7407bebe06cc31088b7f889ad550d"
PV = "0.1+git${SRCPV}"
S = "${WORKDIR}/git/"

DEPENDS = "systemd pkgconfig-native"
EXTRA_OEMAKE = "'CC=${CC}' 'CFLAGS=${CFLAGS}'"
ACM_SERVICE = "acm.service"
SYSTEMD_SERVICE_${PN} = "${ACM_SERVICE}"
SYSTEMD_LINK_${PN} = "../${ACM_SERVICE}:multi-user.target.wants/${ACM_SERVICE}"

FILES_${PN} = "${bindir}/acm-poll"
FILES_${PN} += " /lib/systemd/system/acm.service"

do_install () {
	install -d ${D}/lib/systemd/system
	install -m 0644 ${S}/acm.service ${D}/lib/systemd/system
	install -d ${D}${bindir}
	install -m 0755 acm-poll ${D}${bindir}
}

inherit obmc-phosphor-systemd
