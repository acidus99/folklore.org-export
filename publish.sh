#create clean output
rm -rf output
mkdir output
cp -R Posts/* output/.

#convert MD to gemtext
md2gemini --write --dir output/ --frontmatter --img-tag='' --links images-only output/*.md
rm output/*.md

#md2gemini annoyingly adds CRLF, regardless of platform
dos2unix -q output/*.gmi

#generate index and append navigation links to the bottom of the posts
dotnet run --project ../ContentIndexer/ output/ "Folklore.org Mirror"