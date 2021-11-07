JQUERY_VERSION=3.6.0
JQUERY_FILES+=htdocs/trust/js/jquery-$(JQUERY_VERSION).min.js
data-y+=$(JQUERY_FILES)

$(JQUERY_FILES): htdocs/trust/%:
	mkdir -p $(dir $@)
	wget -O $@ https://code.jquery.com/$(notdir $*)

htdocs/trust/js/jquery-$(JQUERY_VERSION).min.js_ALIAS+=jquery.min.js
