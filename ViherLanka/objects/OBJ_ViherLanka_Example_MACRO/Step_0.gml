/// @desc APPLY VIHERLANKA


// Having GreenThread like this advances one split per frame.
// -> Calling it advances it, you could call it repeatly too.
VIHERLANKA_BEGIN 
  // This part is executed once.
  // Reason is it doesn't return anything (undefined)
  // -> which is interpreted as "true", finished.
  show_debug_message("Starting ViherLanka");
  
  
VIHERLANKA_SPLIT 
  // Using split will split execution to next frame.
  // This is executed until returns true.
  self.x += 8;
  return (self.x >= room_width * 0.8);
  
  
VIHERLANKA_SPLIT 
  // Same as before.
  self.x -= 8;
  return (self.x <= room_width * 0.2);
  
  
VIHERLANKA_SPLIT
  // Blink randomly for random period of time.
  self.image_blend = make_color_rgb(
    irandom(255), irandom(255), irandom(255)
  );
  return (random(1.0) > 0.995);
  
  
VIHERLANKA_SPLIT
  // Final split, the "return true;" could be omitted out,
  // but here I am just making it explicit.
  show_debug_message("Finished ViherLanka");
  image_blend = c_white;
  return true;
  
  
VIHERLANKA_FINISH


