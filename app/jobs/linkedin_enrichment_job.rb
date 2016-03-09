require 'json'
require 'open-uri'

class LinkedinEnrichmentJob < ApplicationJob
  queue_as :default

  def perform(company_id)

     agency = Agency.find(agence_id)
     company_id = agency.company_id

     api = LinkedinApiService.new(company_id)

      agency.company_name = api.company_name
      agency.company_size = api.company_size
      agency.specialities = api.specialities
      agency.website = api.website
      agency.industry = api.industry
      agency.type = api.type
      agency.creation_date = api.creation_date
      agency.address = api.address


      agency.save

    # Do something later
  end
end
