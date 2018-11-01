class ShoutSearchQuery
  attr_reader :term
  def initialize(term:)
    @term = term
  end

  def to_relation
    matching_shouts_of_type_text.or(matching_shouts_of_type_photo)
  end

  def matching_shouts_of_type_text
    Shout.where(content_type:"TextShout", content_id: matching_text_shouts.select(:id))
  end

  def matching_shouts_of_type_photo
    Shout.where(content_type:"PhotoShout", content_id: matching_photo_shouts.select(:id))
  end

  def matching_text_shouts
    TextShout.where("body ILIKE ?", "%#{term}%")
  end

  def matching_photo_shouts
    PhotoShout.where("image_file_name ILIKE ?", "%#{term}%")
  end

end