apk upgrade --update

apk add libatomic readline readline-dev \
	libxml2 libxml2-dev libxml2-utils \
	ncurses-terminfo-base ncurses-terminfo \
	libxslt libxslt-dev zlib-dev zlib ruby yaml \
	yaml-dev libffi-dev build-base git nodejs \
	ruby-io-console ruby-irb ruby-json ruby-rake \
	imagemagick imagemagick-dev make \
	gcc g++ libffi-dev ruby-dev 

apk add --no-cache python py-pygments 
python -m ensurepip 
rm -r /usr/lib/python*/ensurepip 
pip install --upgrade pip setuptools 

apk add py-pygments

gem install nokogiri -- --use-system-libraries --with-xml2-config=/usr/local/bin/xml2-config --with-xslt-config=/usr/local/bin/xslt-config

gem install rails
gem install etc
