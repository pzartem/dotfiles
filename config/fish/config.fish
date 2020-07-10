set -U fish_prompt_pwd_dir_length 0
set -U fish_greeting ""
set -U -x VISUAL e

abbr --add g   git
abbr --add gb  git branch
abbr --add gc  git commit
abbr --add gl  git log
abbr --add gp  git push
abbr --add gp! git push --force
abbr --add gpo git push -u origin HEAD

abbr --add sw  git switch
abbr --add swm git switch master
abbr --add swc git switch -c

abbr --add ls exa -l
abbr --add la exa -la
abbr --add l  exa -l

abbr --add c code
abbr --add w code ~/work/

abbr --add fc nvim ~/.config/fish/config.fish
abbr --add vc nvim ~/.config/nvim/init.vim

abbr --add wrp nvim ~/work/raa-profiles
abbr --add wmeta nvim ~/work/meta
abbr --add wraa nvim ~/work/labrador

abbr --add ctrlc xclip -selection c
abbr --add ctrlv xclip -selection c -o

abbr --add xp  ./x.py --stage 1 --keep-stage 1
abbr --add xpt ./x.py --stage 1 --keep-stage 1 test
abbr --add xpc ./x.py check

abbr --add cat bat -p

source ~/envs/.metaenvs
