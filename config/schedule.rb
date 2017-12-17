set :output, "/home/deploy/cron.log"

every 1.hours do
  command "echo 'the job is working 😁'"
end