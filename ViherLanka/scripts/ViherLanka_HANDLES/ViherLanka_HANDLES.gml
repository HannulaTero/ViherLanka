

// Begins the GreenThread.
#macro VIHERLANKA_BEGIN   ViherLanka(self, function() { return [ function(_context) { with(_context) {


// Splits the execution.
#macro VIHERLANKA_SPLIT   } }, function(_context) { with(_context) {


// Finishes the GreenThread.
#macro VIHERLANKA_END     } } ]; })