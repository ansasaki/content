# platform = multi_platform_wrlinux,multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,multi_platform_sle

{{{ bash_instantiate_variables("var_password_pam_unix_remember") }}}

AUTH_FILES[0]="/etc/pam.d/system-auth"
AUTH_FILES[1]="/etc/pam.d/password-auth"

for pamFile in "${AUTH_FILES[@]}"
do
	if grep -q "pam_unix.so.*remember=" $pamFile; then
		sed -i --follow-symlinks "s/\(^password.*sufficient.*pam_unix.so.*\)\(\(remember *= *\)[^ $]*\)/\1remember=$var_password_pam_unix_remember/" $pamFile
	else
		sed -i --follow-symlinks "/^password[[:space:]]\+sufficient[[:space:]]\+pam_unix.so/ s/$/ remember=$var_password_pam_unix_remember/" $pamFile
	fi
	if grep -q "pam_pwhistory.so.*remember=" $pamFile; then
		sed -i --follow-symlinks "s/\(^password.*\)\(\(remember *= *\)[^ $]*\)/\1remember=$var_password_pam_unix_remember/" $pamFile
	else
		sed -i --follow-symlinks "/^password[[:space:]]\+\(requisite\|required\)[[:space:]]\+pam_pwhistory.so/ s/$/ remember=$var_password_pam_unix_remember/" $pamFile
	fi
done
