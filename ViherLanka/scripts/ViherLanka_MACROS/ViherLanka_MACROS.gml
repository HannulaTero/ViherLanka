

// Begins the GreenThread.
#macro __VIHERLANKA_BEGIN   ViherLanka(self, function() { return [ function() {


// Splits the execution.
#macro __VIHERLANKA_SPLIT   }, function() {


// Finishes the GreenThread.
#macro __VIHERLANKA_FINISH  } ]; })