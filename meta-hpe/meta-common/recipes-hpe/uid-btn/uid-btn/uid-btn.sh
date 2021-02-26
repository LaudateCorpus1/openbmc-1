#~/bin/sh
led_service=`mapper get-service /xyz/openbmc_project/led/groups/enclosure_identify`
uid_state=`busctl call ${led_service} /xyz/openbmc_project/led/groups/enclosure_identify org.freedesktop.DBus.Properties Get ss xyz.openbmc_project.Led.Group Asserted`
uid_state=`echo ${uid_state} | cut -d ' ' -f 3`
if [ "${uid_state}" == "true" ]; then
	uid_state="false"
else
	uid_state="true"
fi
busctl call ${led_service} /xyz/openbmc_project/led/groups/enclosure_identify org.freedesktop.DBus.Properties Set ssv xyz.openbmc_project.Led.Group Asserted b ${uid_state}
