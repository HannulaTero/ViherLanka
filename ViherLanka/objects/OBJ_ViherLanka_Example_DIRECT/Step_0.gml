/// @desc APPLY VIHERLANKA

// This does exactly the same as the Macro-version,
// But this uses ViherLanka directly.

ViherLanka(self, function() 
{ 
  return [ 
    function() { 
      show_debug_message("Starting ViherLanka");
      
      
    }, function() { 
      self.x += 8;
      return (self.x >= room_width * 0.8);
      
      
    }, function() { 
      self.x -= 8;
      return (self.x <= room_width * 0.2);
      
      
    }, function() {
      self.image_blend = make_color_rgb(
        irandom(255), irandom(255), irandom(255)
      );
      return (random(1.0) > 0.995);
      
      
    }, function() {
      show_debug_message("Finished ViherLanka");
      image_blend = c_white;
      return true;
    } 
  ]; 
});


