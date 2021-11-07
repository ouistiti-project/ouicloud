data-y+=htdocs/apps/signin.html
data-y+=htdocs/apps/ouiweb.html
htdocs/apps/ouiweb.html_ALIAS+=../index.html
data-y+=htdocs/apps/ouiweb.json
data-y+=htdocs/apps/ouifile.html
data-y+=htdocs/apps/js/ouishell.js
data-y+=htdocs/apps/images/ouifile.png
data-$(ALBUM)+=htdocs/apps/ouialbum.html
data-$(ALBUM)+=htdocs/apps/images/ouialbum.png
data-$(CHAT)+=htdocs/apps/ouichat.html
data-$(CHAT)+=htdocs/apps/js/ouichat.js
data-$(CHAT)+=htdocs/apps/images/ouichat.png
data-$(PLAYMUSIC)+=htdocs/apps/ouiplaymusic.html
data-$(PLAYMUSIC)+=htdocs/apps/images/ouiplaymusic.png
data-$(EDIT)+=htdocs/apps/ouiedit.html

BOOTSTRAP_VERSION=3.3.7
BOOTSTRAP_FILES+=htdocs/trust/css/bootstrap.min.css
BOOTSTRAP_FILES+=htdocs/trust/css/bootstrap.min.css.map
BOOTSTRAP_FILES+=htdocs/trust/fonts/glyphicons-halflings-regular.woff2
BOOTSTRAP_FILES+=htdocs/trust/js/bootstrap.min.js
data-y+=$(BOOTSTRAP_FILES)

bootstrap-v$(BOOTSTRAP_VERSION).zip:
	wget -c -O $@ https://github.com/twbs/bootstrap/archive/v$(BOOTSTRAP_VERSION).zip || if [ ! -s $@ ]; then rm $@; fi

bootstrap-$(BOOTSTRAP_VERSION)/: bootstrap-v$(BOOTSTRAP_VERSION).zip
	unzip $<

$(BOOTSTRAP_FILES): htdocs/trust/%: bootstrap-$(BOOTSTRAP_VERSION)/
	mkdir -p $(dir $@)
	cp $</dist/$* $@

JQUERY_VERSION=3.6.0
JQUERY_FILES+=htdocs/trust/js/jquery-$(JQUERY_VERSION).min.js
data-y+=$(JQUERY_FILES)

$(JQUERY_FILES): htdocs/trust/%:
	mkdir -p $(dir $@)
	wget -O $@ https://code.jquery.com/$(notdir $*)

htdocs/trust/js/jquery-$(JQUERY_VERSION).min.js_ALIAS+=jquery.min.js
