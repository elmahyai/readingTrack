# readingTrack
To improve my reading progress, I removed all distractions, put the files I read on the desktop, wrote a shell script to change the desktop background to denote exacltly how much I have done and how much pages are not yet read.


I didn't have enough time to comment the files (Next time I will) so here is a description:
1. I extract the number of pages of every book from pdfinfo
2. I extract the page number I stopped at from  from okular
3. I send the output file to R using Rscript
4. R produces the ggplot graph denoting how much progress I have made in every book
5. The shell script changes the desktop background to the new graph
6. All the previous steps are repeated every minute behind the scenes using cron

So everytime I make progress in one book the stack with change with me in the background until I finsh reading

Note: I add the following to the crontab file
# m h dom mon dow command
  * * * * * source ~/Documents/pj/Readingtrack/readingProgress.sh

