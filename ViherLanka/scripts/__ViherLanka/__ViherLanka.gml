

/**
* Simple "GreenThread" implementation for instances.
* 
* Allows instance to execute series of function asynchronously.
* 
* The Function -parameter should return array of methods.
* -> Function returns "prototype", array of methods.
* 
* The methods should return true/false whether it has finished.
* -> By default it is "true" -> can continue to the next split.
* -> Executing the next step always happens on the next frame.
* 
* @param {Struct | Id.Instance} _context
* @param {Function}             _Function Function which returns array of methods.
*/ 
function __ViherLanka(_context, _Function)
{
  static prototypes = ds_map_create();
  static threads = ds_map_create();
  
  
  // Generate unique key.
  // I have heard using "method_get_index" is slow, but eh.
  var _ptr = ptr(_context);
  var _idx = method_get_index(_Function);
  var _key = $"{_ptr}@{_idx}";
  
  
  // Find whether thread exists.
  // If not, then create one.
  var _thread = threads[? _key];
  if (_thread == undefined)
  {
    // Get prototype.
    // Make methods unbound. 
    var _prototype = prototypes[? _idx];
    if (_prototype == undefined)
    {
      _prototype = _Function();
      array_map_ext(_prototype, function(_method, _index)
      {
        return method(undefined, _method);
      });
      prototypes[? _idx] = _prototype;
    }
    
    // Create new thread.
    _thread = {
      key     : _key, 
      context : _context,
      array   : _prototype,
      index   : 0,
      count   : array_length(_prototype),
    };
    threads[? _key] = _thread;
  }
  
  
  with(_thread)
  {
    // Advance the given thread.
    if (array[index](context) ?? true)
    {
      index += 1;
    }
    
    // Remove thread if finished.
    if (index >= count)
    {
      ds_map_delete(threads, _key);
    }
  }
  
  
  // Returns the thread-reference.
  return _thread;
}


