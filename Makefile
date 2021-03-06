# Don't worry if the system files do not exist
.PHONY: html pdf

# Only build the HTML component under a default make
all: html

# Create the gitbook and then launch it inside of a browser
html:
	Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"
	Rscript -e "browseURL('_book/index.html')"

# Create a pdf and then open it with the system pdf handler
pdf:
	Rscript -e "bookdown::render_book('index.Rmd', 'tint::tintBook')" 
	Rscript -e "browseURL('_book/spm.pdf')"

# Clean up on isle 7
clean:
	Rscript -e "bookdown::clean_book(TRUE)"
	rm -rfv _bookdown_files *.log
