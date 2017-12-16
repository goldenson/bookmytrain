set :output, "/home/deploy/cron.log"

every hour do
  command "echo 'the job is working 😁'"
end