
// SDL_Rect
#define ___BEGIN_CFUN_SCMOBJ_to_SDL_Rect(src,dst,i) \
if ((___err = SCMOBJ_to_SDL_Rect (src, &dst, i)) == ___NO_ERR) {
#define ___END_CFUN_SCMOBJ_to_SDL_Rect(src,dst,i) }

#define ___BEGIN_CFUN_SDL_Rect_to_SCMOBJ(src,dst) \
if ((___err = SDL_Rect_to_SCMOBJ (&src, &dst, ___RETURN_POS)) == ___NO_ERR) {
#define ___END_CFUN_SDL_Rect_to_SCMOBJ(src,dst) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_SDL_Rect_to_SCMOBJ(src,dst,i) \
if ((___err = SDL_Rect_to_SCMOBJ (src, &dst, i)) == ___NO_ERR) {
#define ___END_SFUN_SDL_Rect_to_SCMOBJ(src,dst,i) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_SCMOBJ_to_SDL_Rect(src,dst) \
{ ___err = SCMOBJ_to_SDL_Rect (src, &dst, ___RETURN_POS);
#define ___END_SFUN_SCMOBJ_to_SDL_Rect(src,dst) }

#define ___BEGIN_CFUN_SCMOBJ_to_SDL_Rect_ptr(src,dst,i) \
if ((___err = SCMOBJ_to_SDL_Rect_ptr (src, &dst, i)) == ___NO_ERR) {
#define ___END_CFUN_SCMOBJ_to_SDL_Rect_ptr(src,dst,i) \
___EXT(___release_rc)(dst); }

#define print(p) printf("%p\n", (p))

#define ___BEGIN_CFUN_SDL_Rect_ptr_to_SCMOBJ(src,dst) \
if (___err = SDL_Rect_to_SCMOBJ (src, &dst, ___RETURN_POS) == ___NO_ERR) {
#define ___END_CFUN_SDL_Rect_ptr_to_SCMOBJ(src,dst) \
___EXT(print)(p); ___EXT(___release_rc)(src); ___EXT(___release_scmobj) (dst); }

___HIDDEN ___ERR_CODE SCMOBJ_to_SDL_Rect(___SCMOBJ src, SDL_Rect *dst, int arg_num);
___HIDDEN ___ERR_CODE SDL_Rect_to_SCMOBJ(SDL_Rect* src, ___SCMOBJ *dst, int arg_num);

___HIDDEN ___ERR_CODE SCMOBJ_to_SDL_Rect_ptr(___SCMOBJ src, SDL_Rect **dst, int arg_num);
// ___HIDDEN ___ERR_CODE SDL_Rect_to_SCMOBJ(SDL_Rect* src, ___SCMOBJ *dst, int arg_num);
