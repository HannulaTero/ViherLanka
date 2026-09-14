

// Begins the GreenThread.
#macro __VIHERLANKA_BEGIN   __ViherLanka(self, function() { return [ function(_context) { with(_context) {


// Splits the execution.
#macro __VIHERLANKA_SPLIT   } }, function(_context) { with(_context) {


// Finishes the GreenThread.
#macro __VIHERLANKA_END     } } ]; })