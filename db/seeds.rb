sinatra = Deck.create(name: "Sinatra")
javascript = Deck.create(name: "JavaScript")
activerecord = Deck.create(name: "ActiveRecord")
http = Deck.create(name: "HTTP")
cs_concepts = Deck.create(name: "CS Concepts")
agile = Deck.create(name: "Agile")

csv = CSV.open("flashcard_content.csv", headers: true, header_converters: :symbol, converters: :all)
card_object_array = []
csv.to_a.map do |row|
  card_object_array << Card.new(row.to_hash)
end

sinatra.cards = card_object_array[0..9]
javascript.cards = card_object_array[10..19]
activerecord.cards = card_object_array[20..29]
http.cards = card_object_array[30..39]
cs_concepts.cards = card_object_array[40..49]
agile.cards = card_object_array[50..59]
