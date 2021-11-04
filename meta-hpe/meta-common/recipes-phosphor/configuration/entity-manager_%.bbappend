FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

# platform configuration files
SRC_URI += "file://dl360g10.json"
SRC_URI += "file://dl325g10p.json"
SRC_URI += "file://xl225ng10p.json"
SRC_URI += "file://dl325g10pv2.json"


do_install_append() {
	install -D ${WORKDIR}/dl360g10.json ${D}${datadir}/${BPN}/configurations/dl360g10.json
	install -D ${WORKDIR}/dl325g10p.json ${D}${datadir}/${BPN}/configurations/dl325g10p.json
	install -D ${WORKDIR}/xl225ng10p.json ${D}${datadir}/${BPN}/configurations/xl225ng10p.json
	install -D ${WORKDIR}/dl325g10pv2.json ${D}${datadir}/${BPN}/configurations/dl325g10pv2.json 
}
