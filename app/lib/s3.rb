class S3
  class << self
    def upload(path, folder = '')
      key = "#{folder}/#{Time.now.strftime("%Y%m%d%H%M%S%L")}_#{File.basename(path)}"
      key = "#{Rails.env}/#{key}" if Rails.env != 'production'
      obj = S3_BUCKET.object(key)
      obj.upload_file(path)
      S3_CLIENT.put_object_acl(acl: 'public-read', bucket: S3_BUCKET.name, key: key)

      obj.public_url
    end

    def delete_object(key)
      key = "#{Rails.env}/#{key}" if Rails.env != 'production'
      object = S3_BUCKET.object(key)
      object.delete
    end
  end
end