export HISTSIZE=10000
export NO_AT_BRIDGE=1
export GUROBI_HOME="/opt/gurobi702/linux64"
export PATH="${PATH}:${GUROBI_HOME}/bin"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${GUROBI_HOME}/lib"
export PATH=$HOME/bin:$PATH
export GUROBI_HOME="/home/zandi/.gurobi/gurobi801/linux64"
export GRB_LICENSE_FILE='/home/zandi/.gurobi/gurobi.lic'
export PATH="${PATH}:${GUROBI_HOME}/bin"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${GUROBI_HOME}/lib"
export LD_LIBRARY_PATH="${GUROBI_HOME}/lib"


bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
# alias for python3.5
##alias py=python3.5
alias st='git status'
alias graph='git log --decorate --oneline --graph --all'

# alias for /media/zandi/Daten
shopt -s cdable_vars
export data=/media/zandi/Daten
export git=/media/zandi/Daten/git

# alias for latexmk
alias texmake='latexmk -pdf -pvc -interaction=nonstopmode' 
alias easycopy='echo $(pwd) | xclip -i -selection clipboard'
alias easypaste='xclip -selection clipboard -o'
alias easyopen='nemo $(pwd) &'
alias savescreen='ffmpeg -f x11grab -y -r 30 -s 1280x720 -i :0.0 -vcodec huffyuv out.avi'
alias pdflatex_piped='pdflatex --enable-pipes --shell-escape'
alias joinalsongs='ls *.mp3 | sed -e "s/\(.*\)/file '\1'/" | ffmpeg -protocol_whitelist 'file,pipe' -f concat -i - -c copy output.mp3'
home-screen(){
xrandr --output eDP-1 --off
xrandr --output HDMI-2 --auto
xrandr --output HDMI-2 --rotate normal
xrandr --output HDMI-2 --scale 1x1
xrandr --output eDP-1 --auto
xrandr --output eDP-1 --primary
xrandr --output eDP-1 --right-of HDMI-2
xrandr --output eDP-1 --scale 0.5x0.5
}
main-screen(){
xrandr --output DP-2-1 --off
xrandr --output DP-2-2 --off
xrandr --output DP-2-3 --off
xrandr --output HDMI-2 --off
xrandr --output eDP-1 --auto
xrandr --output eDP-1 --scale 0.5x0.5
#xrandr --output DP-2-2 --mode 8192x8192 --scalw 1x1
}
home-double-screen(){
rightdisp=DP-2-2
leftdisp=DP-2-1
xrandr --output eDP-1 --off
xrandr --output $leftdisp --rotate normal
xrandr --output $leftdisp --auto
xrandr --output $leftdisp --scale 1x1
xrandr --output $leftdisp --primary
xrandr --output $rightdisp --auto
xrandr --output $rightdisp --right-of $leftdisp
xrandr --output $rightdisp --scale 1x1
xrandr --output $rightdisp --rotate normal
}
office-screen(){
rightdisp=DP-2-3
leftdisp=DP-2-2
xrandr --output eDP-1 --off
xrandr --output $leftdisp --rotate normal
xrandr --output $leftdisp --auto
xrandr --output $leftdisp --scale 1x1
xrandr --output $leftdisp --primary
xrandr --output $rightdisp --auto
xrandr --output $rightdisp --right-of $leftdisp
xrandr --output $rightdisp --scale 1x1
xrandr --output $rightdisp --rotate normal
}

pdftovid(){
if [ -d tmp ]; then
rm -rf tmp
else
mkdir tmp
fi
BaseName=${1%*.pdf}
pdfFile=$1
PageNum=$(pdftk "$BaseName.pdf" dump_data | grep NumberOfPages | sed 's/[^0-9]*//')
pdftoppm -scale-to-x 1920 -scale-to-y 1080 "$pdfFile" "tmp/$BaseName" -png
outFile="$BaseName-tmp.mp4"
if [ -f tmp/$BaseName-00001.png ]; then
ffmpeg -r 2 -f image2 -s 1920x1080 -start_number 1 -i tmp/$BaseName-%05d.png -vframes "$PageNum" -vcodec libx264 -vf pad="width=ceil(iw/2)*2:height=ceil(ih/2)*2" -crf 25 -pix_fmt yuv420p $outFile
elif [ -f tmp/$BaseName-0001.png ]; then
ffmpeg -r 2 -f image2 -s 1920x1080 -start_number 1 -i tmp/$BaseName-%04d.png -vframes "$PageNum" -vcodec libx264 -vf pad="width=ceil(iw/2)*2:height=ceil(ih/2)*2" -crf 25 -pix_fmt yuv420p $outFile
elif [ -f tmp/$BaseName-001.png ]; then
ffmpeg -r 2 -f image2 -s 1920x1080 -start_number 1 -i tmp/$BaseName-%03d.png -vframes "$PageNum" -vcodec libx264 -vf pad="width=ceil(iw/2)*2:height=ceil(ih/2)*2" -crf 25 -pix_fmt yuv420p $outFile
fi
}

alias record='timeout 41m ffmpeg -f x11grab -y -r 2 -s 1280x720 -i :0.0 -vcodec huffyuv out.avi | okular -p 1 --presentation 1.pdf'
### create avi file of video
giftoavi(){
file=${1%*.gif}
convert -coalesce "$file.gif" "$file-bak.png"
N=$(ls $file-bak*.png | wc -l)
if  [ $N -eq 1 ]; then mv "$file-bak.png" "$file-bak-0.png"; fi
### length in seconds
length=90
for (( i=0; i<=$((2*$length/$N)); i++ ))
    do 
        for (( n=0; n<=$(($N-1)); n++ ))
        do
        new=$(($i*$N+$n))
        #echo "$n to $new"
        if [ $new -le $((2*$length)) ]
        then
         cp "$file-bak-$n.png" "$file-$new.png"
         caption=$(($length-$new/2))
            if [ $caption -le 5 ]
            then
                 convert -font helvetica -fill red -pointsize 100 -draw "text 50,100 '$caption'" "$file-$new.png" "$file-$new.png"
             else
                 convert -font helvetica -fill black -pointsize 100 -draw "text 50,100 '$caption'" "$file-$new.png" "$file-$new.png"
             fi
         fi
        done
    done
ffmpeg -framerate 2 -start_number 0 -i $file-%d.png -vcodec mpeg4 $file.avi
#ffmpeg -i $file.avi -ss 00:00:40 $file-cycle.avi
#ffmpeg -i $file.avi -ss 00:00:50 $file-rest.avi
#ffmpeg -i $file.avi -ss 00:00:49 $file-prep.avi
rm $file-*.png
mv *.avi avi/
}
cutandmix(){
#input=$1
#start=$2
#duration=$3
#music=$4
#ffmpeg -i $input -ss 00:00:$start -t 00:$duration -c:v copy -c:a copy tmp.avi
ffmpeg -i out.avi -ss 00:00:11 -t 00:39:52 -c:v copy -c:a copy output.avi
ffmpeg -i tmp.avi -i $music -c copy tmp.avi
echo "tmp.avi is created!"
}
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/zandi/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/zandi/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/zandi/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/zandi/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
#########
#########mergeti() {
#########FileName=$1.pdf
#########pdftk $(ls [1-9].pdf) cat output "$FileName"
#########PageNum=$(pdftk $FileName dump_data | grep NumberOfPages | sed 's/[^0-9]*//')
#########pdftk $FileName cat 1-"$PageNum"right output $FileName-new
#########mv $FileName-new $FileName
#########evince $FileName
#########}
#########
########## The next line updates PATH for the Google Cloud SDK.
#########if [ -f '/home/zandi/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/home/zandi/Downloads/google-cloud-sdk/path.bash.inc'; fi
#########
########## The next line enables shell command completion for gcloud.
#########if [ -f '/home/zandi/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/home/zandi/Downloads/google-cloud-sdk/completion.bash.inc'; fi
#########
#########source /usr/share/bash-completion/bash_completion
