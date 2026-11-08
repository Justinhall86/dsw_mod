{
	"type": "fx",
	"duration": 15,
	"cullingRadius": 3,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"z": 0.08361,
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
			"rotationZ": 180,
			"children": [
				{
					"type": "model",
					"name": "BaseArrakeen_mesh",
					"source": "Structure/Base/Arrakeen/BaseArrakeen.fbx",
					"editorOnly": true,
					"z": -0.5,
					"scaleX": 0.9999999999999998,
					"scaleY": 0.9999999999999998,
					"rotationZ": -155.00000000000003
				},
				{
					"type": "object",
					"name": "TESTDECALS",
					"editorOnly": true,
					"x": 0.1623800000000005,
					"y": 1.0936233333333334,
					"z": 1.4188933333333331,
					"children": [
						{
							"type": "object",
							"name": "Decals",
							"x": 10.56353,
							"y": -4.366463333333334,
							"z": 0.4882366666666669,
							"scaleX": 8,
							"scaleY": 8,
							"scaleZ": 8,
							"rotationZ": 61.39999999999999,
							"children": [
								{
									"type": "advancedDecal",
									"name": "Decal_Large",
									"x": -0.0573,
									"y": -0.2022,
									"z": -0.19,
									"scaleX": 5,
									"scaleY": 5,
									"scaleZ": 2.5,
									"rotationZ": 26.8,
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
									"name": "advancedDecal",
									"x": 0.04591,
									"y": 0.07799,
									"z": -0.19293,
									"scaleX": 4.619999999999998,
									"scaleY": 4.619999999999998,
									"scaleZ": 2.419999999999999,
									"rotationZ": 55.5,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_01_Albedo.png",
									"albedoStrength": 0.95,
									"children": [
										{
											"type": "curve",
											"name": "color.a",
											"keys": [
												{
													"time": 1.4899999999999984,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.695,
													"value": 1,
													"mode": 2
												}
											]
										},
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
							"locked": true,
							"x": -9.28151,
							"y": -8.240763333333334,
							"z": -1.4188933333333331,
							"scaleX": 8,
							"scaleY": 8,
							"scaleZ": 8,
							"children": [
								{
									"type": "advancedDecal",
									"name": "Decal_Large",
									"x": -0.02318,
									"y": 0.11077,
									"scaleX": 6,
									"scaleY": 7,
									"scaleZ": 4,
									"rotationZ": 145.9,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
									"albedoStrength": 1.1,
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
									"x": 1.05635,
									"y": 1.04769,
									"z": 0.75656,
									"scaleX": 2,
									"scaleY": 2,
									"scaleZ": 4,
									"rotationZ": 145.9,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
									"albedoStrength": 1.1
								}
							]
						},
						{
							"type": "object",
							"name": "Decals",
							"x": -1.2820200000000004,
							"y": 12.607226666666667,
							"z": 0.9306566666666667,
							"scaleX": 8.200000000000001,
							"scaleY": 8.200000000000001,
							"scaleZ": 8.2,
							"rotationZ": 150.8,
							"children": [
								{
									"type": "advancedDecal",
									"name": "Decal_Large",
									"x": 0.33745,
									"y": -0.36061,
									"z": -0.3,
									"scaleX": 5,
									"scaleY": 5,
									"scaleZ": 1.73,
									"rotationZ": 26.8,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
									"albedoStrength": 1.2
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal",
									"x": -0.1923,
									"y": 0.28425,
									"z": -0.3,
									"scaleX": 3,
									"scaleY": 3,
									"scaleZ": 1.56,
									"rotationZ": 23.9,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_01_Albedo.png",
									"albedoStrength": 0.75
								}
							]
						}
					]
				},
				{
					"type": "subFX",
					"name": "FX_SandShockwave",
					"source": "Fx/Explosion/BasesExplosions/FX_SandShockwave.fx",
					"scaleX": 0.9,
					"scaleY": 0.9,
					"scaleZ": 0.9,
					"rotationZ": -180,
					"time": 2.41023
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
							"source": "Fx/Explosion/FX_Directional_Explosion_High.fx",
							"x": -3.30172,
							"y": -1.20843,
							"z": 4.25846,
							"scaleX": 1.5,
							"scaleY": 1.5000000000000009,
							"scaleZ": 1.5000000000000009,
							"rotationX": 90,
							"rotationZ": -86.4
						},
						{
							"type": "subFX",
							"name": "02 - FX_Directional_Explosion_Medium",
							"source": "Fx/Explosion/FX_Directional_Explosion_Medium.fx",
							"x": -10.47619,
							"y": 15.78987,
							"z": -0.03298,
							"scaleX": 0.9,
							"scaleY": 0.9,
							"scaleZ": 0.9,
							"rotationX": -30,
							"time": 0.39244
						},
						{
							"type": "subFX",
							"name": "03 - FX_Directional_Explosion_High",
							"source": "Fx/Explosion/FX_Directional_Explosion_High.fx",
							"x": 8.86482,
							"y": -5.65221,
							"z": -2.14873,
							"scaleX": 1.3,
							"scaleY": 1.3,
							"scaleZ": 1.3,
							"rotationX": 15,
							"time": 1.06726
						},
						{
							"type": "subFX",
							"name": "06 - FX_Directional_Explosion_High",
							"source": "Fx/Explosion/FX_Directional_Explosion_High.fx",
							"x": 4.67634,
							"y": 6.332458571428571,
							"z": -2.2076114285714286,
							"scaleX": 1.3,
							"scaleY": 1.3,
							"scaleZ": 1.3,
							"rotationX": -29.89999999999999,
							"rotationY": 89.99999999999999,
							"time": 1.23507
						},
						{
							"type": "subFX",
							"name": "07 - FX_Explosion_Mid_Slow_SmallDistort",
							"source": "Fx/Explosion/BasesExplosions/FX_Explosion_Mid_Slow_SmallDistort_Base.fx",
							"x": -13.72442,
							"y": 8.52668,
							"z": -4.5,
							"rotationZ": -180,
							"time": 0.10412
						},
						{
							"type": "subFX",
							"name": "08 - FX_Directional_Explosion_trails",
							"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base.fx",
							"x": -13.95049,
							"y": -9.32114,
							"z": -2.12806,
							"scaleY": 0.9999999999999999,
							"rotationX": -7.2,
							"rotationY": 55.4,
							"rotationZ": -162.7,
							"time": 1.36
						},
						{
							"type": "subFX",
							"name": "09 - FX_Directional_Explosion_trails",
							"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base.fx",
							"x": 0.6050300000000002,
							"y": 1.611788571428571,
							"z": 1.6630285714285717,
							"scaleX": 1.5,
							"scaleY": 1.5000000000000002,
							"scaleZ": 1.5,
							"rotationX": 55.4,
							"rotationZ": 154.8,
							"time": 1.36
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
							"name": "FX_StarFlare",
							"source": "Fx/Explosion/BasesExplosions/FX_StarFlare_Base.fx",
							"enabled": false,
							"z": 3.81966,
							"scaleX": 1.2,
							"scaleY": 1.2,
							"scaleZ": 1.2,
							"time": 1.74009
						},
						{
							"type": "subFX",
							"name": "FX_ScreenShake02",
							"source": "Fx/Explosion/FX_ScreenShake02.fx",
							"rotationZ": -180,
							"time": 2.63142,
							"children": [
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
							"type": "subFX",
							"name": "FX_ScreenShake",
							"source": "Fx/Explosion/FX_ScreenShake.fx",
							"enabled": false,
							"rotationZ": -180,
							"time": 2.55024
						},
						{
							"type": "subFX",
							"name": "FX_Explosion_High_Cinematic",
							"source": "Fx/Explosion/BasesExplosions/FX_Explosion_High_Cinematic_Base.fx",
							"x": 0.05985,
							"y": 0.06748,
							"z": 0.41325,
							"rotationZ": 24.7,
							"time": 1.84483
						},
						{
							"type": "object",
							"name": "ExploTrailsHigh",
							"x": -1.0405300000000002,
							"y": -0.13061999999999999,
							"z": 5,
							"rotationZ": 40,
							"children": [
								{
									"type": "subFX",
									"name": "FX_Directional_Explosion_trails",
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base_NoFlare.fx",
									"x": -0.17169,
									"y": -1.25609,
									"z": -1.09939,
									"scaleX": 1.7,
									"scaleY": 1.7,
									"scaleZ": 2.15,
									"rotationX": -7.1,
									"rotationY": 49.7,
									"rotationZ": -5.6,
									"time": 2.79385
								},
								{
									"type": "subFX",
									"name": "FX_Directional_Explosion_trails",
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base_NoFlare.fx",
									"x": 4.07153,
									"y": -9.12217,
									"z": -5.26093,
									"scaleX": 0.85,
									"scaleY": 0.85,
									"scaleZ": 1.55,
									"rotationX": -2.2,
									"rotationY": 41,
									"rotationZ": -60.4,
									"time": 2.79385
								},
								{
									"type": "subFX",
									"name": "FX_Directional_Explosion_trails",
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base_NoFlare.fx",
									"x": -3.17939,
									"y": 12.6468,
									"z": -5.47459,
									"scaleX": 1.55,
									"scaleY": 1.55,
									"scaleZ": 1.6,
									"rotationX": -25.3,
									"rotationY": 29.8,
									"rotationZ": 109,
									"time": 2.79385
								}
							]
						},
						{
							"type": "subFX",
							"name": "01 - FX_Explosion_Mid_Slow_SmallDistort",
							"source": "Fx/Explosion/BasesExplosions/FX_Explosion_Mid_Slow_NoFlare_Base.fx",
							"x": 9.17828,
							"y": 5.89323,
							"z": -3,
							"scaleX": 1.2,
							"scaleY": 1.2,
							"scaleZ": 1.2,
							"rotationZ": -180,
							"time": 2.23327
						},
						{
							"type": "subFX",
							"name": "03 - FX_Explosion_Mid_Slow_SmallDistort",
							"source": "Fx/Explosion/BasesExplosions/FX_Explosion_Mid_Slow_NoFlare_Base.fx",
							"x": -11.27309,
							"y": 5.38277,
							"z": -3,
							"scaleX": 1.1,
							"scaleY": 1.1,
							"scaleZ": 1.1,
							"rotationZ": -180,
							"time": 2.92739
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
						},
						{
							"type": "advancedDecal",
							"name": "DarkenScreen",
							"z": -6.079823333333333,
							"scaleX": 2500,
							"scaleY": 2500,
							"scaleZ": 100,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"fadePower": 2,
							"fadeStart": 1,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.69
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 1.7059362319763756,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 7.18895034573277e-17,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.9128580216038975
													}
												},
												{
													"time": 3.008472776636482,
													"value": 1.0166666666666666,
													"mode": 2
												},
												{
													"time": 3.7156671332940467,
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
											0,
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
					"name": "LightDecals",
					"children": [
						{
							"type": "advancedDecal",
							"name": "HighExplosionAnticipation",
							"scaleX": 60,
							"scaleY": 60,
							"scaleZ": 40,
							"albedoMap": "Fx/Alphas/T_circle2.png",
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
											"emissive": 60
										}
									}
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.15
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 1.59,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.6,
													"value": 2,
													"mode": 2
												},
												{
													"time": 2.4473928308486976,
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
											"time": 1.53,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.54,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.476992187500002,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.4869921875000016,
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
											"mode": "BeforeTonemapping",
											"blend": "Add",
											"shadows": false,
											"culling": "Back",
											"colorMask": 255,
											"emissive": 0.2
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
													"time": 3.0948420333862297,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 3.1048420333862294,
													"value": 1,
													"mode": 2
												},
												{
													"time": 6.950871026095123,
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
											"time": 3.0227432169765236,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.0327432169765234,
											"value": 1,
											"mode": 2
										},
										{
											"time": 7.01714254955587,
											"value": 1,
											"mode": 2
										},
										{
											"time": 7.02714254955587,
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
							"x": -3.65207,
							"y": -1.71421,
							"scaleX": 25,
							"scaleY": 25,
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
										"scale": 2
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 0.42416950169553336,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 0.43416950169553314,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.290583496093751,
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
											"time": 0.33208695553243184,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.34208695553243185,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.3751029887050388,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.391977988705039,
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
							"x": -7.9929,
							"y": 13.79077,
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
													"time": 0.8107857900178259,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 0.8207857900178257,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.677199784416043,
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
											"time": 0.7174078287929301,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.7274078287929301,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.7546943583339467,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.7646943583339465,
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
							"x": -10.89355,
							"y": 6.69442,
							"z": 2.12237,
							"scaleX": 30,
							"scaleY": 30,
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
											"keyMode": 0,
											"keys": [
												{
													"time": 1.520141071224959,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.5301410712249588,
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
													"time": 2.747988281250004,
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
											"time": 1.4066852488368757,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.4166852488368757,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.968335486873986,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.978335486873986,
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
							"x": 11.00354,
							"y": -8.70384,
							"z": 2.12237,
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
													"time": 1.520141071224959,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.5301410712249588,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.018515625000003,
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
											"time": 1.426958114132286,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.436958114132286,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.10960593365133,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.11960593365133,
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
							"x": 5.20715,
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
													"time": 1.4560688055999584,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.4660688055999582,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.4774609375000023,
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
											"time": 1.3661395182460556,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.3761395182460556,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.56210213802755,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.57210213802755,
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
							"x": 9.51151,
							"y": 3.05154,
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
													"time": 1.6718913623359057,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.6818913623359055,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.85702372861095,
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
											"time": 1.5728128669131551,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.5828128669131551,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.930958409057931,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.940958409057931,
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
							"x": 8.11402,
							"y": 6.22043,
							"z": -0.12698,
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
											"mode": "BeforeTonemapping",
											"blend": "Add",
											"shadows": false,
											"culling": "Back",
											"colorMask": 255,
											"emissive": 0.25
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
													"time": 3.6277028506988716,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 3.6377028506988713,
													"value": 1,
													"mode": 2
												},
												{
													"time": 5.292598553155557,
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
											"time": 3.5324481124477494,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.542448112447749,
											"value": 1,
											"mode": 2
										},
										{
											"time": 5.377278854330075,
											"value": 1,
											"mode": 2
										},
										{
											"time": 5.3872788543300745,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Explo08",
							"x": -12.05921,
							"y": 6.22043,
							"z": -0.12698,
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
													"time": 4.3908232916839465,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 4.400823291683946,
													"value": 1,
													"mode": 2
												},
												{
													"time": 6.055718994140632,
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
											"time": 4.295568553432824,
											"value": 0,
											"mode": 2
										},
										{
											"time": 4.305568553432824,
											"value": 1,
											"mode": 2
										},
										{
											"time": 6.14039929531515,
											"value": 1,
											"mode": 2
										},
										{
											"time": 6.150399295315149,
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
							"children": [
								{
									"type": "advancedDecal",
									"name": "Explo07",
									"x": 8.71646,
									"y": -5.02586,
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
															"time": 4.287955826846888,
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
													"time": 4.359829154564069,
													"value": 1,
													"mode": 2
												},
												{
													"time": 4.369829154564068,
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
									"x": -12.59367,
									"y": 7.40749,
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
															"time": 4.223009406337519,
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
													"time": 4.305019166702405,
													"value": 1,
													"mode": 2
												},
												{
													"time": 4.315019166702405,
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
					"type": "curve",
					"name": "shake",
					"keyMode": 1,
					"keys": [
						{
							"time": 3.115194361553664,
							"value": 0,
							"mode": 2
						},
						{
							"time": 3.1251943615536644,
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
							"time": 6.5,
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
					"name": "DamageDecal",
					"x": 2.7755575615628914e-17,
					"y": 0.47709000000000007,
					"z": -0.77242,
					"children": [
						{
							"type": "advancedDecal",
							"name": "Sanddecal_02",
							"z": 1.1102230246251565e-16,
							"scaleX": 70.00000000000003,
							"scaleY": 70.00000000000003,
							"scaleZ": 20,
							"rotationZ": 120.59999999999998,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"normalMap": "Fx/DistortionMaps/sand-normal.png",
							"albedoStrength": 3,
							"children": [
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0,
											0,
											0
										]
									}
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_SandDecal_02.png"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 2.2102078729594368,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 5.587040948717635e-17,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 1.0959708460955895
													}
												},
												{
													"time": 3.287912538286765,
													"value": 0.9666666666666667,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.65,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.5,
										"uvScaleY": 1,
										"texture": "Fx/noise/T_Noise_Grunge_02.png",
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
							"name": "Sanddecal_02",
							"z": 1.1102230246251565e-16,
							"scaleX": 100.00000000000001,
							"scaleY": 100.00000000000001,
							"scaleZ": 20,
							"rotationZ": 156.1,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"normalMap": "Fx/DistortionMaps/sand-normal.png",
							"albedoStrength": 2,
							"children": [
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0,
											0,
											0
										]
									}
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_SandDecal_02.png"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 2.2102078729594368,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 5.587040948717635e-17,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 1.0959708460955895
													}
												},
												{
													"time": 3.287912538286765,
													"value": 0.9666666666666667,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.72,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.5,
										"uvScaleY": 1,
										"texture": "Fx/noise/T_Noise_Grunge_02.png",
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
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.75
							}
						}
					]
				},
				{
					"type": "emitter",
					"name": "FireFloor_anticipation",
					"props": {
						"warmUpTime": -1.6,
						"emitType": "Burst",
						"instScale": 55,
						"instRotation_rand": [
							0,
							0,
							0
						],
						"maxCount": 5,
						"lifeTime": 1.5
					},
					"z": 1.4375,
					"scaleX": 0.07500000000000001,
					"scaleY": 0.07500000000000001,
					"scaleZ": 0.07500000000000001,
					"rotationZ": 1.1770416794800422e-30,
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
											"culling": "None",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"emissive": 30,
											"drawOrder": "-80",
											"depthWrite": "Off"
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": false,
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_circle2.png"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.15
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.01666666666666672,
														"dt": -0.38408525123202764
													},
													"nextHandle": {
														"dv": 0.014436864824411356,
														"dt": 0.3332756687015779
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "alpha",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 1.4258279990287213,
														"dt": -0.24442765697635202
													},
													"nextHandle": {
														"dv": -1.1666666666666665,
														"dt": 0.20000000000000007
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.033333333333333326,
														"dt": -0.33999999999999986
													},
													"nextHandle": {
														"dv": -0.03266568666923559,
														"dt": 0.33319000402620214
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
											0.6941176470588235,
											0.3607843137254902,
											0.2588235294117647
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.5,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 3.25,
										"texture": "Fx/noise/T_Fire.png",
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
											"enabled": false,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.02018778987695988,
														"dt": -1.1385913490605288
													},
													"nextHandle": {
														"dv": 0.016666666666666607,
														"dt": 0.94
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "progress",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 1.245041497761005,
														"dt": -0.020614551575750532
													},
													"nextHandle": {
														"dv": -0.446875,
														"dt": 0.0067260711913458004
													}
												},
												{
													"time": 1,
													"value": 0.5,
													"mode": 0,
													"prevHandle": {
														"dv": -0.01666666666666672,
														"dt": -0.7109224214778171
													},
													"nextHandle": {
														"dv": 0.007810578034972692,
														"dt": 0.33333208232392514
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.5,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 2.25,
										"texture": "Fx/noise/Water_01.png",
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
											"enabled": false,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.02018778987695988,
														"dt": -1.1385913490605288
													},
													"nextHandle": {
														"dv": 0.016666666666666607,
														"dt": 0.94
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "progress",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 1.2177795461420868,
														"dt": -0.0988648016929929
													},
													"nextHandle": {
														"dv": -0.7015380859375002,
														"dt": 0.056053089618603016
													}
												},
												{
													"time": 1,
													"value": 0.3,
													"mode": 0,
													"prevHandle": {
														"dv": -0.014721679687500211,
														"dt": -0.606056834154685
													},
													"nextHandle": {
														"dv": 0.007243080094943305,
														"dt": 0.333333876231921
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "progress",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 1.229552882459761,
														"dt": -0.1737100874637916
													},
													"nextHandle": {
														"dv": -0.7417695473251028,
														"dt": 0.105
													}
												},
												{
													"time": 1,
													"value": 0.3,
													"mode": 0,
													"prevHandle": {
														"dv": -0.0014403292181069394,
														"dt": -0.385
													},
													"nextHandle": {
														"dv": -9.409347310140472e-17,
														"dt": 0.3334009968594422
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 5,
										"power": 0.8
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "curve",
							"name": "instScale",
							"enabled": false,
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0.5,
									"mode": 0,
									"prevHandle": {
										"dv": -2.494073049921499,
										"dt": -0.0712919490177076
									},
									"nextHandle": {
										"dv": 0.6127090979023997,
										"dt": 0.018205260047565522
									}
								},
								{
									"time": 1,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": -0.0010974281668227892,
										"dt": -1.0012819571088818
									},
									"nextHandle": {
										"dv": -1.6811564388663527e-16,
										"dt": 0.2703197486375193
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