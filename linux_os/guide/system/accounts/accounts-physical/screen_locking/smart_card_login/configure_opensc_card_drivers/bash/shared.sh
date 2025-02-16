# platform = Red Hat Enterprise Linux 7,Red Hat Enterprise Linux 8,multi_platform_fedora,multi_platform_rhv,multi_platform_ol,multi_platform_sle
# reboot = false
# strategy = configure
# complexity = low
# disruption = low

{{{ bash_instantiate_variables("var_smartcard_drivers") }}}

OPENSC_TOOL="/usr/bin/opensc-tool"

if [ -f "${OPENSC_TOOL}" ]; then
    ${OPENSC_TOOL} -S app:default:card_drivers:$var_smartcard_drivers
fi
