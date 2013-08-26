# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#

every 1.days do
	#Run Scraper against site ( 10 pages max ) after a full initial scrape of the site
end
