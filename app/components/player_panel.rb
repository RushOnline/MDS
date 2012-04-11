class PlayerPanel < Netzke::Basepack::BorderLayoutPanel

  def configuration
    super.merge(
      :header => false,
      :items => [
        :podcast_grid.component(
          :region => :center,
          :name => 'podcasts',
          :title => "Podcasts"
        ),
        :media_player.component(
          :region => :south,
          :title => "Player",
          :height => 150,
          :split => true
        )
      ]
    )
  end

  # Overriding initComponent
  js_method :init_component, <<-JS
    function(){
      // calling superclass's initComponent
      #{js_full_class_name}.superclass.initComponent.call(this);

      // setting the 'selectionchange' event
      // this.getChildNetzkeComponent('podcast_grid').on('selectionchange', this.onPodcastSelectionChanged, this);

      // itemdblclick
      this.getChildNetzkeComponent('podcast_grid').on('itemdblclick', this.onPodcastDoubleClicked, this);
    }
  JS

  # Event handler
  js_method :on_podcast_double_clicked, <<-JS
    function(self, record, item, index, e, eOpts) {
        //self.panel.getPlugin('celleditor').cancelEdit();
        // Ext.Msg.alert(record.get('title'));
        var player = this.getChildNetzkeComponent('media_player').player;
        player.load({file: 'http://mds.datagrad.ru' + record.get('path'), title: record.get('title')});
        player.play(true);
    }
  JS

  # Event handler
  js_method :on_podcast_selection_changed, <<-JS
    function(self, selected, eOpts) {
      if (selected.length) {
        Ext.Msg.alert(selected[0].get('title'), selected[0].get('path'));
      }
    }
  JS

  component :podcast_grid
  component :media_player
end
