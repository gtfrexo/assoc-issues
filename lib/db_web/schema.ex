defmodule DbWeb.Schema do

    use Absinthe.Schema
    import Pigeon.APNS.Notification
    #use Pigeon.APNS
    import_types DbWeb.Schema.Types

    enum :category_enums, values: [:error, :warning, :feedback]

    query do

        #LIST
        field :all_context_vals, non_null(list_of(non_null(:context_val))) do
            resolve &Db.Context_Val_Resolver.all/2
        end

        field :all_genders, non_null(list_of(non_null(:gender))) do
            resolve &Db.Gender_Resolver.all/2
        end

        field :all_locations, non_null(list_of(non_null(:location))) do
            resolve &Db.Location_Resolver.all/2
        end

        field :all_versions, non_null(list_of(non_null(:version))) do
            resolve &Db.Version_Resolver.all/2
        end

        field :all_hosts, list_of(:host) do
            resolve &Db.Host_Resolver.all/2
        end

        field :all_medias, non_null(list_of(non_null(:media))) do
            resolve &Db.Media_Resolver.all/2
        end

        field :all_messages, non_null(list_of(non_null(:message))) do
            resolve &Db.Message_Resolver.all/2
        end

        field :all_profile_contents, non_null(list_of(non_null(:profile_content))) do
            resolve &Db.Profile_Content_Resolver.all/2
        end

        field :all_events, non_null(list_of(non_null(:event))) do
            resolve &Db.Event_Resolver.all/2
        end

        field :all_persons, non_null(list_of(non_null(:person))) do
            resolve &Db.Person_Resolver.all/2
        end

        field :all_pools, non_null(list_of(non_null(:pool))) do
            resolve &Db.Pool_Resolver.all/2
        end

        field :all_venues, list_of(:venue) do
            resolve &Db.Venue_Resolver.all/2
        end

        field :all_logs, list_of(:log) do
            resolve &Db.Log_Resolver.all/2
        end

        field :all_server_flags, list_of(:context_val) do
            resolve &Db.Server_Flag_Resolver.all/2
        end

        #field :me_recieved_messages, list_of(:message) do
         #   arg :to_person_id, non_null(:id)
          #  resolve &Db.Message_Resolver.all_recieved/2
        #end

        #FIND
        field :find_context_val, type: :context_val do
            arg :id, non_null(:id)
            resolve &Db.Context_Val_Resolver.find/2
        end

        field :find_gender, type: :gender do
            arg :id, non_null(:id)
            resolve &Db.Gender_Resolver.find/2
        end

        field :find_location, type: :location do
            arg :id, non_null(:id)
            resolve &Db.Location_Resolver.find/2
        end

        field :find_version, type: :version do
            arg :id, non_null(:id)
            resolve &Db.Version_Resolver.find/2
        end

        field :find_host, type: :host do
            arg :id, non_null(:id)
            resolve &Db.Host_Resolver.find/2
        end

        field :find_media, type: :media do
            arg :id, non_null(:id)
            resolve &Db.Media_Resolver.find/2
        end

        field :find_message, type: :message do
            arg :id, non_null(:id)
            resolve &Db.Message_Resolver.find/2
        end

        field :find_profile_content, type: :profile_content do
            arg :id, non_null(:id)
            resolve &Db.Profile_Content_Resolver.find/2
        end

        field :find_event, type: :event do
            arg :id, non_null(:id)
            resolve &Db.Event_Resolver.find/2
        end

        field :find_person, type: :person do
            arg :id, non_null(:id)
            resolve &Db.Person_Resolver.find/2
        end

        field :find_pool, type: :pool do
            arg :id, non_null(:id)
            resolve &Db.Pool_Resolver.find/2
        end

        field :find_venue, type: :venue do
            arg :id, non_null(:id)
            resolve &Db.Venue_Resolver.find/2
        end

        field :find_log, type: :log do
            arg :id, non_null(:id)
            resolve &Db.Log_Resolver.find/2
        end

        field :find_server_flag, type: :server_flag do
            arg :id, non_null(:id)
            resolve &Db.Server_Flag_Resolver.find/2
        end

        field :find_me, type: :person do
            arg :token, non_null(:string)
            resolve &Db.Person_Resolver.find_session/2
        end

    end

    #UPDATE PARAMS
    input_object :update_context_val_params do
        field :animal_blurb, :string
        field :boat_blurb, :string
        field :education_blurb, :string
        field :eggs_blurb, :string
        field :emoji_blurb, :string
        field :occupation_blurb, :string
        field :worst_pickup_blurb, :string
    end

    input_object :update_gender_params do
        field :is_male, non_null(:boolean)
        field :is_female, non_null(:boolean)
        field :person_id, :id
    end

    input_object :update_location_params do
        field :address, :string
        field :address_full, :string
        field :city, :string
        field :country, :string
        field :lat, :float
        field :lon, :float
        field :state, :string
        field :zip, :string
        field :event_id, :id
        field :venue_id, :id
    end

    input_object :update_version_params do
        field :current_version, :string
        field :target_version, :string
    end

    input_object :update_host_params do
        field :description, :string
        field :name, :string
        field :name_full, :string
        field :venue_id, :id
        field :event_id, :id
    end

    input_object :update_media_params do
        field :deleted_at, :datetime
        field :description, :string
        field :media_type, :string
        field :url, :string
        field :venue_id, :id
        field :venue_media_id, :id
        field :event_id, :id
        field :event_media_id, :id
        field :person_id, :id
        field :person_media_id, :id
    end

    input_object :update_message_params do
        field :content, :string
        field :read_at, :datetime
        field :sent_at, :datetime
        field :from_person_id, :id
        field :to_person_id, :id
    end

    input_object :update_profile_content_params do
        field :animal_blurb, :string
        field :boat_blurb, :string
        field :education_blurb, :string
        field :eggs_blurb, :string
        field :emoji_blurb, :string
        field :occupation_blurb, :string
        field :worst_pickup_blurb, :string
        field :person_id, :id
    end

    input_object :update_event_params do
        field :category, :string
        field :description, :string
        field :end_time, :datetime
        field :start_time, :datetime
        field :title, :string
        field :created_by_id, non_null(:id)
        field :venue_id, non_null(:id)
        field :is_private, :boolean
        field :deleted_by_id, :id
        field :updated_by_id, :id
        field :location, :id
        field :pic, :id
        field :pool, non_null(:id)
        field :host, :id
        #field :images, list_of(non_null(:id))
        #field :venues, list_of(non_null(:id))
    end

    input_object :update_person_params do
        field :bio, :string
        field :birthday, :datetime
        field :name, :string
        field :name_full, :string
        field :target_gender, :string
        field :target_relationship, :string
        field :email, :string
        field :password, :string
        field :hashed_password, :string
        field :token, :string
        field :current_device, :string
        field :current_n_key, :string
        #field :user_id, :id
    end

    input_object :update_pool_params do
        field :eventbrite_id, :string
        field :seatgeek_id, :string
        field :event_id, :integer
        #field :interested_persons, list_of(non_null(:id))
        #field :viewed_persons, list_of(non_null(:id))
        #field :attending_persons, list_of(non_null(:id))
    end

    input_object :update_venue_params do
        field :category, :string
        field :description, :string
        field :name, :string
        field :name_full, :string
        field :event_id, :id
        field :location, :id
        field :pic, :id
        #field :events, list_of(non_null(:id))
        #field :hosts, list_of(:id)
        #field :images, list_of(non_null(:id))
    end

    input_object :update_log_params do
        field :category, :category_enums
        field :content, :string
        field :context, :string
        field :person_id, :id
    end

    input_object :update_server_flag_params do
        field :version, :string
        field :release_notes, :string
    end

    

    mutation do

        field :login_person, type: :session do
            arg :email, :string
            arg :password, :string
            #arg :hashed_password, :string

            resolve &Db.Session_Resolver.login_person/3
        end



        #CREATE
        field :create_context_val, type: :context_val do
            arg :animal_blurb, :string
            arg :boat_blurb, :string
            arg :education_blurb, :string
            arg :eggs_blurb, :string
            arg :emoji_blurb, :string
            arg :occupation_blurb, :string
            arg :worst_pickup_blurb, :string

            resolve &Db.Context_Val_Resolver.create/2
        end

        field :create_gender, type: :gender do
            arg :is_male, non_null(:boolean)
            arg :is_female, non_null(:boolean)
            arg :person_id, :id

            resolve &Db.Gender_Resolver.create/2
        end

        field :create_location, type: :location do
            arg :address, :string
            arg :address_full, :string
            arg :city, :string
            arg :country, :string
            arg :lat, non_null(:float)
            arg :lon, non_null(:float)
            arg :state, :string
            arg :zip, :string
            arg :event_id, :id
            arg :venue_id, :id

            resolve &Db.Location_Resolver.create/2
        end

        field :create_version, type: :version do
            arg :current_version, :string
            arg :target_version, :string

            resolve &Db.Version_Resolver.create/2
        end

        field :create_host, type: :host do
            arg :description, :string
            arg :name, non_null(:string)
            arg :name_full, :string
            arg :venue_id, :id
            arg :event_id, :id

            resolve &Db.Host_Resolver.create/2
        end

        field :create_media, type: :media do
            arg :deleted_at, :datetime
            arg :description, :string
            arg :media_type, :string
            arg :url, non_null(:string)
            arg :venue_id, :id
            arg :venue_media_id, :id
            arg :event_id, :id
            arg :event_media_id, :id
            arg :person_id, :id
            arg :person_media_id, :id

            resolve &Db.Media_Resolver.create/2
        end

        field :create_message, type: :message do
            arg :content, non_null(:string)
            arg :read_at, :datetime
            arg :sent_at, non_null(:datetime)
            arg :from_person_id, non_null(:id)
            arg :to_person_id, non_null(:id)

            resolve &Db.Message_Resolver.create/2
        end

        field :create_profile_content, type: :profile_content do
            arg :animal_blurb, :string
            arg :boat_blurb, :string
            arg :education_blurb, :string
            arg :eggs_blurb, :string
            arg :emoji_blurb, :string
            arg :occupation_blurb, :string
            arg :worst_pickup_blurb, :string
            arg :person_id, :id

            resolve &Db.Profile_Content_Resolver.create/2
        end

        field :create_event, type: :event do
            arg :category, :string
            arg :description, non_null(:string)
            arg :end_time, :datetime
            arg :start_time, non_null(:datetime)
            arg :title, non_null(:string)
            arg :title_full, :string
            arg :created_by_id, non_null(:id)
            arg :venue_id, non_null(:id)
            arg :is_private, :boolean
            arg :deleted_by_id, :id
            arg :updated_by_id, :id
            arg :location, :id
            arg :pic, :id
            arg :pool, non_null(:id)
            arg :host, :id
            #arg :images, list_of(non_null(:id))
            #arg :venues, list_of(non_null(:id))

            resolve &Db.Event_Resolver.create/2
        end

        field :create_person, type: :person do
            arg :bio, :string
            arg :birthday, non_null(:datetime)
            arg :name, non_null(:string)
            arg :name_full, :string
            arg :target_gender, :string
            arg :target_relationship, :string
            arg :email, :string
            arg :password, :string
            arg :hashed_password, :string
            arg :token, :string
            arg :current_device, :string
            arg :current_n_key, :string
            #arg :user_id, :id

            resolve &Db.Person_Resolver.create/2
        end

        field :create_pool, type: :pool do
            arg :eventbrite_id, :string
            arg :seatgeek_id, :string
            arg :event_id, :id
            #arg :interested_persons, list_of(non_null(:id))
            #arg :viewed_persons, list_of(non_null(:id))
            #arg :attending_persons, list_of(non_null(:id))
            
            resolve &Db.Pool_Resolver.create/2
        end

        field :create_venue, type: :venue do
            arg :category, :string
            arg :description, :string
            arg :name, non_null(:string)
            arg :name_full, :string
            arg :event_id, :id
            arg :location, :id
            arg :pic, :id
            #arg :events, list_of(non_null(:id))
            #arg :hosts, list_of(:id)
            #arg :images, list_of(non_null(:id))

            resolve &Db.Venue_Resolver.create/2
        end

        field :create_log, type: :log do
            arg :category, non_null(:category_enums)
            arg :content, non_null(:string)
            arg :context, non_null(:string)
            arg :person_id, :id

            resolve &Db.Log_Resolver.create/2
        end

        field :create_server_flag, type: :server_flag do
            arg :version, non_null(:string)
            arg :release_notes, non_null(:string)

            resolve &Db.Server_Flag_Resolver.create/2
        end

        #UPDATE
        field :update_context_val, type: :context_val do
            arg :id, non_null(:id)
            arg :context_val, :update_context_val_params

            resolve &Db.Context_Val_Resolver.update/2
        end

        field :update_gender, type: :gender do
            arg :id, non_null(:id)
            arg :gender, :update_gender_params

            resolve &Db.Gender_Resolver.update/2
        end

        field :update_location, type: :location do
            arg :id, non_null(:id)
            arg :location, :update_location_params

            resolve &Db.Location_Resolver.update/2
        end

        field :update_version, type: :version do
            arg :id, non_null(:id)
            arg :version, :update_version_params

            resolve &Db.Version_Resolver.update/2
        end

        field :update_host, type: :host do
            arg :id, non_null(:id)
            arg :host, :update_host_params

            resolve &Db.Host_Resolver.update/2
        end

        field :update_media, type: :media do
            arg :id, non_null(:id)
            arg :media, :update_media_params

            resolve &Db.Media_Resolver.update/2
        end

        field :update_message, type: :message do
            arg :id, non_null(:id)
            arg :media, :update_message_params

            resolve &Db.Message_Resolver.update/2
        end

        field :update_profile_content, type: :profile_content do
            arg :id, non_null(:id)
            arg :profile_content, :update_profile_content_params

            resolve &Db.Profile_Content_Resolver.update/2
        end

        field :update_event, type: :event do
            arg :id, non_null(:id)
            arg :event, :update_event_params

            resolve &Db.Event_Resolver.update/2
        end

        field :update_person, type: :person do
            arg :id, non_null(:id)
            arg :person, :update_person_params

            resolve &Db.Person_Resolver.update/2
        end

        field :update_pool, type: :pool do
            arg :id, non_null(:id)
            arg :pool, :update_pool_params

            resolve &Db.Pool_Resolver.update/2
        end

        field :update_venue, type: :venue do
            arg :id, non_null(:id)
            arg :venue, :update_venue_params

            resolve &Db.Venue_Resolver.update/2
        end

        field :update_log, type: :log do
            arg :id, non_null(:id)
            arg :log, :update_log_params

            resolve &Db.Log_Resolver.update/2
        end

        field :update_server_flag, type: :server_flag do
            arg :id, non_null(:id)
            arg :server_flag, :update_server_flag_params

            resolve &Db.Server_Flag_Resolver.update/2
        end

        #TACK

        field :tack_context_val, type: :context_val do
            arg :id, non_null(:id)
            arg :context_val, :update_context_val_params

            resolve &Db.Context_Val_Resolver.update/2
        end

        field :tack_gender, type: :gender do
            arg :id, non_null(:id)
            arg :gender, :update_gender_params

            resolve &Db.Gender_Resolver.update/2
        end

        field :tack_location, type: :location do
            arg :id, non_null(:id)
            arg :location, :update_location_params

            resolve &Db.Location_Resolver.update/2
        end

        field :tack_version, type: :version do
            arg :id, non_null(:id)
            arg :version, :update_version_params

            resolve &Db.Version_Resolver.update/2
        end

        field :tack_host, type: :host do
            arg :id, non_null(:id)
            arg :host, :update_host_params

            resolve &Db.Host_Resolver.update/2
        end

        field :tack_media, type: :media do
            arg :id, non_null(:id)
            arg :media, :update_media_params

            resolve &Db.Media_Resolver.update/2
        end

        field :tack_message, type: :message do
            arg :id, non_null(:id)
            arg :media, :update_message_params

            resolve &Db.Message_Resolver.update/2
        end

        field :tack_profile_content, type: :profile_content do
            arg :id, non_null(:id)
            arg :profile_content, :update_profile_content_params

            resolve &Db.Profile_Content_Resolver.update/2
        end

        field :tack_event, type: :event do
            arg :id, non_null(:id)
            arg :event, :update_event_params

            resolve &Db.Event_Resolver.update/2
        end

        field :tack_person, type: :person do
            arg :id, non_null(:id)
            arg :person, :update_person_params

            resolve &Db.Person_Resolver.update/2
        end

        field :tack_pool, type: :pool do
            arg :id, non_null(:id)
            arg :pool, :update_pool_params

            resolve &Db.Pool_Resolver.update/2
        end

        field :tack_venue, type: :venue do
            arg :id, non_null(:id)
            arg :venue, :update_venue_params

            resolve &Db.Venue_Resolver.update/2
        end

        field :tack_log, type: :log do
            arg :id, non_null(:id)
            arg :log, :update_log_params

            resolve &Db.Log_Resolver.update/2
        end

        field :tack_server_flag, type: :server_flag do
            arg :id, non_null(:id)
            arg :server_flag, :update_server_flag_params

            resolve &Db.Server_Flag_Resolver.update/2
        end

        #DELETE
        field :delete_context_val, type: :context_val do
            arg :id, non_null(:id)
            
            resolve &Db.Context_Val_Resolver.delete/2
        end

        field :delete_gender, type: :gender do
            arg :id, non_null(:id)

            resolve &Db.Gender_Resolver.delete/2
        end

        field :delete_location, type: :location do
            arg :id, non_null(:id)

            resolve &Db.Location_Resolver.delete/2
        end

        field :delete_version, type: :version do
            arg :id, non_null(:id)

            resolve &Db.Version_Resolver.delete/2
        end

        field :delete_host, type: :host do
            arg :id, non_null(:id)

            resolve &Db.Host_Resolver.delete/2
        end

        field :delete_media, type: :media do
            arg :id, non_null(:id)

            resolve &Db.Media_Resolver.delete/2
        end

        field :delete_message, type: :message do
            arg :id, non_null(:id)

            resolve &Db.Message_Resolver.delete/2
        end

        field :delete_profile_content, type: :profile_content do
            arg :id, non_null(:id)

            resolve &Db.Profile_Content_Resolver.delete/2
        end

        field :delete_event, type: :event do
            arg :id, non_null(:id)

            resolve &Db.Event_Resolver.delete/2
        end

        field :delete_person, type: :person do
            arg :id, non_null(:id)

            resolve &Db.Person_Resolver.delete/2
        end

        field :delete_pool, type: :pool do
            arg :id, non_null(:id)

            resolve &Db.Pool_Resolver.delete/2
        end

        field :delete_venue, type: :venue do
            arg :id, non_null(:id)

            resolve &Db.Venue_Resolver.delete/2
        end

        field :delete_log, type: :log do
            arg :id, non_null(:id)

            resolve &Db.Log_Resolver.delete/2
        end

        field :delete_server_flag, type: :server_flag do
            arg :id, non_null(:id)
            
            resolve &Db.Server_Flag_Resolver.delete/2
        end

    end

    #SUBS

    subscription do
        
        field :message_sent, :message do
            arg :from_person_id, non_null(:id)
            #arg :n_key, non_null(:string)

            config fn args, _ ->
                {:ok, topic: args.from_person_id}
            end

            trigger :create_message, topic: fn message ->
                message.from_person_id
            end
#%{context: %{current_person: person}}
            resolve fn message, args, _ ->
                sendTo = Db.Persons.get_person!(message.to_person_id)
                n = Pigeon.APNS.Notification.new("You have a new message!", sendTo.current_n_key, "com.plusone.PlusOne-Dating")
                Pigeon.APNS.push(n)
                {:ok, message}
            end
        end

    end

    def loader do
        Dataloader.new
        |> Dataloader.add_source(:db, Db.data)
    end

    def context(ctx) do
        Map.put(ctx, :loader, loader())
    end

    def plugins do
        [Absinthe.Middleware.Dataloader | Absinthe.Plugin.defaults()]
    end

end

