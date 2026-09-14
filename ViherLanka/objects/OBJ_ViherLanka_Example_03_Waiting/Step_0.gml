/// @desc 


VIHERLANKA_BEGIN
  // Initialize the waiting period.
  self.timeStop = (current_time + random_range(1_000, 2_000));
  
  
VIHERLANKA_SPLIT
  // Wait until waiting period is over.
  return (current_time >= self.timeStop);
  
  
VIHERLANKA_SPLIT
  // Enlarge itself.
  var _target = 1.0;
  image_xscale = lerp(image_xscale, _target, 0.1);
  image_yscale = image_xscale;
  return (image_xscale >= _target - 0.01);
  
  
VIHERLANKA_SPLIT
  // Initialize the waiting period.
  self.timeStop = (current_time + random_range(1_000, 2_000));
  
  
VIHERLANKA_SPLIT
  // Wait until waiting period is over.
  return (current_time >= self.timeStop);
  
  
VIHERLANKA_SPLIT
  // Make small.
  var _target = 0.5;
  image_xscale = lerp(image_xscale, 0.5, 0.1);
  image_yscale = image_xscale;
  return (image_xscale <= _target + 0.01);
  
  
VIHERLANKA_END