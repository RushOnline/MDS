# User grid with some pre-configured columns
class PodcastGrid < Netzke::Basepack::GridPanel
    include Netzke::Basepack::ActionColumn

    model "MdsFile"

    column :date
    column :source__description
    column :author__name, :flex => 1
    column :title, :flex => 1
    column :url
    column :path

    action :playfile do
        {
            :text => 'Play',
            :tooltip => 'Play file with embedded flash player',
            :handler => "onPlayFile"
        }
    end

    js_method :on_play_file, <<-JS
        function(record){
            this.getSelectionModel().select(record);
            alert(record);
        }
    JS

    def default_context_menu
        menu = super
        menu << :playfile.action
        menu
    end

=begin
#    override_column :source__description, :flex => 1
    column_action :play_file,
        :icon => "#{Netzke::Core.ext_uri}/resources/themes/images/access/dd/drop-yes.gif",
        :handler => "onPlayFile"


  override_column :name, flex: 1
  override_column :email, flex: 1
  override_column :actions, width: 20
  override_column :created_at, read_only: true
  override_column :updated_at, read_only: true

  include Netzke::Yanit::Inspectable
=end
end
