{
	"type": "fx",
	"markers": [
		{
			"t": 0
		}
	],
	"cullingRadius": 99999,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "subFX",
					"name": "FX_MissileLauncher_Impact",
					"source": "Fx/Unit/FX_MissileLauncher_Impact.fx",
					"enabled": false,
					"y": -24.87915
				},
				{
					"type": "event",
					"name": "Dmg",
					"time": 2.855
				},
				{
					"type": "object",
					"name": "group",
					"scaleX": 0.15,
					"scaleY": 0.15,
					"scaleZ": 0.15,
					"children": [
						{
							"type": "subFX",
							"name": "FX_Nuke_Missile",
							"source": "Fx/Nuke/FX_Nuke_Missile.fx",
							"enabled": false,
							"x": -21.39627,
							"y": 5.16701
						},
						{
							"type": "subFX",
							"name": "FX_Nuke_Anticipation_2",
							"source": "Fx/Nuke/FX_SmallNuke_Anticipation_2.fx",
							"enabled": false,
							"x": -2.42915,
							"y": -0.59358
						},
						{
							"type": "subFX",
							"name": "FX_SmallNuke_LongFlash",
							"source": "Fx/Nuke/FX_SmallNuke_LongFlash.fx",
							"scaleX": 0.25,
							"scaleY": 0.25,
							"scaleZ": 0.25,
							"children": [
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.25
									}
								}
							]
						},
						{
							"type": "subFX",
							"name": "FX_SmallNuke_Mushroom",
							"source": "Fx/Nuke/FX_SmallNuke_Mushroom.fx",
							"time": 0.86291
						},
						{
							"type": "subFX",
							"name": "FX_Nuke_DecalGround",
							"source": "Fx/Nuke/FX_Nuke_DecalGround.fx",
							"enabled": false,
							"time": 2.00789
						}
					]
				},
				{
					"type": "emitter",
					"name": "SandResiduel",
					"enabled": false,
					"props": {
						"lifeTime": 2,
						"lifeTimeRand": 0.25,
						"speedFactor": 0.8,
						"warmUpTime": -1.1,
						"emitType": "Burst",
						"burstParticleCount": 3,
						"emitShape": "Cone",
						"emitAngle": 19.09,
						"emitSurface": true,
						"alignMode": "Screen",
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"animationSpeed": 0,
						"instScale": 24,
						"instSpeed": [
							65,
							0,
							0
						],
						"spriteSheet": "Fx/Alphas/T_Smoke_4x4_04.png",
						"instRotation_rand": [
							0,
							0,
							360
						],
						"instScale_rand": 5,
						"instSpeed_rand": [
							5,
							0,
							0
						],
						"instWorldSpeed": [
							0,
							0,
							-4
						],
						"instWorldSpeed_rand": [
							0,
							0,
							-1
						],
						"randomColor1": [
							0.8117647058823529,
							0.8117647058823529,
							0.8117647058823529,
							1
						]
					},
					"z": 3.92,
					"rotationY": -90,
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
							"kind": 0,
							"args": [
								0
							],
							"children": [
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
											"textureWrap": true
										}
									},
									"wrapRepeat": true
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 1.2
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": false,
										"wrap": true,
										"progress": 0.5,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/T_Noise_Grunge_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
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
											"name": "progress",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.7,
													"mode": 2
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.0032931736537387124,
														"dt": -0.39546998527483657
													},
													"nextHandle": {
														"dv": -0.0032931736537387124,
														"dt": 0.39546998527483657
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.9764705882352941,
											0.9607843137254902,
											0.9490196078431372
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.6,
										"sandColorSet": false,
										"envBlend": 0.5,
										"envColorSet": false
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "curve",
							"name": "instSpeed.x",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": 2.9173338952643375,
										"dt": -0.34612783862841096
									},
									"nextHandle": {
										"dv": -1.1533247604966166,
										"dt": 0.1375675736137951
									}
								},
								{
									"time": 0.9903769144228197,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0.012976087629794963,
										"dt": -0.6555012670999958
									},
									"nextHandle": {
										"dv": -0.012976087629794963,
										"dt": 0.6555012670999958
									}
								}
							]
						},
						{
							"type": "curve",
							"name": "InstWorldSpeed.z",
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 2
								},
								{
									"time": 1,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": -1.140345982142858,
										"dt": -0.13896948945309906
									},
									"nextHandle": {
										"dv": 0.7341459191045832,
										"dt": 0.08913588385340426
									}
								}
							]
						},
						{
							"type": "curve",
							"name": "instScale",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0.012707392165911546,
									"mode": 0,
									"prevHandle": {
										"dv": -1.562544836391683,
										"dt": -0.057312053992565525
									},
									"nextHandle": {
										"dv": 0.8951335055594681,
										"dt": 0.03233660096897972
									}
								},
								{
									"time": 1,
									"value": 1.01469963255798,
									"mode": 0,
									"prevHandle": {
										"dv": -0.024099204996862578,
										"dt": -0.9873942064019231
									},
									"nextHandle": {
										"dv": 0.0055778337215589505,
										"dt": 0.265963721460112
									}
								}
							]
						}
					]
				}
			]
		}
	]
}