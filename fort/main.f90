program main
    use gforse

    type(c_ptr) :: window_ptr
    type(c_ptr) :: render_ptr

    call GF_Init()
    
    window_ptr = GF_window(200, 200, 300, 300)
    render_ptr = GF_render(window_ptr)

    call GF_set_window_color(render_ptr, 0, 20, 255)

    call GF_delay(1000)

    call GF_destroy_window(window_ptr, render_ptr)

    call GF_Quit()

end program main