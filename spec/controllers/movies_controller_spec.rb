require 'spec_helper'

describe MoviesController do
  describe 'Find movies with same director' do
    before :each do
      @fake_movie = FactoryGirl.create(:movie, :id => "1", :title => "Star Wars", :director => "George Lucas") 
    end
    it 'should call the model method that handles similar movies search' do
      Movie.should_receive(:similar)
      get :movies, :id => @fake_movie.id, :action => 'similar'
      end
    it 'should select the Similar Movies template for rendering' do
      Movie.stub :similar
      get :movies, :id => @fake_movie.id, :action => 'similar'
      response.should render_template :similar
    end
    it 'should make search results available to that template' do
      fake_results = :fake
      Movie.stub(:similar).and_return(fake_results)
      get :movies, :id => @fake_movie.id, :action => 'similar'
      assigns(:movies).should == fake_results
    end
    it 'should redirect to home with flash available if director field empty' do
      movie = FactoryGirl.create(:movie, :title => "Spice", :id => "2", :director => "")
      get :movies, :id => movie.id, :action => 'similar'
      response.should be_redirect
      response.should redirect_to(movies_path)
    end
    it 'should make flash available to next reguest' do
      movie = FactoryGirl.create(:movie, :title => "Spice", :id => "2", :director => "")
      get :movies, :id => movie.id, :action => 'similar'
      flash[:notice].should == "'#{movie.title}' has no director info"
    end
  end
#  describe 'Delete movie' do
#     before :each do
#      @fake_movie = FactoryGirl.create(:movie, :id => "1", :title => "Star Wars", :director => "George Lucas") 
#    end
#    it 'should have destroy class' do
#      @fake_movie.should respond_to :destroy
#    end
#  end
end
