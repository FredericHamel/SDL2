
(define-library (SDL2)
  (export SDL_Init
          SDL_InitSubSystem
          SDL_Quit

          ;; SDL subsystems
          SDL_INIT_TIMER
          SDL_INIT_AUDIO
          SDL_INIT_VIDEO
          SDL_INIT_JOYSTICK
          SDL_INIT_HAPTIC
          SDL_INIT_GAMECONTROLLER
          SDL_INIT_EVENTS
          ; SDL_INIT_SENSOR
          ; SDL_INIT_NOPARACHUTE
          SDL_INIT_EVERYTHING

          ;; Window
          SDL_CreateWindow
          SDL_DestroyWindow

          ;; SDL position constant
          SDL_WINDOWPOS_CENTERED

          ;; SDL Window Flags
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
          SDL_WINDOW_VULKAN

          ;; SDL Structure
          make-SDL_Color
          make-SDL_Rect

          SDL_PollEvent
          SDL_Event-type

          ;; Event types
          SDL_QUIT
          SDL_WINDOWEVENT
          SDL_SYSWMEVENT

          SDL_KEYDOWN
          SDL_KEYUP

          ;; SDL_keycode
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
          SDLK_z

          ;; Renderer
          SDL_CreateRenderer
          SDL_DestroyRenderer

          ;; Kind of Renderers
          SDL_RENDERER_SOFTWARE
          SDL_RENDERER_ACCELERATED
          SDL_RENDERER_PRESENTVSYNC
          SDL_RENDERER_TARGETTEXTURE

          SDL_Surface-clip_rect
          SDL_FreeSurface

          SDL_SetRenderDrawColor
          SDL_RenderClear
          SDL_RenderPresent
          SDL_RenderCopy
          SDL_RenderFillRect

          ;; Surface and Texture
          SDL_CreateTextureFromSurface
          SDL_DestroyTexture

          with-SDL2
          with-SDL2-context
          )

  (pkg-config "sdl2")
  (cc-options "-Wall")

  ;; c-define and c-declare
  (import (gambit))

  (include "c-types.scm")
  (include "SDL2.scm"))
