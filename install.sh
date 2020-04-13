#!/bin/bash

test -d /usr/local/bin || /usr/bin/install -c -d /usr/local/bin
test -d /usr/local/include/znc || /usr/bin/install -c -d /usr/local/include/znc
test -d /usr/local/lib/pkgconfig || /usr/bin/install -c -d /usr/local/lib/pkgconfig
test -d /usr/local/lib/znc || /usr/bin/install -c -d /usr/local/lib/znc
test -d /usr/local/share/znc || /usr/bin/install -c -d /usr/local/share/znc
cp -R ../webskins /usr/local/share/znc
find /usr/local/share/znc/webskins -type d -exec chmod 0755 '{}' \;
find /usr/local/share/znc/webskins -type f -exec chmod 0644 '{}' \;
/usr/bin/install -c znc /usr/local/bin
/usr/bin/install -c znc-buildmod /usr/local/bin
/usr/bin/install -c -m 644 ../include/znc/*.h /usr/local/include/znc
/usr/bin/install -c -m 644 include/znc/*.h /usr/local/include/znc
/usr/bin/install -c -m 644 znc.pc /usr/local/lib/pkgconfig
cd /znc/build/modules
rm -rf /usr/local/share/znc/modules
test -d /usr/local/lib/znc || /usr/bin/install -c -d /usr/local/lib/znc
test -d /usr/local/share/znc/modules || /usr/bin/install -c -d /usr/local/share/znc/modules
rm -rf /usr/local/lib/znc/*.so
cp -R ../../modules/data/* /usr/local/share/znc/modules
find /usr/local/share/znc/modules -type d -exec chmod 0755 '{}' \;
find /usr/local/share/znc/modules -type f -exec chmod 0644 '{}' \;
/usr/bin/install -c admindebug.so adminlog.so alias.so autoattach.so autocycle.so autoop.so autoreply.so autovoice.so awaynick.so block_motd.so blockuser.so bouncedcc.so buffextras.so chansaver.so clearbufferonmsg.so clientnotify.so controlpanel.so ctcpflood.so dcc.so disconkick.so fail2ban.so flooddetach.so identfile.so imapauth.so keepnick.so kickrejoin.so lastseen.so listsockets.so log.so missingmotd.so modules_online.so nickserv.so notes.so notify_connect.so perform.so raw.so route_replies.so sample.so samplewebapi.so sasl.so send_raw.so shell.so simple_away.so stickychan.so stripcontrols.so watch.so webadmin.so /usr/local/lib/znc
