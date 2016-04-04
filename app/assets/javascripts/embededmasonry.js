
/*
var embeded = boxFind.find('.embedly-card').embedly({
    //maxWidth: 260,
    //wmode: 'transparent',
    //method: 'after',
    //chars: 50,
    className: 'hiddenCard',
    key: ':7918a7b91ef74f3790e4e9d15e0f7aa2', //temporal
    progress: myfct
});
*/
// we call this from the embedly callback after all
// content has been loaded.

function EmbedlyLoader(){
  var self = this;

  var boxFind = $(".box").find('.embedly');
  var matches = boxFind.length;
  var loaded = 0;
  var iframeImgsLength=0;
  var loadedImgs=0;
  var embedly=null;
  var deferred = jQuery.Deferred();

  var loadScript = loadScript;
  var callMasonryIfEmbedlyLoaded = callMasonryIfEmbedlyLoaded;
  var callMasonryWhenImagesLoaded = callMasonryWhenImagesLoaded;
  var callMasonryIfEverythingLoaded = callMasonryIfEverythingLoaded;

  self.loaded = null;

  activate();


  function activate(){
    loadScript();
    embedly('on', 'card.rendered', callMasonryIfEmbedlyLoaded);
    self.loaded = deferred.promise();
  }

  function loadScript(){
    (function(w, d){
     var id='embedly-platform', n = 'script';
     if (!d.getElementById(id)){
       w.embedly = w.embedly || function() {(w.embedly.q = w.embedly.q || []).push(arguments);};
       embedly=w.embedly;
       var e = d.createElement(n); e.id = id; e.async=1;
       e.src = ('https:' === document.location.protocol ? 'https' : 'http') + '://cdn.embedly.com/widgets/platform.js';
       var s = d.getElementsByTagName(n)[0];
       s.parentNode.insertBefore(e, s);
     }
    })(window, document);
  }

  function callMasonryIfEmbedlyLoaded(iframe) {

    var imgs = $(iframe).contents().find('img');
    imgs.each(
      function(i,img){
        var temp = img.src;
         img.src="";
         img.src= temp;
      }
    );
      iframeImgsLength += imgs.length;
      imgs.load(callMasonryWhenImagesLoaded);
      loaded++;
      callMasonryIfEverythingLoaded();
  };

  function callMasonryWhenImagesLoaded(){
    loadedImgs++;
    callMasonryIfEverythingLoaded();
  }

  function callMasonryIfEverythingLoaded(){

      if(loadedImgs == iframeImgsLength &&  loaded == matches){
        deferred.resolve();
      }
  }
}
