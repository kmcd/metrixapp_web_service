xml = Builder::XmlMarkup.new
xml.instruct!

xml.chart do
  xml.series do
  end
end

xml.graphs do
  xml.graph :gid => 'population' do
  end
end
