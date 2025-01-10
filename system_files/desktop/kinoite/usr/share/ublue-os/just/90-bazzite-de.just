# vim: set ft=make :

# Restore zeropoint Breeze GTK4 theme
restore-zeropoint-breeze-gtk-theme:
    rm -f $HOME/.config/gtk-4.0/gtk.css
    rm -f $HOME/.config/gtk-4.0/kde_window_geometry.css
    cp /etc/skel/.config/gtk-4.0/gtk.css $HOME/.config/gtk-4.0/gtk.css
    cp /etc/skel/.config/gtk-4.0/kde_window_geometry.css $HOME/.config/gtk-4.0/kde_window_geometry.css
