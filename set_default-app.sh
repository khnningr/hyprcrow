#!/bin/bash

# https://github.com/chmln/handlr


handlr set 'image/*' swappy.desktop 
handlr set inode/directory yazi.desktop



handlr list # List default apps.

handlr get .png # Consulta de app por extensión.

handlr set image/bmp imv.desktop
handlr set image/gif imv.desktop
handlr set image/jpeg imv.desktop
handlr set image/jpg imv.desktop
handlr set image/pjpeg imv.desktop
handlr set image/png imv.desktop
handlr set image/tiff imv.desktop
handlr set image/x-bmp imv.desktop
handlr set image/x-pcx imv.desktop
handlr set image/x-png imv.desktop
handlr set image/x-portable-anymap imv.desktop
handlr set image/x-portable-bitmap imv.desktop
handlr set image/x-portable-graymap imv.desktop
handlr set image/x-portable-pixmap imv.desktop
handlr set image/x-tga imv.desktop
handlr set image/x-xbitmap imv.desktop
handlr set image/webp imv.desktop
handlr set video/mp4 vlc.desktop    
handlr set video/webm vlc.desktop
handlr set application/pdf org.pwmt.zathura.desktop
handlr set application/epub+zip org.pwmt.zathura-pdf-mupdf.desktop

