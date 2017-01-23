class Product < ActiveRecord::Base
 
  belongs_to :category
   
  has_attached_file :product_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "http://placehold.it/800x500"
  validates_attachment_content_type :product_image, content_type: /\Aimage\/.*\z/
  
   include Tire::Model::Search
   include Tire::Model::Callbacks

   def self.search(params)
   	   tire.search(load: true, page: params[:page], per_page: 12) do 
          query { string params[:query] } if params[:query].present?
          sort { by :created_at , "asc" } if params[:query].blank? 	   
   	   end
   end
   
end
