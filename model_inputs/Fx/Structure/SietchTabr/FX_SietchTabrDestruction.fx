{
	"type": "fx",
	"duration": 10,
	"cullingRadius": 100,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"scaleX": 100,
			"scaleY": 100,
			"scaleZ": 70,
			"rotationZ": 180,
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
							"mode": "PBR",
							"blend": "None",
							"shadows": true,
							"culling": "Back",
							"depthTest": "Less",
							"colorMask": 15,
							"enableStencil": false
						}
					},
					"diffuseMap": "Fx/Test/Map_Albedo_VFXTest.png"
				}
			]
		},
		{
			"type": "object",
			"name": "FXRoot",
			"z": -0.15,
			"children": [
				{
					"type": "model",
					"name": "SietchTabr_mesh",
					"source": "Structure/Base/SietchTabr/SietchTabr.fbx",
					"editorOnly": true,
					"x": 3.30123,
					"y": -7.89184,
					"scaleX": 248,
					"scaleY": 248,
					"scaleZ": 248,
					"rotationZ": 22.7
				},
				{
					"type": "object",
					"name": "SmallExplosions",
					"x": 2.36314,
					"y": -2.803138571428571,
					"z": 3.3610814285714286,
					"children": [
						{
							"type": "subFX",
							"name": "01 - FX_Directional_Explosion_High",
							"source": "Fx/Explosion/FX_Directional_Explosion_High02.fx",
							"x": -1.20157,
							"y": 1.49053,
							"z": -2.13657,
							"scaleX": 1.1,
							"scaleY": 1.1,
							"scaleZ": 1.1,
							"rotationX": 41.2,
							"rotationZ": 17.8
						},
						{
							"type": "subFX",
							"name": "01 - FX_Directional_Explosion_High",
							"source": "Fx/Explosion/FX_Directional_Explosion_High02.fx",
							"x": 0.27691,
							"y": -4.85954,
							"z": -3.77661,
							"rotationX": 67.8,
							"rotationZ": 17.8,
							"time": 0.025
						},
						{
							"type": "subFX",
							"name": "02 - FX_Directional_Explosion_Medium",
							"source": "Fx/Explosion/FX_Directional_Explosion_Medium.fx",
							"x": -17.90716,
							"y": 8.56234,
							"z": 5.19145,
							"scaleX": 0.9,
							"scaleY": 0.9,
							"scaleZ": 0.9,
							"rotationX": 6.6,
							"rotationY": -32.6,
							"time": 1.1
						},
						{
							"type": "subFX",
							"name": "06 - FX_Directional_Explosion_High",
							"source": "Fx/Explosion/FX_Directional_Explosion_High02.fx",
							"x": 20.58243,
							"y": 10.68812,
							"z": -0.63461,
							"scaleX": 0.7,
							"scaleY": 0.7,
							"scaleZ": 0.7,
							"rotationY": 55.8,
							"rotationZ": 29.9,
							"time": 1.33757
						},
						{
							"type": "subFX",
							"name": "07 - FX_Explosion_Mid_Slow_SmallDistort",
							"source": "Fx/Explosion/BasesExplosions/FX_Explosion_Mid_Slow_NoFlare_Base.fx",
							"x": 0.67676,
							"y": -5.96009,
							"z": -3.62962,
							"scaleX": 1.2,
							"scaleY": 1.2,
							"scaleZ": 1.2,
							"rotationZ": -180,
							"time": 0.10412
						},
						{
							"type": "subFX",
							"name": "09 - FX_Directional_Explosion_trails",
							"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base.fx",
							"x": 14.58858,
							"y": -2.90183,
							"z": -2.24389,
							"scaleX": 1.15,
							"scaleY": 1.15,
							"scaleZ": 1.15,
							"rotationX": 21.4,
							"rotationY": 31.9,
							"rotationZ": 22.8,
							"time": 1.555
						},
						{
							"type": "subFX",
							"name": "10 - FX_Directional_Explosion_trails",
							"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base.fx",
							"x": -27.05404,
							"y": 2.25584,
							"z": -1.06172,
							"scaleX": 1.5,
							"scaleY": 1.5,
							"scaleZ": 1.5,
							"rotationX": 24,
							"rotationY": -29,
							"rotationZ": -21.6,
							"time": 1.55375
						},
						{
							"type": "shader",
							"name": "NightEmissive",
							"source": "shaders/NightEmissive.hx",
							"props": {
								"amount": 0.75,
								"ATTENUATE": true,
								"emissiveMap": null
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "object",
					"name": "BigExplosions",
					"children": [
						{
							"type": "subFX",
							"name": "01 - FX_SietchTabr_Anticipation",
							"source": "Fx/Structure/SietchTabr/FX_SietchTabr_Anticipation02.fx",
							"scaleX": 0.9999999999999998,
							"scaleY": 0.9999999999999998,
							"time": 0.68,
							"children": [
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.7
									}
								}
							]
						},
						{
							"type": "subFX",
							"name": "FX_ScreenShake",
							"source": "Fx/Explosion/FX_ScreenShake.fx",
							"z": -2.70449,
							"rotationZ": 80,
							"time": 2.605
						},
						{
							"type": "subFX",
							"name": "02 - FX_SietchTabr_Anticipation",
							"source": "Fx/Structure/SietchTabr/FX_SietchTabr_Anticipation.fx",
							"z": 0.37388,
							"scaleX": 0.9999999999999998,
							"scaleY": 0.9999999999999998,
							"time": 2.96491,
							"children": [
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 1.15
									}
								}
							]
						},
						{
							"type": "subFX",
							"name": "AnticipationUnderground",
							"source": "Fx/Explosion/AnticipationUnderground.fx",
							"z": -2,
							"scaleX": 3.5,
							"scaleY": 3.5,
							"scaleZ": 3.5,
							"time": 3.05297,
							"children": [
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 5,
										"power": 0.8
									}
								}
							]
						},
						{
							"type": "subFX",
							"name": "FX_Explosion_High_Cinematic_SietchTabr",
							"source": "Fx/Explosion/FX_Explosion_High_Cinematic_SietchTabr.fx",
							"x": -3.3648,
							"y": -6.81768,
							"scaleX": 1.1,
							"scaleY": 1.1,
							"scaleZ": 1.1,
							"rotationZ": -180,
							"time": 2.115
						},
						{
							"type": "subFX",
							"name": "09 - FX_Directional_Explosion_trails",
							"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base_NoFlare.fx",
							"x": 15.54373,
							"y": -2.90183,
							"z": 1.71286,
							"scaleX": 1.15,
							"scaleY": 1.1500000000000001,
							"scaleZ": 1.15,
							"rotationX": 21.9,
							"rotationY": 33.1,
							"rotationZ": 23.1,
							"time": 2.65
						},
						{
							"type": "subFX",
							"name": "10 - FX_Directional_Explosion_trails",
							"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base_NoFlare.fx",
							"x": -21.54566,
							"y": 1.69997,
							"z": 0.06144,
							"scaleX": 1.5,
							"scaleY": 1.5,
							"scaleZ": 1.8,
							"rotationX": 32.2,
							"rotationY": -42.1,
							"rotationZ": -37.1,
							"time": 2.65
						},
						{
							"type": "subFX",
							"name": "10 - FX_Directional_Explosion_trails",
							"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base_NoFlare.fx",
							"x": 6.6911,
							"y": 9.37202,
							"z": 6.48841,
							"scaleX": 1.5,
							"scaleY": 1.5,
							"scaleZ": 1.8,
							"rotationX": -6.6,
							"rotationY": 22.2,
							"rotationZ": -28.9,
							"time": 2.65
						},
						{
							"type": "subFX",
							"name": "01 - FX_Explosion_Mid_Slow_SmallDistort",
							"source": "Fx/Explosion/BasesExplosions/FX_Explosion_Mid_Slow_NoFlare_Base.fx",
							"x": 22.64238,
							"y": -1.53368,
							"z": -2.89304,
							"scaleX": 1.2,
							"scaleY": 1.2,
							"scaleZ": 1.2,
							"rotationZ": -180,
							"time": 1.87017
						},
						{
							"type": "subFX",
							"name": "02 - FX_Explosion_Mid_Slow_SmallDistort",
							"source": "Fx/Explosion/BasesExplosions/FX_Explosion_Mid_Slow_NoFlare_Base.fx",
							"x": -12.24483,
							"y": -15.12715,
							"z": -2.12069,
							"scaleX": 0.7,
							"scaleY": 0.7,
							"scaleZ": 0.7,
							"rotationZ": -180,
							"time": 2.04122
						},
						{
							"type": "subFX",
							"name": "03 - FX_Explosion_Mid_Slow_SmallDistort",
							"source": "Fx/Explosion/BasesExplosions/FX_Explosion_Mid_Slow_NoFlare_Base.fx",
							"x": -14.49485,
							"y": 7.86319,
							"z": 6.01098,
							"scaleX": 1.1,
							"scaleY": 1.1,
							"scaleZ": 1.1,
							"rotationZ": -180,
							"time": 1.44824
						},
						{
							"type": "subFX",
							"name": "Final - FX_Directional_Explosion_High",
							"source": "Fx/Explosion/FX_Directional_Explosion_High.fx",
							"x": 2.30107,
							"y": -7.59754,
							"z": 6.28409,
							"scaleX": 1.5,
							"scaleY": 1.5,
							"scaleZ": 1.5,
							"rotationX": 41.2,
							"rotationZ": 17.8,
							"time": 2.55394
						},
						{
							"type": "subFX",
							"name": "Final - FX_Directional_Explosion_High",
							"source": "Fx/Explosion/FX_Directional_Explosion_High.fx",
							"x": 4.06661,
							"y": -12.04785,
							"z": 1.76285,
							"scaleX": 1.75,
							"scaleY": 1.75,
							"scaleZ": 1.75,
							"rotationX": 67.2,
							"rotationZ": 17.8,
							"time": 2.55394
						},
						{
							"type": "shader",
							"name": "NightEmissive",
							"source": "shaders/NightEmissive.hx",
							"props": {
								"amount": 0.75,
								"ATTENUATE": true,
								"emissiveMap": null
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "object",
					"name": "LightDecals",
					"children": [
						{
							"type": "advancedDecal",
							"name": "HighExplosionAnticipation",
							"x": 2.95844,
							"y": -6.69545,
							"scaleX": 35,
							"scaleY": 35,
							"scaleZ": 40,
							"rotationX": 41.5,
							"rotationZ": 12.3,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"albedoStrength": 3,
							"emissive": 45,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "AfterTonemapping",
											"blend": "Add",
											"shadows": false,
											"culling": "Back",
											"colorMask": 255,
											"emissive": 70
										}
									}
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.5
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 0.695389728546143,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 0.7053897285461428,
													"value": 2,
													"mode": 2
												},
												{
													"time": 3.008681893348697,
													"value": 0,
													"mode": 2
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
											0.8745098039215686,
											0.3803921568627451,
											0.22745098039215686
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.45,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 3.25,
										"texture": "Fx/noise/T_Fire.png",
										"uvShift": [
											0,
											-0.2
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
									"isInstance": true
								},
								{
									"type": "curve",
									"name": "visibility",
									"keys": [
										{
											"time": 0.6272815670818104,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.6372815670818102,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.0724218750000007,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.0824218750000005,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "HighExplosion",
							"enabled": false,
							"scaleX": 70,
							"scaleY": 70,
							"scaleZ": 40,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"albedoStrength": 3,
							"emissive": 40,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "AfterTonemapping",
											"blend": "Add",
											"shadows": false,
											"culling": "Back",
											"colorMask": 255,
											"emissive": 70
										}
									}
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.25
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 3.0340234374999993,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 3.044023437499999,
													"value": 1,
													"mode": 2
												},
												{
													"time": 6.590949404239656,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.03361111111111109,
														"dt": -1.949996230602265
													},
													"nextHandle": {
														"dv": 0.0057926397589892495,
														"dt": 0.3333135451062032
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
											0.8745098039215686,
											0.3803921568627451,
											0.22745098039215686
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.45,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 3.25,
										"texture": "Fx/noise/T_Fire.png",
										"uvShift": [
											0,
											-0.2
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
									"isInstance": true
								},
								{
									"type": "curve",
									"name": "visibility",
									"keys": [
										{
											"time": 2.961924621090293,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.971924621090293,
											"value": 1,
											"mode": 2
										},
										{
											"time": 6.657220927700403,
											"value": 1,
											"mode": 2
										},
										{
											"time": 6.677493792995814,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Explo01",
							"x": -14.91494,
							"y": 6.06757,
							"z": 8.32916,
							"scaleX": 15,
							"scaleY": 15,
							"scaleZ": 15,
							"rotationX": 1.1,
							"rotationY": -12.7,
							"rotationZ": 11.7,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"albedoStrength": 3,
							"emissive": 40,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "AfterTonemapping",
											"blend": "Add",
											"shadows": false,
											"culling": "Back",
											"colorMask": 255,
											"emissive": 70
										}
									}
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 1
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 1.8335737985705334,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.8435737985705332,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.699987792968751,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.03361111111111109,
														"dt": -1.949996230602265
													},
													"nextHandle": {
														"dv": 0.0057926397589892495,
														"dt": 0.3333135451062032
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
											0.8745098039215686,
											0.3803921568627451,
											0.22745098039215686
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.45,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 3.25,
										"texture": "Fx/noise/T_Fire.png",
										"uvShift": [
											0,
											-0.2
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
									"isInstance": true
								},
								{
									"type": "curve",
									"name": "visibility",
									"keys": [
										{
											"time": 1.7414912524074317,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.751491252407432,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.784507285580039,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.801382285580039,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Explo02",
							"x": -25.06639,
							"y": -0.67857,
							"z": 2.12237,
							"scaleX": 15,
							"scaleY": 15,
							"scaleZ": 15,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"albedoStrength": 3,
							"emissive": 40,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "AfterTonemapping",
											"blend": "Add",
											"shadows": false,
											"culling": "Back",
											"colorMask": 255,
											"emissive": 70
										}
									}
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 1
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 1.835951805642826,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.8459518056428257,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.702365800041043,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.03361111111111109,
														"dt": -1.949996230602265
													},
													"nextHandle": {
														"dv": 0.0057926397589892495,
														"dt": 0.3333135451062032
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
											0.8745098039215686,
											0.3803921568627451,
											0.22745098039215686
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.45,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 3.25,
										"texture": "Fx/noise/T_Fire.png",
										"uvShift": [
											0,
											-0.2
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
									"isInstance": true
								},
								{
									"type": "curve",
									"name": "visibility",
									"keys": [
										{
											"time": 1.74257384441793,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.7525738444179302,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.7798603739589467,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.7898603739589465,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Explo03",
							"x": 19.45219,
							"y": -6.62946,
							"z": 2.12237,
							"scaleX": 18,
							"scaleY": 18,
							"scaleZ": 15,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"albedoStrength": 3,
							"emissive": 40,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "AfterTonemapping",
											"blend": "Add",
											"shadows": false,
											"culling": "Back",
											"colorMask": 255,
											"emissive": 70
										}
									}
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 1
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": 1.829545368099959,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.8395453680999587,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.00028288673253867614,
														"dt": -0.0033279044480798515
													},
													"nextHandle": {
														"dv": -0.042361111111111294,
														"dt": 0.4986479912750421
													}
												},
												{
													"time": 3.057392578125004,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.016666666666666552,
														"dt": -1.1107519531250034
													},
													"nextHandle": {
														"dv": 0.006356705433136639,
														"dt": 0.3333088994929532
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
											0.8745098039215686,
											0.3803921568627451,
											0.22745098039215686
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.45,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 3.25,
										"texture": "Fx/noise/T_Fire.png",
										"uvShift": [
											0,
											-0.2
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
									"isInstance": true
								},
								{
									"type": "curve",
									"name": "visibility",
									"keys": [
										{
											"time": 1.7160895457118757,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.7260895457118757,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.277739783748986,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.287739783748986,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Explo04",
							"x": 23.0165,
							"y": 9.18624,
							"z": 2.12237,
							"scaleX": 15,
							"scaleY": 15,
							"scaleZ": 15,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"albedoStrength": 3,
							"emissive": 40,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "AfterTonemapping",
											"blend": "Add",
											"shadows": false,
											"culling": "Back",
											"colorMask": 255,
											"emissive": 70
										}
									}
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 1
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 1.8231879462249596,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.8331879462249594,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.3215625000000037,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.016666666666666663,
														"dt": -0.9326074218750007
													},
													"nextHandle": {
														"dv": 0.006055923122821887,
														"dt": 0.33331271905465326
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
											0.8745098039215686,
											0.3803921568627451,
											0.22745098039215686
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.45,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 3.25,
										"texture": "Fx/noise/T_Fire.png",
										"uvShift": [
											0,
											-0.2
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
									"isInstance": true
								},
								{
									"type": "curve",
									"name": "visibility",
									"keys": [
										{
											"time": 1.7300049891322866,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.7400049891322866,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.412652808651331,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.4226528086513306,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Explo05",
							"enabled": false,
							"x": -25.68932,
							"y": 2.28287,
							"z": 2.12237,
							"scaleX": 20,
							"scaleY": 20,
							"scaleZ": 25,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"albedoStrength": 3,
							"emissive": 40,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "AfterTonemapping",
											"blend": "Add",
											"shadows": false,
											"culling": "Back",
											"colorMask": 255,
											"emissive": 70
										}
									}
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 2
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 2.929730914974958,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 2.939730914974958,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.9511230468750025,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.0002777777777778212,
														"dt": -0.4271484375000001
													},
													"nextHandle": {
														"dv": -1.9431447321434067e-16,
														"dt": 0.33332243025631764
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
											0.8745098039215686,
											0.3803921568627451,
											0.22745098039215686
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.45,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 3.25,
										"texture": "Fx/noise/T_Fire.png",
										"uvShift": [
											0,
											-0.2
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
									"isInstance": true
								},
								{
									"type": "curve",
									"name": "visibility",
									"keys": [
										{
											"time": 2.839801627621055,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.8498016276210554,
											"value": 1,
											"mode": 2
										},
										{
											"time": 4.03576424740255,
											"value": 1,
											"mode": 2
										},
										{
											"time": 4.04576424740255,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Explo06",
							"enabled": false,
							"x": 17.01001,
							"y": -3.57503,
							"z": 2.12237,
							"scaleX": 15,
							"scaleY": 15,
							"scaleZ": 15,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"albedoStrength": 3,
							"emissive": 40,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "AfterTonemapping",
											"blend": "Add",
											"shadows": false,
											"culling": "Back",
											"colorMask": 255,
											"emissive": 70
										}
									}
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 2
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 2.936850055599958,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 2.946850055599958,
													"value": 1,
													"mode": 2
												},
												{
													"time": 4.1219824218750025,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.0002777777777778212,
														"dt": -0.4271484375000001
													},
													"nextHandle": {
														"dv": -1.9431447321434067e-16,
														"dt": 0.33332243025631764
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
											0.8745098039215686,
											0.3803921568627451,
											0.22745098039215686
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.45,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 3.25,
										"texture": "Fx/noise/T_Fire.png",
										"uvShift": [
											0,
											-0.2
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
									"isInstance": true
								},
								{
									"type": "curve",
									"name": "visibility",
									"keys": [
										{
											"time": 2.8377715601772078,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.8477715601772076,
											"value": 1,
											"mode": 2
										},
										{
											"time": 4.1959171023219834,
											"value": 1,
											"mode": 2
										},
										{
											"time": 4.205917102321983,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Explo07",
							"enabled": false,
							"x": 21.11964,
							"y": -0.8932,
							"z": 1.14834,
							"scaleX": 25,
							"scaleY": 25,
							"scaleZ": 30,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"albedoStrength": 3,
							"emissive": 40,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "AfterTonemapping",
											"blend": "Add",
											"shadows": false,
											"culling": "Back",
											"colorMask": 255,
											"emissive": 70
										}
									}
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 2
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 3.342166057700263,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 3.3521660577002628,
													"value": 1,
													"mode": 2
												},
												{
													"time": 5.007061760156948,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.01722222222222225,
														"dt": -0.7208129882812511
													},
													"nextHandle": {
														"dv": -0.007834934023029533,
														"dt": 0.3332963924927146
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
											0.8745098039215686,
											0.3803921568627451,
											0.22745098039215686
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.45,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 3.25,
										"texture": "Fx/noise/T_Fire.png",
										"uvShift": [
											0,
											-0.2
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
									"isInstance": true
								},
								{
									"type": "curve",
									"name": "visibility",
									"keys": [
										{
											"time": 3.246911319449141,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.2569113194491406,
											"value": 1,
											"mode": 2
										},
										{
											"time": 5.091742061331466,
											"value": 1,
											"mode": 2
										},
										{
											"time": 5.101742061331466,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "HighExplosion",
							"enabled": false,
							"children": [
								{
									"type": "advancedDecal",
									"name": "Explo07",
									"x": 10.04878,
									"y": -5.56732,
									"scaleX": 20,
									"scaleY": 20,
									"scaleZ": 15,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"albedoStrength": 3,
									"emissive": 40,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "AfterTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 70
												}
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 2
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 3.045211857701097,
															"value": -0.01666666666666672,
															"mode": 0
														},
														{
															"time": 3.0552118577010967,
															"value": 1,
															"mode": 2
														},
														{
															"time": 4.710107560157782,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.01722222222222225,
																"dt": -0.7208129882812511
															},
															"nextHandle": {
																"dv": -0.007834934023029533,
																"dt": 0.3332963924927146
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
													0.8745098039215686,
													0.3803921568627451,
													0.22745098039215686
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.45,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 3.25,
												"texture": "Fx/noise/T_Fire.png",
												"uvShift": [
													0,
													-0.2
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
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "visibility",
											"keys": [
												{
													"time": 2.906740848049523,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.916740848049523,
													"value": 1,
													"mode": 2
												},
												{
													"time": 4.781980887874963,
													"value": 1,
													"mode": 2
												},
												{
													"time": 4.791980887874963,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "tower1",
									"x": -3.25986,
									"y": 0.6673,
									"z": 4.52195,
									"scaleX": 12,
									"scaleY": 12,
									"scaleZ": 20,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"albedoStrength": 3,
									"emissive": 40,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "AfterTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 70
												}
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 2
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 3.045211857701097,
															"value": -0.01666666666666672,
															"mode": 0
														},
														{
															"time": 3.0552118577010967,
															"value": 1,
															"mode": 2
														},
														{
															"time": 4.710107560157782,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.01722222222222225,
																"dt": -0.7208129882812511
															},
															"nextHandle": {
																"dv": -0.007834934023029533,
																"dt": 0.3332963924927146
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
													0.8745098039215686,
													0.3803921568627451,
													0.22745098039215686
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.45,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 3.25,
												"texture": "Fx/noise/T_Fire.png",
												"uvShift": [
													0,
													-0.2
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
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "visibility",
											"keys": [
												{
													"time": 2.9575594439357538,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.9675594439357535,
													"value": 1,
													"mode": 2
												},
												{
													"time": 4.792117320522668,
													"value": 1,
													"mode": 2
												},
												{
													"time": 4.802117320522668,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "tower2",
									"x": 3.31567,
									"y": 1.39794,
									"z": 4.52195,
									"scaleX": 18,
									"scaleY": 18,
									"scaleZ": 20,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"albedoStrength": 3,
									"emissive": 40,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "AfterTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 70
												}
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 2
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 3.045211857701097,
															"value": -0.01666666666666672,
															"mode": 0
														},
														{
															"time": 3.0552118577010967,
															"value": 1,
															"mode": 2
														},
														{
															"time": 4.710107560157782,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.01722222222222225,
																"dt": -0.7208129882812511
															},
															"nextHandle": {
																"dv": -0.007834934023029533,
																"dt": 0.3332963924927146
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
													0.8745098039215686,
													0.3803921568627451,
													0.22745098039215686
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.45,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 3.25,
												"texture": "Fx/noise/T_Fire.png",
												"uvShift": [
													0,
													-0.2
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
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "visibility",
											"keys": [
												{
													"time": 2.9575594439357538,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.9675594439357535,
													"value": 1,
													"mode": 2
												},
												{
													"time": 4.792117320522668,
													"value": 1,
													"mode": 2
												},
												{
													"time": 4.802117320522668,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "curve",
					"name": "shake",
					"keyMode": 1,
					"keys": [
						{
							"time": 3.0591311291317886,
							"value": 0,
							"mode": 2
						},
						{
							"time": 3.069131129131789,
							"value": 0.35,
							"mode": 1,
							"prevHandle": {
								"dv": 0,
								"dt": -0.0033333333333334103
							},
							"nextHandle": {
								"dv": -0.2962962962962964,
								"dt": 0.2556187793154785
							}
						},
						{
							"time": 7.512198838059561,
							"value": 0,
							"mode": 0,
							"prevHandle": {
								"dv": 0.0018518518518517435,
								"dt": -3.073885765075682
							},
							"nextHandle": {
								"dv": -5.6766063595290996e-18,
								"dt": 0.06343031018886429
							}
						}
					]
				},
				{
					"type": "object",
					"name": "DECALTESTS",
					"editorOnly": true,
					"children": [
						{
							"type": "object",
							"name": "Decals",
							"x": -3.19061,
							"y": -20.41448,
							"scaleX": 8,
							"scaleY": 8,
							"scaleZ": 8,
							"children": [
								{
									"type": "advancedDecal",
									"name": "Decal_Large",
									"x": -0.4037,
									"y": -0.23906,
									"scaleX": 6,
									"scaleY": 7,
									"scaleZ": 4,
									"rotationZ": 145.9,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
									"albedoStrength": 0.75,
									"children": [
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.67,
												"saturation": 1,
												"width": 0.24,
												"uvScaleX": 0.5,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Water_04.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0
												]
											}
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "Decal_tour",
									"x": -1.33841,
									"y": 1.21185,
									"z": 0.75656,
									"scaleX": 5,
									"scaleY": 5,
									"scaleZ": 4,
									"rotationZ": 145.9,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
									"albedoStrength": 0.9
								}
							]
						},
						{
							"type": "object",
							"name": "Decals",
							"x": 15.57871,
							"y": -1.34593,
							"z": 1.90713,
							"scaleX": 8,
							"scaleY": 8,
							"scaleZ": 8,
							"rotationZ": 61.4,
							"children": [
								{
									"type": "advancedDecal",
									"name": "Decal_Large",
									"x": -0.459,
									"y": -0.53796,
									"z": -0.19,
									"scaleX": 7,
									"scaleY": 7,
									"scaleZ": 3,
									"rotationX": 4.2,
									"rotationY": 0.1,
									"rotationZ": 26.8,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
									"children": [
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.67,
												"saturation": 1,
												"width": 0.24,
												"uvScaleX": 0.5,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Water_04.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0
												]
											}
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal",
									"x": 0.84897,
									"y": 0.62884,
									"z": -0.01388,
									"scaleX": 5.5,
									"scaleY": 5.5,
									"scaleZ": 3,
									"rotationZ": 55.5,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_01_Albedo.png",
									"albedoStrength": 0.9,
									"children": [
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.67,
												"saturation": 1,
												"width": 0.15,
												"uvScaleX": 0.5,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Water_04.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0
												]
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Decals",
							"x": 1.60802,
							"y": -5.62208,
							"z": 2.34955,
							"scaleX": 8.2,
							"scaleY": 8.2,
							"scaleZ": 8.2,
							"rotationZ": 150.8,
							"children": [
								{
									"type": "advancedDecal",
									"name": "Decal_Large",
									"enabled": false,
									"x": -0.08679,
									"y": 0.07935,
									"z": -0.3,
									"scaleX": 5,
									"scaleY": 5,
									"scaleZ": 3,
									"rotationZ": 26.8,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
									"albedoStrength": 0.9
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal",
									"x": -0.0454,
									"y": -0.23648,
									"z": 1.12057,
									"scaleX": 3.5,
									"scaleY": 3.5,
									"scaleZ": 1.56,
									"rotationX": -22.1,
									"rotationY": 4.8,
									"rotationZ": 46.8,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_01_Albedo.png",
									"albedoStrength": 0.75
								}
							]
						}
					]
				}
			]
		}
	]
}