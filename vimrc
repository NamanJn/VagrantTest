set number
inoremap {	{}<Left>
inoremap {}	{}
inoremap {<CR>	{<CR>}<Esc>O<Tab>
inoremap {{	{ 
inoremap "	""<Left>
inoremap ""	"
inoremap (	()<Left>
inoremap ()	()
inoremap ((	(
inoremap {%	{%  %}<Left><Left><Left>
inoremap ssyso	System.out.println(  )<Left><Left>
inoremap ccc	console.log("%c"+"%c","color:red;","color:black;")<Esc>14bhi
inoremap q1q	###############################
inoremap pqp	poing=inspect.getabsfile(inspect.currentframe());
inoremap pjquery <script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
inoremap q`q	/************************************/<Down>/*             */<Down>/************************************/
nnoremap :	; 
nnoremap ;	:

let CursorColumnI = 0 "the cursor column position in INSERT
autocmd InsertEnter * let CursorColumnI = col('.')
autocmd CursorMovedI * let CursorColumnI = col('.')
autocmd InsertLeave * if col('.') != CursorColumnI | call cursor(0, col('.')+1) | endif

nnoremap gk	gt
nnoremap gj	gT

set shiftwidth=4
