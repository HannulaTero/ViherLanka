/// @desc APPLY VIHERLANKA


// Having GreenThread like this advances one split per frame.
// -> Calling it advances it, you could call it repeatly too.
VIHERLANKA_BEGIN 
  // This splits starts.
  // After split ends, thread yields.
  // If you don't return anything, it expects split to be "finished".
  show_debug_message("First split");
  
  
VIHERLANKA_SPLIT 
  // This was split is executed on next frame to the another.
  // Returning true explicitly tells split has "finished".
  show_debug_message("Second split.");
  return true;
  
  
VIHERLANKA_SPLIT 
  // Returning false makes this split re-execute, as it tells its "unfinished".
  // Here the instance is destroyed though, so it's only executed once.
  show_debug_message("Final split.");
  instance_destroy();
  return false;
  
VIHERLANKA_END


