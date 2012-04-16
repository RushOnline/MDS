# User grid with some pre-configured columns
class PodcastGrid < Netzke::Basepack::GridPanel
#    include Netzke::Basepack::ActionColumn

    model "MdsFile"

    column :date
    column :source__description
    column :author__name, :flex => 1
    column :title, :flex => 1
    column :path
=begin
    column :url

    column :xaction,
        :xtype => 'actioncolumn',
        :items => [{
            :icon       => "#{Netzke::Core.ext_uri}/resources/themes/images/access/dd/drop-yes.gif",
            :tooltip    => 'Play this podcast',
            :handler    => <<-JS.l
                function (grid, rowIndex, colIndex) {
                    var rec = grid.store.getAt(rowIndex);
                    // alert(rec.get('path'));
                    $("#jpId").jPlayer("setMedia", {"mp3": "http://mds.datagrad.ru" + rec.get('path')}).jPlayer("play");
                }
                JS
            }]
=end
  # Overriding initComponent
  js_method :init_component, <<-JS
    function(){
      // calling superclass's initComponent
      #{js_full_class_name}.superclass.initComponent.call(this);

        this.plugins.pop();
        // this.plugins.push(Ext.create('Ext.grid.plugin.CellEditing', {pluginId: 'celleditor', config: {clicksToEdit: 3}}));

    }
  JS

=begin
    def js_component_instance
        #%{Netzke.page.#{name.jsonify} = Ext.create("#{self.class.js_alias}", #{js_config.to_nifty_json({:methods => :handler})});}
        "fuck"
    end

    action :playfile do
        {
            :text => 'Play',
            :tooltip => 'Play file with embedded flash player',
            :handler => "onPlayFile"
        }
    end

    js_method :on_play_file, <<-JS
        function(record){
            alert("HERE");
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
