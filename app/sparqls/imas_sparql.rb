
class ImasSparql
	require "sparql/client"
	include ActiveAttr::TypecastedAttributes
	include ActiveAttr::BlockInitialization

	attribute :name, type: String
	attribute :height, type: String

	def self.all
		idols = []
		results = self.all_query

		results.each do |result|
			idol = ImasSparql.new do |r|
				r.name   = result[:name]
				r.height = result[:height]
			end
			idols << idol
		end

		idols
	end

	private

	def self.all_query
		client = SPARQL::Client.new('https://sparql.crssnky.xyz/spql/imas/query')
		results = client.query('
			PREFIX schema: <http://schema.org/>
      PREFIX imas:   <https://sparql.crssnky.xyz/imasrdf/URIs/imas-schema.ttl#>
      SELECT ?name ?height
      WHERE {
	    ?s schema:name|schema:alternateName ?name;
		     schema:height                    ?height.
      }order by(?height)
		')

		results
	end
end
