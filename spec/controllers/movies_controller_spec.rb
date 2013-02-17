require 'spec_helper'

describe MoviesController do
  describe 'Find movies with same director' do
    before :each do
      @fake_movie = FactoryGirl.create(:movie, :id => "1", :title => "Star Wars", :director => "George Lucas") 
    end
    it 'should call the model method that handles similar movies search' do
      Movie.should_receive(:similar).with('1')
      get :similar, {:id => "1"}
      end
    it 'should select the Similar Movies template for rendering' do
      Movie.stub :similar
      get :similar, {:id => "1"}
      response.should render_template :similar
    end
    it 'should make search results available to that template' do
      fake_results = :fake
      Movie.stub(:similar).and_return(fake_results)
      get :similar, {:id => "1"}
      assigns(:movies).should == fake_results
    end
  end
end
