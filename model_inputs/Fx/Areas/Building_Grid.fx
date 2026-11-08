{
	"type": "fx",
	"cullingRadius": 100000,
	"blendFactor": 1,
	"children": [
		{
			"type": "object",
			"name": "root",
			"children": [
				{
					"type": "advancedDecal",
					"name": "advancedDecal",
					"scaleX": 2,
					"scaleY": 2,
					"scaleZ": 10,
					"albedoMap": "Fx/Alphas/T_circle5.png",
					"fadeStart": 0.5,
					"renderMode": "BeforeTonemapping",
					"children": [
						{
							"type": "material",
							"name": "material",
							"props": {
								"PBR": {
									"mode": "BeforeTonemapping",
									"blend": "Add",
									"shadows": false,
									"culling": "Back",
									"colorMask": 255,
									"depthTest": "Always"
								}
							},
							"wrapRepeat": true
						},
						{
							"type": "shader",
							"name": "AutoAlpha",
							"source": "shaders/AutoAlpha.hx",
							"enabled": false,
							"props": {
								"scale": 1
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "ColorSet",
							"source": "shaders/ColorSet.hx",
							"props": {
								"amount": 1,
								"color": [
									1,
									0.984313725490196,
									0.7411764705882353
								]
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "WorldUV",
							"source": "shaders/WorldUV.hx",
							"enabled": false,
							"props": {
								"useNormalMap": false,
								"onDecal": true,
								"scale": 1,
								"rotation": 0
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.8
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "EnvColorMult",
							"source": "shaders/EnvColorMult.hx",
							"props": {
								"sandBlend": 0.45,
								"sandColorSet": false,
								"envBlend": 0,
								"envColorSet": false
							},
							"isInstance": true
						}
					]
				}
			]
		}
	]
}