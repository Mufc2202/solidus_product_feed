xml.instruct! :xml, version: "1.0"

xml.rss version: "2.0", "xmlns:g" => "http://base.google.com/ns/1.0" do
  xml.channel do
    xml.title SolidusProductFeed.evaluate(SolidusProductFeed.title, self)
    xml.link SolidusProductFeed.evaluate(SolidusProductFeed.link, self)
    xml.description SolidusProductFeed.evaluate(SolidusProductFeed.description, self)
    xml.language SolidusProductFeed.evaluate(SolidusProductFeed.language, self)

    @feed_products.each do |feed_product|
      xml.item do
        xml.tag! 'g:id', feed_product.id
        xml.title feed_product.title
        xml.description feed_product.description
        xml.category feed_product.category if feed_product.category
        xml.link product_url(feed_product.product)
        xml.tag! 'g:image_link', feed_product.image_link
        xml.tag! 'g:condition', feed_product.condition
        xml.tag! 'g:price', feed_product.price.money.format(symbol: false, with_currency: true)
      end
    end
  end
end
