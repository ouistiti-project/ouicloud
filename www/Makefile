data-y+=htdocs/login.html
data-y+=htdocs/apps/ouiweb.html
htdocs/apps/ouiweb.html_ALIAS+=htdocs/index.html
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

data-y+=htdocs/trust/css/bootstrap.min.css
data-y+=htdocs/trust/css/bootstrap.min.css.map
data-y+=htdocs/trust/fonts/glyphicons-halflings-regular.woff2
data-y+=htdocs/trust/js/bootstrap.min.js
data-y+=htdocs/trust/js/jquery.min.js

BOOTSTRAP_VERSION=-3.3.1
htdocs/trust/css/bootstrap.min.css:
	cd htdocs/trust/css/ && wget http://maxcdn.bootstrapcdn.com/bootstrap/$(BOOTSTRAP_VERSION)/css/bootstrap.min.css
htdocs/trust/fonts/glyphicons-halflings-regular.woff2:
	cd htdocs/trust/js/ && wget http://maxcdn.bootstrapcdn.com/bootstrap/$(BOOTSTRAP_VERSION)/fonts/glyphicons-halflings-regular.woff2
htdocs/trust/js/bootstrap.min.js:
	cd htdocs/trust/js/ && wget http://maxcdn.bootstrapcdn.com/bootstrap/$(BOOTSTRAP_VERSION)/js/bootstrap.min.js
JQUERY_VERSION=-3.3.1
htdocs/trust/js/jquery.min.js:
	cd htdocs/trust/js/ && wget https://code.jquery.com/jquery$(JQUERY_VERSION).min.js && mv jquery$(JQUERY_VERSION).min.js jquery.min.js
