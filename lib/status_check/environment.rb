begin
  require 'dotenv'
  Dotenv.load(".env.#{StatusCheck.env}", '.env')
rescue LoadError
end

