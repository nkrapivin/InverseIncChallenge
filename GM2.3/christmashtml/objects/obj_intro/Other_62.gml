/// @description do we have internet?

var _id, _status, _url;
_id = ds_map_find_value(async_load, "id");
_status = ds_map_find_value(async_load, "status");
_url = ds_map_find_value(async_load, "url");

testdone = true;

if (_url == testurl && _id == test && _status == 0) {
    show_debug_message("We have internet!");
}
else {
    global.net = false;
    show_debug_message("inet oof");
}

