wall=$(zenity --file-selection --title="Select a Wallpaper" --filename="$HOME/Pictures/Wallpapers/")
if [[ $wall ]]; then
  echo "$wall" >"$HOME/.current_wallpaper"
  hyprctl hyprpaper reload ,"$wall"
  notify-send -i "$HOME/Pictures/hyprland-logo.png" "Hyprpaper" "Wallpaper changed successfully"
else
  notify-send -i "$HOME/Pictures/hyprland-logo-error.png" "Hyprpaper" "Wallpaper not changed"
fi
