
// SDL_Color
#define ___BEGIN_CFUN_SCMOBJ_to_SDL_Color(src,dst,i) \
if ((___err = SCMOBJ_to_SDL_Color (src, &dst, i)) == ___NO_ERR) {
#define ___END_CFUN_SCMOBJ_to_SDL_Color(src,dst,i) }

#define ___BEGIN_CFUN_SDL_Color_to_SCMOBJ(src,dst) \
if ((___err = SDL_Color_to_SCMOBJ (src, &dst, ___RETURN_POS)) == ___NO_ERR) {
#define ___END_CFUN_QString_to_SCMOBJ(src,dst) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_SDL_Color_to_SCMOBJ(src,dst,i) \
if ((___err = SDL_Color_to_SCMOBJ (src, &dst, i)) == ___NO_ERR) {
#define ___END_SFUN_SDL_Color_to_SCMOBJ(src,dst,i) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_SCMOBJ_to_SDL_Color(src,dst) \
{ ___err = SCMOBJ_to_SDL_Color (src, &dst, ___RETURN_POS);
#define ___END_SFUN_SCMOBJ_to_SDL_Color(src,dst) }

___HIDDEN ___ERR_CODE SCMOBJ_to_SDL_Color(___SCMOBJ src, SDL_Color *dst, int arg_num);
___HIDDEN ___ERR_CODE SDL_Color_to_SCMOBJ(SDL_Color src, ___SCMOBJ *dst, int arg_num);

