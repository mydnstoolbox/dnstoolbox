require 'logger'

logger = Logger.new("logfile.log")
logger.formatter = proc do |severity, datetime, progname, msg| 
    "#{severity} #{progname} #{datetime}: #{msg}\n"
end

logger.error('Apache') { "Initializing..."}
