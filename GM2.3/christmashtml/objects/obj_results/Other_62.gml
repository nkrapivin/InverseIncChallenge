/// @description did we report the result fine?

var _id, _status, _url, _result;
_id = ds_map_find_value(async_load, "id");
_status = ds_map_find_value(async_load, "status");
_url = ds_map_find_value(async_load, "url");
_result = ds_map_find_value(async_load, "result");
if (is_undefined(_result)) _result = "<result is undefined>";

show_debug_message(json_encode(async_load));

reported = true;
if (_status != 0 || _url != phpurl/* || _result != success*/) {
    reportstr = "FAILED!#";
    
    // so we did receive a response just fine, but it's an error :\
    if (_status == 0 && string_count("failure", _result) > 0) {
        reportstr += "BACKEND SERVER ERROR.#";
    }
    else {
        reportstr += "INTERNET ERROR.#";
    }
    
    reportstr += _result;
}
else {
    // we're done here, wait a bit and quit.
    reportstr = "REPORTED. QUITTING...";
    quitting = true;
    alarm[0] = quittime;
}

/* */
/*  */
