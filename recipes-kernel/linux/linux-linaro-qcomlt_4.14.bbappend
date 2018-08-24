FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
    file://0001-Add-IMU-ST-driver-patches-for-SPI.patch \
    file://0002-Update-gumstix-device-tree-for-ov5640-and-amoled.patch \
    file://0003-Add-support-for-the-OSD-OSD055A-5.5-MIPI-DSI-AMOLED-.patch \
    file://0004-Switch dtb to dragon.patch \
    file://fragment.cfg \
"

do_configure_append () {
    ${S}/scripts/kconfig/merge_config.sh -m -O ${WORKDIR}/build ${WORKDIR}/build/.config ${WORKDIR}/*.cfg
    yes '' | make oldconfig
}
