#include <SDL2/SDL.h>

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

void gf_set_window_color(void* render, int r, int g, int b) {
    SDL_Event event;
    SDL_PollEvent(&event);
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