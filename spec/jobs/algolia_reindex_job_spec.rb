# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Algolia Reindex Job' do
  it 'runs Algolia reindex operation on the expected models' do
    resource_query = double
    expect(Resource).to receive(:where).with(status: :approved).and_return(resource_query)
    expect(resource_query).to receive(:reindex)

    service_query = double
    expect(Service).to receive(:where).with(status: :approved).and_return(service_query)
    expect(service_query).to receive(:reindex!)

    AlgoliaReindexJob.new.perform
  end
end
