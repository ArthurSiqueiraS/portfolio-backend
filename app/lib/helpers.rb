def jsonify(object)
  object = object.as_json
  (object.is_a? String) ? JSON.parse(object) : object
end

def to_object_id(ids)
  begin
    (ids.is_a? Array) ?
      ids.map { |id| BSON::ObjectId(id) } :
      BSON::ObjectId(ids)
  rescue BSON::ObjectId::Invalid
  end
end

def pluralize_dict(dict)
  dict.each do |type, enum|
    pluralized_words = enum.split(' ').map { |word| word.pluralize(:'pt-BR') }

    dict[type] = pluralized_words.join(' ')
  end
end

def local_date(time)
  return unless time
  I18n.l(time.to_date)
end

def print_key_value(k, v)
  puts "#{k}: #{v}"
end

def normalize_email(email)
  email.strip.downcase
end