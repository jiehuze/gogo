#!/usr/bin/expect
#send argv[1]
set TARGET_HOST "[lindex $argv 0]"
set TARGET_PASSWD "[lindex $argv 1]"
set LOCAL_FILE "[lindex $argv 2]"
set REMOTE_PATH "[lindex $argv 3]"

spawn scp ${LOCAL_FILE} ${TARGET_HOST}:${REMOTE_PATH} 
expect {
    "*(yes/no)?" {send "yes\r"; exp_continue}
    "*password:" {send "${TARGET_PASSWD}\r"}
}
interact

