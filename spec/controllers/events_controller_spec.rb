require 'rails_helper'
require 'spec_helper'

RSpec.describe EventsController, type: :controller do
	describe 'GET #new' do
		context 'when nologgedin user come' do
			before { get :new }

			it 'redirect to top' do
				expect(response).to redirect_to(root_path)
			end
		end

		context 'when loggedin user come' do
			before do
				user = create :user
				session[:user_id] = user.id
				get :new
			end

			it 'return status code 200' do
				expect(response.status).to eq(200)
			end

			it 'New Event Object assigning to @event' do
				expect(assaigns(:event)).to be_a_new(Event)
			end

			it 'rendering new template' do 
				expect(response).to render_template :new
			end
		end
	end
end
