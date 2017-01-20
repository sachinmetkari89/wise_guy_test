module ProductsHelper

  def select_catagory_tag_helper
	categories = Category.all
    return categories
  end

end
