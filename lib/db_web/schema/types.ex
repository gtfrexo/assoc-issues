defmodule DbWeb.Schema.Types do

    use Absinthe.Schema.Notation
    use Absinthe.Ecto, repo: Db.Repo
    import Absinthe.Resolution.Helpers
    import_types(Absinthe.Type.Custom)

    object :context_val do #

        field :id, non_null(:id)
        field :animal_blurb, :string
        field :boat_blurb, :string
        field :education_blurb, :string
        field :eggs_blurb, :string
        field :emoji_blurb, :string
        field :occupation_blurb, :string
        field :worst_pickup_blurb, :string
        field :created_at, non_null(:datetime)
        field :updated_at, non_null(:datetime)

    end

    object :gender do #

        field :id, non_null(:id)
        field :is_male, non_null(:boolean)
        field :is_female, non_null(:boolean)
        field :person, :person, resolve: dataloader(:db)
        field :created_at, non_null(:datetime)
        field :updated_at, non_null(:datetime)

    end

    object :location do

        field :id, non_null(:id)
        field :address, :string#
        field :address_full, :string#
        field :city, :string#
        field :country, :string#
        field :lat, non_null(:float)#
        field :lon, non_null(:float)#
        field :state, :string#
        field :zip, :string#
        field :event, :event, resolve: dataloader(:db)###
        field :venue, :venue, resolve: dataloader(:db)#
        field :created_at, non_null(:datetime)
        field :updated_at, non_null(:datetime)

    end

    object :version do #

        field :id, non_null(:id)
        field :current_version, :string
        field :target_version, :string
        field :created_at, non_null(:datetime)
        field :updated_at, non_null(:datetime)

    end

    object :host do #
        
        field :id, non_null(:id)
        field :description, :string
        field :name, non_null(:string)
        field :name_full, :string
        field :venue, :venue, resolve: dataloader(:db)
        field :event, :event, resolve: dataloader(:db)
        field :created_at, non_null(:datetime)
        field :updated_at, non_null(:datetime)

    end

    object :media do #
        
        field :id, non_null(:id)
        field :deleted_at, :datetime#
        field :description, :string#
        field :media_type, :string
        field :url, non_null(:string)#
        field :event, :event, resolve: dataloader(:db)#
        field :event_media, :event, resolve: dataloader(:db)#
        field :venue, :venue, resolve: dataloader(:db)#
        field :venue_media, :venue, resolve: dataloader(:db)#
        field :person, :person, resolve: dataloader(:db)#
        field :person_media, :person, resolve: dataloader(:db)#
        field :created_at, non_null(:datetime)
        field :updated_at, non_null(:datetime)


    end

    object :message do
        
        field :id, non_null(:id)
        field :content, non_null(:string)#
        field :read_at, :datetime#
        field :from_person, non_null(:person), resolve: dataloader(:db)#
        field :to_person, non_null(:person), resolve: dataloader(:db)#
        field :sent_at, non_null(:datetime)###
        field :created_at, non_null(:datetime)
        field :updated_at, non_null(:datetime)
        field :n_key, :string

       # field :find_person, type: :person do
        #    arg :id, non_null(:id)
         #   
          #  resolve &Db.Person_Resolver.find/2
       # end
        
    end

    object :profile_content do #

        field :id, non_null(:id)
        field :animal_blurb, :string
        field :boat_blurb, :string
        field :education_blurb, :string
        field :eggs_blurb, :string
        field :emoji_blurb, :string
        field :occupation_blurb, :string
        field :worst_pickup_blurb, :string
        field :person, :person, resolve: dataloader(:db)
        field :created_at, non_null(:datetime)
        field :updated_at, non_null(:datetime)

    end

    object :event do
        
        field :id, non_null(:id)
        field :created_by, non_null(:person), resolve: dataloader(:db)#
        field :location, :location, resolve: dataloader(:db)###
        field :pic, :media, resolve: dataloader(:db)#
        field :category, :string#
        field :description, non_null(:string)###
        field :end_time, :datetime#
        field :start_time, non_null(:datetime)#
        field :title, non_null(:string)#
        field :title_full, :string#
        field :pool, non_null(:pool), resolve: dataloader(:db)#
        field :host, :host, resolve: dataloader(:db)###
        field :images, list_of(:media), resolve: dataloader(:db)#
        field :venues, list_of(:venue), resolve: dataloader(:db)#
        field :venue, non_null(:venue), resolve: dataloader(:db)###
        field :created_at, non_null(:datetime)
        field :updated_at, non_null(:datetime)
        field :is_private, :boolean
        field :deleted_by, :person, resolve: dataloader(:db)
        field :updated_by, :person, resolve: dataloader(:db)

    end

    object :person do
        
        field :id, non_null(:id)
        field :birthday, non_null(:datetime)#
        field :gender, :gender, resolve: dataloader(:db)###
        field :name, non_null(:string)#
        field :name_full, :string#
        field :target_gender, :string###
        field :target_relationship, :string###
        field :profile_content, :profile_content, resolve: dataloader(:db)###
        field :profile_pic, :media, resolve: dataloader(:db)#
        field :bio, :string#
        field :email, :string
        field :password, :string
        field :hashed_password, :string
        field :token, :string
        field :current_device, :string
        field :current_n_key, :string
        field :currently_blocking, list_of(:person), resolve: dataloader(:db)###
        field :blocked_by, list_of(:person), resolve: dataloader(:db)#
        field :created_events, list_of(:event), resolve: dataloader(:db)#
        field :sent_messages, list_of(:message), resolve: dataloader(:db)#
        field :received_messages, list_of(:message), resolve: dataloader(:db)#
        field :chatting_with, list_of(:person), resolve: dataloader(:db)#
        field :interested_pools, list_of(:pool), resolve: dataloader(:db)#
        field :viewed_pools, list_of(:pool), resolve: dataloader(:db)#
        field :attending_pools, list_of(:pool), resolve: dataloader(:db)#
        field :images, list_of(:media), resolve: dataloader(:db)#
        #field :user, :user, resolve: dataloader(:db)###
        field :logs, list_of(:log), resolve: dataloader(:db)
        field :created_at, non_null(:datetime)
        field :updated_at, non_null(:datetime)

    end

    object :pool do
        
        field :id, non_null(:id)
        field :event, :event, resolve: dataloader(:db)#
        field :seatgeek_id, :string#
        field :eventbrite_id, :string#
        field :interested_persons, list_of(:person), resolve: dataloader(:db)#
        field :attending_persons, list_of(:person), resolve: dataloader(:db)#
        field :viewed_persons, list_of(:person), resolve: dataloader(:db)#
        field :created_at, non_null(:datetime)
        field :updated_at, non_null(:datetime)

    end

    object :venue do
        
        field :id, non_null(:id)
        field :category, :string#
        field :description, :string#
        field :name, non_null(:string)#
        field :name_full, :string#
        field :location, :location, resolve: dataloader(:db)#
        field :pic, :media, resolve: dataloader(:db)#
        field :events, list_of(:event), resolve: dataloader(:db)#
        field :hosts, list_of(:host), resolve: dataloader(:db)###
        field :images, list_of(:media), resolve: dataloader(:db)#
        field :event, :event, resolve: dataloader(:db)###
        field :created_at, non_null(:datetime)
        field :updated_at, non_null(:datetime)

        field :create_pool, type: :pool do
            arg :eventbrite_id, :string
            arg :seatgeek_id, :string
            arg :event_id, :id
            arg :interested_persons_id, :id
            arg :attending_persons_id, :id
            arg :viewed_persons_id, :id
            
            
            resolve &Db.Pool_Resolver.create/2
        end

    end

    object :session do
        field :token, :string
        field :person, :person
    end

    enum :category_enum, values: [:error, :warning, :feedback]

    object :log do
        field :id, non_null(:id)
        field :category, non_null(:category_enum)
        field :context, non_null(:string)
        field :content, non_null(:string)
        field :person, :person, resolve: dataloader(:db)#
        field :created_at, non_null(:datetime)
        field :updated_at, non_null(:datetime)
    end

    object :server_flag do #

        field :id, non_null(:id)
        field :version, non_null(:string)
        field :release_notes, non_null(:string)
        field :created_at, non_null(:datetime)
        field :updated_at, non_null(:datetime)

    end

    


end