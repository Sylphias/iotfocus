module API
  class IotFocus < Grape::API
    
    version 'v1', using: :header, vendor: 'Focus'
    format :json
    resource :person do
      #GET /person/all_people
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

      #POST /person
      #attach person json as data
      post do
        Person.create(name: params[:name], age: params[:age], gender: params[:gender])
      end

      desc 'Update a person particulars and ip_address'
      params do
        requires :name, type: String
        requires :age, type: Integer
        requires :gender, type: String
        requires :id, type: Integer
      end

      #put /api/person
      #attach person json as data
      put do
        Person.find(params[:id]).update(name: params[:name], age: params[:age], gender: params[:gender])
      end

      #GET /person/by_id?id=id
      desc 'get current user with user Id'
      params do
        requires :id, type: Integer
      end

      get :by_id do
        Person.find(params[:id])
      end

      #GET /person/by_name?name=name
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
      # GET /emotiondatum/person_emotion?id=1
      get :person_emotion do
        Person.find(params[:id]).EmotionDatum.all
      end

      # POST /emotiondatum
      # Post emotiondatum as data json
      desc 'Create a emotion datum'
      params do
        requires :feeling, type: String
        requires :anger, type: Float
        requires :happiness, type: Float
        requires :sadness, type: Float
        requires :person_id, type: Integer
      end
      post do
        EmotionDatum.create(feeling: params[:feeling],anger: params[:anger],happiness: params[:happiness],sadness: params[:sadness],person_id: params[:person_id])
      end

    end
    
    #GET /seatdatum/person_seat?id=id
    resource :seatdatum do
      desc  'Gets a list of a persons seat data'
      params do 
        requires :id, type: Integer
      end
      get :person_seat do
        Person.find(params[:id]).SeatDatum.all
      end

      #POST /seatdatum
      # post seatdatum as data json
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

      #GET totemdatum
      desc  'Gets a list of persons totem data'
      params do 
        requires :id, type: Integer
      end
      get :person_totem do
        Person.find(params[:id]).TotemDatum.all
      end

      #Get iotfocus.herokuapp.com/api/totemdatum/latest_state
      desc 'get the lastest TotemDatum'
      params do
        requires :id, type: Integer
      end
      get :latest_state do
        Person.find(params[:id]).TotemDatum.last
      end

      #Get iotfocus.herokuapp.com/api/totemdatum/latest_state
      desc 'get the lastest TotemDatum that is not the current state'
      params do
        requires :id, type: Integer
      end
      get :latest_state do
        Person.find(params[:id]).TotemDatum.where(is_current_state: false).last
      end

      #POST totemdatum
      desc 'Create a totemdatum'
      params do
        requires :state, type: String
        requires :person_id, type: Integer
      end
      post do
        Person.find(params[:person_id]).TotemDatum.update(is_current_state: false)if Person.find(params[:person_id]).TotemDatum.last
        TotemDatum.create(state: params[:state],person_id: params[:person_id])
      end

    end


  end
end