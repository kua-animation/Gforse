#include <SDL2/SDL.h>

SDL_Event event;

void gf_init() {
    SDL_Init(SDL_INIT_VIDEO);
}

void* gf_window(int x, int y, int w, int h) {

    SDL_Window* window = SDL_CreateWindow("",
        x, y, w, h, 
        SDL_WINDOW_SHOWN | SDL_WINDOW_SKIP_TASKBAR | SDL_WINDOW_BORDERLESS);

    return (void*)window;

}

void* gf_render(void* window) {
    SDL_Renderer* render = SDL_CreateRenderer((SDL_Window*)window,
                    -1, SDL_RENDERER_SOFTWARE);

    return (void*)render;
}

int gf_is_key_down(int key) {
    if (event.type = SDL_KEYDOWN) {
        if (event.key.keysym.sym == key) {
                return 1;
        }
    }
    return 0;
}

int gf_event() {
    if (SDL_PollEvent(&event) != 0) {
        return 1;
    }

    return 0;

}

void gf_set_window_position(void* window, int newX, int newY) {

    SDL_SetWindowPosition((SDL_Window*)window, newX, newY);

}

void gf_set_window_color(void* render, int r, int g, int b) {
   
    SDL_SetRenderDrawColor((SDL_Renderer*)render, r, g, b, 255);
    SDL_RenderClear((SDL_Renderer*)render);
    SDL_RenderPresent((SDL_Renderer*)render);
}

void gf_delay(int time) {
    SDL_Delay(time);
}

void gf_destroy_window(void* window, void* render) {

    SDL_DestroyRenderer((SDL_Renderer*)render);
    SDL_DestroyWindow((SDL_Window*)window);

}

void gf_quit() {
    SDL_Quit();
}