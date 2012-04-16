class MediaPlayer < Netzke::Basepack::Panel
    def configuration
        super.merge :html => <<-HTML
            <object data="/dewplayer/dewplayer.swf" width="200" height="20" name="dewplayer" id="dewplayerjs" type="application/x-shockwave-flash">
            <param name="movie" value="/dewplayer/dewplayer.swf" />
            <param name="flashvars" value="javascript=on" />
            <param name="wmode" value="transparent" />
            </object>
        HTML
    end

  # Overriding initComponent
  js_method :init_component, <<-JS
    function() {
      // calling superclass's initComponent
      #{js_full_class_name}.superclass.initComponent.call(this);
      this.on('afterrender', function() {
            this.player = document.getElementById("dewplayerjs");
        }
        , this
      );
    }
  JS

end
