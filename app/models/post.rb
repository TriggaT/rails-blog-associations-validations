class Post < ActiveRecord::Base
    belongs_to :user
    has_many :post_tags
    has_many :tags, through: :post_tags

    validates :name, :content, presence: true 

    accepts_nested_attributes_for :tags

    def tags_attributes=(tag_attributes)
        tag_attributes.value.each do |tag_attribute|
           if tag_attribute["name"].present?
               tag = Tag.find_or_create(tag_attribute)
               self.tags << Tag.new(tag_attribute)
           end 
       end 
   end 

  
end
