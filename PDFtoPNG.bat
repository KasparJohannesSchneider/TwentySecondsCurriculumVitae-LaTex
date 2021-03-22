Rem Windows batch file to convert the CV to a PNG that is displayed in README.md
Rem Requires ImageMagick and Ghostscript 
magick convert -density 1200 Twenty-Seconds-Icons_cv.pdf -quality 90 Twenty-Seconds-Icons_cv.png
Pause