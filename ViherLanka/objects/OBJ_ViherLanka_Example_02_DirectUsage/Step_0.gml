/// @desc APPLY VIHERLANKA

// This does exactly the same as the MacroUsage-version, but this uses ViherLanka directly.
// This is more to show what macros produce (+ formatted a bit).
// ViherLanka is NOT meant to be used directly, as it's bit verbose.

__ViherLanka(self, function() 
{ 
  return [ 
    function(_context) { 
      with(_context)
      {
        show_debug_message("Starting ViherLanka");
      }
      
      
    }, function(_context) { 
      with(_context)
      {
        self.x += 8;
        return (self.x >= room_width * 0.8);
      }
      
      
    }, function(_context) { 
      with(_context)
      {
        self.x -= 8;
        return (self.x <= room_width * 0.2);
      }
      
      
    }, function(_context) {
      with(_context)
      {
        self.image_blend = make_color_rgb(
          irandom(255), irandom(255), irandom(255)
        );
        return (random(1.0) > 0.995);
      }
      
      
    }, function(_context) {
      with(_context)
      {
        show_debug_message("Finished ViherLanka");
        image_blend = c_white;
        return true;
      }
    } 
  ]; 
});


