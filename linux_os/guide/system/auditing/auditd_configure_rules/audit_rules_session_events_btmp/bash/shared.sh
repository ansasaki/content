# platform = multi_platform_sle

# Perform the remediation for both possible tools: 'auditctl' and 'augenrules'
{{{ bash_fix_audit_watch_rule("auditctl", "/var/log/btmp", "wa", "session") }}}
{{{ bash_fix_audit_watch_rule("augenrules", "/var/log/btmp", "wa", "session") }}}
