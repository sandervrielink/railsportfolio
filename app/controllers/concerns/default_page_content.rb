module DefaultPageContent
  extend ActiveSupport::Concern
  
  included do
    before_filter :set_page_defaults
  end
  
  def set_page_defaults
    @page_title = "DevcampPortfolio | Sander Vrielink"
    @seo_keywords = "Sander Vrielink Portfolio Ruby on Rails"
  end
end