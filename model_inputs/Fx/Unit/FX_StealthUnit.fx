{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "model",
			"name": "Reference",
			"source": "Character/Atreide/Unit/HeavyWeaponSquad/Male01_HeavyWeaponSquad.fbx",
			"editorOnly": true,
			"z": 0.39659,
			"scaleX": 2.9999999999999987,
			"scaleY": 2.9999999999999987,
			"scaleZ": 3,
			"rotationZ": 145,
			"children": [
				{
					"type": "animEvent",
					"name": "animEvent",
					"enabled": false,
					"animation": "Anim/Male01/Anim_Male01_AttackLaunch.fbx",
					"duration": 1000
				},
				{
					"type": "material",
					"name": "material",
					"props": {
						"PBR": {
							"mode": "BeforeTonemapping",
							"blend": "Alpha",
							"shadows": false,
							"culling": "Back",
							"colorMask": 255,
							"depthTest": "LessEqual",
							"parallax": 0,
							"alphaKill": false,
							"enableStencil": false,
							"emissive": 15,
							"depthWrite": "On"
						}
					},
					"children": [
						{
							"type": "shader",
							"name": "DissolveMap",
							"source": "shaders/DissolveMap.hx",
							"enabled": false,
							"props": {
								"useSourceUVs": true,
								"useScale": true,
								"wrap": true,
								"progress": 0.89,
								"saturation": 0,
								"width": 1,
								"uvScaleX": 0.5,
								"uvScaleY": 0.5,
								"texture": "Fx/Alphas/T_ElectricArc_1x4_03.png",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0.1,
									0.1
								],
								"uvScaleSpeed": [
									0,
									0
								]
							},
							"isInstance": true,
							"children": [
								{
									"type": "curve",
									"name": "width",
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.4924774870974948,
											"value": 1.0125000000000002,
											"mode": 2
										},
										{
											"time": 2.353017558846624,
											"value": 1,
											"mode": 2
										},
										{
											"time": 4.999584194603378,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "Fresnel",
							"source": "shaders/Fresnel.hx",
							"props": {
								"RGB": true,
								"ALPHA": true,
								"REVERSE": false,
								"bias": 0.29,
								"scale": 4,
								"power": 2,
								"color": [
									0.7098039215686275,
									0.7098039215686275,
									0.7098039215686275
								]
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "EnvColorMult",
							"source": "shaders/EnvColorMult.hx",
							"props": {
								"sandBlend": 0.3,
								"sandColorSet": false,
								"envBlend": 0.73,
								"envColorSet": false
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "Fresnel",
							"source": "shaders/Fresnel.hx",
							"props": {
								"RGB": false,
								"ALPHA": true,
								"REVERSE": false,
								"bias": 0.12,
								"scale": 5,
								"power": 1.23,
								"color": [
									1,
									1,
									1
								]
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "Level",
							"source": "shaders/Level.hx",
							"enabled": false,
							"props": {
								"levelMin": 0.27,
								"levelMax": 0.86
							},
							"isInstance": true
						}
					]
				}
			]
		}
	]
}