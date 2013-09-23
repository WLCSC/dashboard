class Service < ActiveRecord::Base
    has_many :messages
    has_many :services, :foreign_key => 'server_id'
    belongs_to :server, :class_name => 'Service'

    def status
        if server && server.status != 1
            server.status
        else
            if messages.count > 0
                messages.last.status
            else
                1
            end
        end
    end

    def message
        if server && server.status != 1
            "From #{server.name}: " + server.message
        else
            if messages.count > 0
                messages.last.description
            else
                "All is well."
            end
        end

    end

    def child_ids
        if services.count > 0
            services.map{|s| s.child_ids}.flatten.uniq
        else
            [id]
        end
    end

    def button_class
        arr = ['btn', 'btn-block']
        case status
        when 1
            arr << 'btn-success'
        when 2
            arr << 'btn-warning'
        when 3
            arr << 'btn-danger'
        else
            arr << 'btn-info'
        end 
    end
end
