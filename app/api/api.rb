module API
  class IotFocus < Grape::API
    
    version 'v1', using: :header, vendor: 'Focus'
    format :json
    resource :person do
      # /person/all_people
      desc  'Gets a list of persons'
      get :all_people do
        Person.all
      end
      desc 'Create a person'
      params do
        requires :name, type: String
        requires :age, type: Integer
        requires :gender, type: String
      end
      post do
        Person.create(name: params[:name], age: params[:age], gender: params[:gender])
      end
      desc 'get current user with user Id'
      params do
        requires :id, type: Integer
      end
      get :by_id do
        Person.find(params[:id])
      end

      desc 'get current user with username'
      params do
        requires :name, type: String
      end
      get :by_name do
        Person.find_by name: params[:name]
      end
    end
    

    resource :emotiondatum do
      desc  'Gets a list of emotiondatum'
      params do 
        requires :id, type: Integer
      end
      # localhost:3000/emotiondatum/person_emotion?id=1
      get :person_emotion do
        Person.find(params[:id]).EmotionDatum.all
      end
      desc 'Create a emotion datum'
      params do
        requires :feeling, type: Float
        requires :anger, type: Float
        requires :happiness, type: Float
        requires :sadness, type: Float
        requires :person_id, type: Integer
      end
      post do
        EmotionDatum.create(feeling: params[:feeling],anger: params[:anger],happiness: params[:happiness],sadness: params[:sadness],person_id: params[:person_id])
      end
    end
    
    resource :seatdatum do
      desc  'Gets a list of persons'
      params do 
        requires :id, type: Integer
      end
      get :person_seat do
        Person.find(params[:id]).SeatDatum.all
      end
      desc 'Create a seat state change'
      params do
        requires :is_sitting, type: Boolean
        requires :person_id, type: Integer
      end
      post do
        SeatDatum.create(is_sitting: params[:is_sitting],person_id: params[:person_id])
      end

    end

    resource :totemdatum do
      desc  'Gets a list of persons'
      params do 
        requires :id, type: Integer
      end
      get :person_emotion do
        Person.find(params[:id]).TotemDatum.all
      end
      desc 'Create a person'
      params do
        requires :state, type: String
        requires :person_id, type: Integer
      end
      post do
        TotemDatum.create(state: params[:state],person_id: params[:person_id])
      end
    end
  end
end