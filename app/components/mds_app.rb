class MdsApp < Netzke::Basepack::SimpleApp

=begin
    def menu
        [:podcast_grid.action, :player.action] + super
    end
=end
    action :podcast_grid, :icon => :table, :handler => :load_netzke_component_by_action
#    action :player, :handler => :load_netzke_component_by_action

    component :podcast_grid
end
