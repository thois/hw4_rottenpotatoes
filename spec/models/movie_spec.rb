require 'spec_helper'

describe Movie do
  describe 'Find movies with same director' do
    it 'should have method to find movies with same director' do
      Movie.should respond_to :similar 
    end
    it 'should return list of movies' do
      Movie.similar should be(:list)
    end
    it 'should return movies where director is same if director is present'
  end
end