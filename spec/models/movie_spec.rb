require 'spec_helper'

describe Movie do
  describe 'Find movies with same director' do
    it 'should have method to find movies with same director' do
      Movie.should respond_to :similar 
    end
    it 'should return array' do
      fake_movie = FactoryGirl.create(:movie, :id => "1", :title => "Star Wars", :director => "George Lucas")
      Movie.similar(fake_movie.id).class.should == [].class
    end
    it 'should return movies where director is same if director is present' do
      fake_movie = FactoryGirl.create(:movie, :id => "1", :title => "Star Wars", :director => "George Lucas")
      second_movie = FactoryGirl.create(:movie, :title => "THX-1138", :director => "George Lucas")
      third_movie = FactoryGirl.create(:movie, :title => "2001", :director => "Stanley Kubric")
      movies = Movie.similar(fake_movie.id)
      movies.should include(second_movie)
      movies.should_not include(third_movie)
    end
  end
end