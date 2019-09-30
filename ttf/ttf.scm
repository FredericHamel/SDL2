
(c-declare #<<end-of-c-declare
#include <SDL_ttf.h>
end-of-c-declare
)

(c-define-type TTF_Font* (pointer "TTF_Font"))

(define TTF_Init
  (c-lambda () bool "___return(!TTF_Init());"))

(define TTF_WasInit
  (c-lambda () bool "TTF_WasInit"))

(define TTF_Quit
  (c-lambda () void "TTF_Quit"))

(define TTF_OpenFont
  (c-lambda (char-string unsigned-int) TTF_Font* "TTF_OpenFont"))

(define TTF_CloseFont
  (c-lambda (TTF_Font*) void "TTF_CloseFont"))

(define TTF_RenderText_Solid
  (c-lambda (TTF_Font* char-string SDL_Color) SDL_Surface* "TTF_RenderText_Solid"))

(define TTF_RenderUTF8_Solid
  (c-lambda (TTF_Font* char-string SDL_Color) SDL_Surface* "TTF_RenderUTF8_Solid"))


