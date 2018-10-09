FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
    file://fragment.cfg \
    file://0005-apq.patch \
    file://0002-Update-gumstix-device-tree-for-ov5640-and-amoled.patch \
    file://0003-Add-support-for-the-OSD-OSD055A-5.5-MIPI-DSI-AMOLED-.patch \
    file://0004-Touchscreen.patch \
"

do_configure_append () {
    ${S}/scripts/kconfig/merge_config.sh -m -O ${WORKDIR}/build ${WORKDIR}/build/.config ${WORKDIR}/*.cfg
    yes '' | make oldconfig
}

KERNEL_DEVICETREE = "qcom/gumstix-dragonboard.dtb"
