"""Labelled 12-view sheet: python hg_sheet.py <render dir> <out.png> <title>"""
import sys
from PIL import Image, ImageDraw, ImageFont
tag, out, title = sys.argv[1:4]
order = ["front","tq_left","tq_right","side_left","side_right","back","back_tq_left","back_tq_right","top","below","front_high","front_low"]
c=330; f=ImageFont.truetype("arial.ttf",22)
sh=Image.new("RGB",(4*c,3*(c+30)+44),(235,236,238)); d=ImageDraw.Draw(sh); d.text((10,10),title,fill=(10,10,10),font=f)
for i,n in enumerate(order):
    x,y=(i%4)*c,44+(i//4)*(c+30)
    sh.paste(Image.open(f"{tag}/{n}.png").convert("RGB").resize((c,c),Image.LANCZOS),(x,y+30)); d.text((x+8,y+4),n.replace("_"," "),fill=(60,60,60),font=f)
sh.save(out)
