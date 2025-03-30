program main
    use gforse

    integer :: speed, runnig
    logical :: color
    type(c_ptr) :: window_ptr
    type(c_ptr) :: render_ptr

    call GF_Init()

    speed = 5
    
    runnig = 0

    window_ptr = GF_window(200, 200, 300, 300)
    render_ptr = GF_render(window_ptr)

    do while (runnig == 0)
        do while (GF_event() == 1)
            if (GF_is_key_down(32) == 1) then
                runnig = 1
            end if

            if (GF_is_key_down(49) == 1) then
                if (color) then
                    color = .false.
                else 
                    color = .true.
                end if
            end if

        end do
        if (color) then
            call GF_set_window_color(render_ptr, 0, 10, 250)
        else 
            call GF_set_window_color(render_ptr, 200, 10, 150)
        end if 
        call GF_delay(10)

    end do

    call GF_destroy_window(window_ptr, render_ptr)

    call GF_Quit()

end program main