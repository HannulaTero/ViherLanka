---
### VIHERLANKA 

Simple GreenThread-type for instances.

by Tero Hannula 2026_09_17


---
### GENERAL INFORMATION


This asset allows you to split execution over several frames.
 In short, if you setup ViherLanka in Step-event, 
it will execute one split in one frame, 
and optionally moves to next split. 
By default it always moves to next split for next frame, 
but if you return "false" (telling split hasn't been finished), 
it will execute the same split on next frame too. 
You may put ViherLanka in loop, 
so it keeps advancing multiple splits.

Calling BEGIN returns handle for thread.
You may use `ViherLanka_Destroy(thread)` to delete current thread.
In step-event example, as no active thread exists,
it will create new one and start executing it.

---
### MACRO SYNTAX HANDLES.

```gml
// Begins greenthread-block.
VIHERLANKA_BEGIN
  
// Makes new split point.
VIHERLANKA_SPLIT
  
// Ends greenthread-block.
VIHERLANKA_END
```

---
### HOW TO USE

```gml
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
```

---
### WHAT MACROS PRODUCE

```gml
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
```

===============================================================


