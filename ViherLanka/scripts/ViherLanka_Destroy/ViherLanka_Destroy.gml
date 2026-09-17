

/**
* Destroys given green-thread.
* 
* @param {Struct} _thread Struct from "thread = VIHERLANKA_BEGIN..."
*/ 
function ViherLanka_Destroy(_thread)
{
  ds_map_delete(ViherLanka.threads, _thread.key);
  delete _thread;
}