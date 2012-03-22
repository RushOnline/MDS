<%= netzke :podcasts, :class_name => "Netzke::Basepack::GridPanel", :model => "MdsFile",
    :columns => [:author__name, {:name => "source__description"}, :title, :url, :path]
%>

<script type="text/javascript">
//<![CDATA[
Ext.onReady(function(){ alert("HERE"); })
//]]>
</script>
