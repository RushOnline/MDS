class MdsApp < Netzke::Basepack::SimpleApp

    def menu
        [:podcast_grid.action] + super
    end

    action :podcast_grid, :icon => :table, :handler => :load_netzke_component_by_action

#    component :podcasts, :class_name => "Netzke::Basepack::GridPanel", :model => "MdsFile",
#            :columns => [{:name => "author__name"}, {:name => "source__description"}, :title, :url, :path]
    component :podcast_grid
end
