#!/bin/sh

PASSWD=${SYSCONFDIR}/passwd.db
PASSWDUPDATE=${SYSCONFDIR}/.passwd.ready
FILTER=${SYSCONFDIR}/filter.db
FILTERUPDATE=${SYSCONFDIR}/.filter.ready

createpasswd () {
	sqlite3i $1 << EOF1
EOF1
}
updatepasswd () {
	sqlite3 $1 << EOF2
EOF2
}
createfilter () {
	sqlite3 $1 << EOF3
create table methods ("id" INTEGER PRIMARY KEY, "name" TEXT UNIQUE NOT NULL);
insert into methods (name) values("GET");
insert into methods (name) values("POST");
insert into methods (name) values("PUT");
insert into methods (name) values("DELETE");
insert into methods (name) values("HEAD");
create table roles ("id" INTEGER PRIMARY KEY, "name" TEXT UNIQUE NOT NULL);
insert into roles (id, name) values(0, "root");
insert into roles (id, name) values(1, "anonymous");
insert into roles (id, name) values(2, "*");
create table rules ("exp" TEXT NOT NULL, "methodid" INTEGER NOT NULL,"roleid" INTEGER NOT NULL, FOREIGN KEY (methodid) REFERENCES methods(id) ON UPDATE SET NULL, FOREIGN KEY (roleid) REFERENCES roles(id) ON UPDATE SET NULL);
insert into rules (exp,methodid,roleid) values("^/*",(select id from methods where name="GET"),(select id from roles where name = "root"));
EOF3
}
updatefilter () {
	sqlite3 $1 << EOF4
insert into roles (id, name) values(3, "users");
insert into rules (exp,methodid,roleid) values("^/~/*",(select id from methods where name="GET"),(select id from roles where name = "root"));
insert into rules (exp,methodid,roleid) values("^/~/*",(select id from methods where name="POST"),(select id from roles where name = "root"));
insert into rules (exp,methodid,roleid) values("^/~/*",(select id from methods where name="PUT"),(select id from roles where name = "root"));
insert into rules (exp,methodid,roleid) values("^/~/*",(select id from methods where name="DELETE"),(select id from roles where name = "root"));
insert into rules (exp,methodid,roleid) values("^/~/*",(select id from methods where name="GET"),(select id from roles where name = "users"));
insert into rules (exp,methodid,roleid) values("^/~/*",(select id from methods where name="POST"),(select id from roles where name = "users"));
insert into rules (exp,methodid,roleid) values("^/~/*",(select id from methods where name="PUT"),(select id from roles where name = "users"));
insert into rules (exp,methodid,roleid) values("^/~/*",(select id from methods where name="DELETE"),(select id from roles where name = "users"));
insert into rules (exp,methodid,roleid) values("^/apps/*",(select id from methods where name="GET"),(select id from roles where name = "users"));
insert into rules (exp,methodid,roleid) values("^/trust/*",(select id from methods where name="GET"),(select id from roles where name = "*"));
EOF4
}

if [ ! -e $PASSWD ]; then
	createpasswd $PASSWD
fi
if [ ! -e $PASSWDUPDATE ]; then
	updatepasswd $PASSWD
	touch $PASSWDUPDATE
fi
if [ ! -e $FILTER ]; then
        createfilter $FILTER
fi
if [ ! -e $FILTERUPDATE ]; then
        updatefilter $FILTER
        touch $FILTERUPDATE
fi
