module gforse



    use iso_c_binding
    interface

        function GF_window(x, y, w, h) bind(C)
            use iso_c_binding
            integer(c_int), value :: x
            integer(c_int), value :: y
            integer(c_int), value :: w
            integer(c_int), value :: h
            type(c_ptr) :: GF_window
        end function GF_window

        function GF_render(window) bind(C)
            use iso_c_binding
            type(c_ptr), value :: window
            type(c_ptr) :: GF_render
        end function GF_render

        function GF_is_key_down(key) bind(C)
            use iso_c_binding
            integer(c_int), value :: key
            integer(c_int) :: GF_is_key_down
        end function GF_is_key_down

        function GF_event() bind(C)
            use iso_c_binding
            integer(c_int) :: GF_event
        
            
        end function GF_event
        
        subroutine GF_set_window_position(window, x, y) bind(C)
            use iso_c_binding
            type(c_ptr), value :: window
            integer(c_int), value :: x
            integer(c_int), value :: y
            
        end subroutine GF_set_window_position

        subroutine GF_Init() bind(C)
            use iso_c_binding
        end subroutine GF_Init

        subroutine GF_set_window_color(render, r, g, b) bind(C)
            use iso_c_binding

            type(c_ptr), value :: render
            integer(c_int), value :: r
            integer(c_int), value :: g
            integer(c_int), value :: b
            
        end subroutine GF_set_window_color

        subroutine GF_delay(time) bind(C)
            use iso_c_binding
            integer(c_int), value :: time
        end subroutine GF_delay
        
        subroutine GF_destroy_window(window, render) bind(C)
            use iso_c_binding
            type(c_ptr), value :: window
            type(c_ptr), value :: render 
        end subroutine GF_destroy_window

        subroutine GF_Quit() bind(C)
            use iso_c_binding
        end subroutine GF_Quit


    end interface

end module gforse
    

