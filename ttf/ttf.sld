
(define-library (SDL2 ttf)
  (export
    TTF_Init
    TTF_WasInit
    TTF_Quit

    TTF_OpenFont
    TTF_CloseFont

    TTF_RenderText_Solid
    TTF_RenderUTF8_Solid)

  (pkg-config "SDL2_ttf")

  (import (gambit))

  (include "../c-types.scm")
  (include "ttf.scm"))

