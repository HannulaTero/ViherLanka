# ViherLanka
### [GameMaker] Simple GreenThread type of functionality, allows instances split execution to multiple frames.
<img width="128" height="128" align="right" alt="icon-ABoxBlur" src="https://github.com/user-attachments/assets/412ea6ae-3004-4134-8842-49accfb3b55b" />

---
### GENERAL INFORMATION

This asset allows you to split execution over several frames.

Either use ViherLanka-function directly, or utilize the macros.
Macros reduce the required boilerplate though.
You can rename the macros in HANDLES.

Use the ViherLanka inside instance-events.
Calling the ViherLanka advances it, so instances are responsible
for advancing them.

---
MACRO SYNTAX
---
```gml
// Default macro handles:
// -> These can be renamed in ViherLanka_HANDLES.
VIHERLANKA_BEGIN  // Begins the GreenThread.
VIHERLANKA_SPLIT  // Splits the execution.
VIHERLANKA_END    // Finishes the GreenThread.

// Macro-definitions for logic.
// -> Don't touch these, these define macro-syntax logic.
// -> But you can assign new macros to relabel these, like in _HANDLES
__VIHERLANKA_BEGIN  // Begins the GreenThread.
__VIHERLANKA_SPLIT  // Splits the execution.
__VIHERLANKA_END    // Finishes the GreenThread.
```
---
HOW TO USE
---
```gml
// INSTANCE STEP-EVENT.
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

  
VIHERLANKA_FINISH
```

---
WHAT MACRO SYNTAX GENERATES
---
```gml
// INSTANCE STEP-EVENT.
__ViherLanka(self, function() 
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
```

---
I needed this kind of functionality during 50th GM48 gamejam, so implemented this in game. But during the jam also decided to make it own asset.

