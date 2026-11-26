import sys
from PIL import Image,ImageDraw
tag=sys.argv[1]; d=tag+'/'
a=[Image.open(d+f'head_{k}.png').convert('RGB') for k in ('front','tq','side','back')]
b=[Image.open(d+f'body_full_{k}.png').convert('RGB').resize((375,500)) for k in ('front','tq','back')]
s=Image.new('RGB',(2000,1030),(225,225,228)); D=ImageDraw.Draw(s)
D.text((10,5),tag,fill=(0,0,0))
for i,im in enumerate(a): s.paste(im,(i*500,20))
for i,im in enumerate(b): s.paste(im,(i*375,525))
s.save(f'{tag}_sheet.png')
