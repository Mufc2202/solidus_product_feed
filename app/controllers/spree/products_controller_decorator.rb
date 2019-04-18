Spree::ProductsController.prepend(Module.new do
  class << self
    def prepended(klass)
      klass.respond_to :rss, only: :index
    end
  end

  def index
    load_feed_products if request.format.rss?
    super
  end

  private

  def load_feed_products
    @feed_products = Spree::Product.all.map(&SolidusProductFeed.feed_product_class.method(:new))
  end
end)
