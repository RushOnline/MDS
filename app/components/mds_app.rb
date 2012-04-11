class MdsApp < Netzke::Basepack::SimpleApp

    def menu
        [:player_panel.action] + super
    end

    action  :player_panel,
            :icon => :table,
            :handler => :load_netzke_component_by_action,
            :text => "MDS Player"

    component :player_panel,
        :title => false
end
