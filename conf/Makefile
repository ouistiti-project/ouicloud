sysconf-y+=ouistiti.d/ouicloud.conf

sysconf-y+=filter.db

filter.db: filter.conf
	@echo "  CREATE filter.db"; cat $< | sqlite3 $@

.filter.ready: filter.update.conf filter.db
	@echo " UPDATE filter.db"; cat  $< | sqlite3 filter.db

hook-build-y+=.filter.ready
