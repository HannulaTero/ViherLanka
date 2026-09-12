

/**
* Simple "GreenThread" implementation for instances.
* 
* Allows instance to execute series of function asynchronously.
* 
* The function-parameter should return array of methods.
* The array of methods should return true/false whether it has finished.
* -> By default it is "true" -> can continue to the next.
* -> Executing the next step always happens on the next frame.
* 
* @param {Struct | Id.Instance} _context
* @param {Function}             _Function Function which returns array of methods.
*/ 
function ViherLanka(_context, _Function)
{
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
    _thread = {
      key     : _key, 
      context : _context,
      index   : 0,
      array   : _Function(),
    };
    threads[? _key] = _thread;
  }
  
  
  // Advance the given thread.
  if (_thread.array[_thread.index](_thread.context) ?? true)
  {
    _thread.index += 1;
  }
  
  
  // Remove thread if finished.
  if (_thread.index >= array_length(_thread.array))
  {
    ds_map_delete(threads, _key);
  }
}


