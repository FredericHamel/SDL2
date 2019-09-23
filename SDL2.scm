
(define-macro (c-define-cst type cst)
  `(define ,cst
     ((c-lambda () ,type ,(string-append "___return(" (symbol->string cst) ");")))))

(define-macro (c-define-enum type . csts)
  `(begin
     ,@(map (lambda (cst)
             `(c-define-cst ,type ,cst))
           csts)))

(c-declare #<<end-of-c-declare
#include <SDL.h>
#include <stdio.h>
#include <stdlib.h>
#include "gambit.h"
end-of-c-declare
)

;; SDL2 Subsystems
(c-define-cst unsigned-int SDL_INIT_TIMER)
(c-define-cst unsigned-int SDL_INIT_AUDIO)
(c-define-cst unsigned-int SDL_INIT_VIDEO)
(c-define-cst unsigned-int SDL_INIT_JOYSTICK)
(c-define-cst unsigned-int SDL_INIT_HAPTIC)
(c-define-cst unsigned-int SDL_INIT_GAMECONTROLLER)
(c-define-cst unsigned-int SDL_INIT_EVENTS)
; (c-define-cst unsigned-int SDL_INIT_SENSOR)
; (c-define-cst unsigned-int SDL_INIT_NOPARACHUTE)
(c-define-cst unsigned-int SDL_INIT_EVERYTHING)

(c-define-type SDL_Window* (pointer (struct "SDL_Window")))
(c-define-type SDL_WindowFlags unsigned-int)
(c-define-cst int SDL_WINDOWPOS_CENTERED)
(c-define-enum SDL_WindowFlags
  SDL_WINDOW_FULLSCREEN
  SDL_WINDOW_OPENGL
  SDL_WINDOW_SHOWN
  SDL_WINDOW_HIDDEN
  SDL_WINDOW_BORDERLESS
  SDL_WINDOW_MINIMIZED
  SDL_WINDOW_MAXIMIZED
  SDL_WINDOW_INPUT_GRABBED
  SDL_WINDOW_INPUT_FOCUS
  SDL_WINDOW_MOUSE_FOCUS
  SDL_WINDOW_FULLSCREEN_DESKTOP
  SDL_WINDOW_FOREIGN
  SDL_WINDOW_ALLOW_HIGHDPI

  SDL_WINDOW_MOUSE_CAPTURE
  SDL_WINDOW_ALWAYS_ON_TOP
  SDL_WINDOW_SKIP_TASKBAR
  SDL_WINDOW_TOOLTIP
  SDL_WINDOW_POPUP_MENU
  SDL_WINDOW_VULKAN)

;; SDL renderer type
(c-define-type SDL_Renderer* (pointer (struct "SDL_Renderer")))
(c-define-type SDL_RendererFlags unsigned-int)
(c-define-enum SDL_RendererFlags
  SDL_RENDERER_SOFTWARE
  SDL_RENDERER_ACCELERATED
  SDL_RENDERER_PRESENTVSYNC
  SDL_RENDERER_TARGETTEXTURE)

;; SDL event type
(c-define-type SDL_EventType unsigned-int)
(c-define-enum SDL_EventType
  SDL_QUIT
  SDL_WINDOWEVENT
  SDL_SYSWMEVENT
  SDL_KEYDOWN
  SDL_KEYUP)

(c-define-enum int
  SDLK_UNKNOWN

  SDLK_RETURN
  SDLK_ESCAPE
  SDLK_BACKSPACE
  SDLK_TAB
  SDLK_SPACE
  SDLK_EXCLAIM
  SDLK_QUOTEDBL
  SDLK_HASH
  SDLK_PERCENT
  SDLK_DOLLAR
  SDLK_AMPERSAND
  SDLK_QUOTE
  SDLK_LEFTPAREN
  SDLK_RIGHTPAREN
  SDLK_ASTERISK
  SDLK_PLUS
  SDLK_COMMA
  SDLK_MINUS
  SDLK_PERIOD
  SDLK_SLASH
  SDLK_0
  SDLK_1
  SDLK_2
  SDLK_3
  SDLK_4
  SDLK_5
  SDLK_6
  SDLK_7
  SDLK_8
  SDLK_9
  SDLK_COLON
  SDLK_SEMICOLON
  SDLK_LESS
  SDLK_EQUALS
  SDLK_GREATER
  SDLK_QUESTION
  SDLK_AT
  #|
     Skip uppercase letters
   |#
  SDLK_LEFTBRACKET
  SDLK_BACKSLASH
  SDLK_RIGHTBRACKET
  SDLK_CARET
  SDLK_UNDERSCORE
  SDLK_BACKQUOTE
  SDLK_a
  SDLK_b
  SDLK_c
  SDLK_d
  SDLK_e
  SDLK_f
  SDLK_g
  SDLK_h
  SDLK_i
  SDLK_j
  SDLK_k
  SDLK_l
  SDLK_m
  SDLK_n
  SDLK_o
  SDLK_p
  SDLK_q
  SDLK_r
  SDLK_s
  SDLK_t
  SDLK_u
  SDLK_v
  SDLK_w
  SDLK_x
  SDLK_y
  SDLK_z)

(c-define-type SDL_Texture* (pointer "SDL_Texture"))

;; SDL procedure
(define SDL_Init
  (c-lambda (unsigned-int) int "SDL_Init"))

(define SDL_InitSubSystem
  (c-lambda (unsigned-int) int "SDL_InitSubSystem"))

(define SDL_Quit
  (c-lambda () void "SDL_Quit"))

(define SDL_CreateWindow
  (c-lambda (char-string int int int int SDL_WindowFlags) SDL_Window* "SDL_CreateWindow"))

(define SDL_DestroyWindow
  (c-lambda (SDL_Window*) void "SDL_DestroyWindow"))

(define SDL_CreateRenderer
  (c-lambda (SDL_Window* int unsigned-int) SDL_Renderer* "SDL_CreateRenderer"))

(define SDL_DestroyRenderer
  (c-lambda (SDL_Renderer*) void "SDL_DestroyRenderer"))

(define SDL_SetRenderDrawColor
  (c-lambda (SDL_Renderer* SDL_Color) int
            #<<end-of-c-lambda
___return(SDL_SetRenderDrawColor(___arg1, ___arg2.r, ___arg2.g, ___arg2.b, ___arg2.a));
end-of-c-lambda
))

(define SDL_RenderClear
  (c-lambda (SDL_Renderer*) int "SDL_RenderClear"))

(define SDL_RenderPresent
  (c-lambda (SDL_Renderer*) void "SDL_RenderPresent"))

(define SDL_RenderCopy
  (c-lambda (SDL_Renderer* SDL_Texture* SDL_Rect* SDL_Rect*) void "SDL_RenderCopy"))

(define SDL_RenderFillRect
  (c-lambda (SDL_Renderer* SDL_Rect*) bool "___return(!SDL_RenderFillRect(___arg1, ___arg2));"))

;; Event polling procedure
(define SDL_PollEvent
  (c-lambda () scheme-object
#<<end-of-c-lambda
___SCMOBJ result;
___SCMOBJ *body;
SDL_Event event;
if (!SDL_PollEvent(&event)) {
  ___return(___FAL);
}
result = ___make_vector(___PSTATE, 2, ___FAL);
body = ___BODY(result);
switch(event.type) {
  case SDL_KEYDOWN: /* fallthrough */
  case SDL_KEYUP: /* fallthrough */
    body[1] = ___FIX(event.key.keysym.sym);
  case SDL_QUIT:
    body[0] = ___FIX(event.type);
    break;
  default:
    break;
}
___return(result);
end-of-c-lambda
))


(define SDL_Surface-clip_rect
  (c-lambda (SDL_Surface*) SDL_Rect "___return(___arg1->clip_rect);"))

(define SDL_FreeSurface
  (c-lambda (SDL_Surface*) void "SDL_FreeSurface"))

(define SDL_CreateTextureFromSurface
  (c-lambda (SDL_Renderer* SDL_Surface*) SDL_Texture* "SDL_CreateTextureFromSurface"))



(define SDL_DestroyTexture
  (c-lambda (SDL_Texture*) void "SDL_DestroyTexture"))

;; SDL2 abstraction
(define (with-SDL2 init-options thunk #!optional exn-handler)
  (and (fx= (SDL_Init init-options) 0)
       (begin
         (with-exception-handler
           (or exn-handler (lambda (exn) #f))
           thunk)
         (SDL_Quit))))

(define (with-SDL2-context win renderer thunk #!optional exn-handler)
  (with-exception-handler
    (or exn-handler (lambda (exn) #f))
    thunk)
  (SDL_DestroyRenderer renderer)
  (SDL_DestroyWindow win))

