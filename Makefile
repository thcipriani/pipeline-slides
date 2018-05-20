deploy: build
	rsync -avz --no-perms --exclude=".git/**" . rutherfordium.eqiad.wmnet:public_html/pipeline/.

build: fetch
	pandoc --standalone -f markdown -t revealjs ssd_pipeline.md -V theme=solarized -o index.html

fetch:
	curl -SLo ssd_pipeline.md https://etherpad.tylercipriani.com/p/2018_blubber/export/txt

.PHONY: build fetch deploy
