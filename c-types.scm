
(##define-syntax c-include
 (lambda (src)
   (let ((datum (##desourcify src)))
     (if (and (##pair? (##cdr datum))
              (##null? (##cddr datum)))
         (let ((filename (##cadr datum)))
           (if (##string=? filename)
               (##expand-source-template
                src
                `(##c-declare
                   ,(##append-strings
                      (##with-input-from-file
                        (##path-expand
                          filename
                          (##path-directory (##source-path src)))
                        (##lambda ()
                          (##read-all (##current-input-port) ##read-line)))
                      "\n")))
               (##ill-formed-special-form src)))
         (##ill-formed-special-form)))))

(c-declare #<<end-of-c-declare
#include <SDL.h>
end-of-c-declare
)

(c-include "color.h")
(c-include "rect.h")

(c-declare #<<end-of-c-declare

___HIDDEN ___ERR_CODE SCMOBJ_to_SDL_Color(___SCMOBJ src, SDL_Color *dst, int arg_num)
{
  // Use by ___U8VECTORP
  ___SCMOBJ ___temp;

  if (!___U8VECTORP(src))
    return ___STOC_U8_ERR+arg_num;

  if (___U8VECTORLENGTH(src) != ___FIX(4))
    return ___STOC_STRUCT_ERR+arg_num;

  Uint8 *body = ___CAST(Uint8*, ___BODY(src));
  dst->r = body[0];
  dst->g = body[1];
  dst->b = body[2];
  dst->a = body[3];
  return ___NO_ERR;
}

___HIDDEN ___ERR_CODE SDL_Color_to_SCMOBJ(SDL_Color src, ___SCMOBJ *dst, int arg_num)
{
  ___SCMOBJ result;
  ___U8 *body;
  result = ___alloc_scmobj(___PSTATE, ___sU8VECTOR, 4);

  if (___FIXNUMP(result)) {
    return ___CTOS_HEAP_OVERFLOW_ERR;
  }

  body = ___CAST(___U8*, ___BODY(result));
  body[0] = src.r;
  body[1] = src.g;
  body[2] = src.b;
  body[3] = src.a;
  *dst = result;

  return ___NO_ERR;
}

___ERR_CODE SCMOBJ_to_SDL_Rect(___SCMOBJ src, SDL_Rect *dst, int arg_num)
{
  // Use by ___S32VECTORP
  ___SCMOBJ ___temp;

  if (!___S32VECTORP(src))
    return ___STOC_S32_ERR+arg_num;

  if (___S32VECTORLENGTH(src) != ___FIX(4))
    return ___STOC_STRUCT_ERR+arg_num;

  int *body = ___CAST(int*, ___BODY(src));
  dst->x = body[0];
  dst->y = body[1];
  dst->w = body[2];
  dst->h = body[3];
  return ___NO_ERR;
}

___ERR_CODE SDL_Rect_to_SCMOBJ(SDL_Rect* src, ___SCMOBJ *dst, int arg_num)
{
  ___SCMOBJ result;
  ___S32 *body;

  if (!src)
    {
      return ___FAL;
    }

  result = ___alloc_scmobj(___PSTATE, ___sS32VECTOR, ___FIX(4));
  if (___FIXNUMP(result))
    {
      return ___CTOS_HEAP_OVERFLOW_ERR;
    }

  body = ___CAST(___S32*, ___BODY(result));
  body[0] = src->x;
  body[1] = src->y;
  body[2] = src->w;
  body[3] = src->h;
  *dst = result;

  return ___NO_ERR;
}

___ERR_CODE SCMOBJ_to_SDL_Rect_ptr(___SCMOBJ src, SDL_Rect **dst, int arg_num)
{
  ___SCMOBJ err;
  SDL_Rect *result;

  if (___FALSEP(src)) // #f is NULL
    {
      *dst = NULL;
      return ___NO_ERR;
    }

  result = ___EXT(___alloc_rc)(sizeof(*result));
  if (result)
    {
      if ((err = SCMOBJ_to_SDL_Rect(src, result, arg_num)) != ___NO_ERR)
        {
          return err;
        }

      *dst = result;
      return ___NO_ERR;
    }
  else
    return ___CTOS_HEAP_OVERFLOW_ERR;
}
end-of-c-declare
)

;; Some SDL structure
(define (make-SDL_Color r g b a)
  (u8vector r g b a))

(define (make-SDL_Rect x y w h)
  (s32vector x y w h))

(c-define-type SDL_Color "SDL_Color" "SDL_Color_to_SCMOBJ" "SCMOBJ_to_SDL_Color" #f)
(c-define-type SDL_Rect  "SDL_Rect" "SDL_Rect_to_SCMOBJ" "SCMOBJ_to_SDL_Rect" #f)
(c-define-type SDL_Rect* "SDL_Rect*" "SDL_Rect_ptr_to_SCMOBJ" "SCMOBJ_to_SDL_Rect_ptr" #f)
(c-define-type SDL_Surface* (pointer (struct "SDL_Surface")))
