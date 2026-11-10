import sys
from PIL import Image
d,t=sys.argv[1],sys.argv[2]
ks=['a_negY','b_tq','c_posX','d_posY','h_negY','h_tq','h_posX','h_posY']
ims=[Image.open(f'{d}/{t}_{k}.png').convert('RGB') for k in ks]
s=Image.new('RGB',(1600,1000),'white')
for i,im in enumerate(ims[:4]): s.paste(im.resize((400,600)),(i*400,0))
for i,im in enumerate(ims[4:]): s.paste(im.resize((400,400)),(i*400,600))
s.save(f'{d}/{t}_sheet.png')
