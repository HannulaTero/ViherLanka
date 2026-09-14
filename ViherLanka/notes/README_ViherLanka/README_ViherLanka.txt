===============================================================
---------------------------------------------------------------

VIHERLANKA 
Simple GreenThread-type for instances.

by Tero Hannula 2026.14.09

---------------------------------------------------------------
===============================================================
GENERAL INFORMATION
===============================================================

This asset allows you to split execution over several frames.

Either use ViherLanka-function directly, or utilize the macros.
Macros reduce the required boilerplate though.
You can rename the macros in HANDLES.

Use the ViherLanka inside instance-events.
Calling the ViherLanka advances it, so instances are responsible
for advancing them.


===============================================================
MACRO SYNTAX HANDLES.
===============================================================

// Default macro handles:
// -> These can be redefined in ViherLanka_HANDLES.
VIHERLANKA_BEGIN
VIHERLANKA_SPLIT
VIHERLANKA_END

// Macro-definitions for logic.
// -> Don't touch these, these define macro-syntax logic.
__VIHERLANKA_BEGIN
__VIHERLANKA_SPLIT
__VIHERLANKA_END


===============================================================
HOW TO USE
===============================================================

VIHERLANKA_BEGIN 
  // This part is executed once.
  // Reason is it doesn't return anything (undefined)
  // -> which is interpreted as "true", finished.
  show_debug_message("Starting");
  self.index = 0;
  
VIHERLANKA_SPLIT 
  // Using split will split execution to next frame.
  x += 1;
  
  // This is executed until returns true.
  self.index += 1;
  return (self.index >= 60);

VIHERLANKA_SPLIT
  // Final split, the "return true;" could be omitted out,
  // but here I am just making it explicit.
  show_debug_message("Finished");
  return true;
  
VIHERLANKA_END


===============================================================
WHAT MACROS PRODUCE
===============================================================

ViherLanka(self, function() 
{ 
  return [ 
    function(_context) { 
      with(_context) 
      {
        // This part is executed once.
        // Reason is it doesn't return anything (undefined)
        // -> which is interpreted as "true", finished.
        show_debug_message("Starting");
        self.index = 0;
      }
  
    }, function(_context) {
      with(_context) 
      {
        // Using split will split execution to next frame.
        x += 1;
  
        // This is executed until returns true.
        self.index += 1;
        return (self.index >= 60);
      }

    }, function(_context) {
      with(_context) 
      {
        // Final split, the "return true;" could be omitted out,
        // but here I am just making it explicit.
        show_debug_message("Finished");
        return true;
      }
    } 
  ];
});


===============================================================


