use std::os::raw::c_double;

#[no_mangle]
pub extern "C" fn add_one(x: *mut c_double) {
    unsafe {
        *x = *x + 1.0;
    }
}
