S3_CLIENT = Aws::S3::Client.new
S3_BUCKET = Aws::S3::Resource.new.bucket(ENV['S3_BUCKET'])