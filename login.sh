#!/usr/bin/expect
#send argv[1]
set TARGET_HOST "[lindex $argv 0]"
set TARGET_PASSWD "[lindex $argv 1]"
set TARGET_PORT "[lindex $argv 2]"

spawn ssh ${TARGET_HOST} ${TARGET_PORT} 
expect {
#    "*(yes/no)?" {send "yes\r"; exp_continue}
    "*(yes/no/*)?" {send "yes\r"; exp_continue}
    "*password:" {send "${TARGET_PASSWD}\r"}
}
interact

