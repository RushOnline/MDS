class MediaPlayer < Netzke::Basepack::Panel
#    def configuration
#        super.merge :html => '<div id="jwplayer"></div>'
#    end

  # Overriding initComponent
  js_method :init_component, <<-JS
    function() {
      // calling superclass's initComponent
      #{js_full_class_name}.superclass.initComponent.call(this);
      this.html = '<div id="jwplayer"></div>';
      this.on('afterrender', function() {
            this.player = jwplayer('jwplayer').setup({
                    flashplayer: "/jwplayer/player.swf"
                });
        }
        , this
      );
    }
  JS

end
