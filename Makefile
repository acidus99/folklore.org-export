all: gemtext images gallery

gallery: gemtext
	@echo "Making Gallery"
	@grep -E -h '^!\[' Posts/*.md > output/gallery.md
	@printf '# Image Gallery\n\n' > output/gallery.gmi
	@perl -pe 's/!\[(.+)?\s\\\[\d+\\]\]\(([^\)]+)\)/=> $$2 $$1/' output/gallery.md >> output/gallery.gmi
# catch and convert the few images that don't have a footnote in the description
	@perl -i -pe 's/!\[(.+)?(?:\s\\\[\d+\\])?\]\(([^\)]+)\)/=> $$2 $$1/' output/gallery.gmi
	@rm -f output/gallery.md

gemtext: images
	@echo "Converting to Gemtext"
	@md2gemini --write --dir output/ --frontmatter --img-tag='' --links images-only output/*.md
	@rm output/*.md
# md2gemini annoyingly adds CRLF, regardless of platform
	@dos2unix -q output/*.gmi
# fix escaped square brackets in link lines
	@sed -i '' '/^=>/ s/\\\[/\[/' output/*.gmi
	@sed -i '' '/^=>/ s/\\\]/\]/' output/*.gmi
# generate index and add navigation links to the bottom of the posts
	@dotnet run --project ../ContentIndexer/ output/ "Folklore.org Mirror"
	
images: output
	@echo "Optimizing images"
	@mogrify -strip -quality 80 -resize 800x800\> output/images/*

output: clean
	@echo "Creating 'output/'"
	@mkdir output
	@cp -R Posts/* output/.

clean:
	@echo "Cleaning"
	@rm -rf output
