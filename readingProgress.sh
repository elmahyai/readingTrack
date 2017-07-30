#!bin/bash
cd ~/Documents/pj/Readingtrack/
rm progress.tab
rm *.png
cd ~/Desktop
for filename in $(ls [A-Z]); do
    #numberPages=$(pdfinfo ~/Desktop/$filename | grep -e Pages | grep -o '[0-9][0-9][0-9]')
    numberPages=$(pdfinfo ~/Desktop/$filename | grep -e Pages | grep -o .[0-9].$)
    
    current=$(grep "current" ~/.local/share/okular/docdata/*$filename.xml | grep -P -o '([0-9]+);' | grep -P -o '.+[^;]')

    echo -e $filename\\t$current\\t$numberPages\\n >>~/Documents/pj/Readingtrack/progress.tab
    
done
cd ~/Documents/pj/Readingtrack/
Rscript -e 'source("~/Documents/pj/Readingtrack/track.R")'

export DISPLAY=:0
export XAUTHORITY=/home/ahmed/.Xauthority  

pcmanfm -w ~/Documents/pj/Readingtrack/track.png
