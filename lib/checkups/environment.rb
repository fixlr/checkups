begin
  require 'dotenv'
  Dotenv.load(".env.#{Checkups.env}", '.env')
rescue LoadError
end

