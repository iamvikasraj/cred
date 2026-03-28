NeoPOP fonts (Gilroy + Cirka / PPCirka)
======================================

iOS needs .ttf or .otf in this folder (not .woff). Filenames must match CredFonts.plist → UIAppFonts (project root).

1. Obtain licensed desktop/mobile font files for Gilroy and Cirka (same families CRED uses in NeoPOP).
2. Export or rename to match exactly:
   Gilroy-Thin.ttf, Gilroy-Regular.ttf, Gilroy-Medium.ttf, Gilroy-SemiBold.ttf,
   Gilroy-Bold.ttf, Gilroy-ExtraBold.ttf,
   PPCirka-Regular.ttf, PPCirka-Medium.ttf, PPCirka-Bold.ttf
3. If your files use different PostScript internal names, update NeoPOPFont.swift
   (gilroyFontName / cirkaFontName) to match Font Book → PostScript Name.

Until files are present, NeoPOPFont falls back to the system font.

Reference: CRED NeoPOP web loads WOFF from web-assets.cred.club; iOS bundles TTF/OTF here instead.
