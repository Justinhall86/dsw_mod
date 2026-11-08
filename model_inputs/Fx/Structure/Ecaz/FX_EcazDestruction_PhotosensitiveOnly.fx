{
	"type": "fx",
	"duration": 15,
	"cullingRadius": 50,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"z": -0.25,
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
			"z": 0.5,
			"rotationZ": -90,
			"children": [
				{
					"type": "model",
					"name": "BaseEcaz",
					"source": "Structure/Base/Ecaz/Ecaz_MainBase.fbx",
					"editorOnly": true,
					"locked": true,
					"z": -0.5,
					"scaleX": 0.9999999999999998,
					"scaleY": 0.9999999999999998,
					"rotationZ": -155.00000000000003
				},
				{
					"type": "object",
					"name": "TESTDECALS",
					"enabled": false,
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
					"z": -2,
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
							"source": "Fx/Explosion/FX_Directional_Explosion_High_Photosensitive.fx",
							"x": -6.40824,
							"y": -1.40388,
							"z": 3.03765,
							"scaleX": 1.25,
							"scaleY": 1.25,
							"scaleZ": 1.25,
							"rotationX": 74.9,
							"rotationZ": -86.4
						},
						{
							"type": "subFX",
							"name": "02 - FX_Directional_Explosion_Medium",
							"source": "Fx/Explosion/FX_Directional_Explosion_Medium_Photosensitive.fx",
							"x": 3.73616,
							"y": 10.35094,
							"z": 4.00612,
							"scaleX": 0.9,
							"scaleY": 0.9,
							"scaleZ": 0.9,
							"rotationX": -1.2,
							"time": 0.39244
						},
						{
							"type": "subFX",
							"name": "03 - FX_Directional_Explosion_High",
							"source": "Fx/Explosion/FX_Directional_Explosion_High_Photosensitive.fx",
							"x": 9.9919,
							"y": -6.44392,
							"z": -0.45829,
							"scaleX": 1.3,
							"scaleY": 1.3,
							"scaleZ": 1.3,
							"rotationX": 3.9,
							"rotationY": 40,
							"rotationZ": -3.2,
							"time": 1.06726
						},
						{
							"type": "subFX",
							"name": "06 - FX_Directional_Explosion_High",
							"source": "Fx/Explosion/FX_Directional_Explosion_High_Photosensitive.fx",
							"x": 1.52428,
							"y": 5.76682,
							"z": 4.32671,
							"scaleX": 1.3,
							"scaleY": 1.3,
							"scaleZ": 1.3,
							"rotationX": -24.7,
							"rotationY": 58.3,
							"rotationZ": 14.6,
							"time": 1.23507
						},
						{
							"type": "subFX",
							"name": "03 - FX_Directional_Explosion_High",
							"source": "Fx/Explosion/FX_Directional_Explosion_High_Photosensitive.fx",
							"x": -13.93152,
							"y": -1.76347,
							"z": -0.85001,
							"scaleX": 1.3000000000000003,
							"scaleY": 1.2999999999999998,
							"scaleZ": 1.3000000000000003,
							"rotationX": 33.1,
							"rotationY": 15.7,
							"rotationZ": -49.5,
							"time": 1.06726
						},
						{
							"type": "subFX",
							"name": "08 - FX_Directional_Explosion_trails",
							"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base_NoFlare_Photosensitive.fx",
							"x": -12.3007,
							"y": -1.65043,
							"z": -1.45747,
							"rotationX": 10,
							"rotationY": 56.4,
							"rotationZ": -131.3,
							"time": 1.36
						},
						{
							"type": "subFX",
							"name": "09 - FX_Directional_Explosion_trails",
							"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base_NoFlare_Photosensitive.fx",
							"x": 0.6050300000000002,
							"y": 1.611788571428571,
							"z": 1.6630285714285717,
							"scaleX": 1.2,
							"scaleY": 1.2,
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
							"name": "FX_Explosion_High_Cinematic",
							"source": "Fx/Explosion/BasesExplosions/FX_Explosion_High_Cinematic_Base_Photosensitive.fx",
							"x": 0.95892,
							"y": -1.88724,
							"z": 1.33,
							"scaleX": 0.8,
							"scaleY": 0.8,
							"scaleZ": 0.8,
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
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base_NoFlare_Photosensitive.fx",
									"x": 0.55441,
									"y": -1.28986,
									"z": -1.49304,
									"scaleX": 1.2,
									"scaleY": 1.2,
									"scaleZ": 1.51,
									"rotationX": -7.1,
									"rotationY": 49.7,
									"rotationZ": -5.6,
									"time": 2.79385
								},
								{
									"type": "subFX",
									"name": "FX_Directional_Explosion_trails",
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base_NoFlare_Photosensitive.fx",
									"x": 5.37107,
									"y": -8.33998,
									"z": -5.30489,
									"scaleX": 0.85,
									"scaleY": 0.85,
									"scaleZ": 0.85,
									"rotationX": -2.2,
									"rotationY": 41,
									"rotationZ": -60.4,
									"time": 2.79385
								},
								{
									"type": "subFX",
									"name": "FX_Directional_Explosion_trails",
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base_NoFlare_Photosensitive.fx",
									"x": -4.92806,
									"y": 11.54475,
									"z": -6.29997,
									"scaleX": 1.05,
									"scaleY": 1.05,
									"scaleZ": 1.08,
									"rotationX": -25.3,
									"rotationY": 29.8,
									"rotationZ": 109,
									"time": 2.79385
								}
							]
						},
						{
							"type": "model",
							"name": "EcazMB_Windows",
							"source": "Fx/Meshes_Common/EcazMB_Windows.fbx",
							"locked": true,
							"z": -0.5,
							"scaleX": 0.9999999999999997,
							"scaleY": 0.9999999999999997,
							"rotationZ": -155.00000000000003,
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
											"emissive": 2
										}
									}
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 1
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 1,
											"keys": [
												{
													"time": 1.6236841146471361,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.6635880117442097,
													"value": 0.05,
													"mode": 2
												},
												{
													"time": 3.0089149618231636,
													"value": 0,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.46545472766711016
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.006132865553234741
													}
												},
												{
													"time": 3.107,
													"value": 1,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.11555006034587834
													},
													"nextHandle": {
														"dv": -0.019986333762937347,
														"dt": 0.28263011076066746
													}
												},
												{
													"time": 5.92247376880826,
													"value": 0,
													"prevHandle": {
														"dv": -0.03361111111111109,
														"dt": -2.4182529367084964
													},
													"nextHandle": {
														"dv": 0.004686721939965088,
														"dt": 0.33443643230724696
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
										"progress": 1,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.6,
										"uvScaleY": 0.6,
										"texture": "Fx/noise/T_Noise_Wave_02.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.05,
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
													"time": 3.353626519023326,
													"value": 0.5,
													"prevHandle": {
														"dv": 0.0910902540606407,
														"dt": -0.6285227530184213
													},
													"nextHandle": {
														"dv": -0.016666666666666663,
														"dt": 0.115
													}
												},
												{
													"time": 5.921005606184007,
													"value": 0,
													"prevHandle": {
														"dv": 0.23470918076809827,
														"dt": -0.4235082530818426
													},
													"nextHandle": {
														"dv": -0.23470918076809827,
														"dt": 0.4235082530818426
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
											0.7058823529411764,
											0.3176470588235294,
											0.19607843137254902
										]
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "object",
							"name": "ExplosWindows",
							"x": 4.042120000000001,
							"y": -9.022483333333334,
							"z": 2.819048333333333,
							"children": [
								{
									"type": "subFX",
									"name": "FX_Directional_Explosion_High_Debris",
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Debris_Photosensitive.fx",
									"x": -13.42739,
									"y": -2.242636666666666,
									"z": -0.162198333333333,
									"scaleZ": 1.3,
									"rotationX": 48.8,
									"rotationY": 7.951386703658792e-16,
									"rotationZ": -18.60000000000001,
									"time": 2.66008
								},
								{
									"type": "subFX",
									"name": "FX_Directional_Explosion_High_Debris",
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Debris_Photosensitive.fx",
									"x": -4.556640000000001,
									"y": -5.644606666666666,
									"z": -0.613258333333333,
									"scaleX": 0.7999999999999999,
									"scaleY": 0.8,
									"scaleZ": 1.1,
									"rotationX": 48.8,
									"rotationY": -7.951386703658792e-16,
									"rotationZ": -18.600000000000005,
									"time": 2.66008
								},
								{
									"type": "subFX",
									"name": "FX_Directional_Explosion_High_Debris",
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Debris_Photosensitive.fx",
									"x": -2.4428600000000005,
									"y": 5.773063333333333,
									"z": 4.498791666666667,
									"scaleX": 0.7,
									"scaleY": 0.7,
									"rotationX": 71.5,
									"rotationY": 1.5902773407317584e-15,
									"rotationZ": 24.8,
									"time": 2.66008
								},
								{
									"type": "subFX",
									"name": "FX_Directional_Explosion_High_Debris",
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Debris_Photosensitive.fx",
									"x": 3.2490499999999995,
									"y": -6.545356666666667,
									"z": -2.642148333333333,
									"scaleX": 0.8,
									"scaleY": 0.8,
									"scaleZ": 1.1,
									"rotationX": 71.5,
									"rotationY": 1.5902773407317584e-15,
									"rotationZ": 24.800000000000004,
									"time": 2.66008
								},
								{
									"type": "subFX",
									"name": "FX_Directional_Explosion_High_Debris",
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Debris_Photosensitive.fx",
									"x": 7.2745999999999995,
									"y": 0.05612333333333375,
									"z": -0.5073183333333331,
									"scaleZ": 1.3,
									"rotationX": -16.099999999999994,
									"rotationY": 61.300000000000004,
									"rotationZ": -31.9,
									"time": 2.66008
								},
								{
									"type": "subFX",
									"name": "FX_Directional_Explosion_High_Debris",
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Debris_Photosensitive.fx",
									"x": 9.90324,
									"y": 8.603413333333334,
									"z": -0.573868333333333,
									"scaleX": 0.8,
									"scaleY": 0.8,
									"scaleZ": 1.1,
									"rotationX": -16.099999999999998,
									"rotationY": 61.300000000000004,
									"rotationZ": -31.9,
									"time": 2.66008
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
					"enabled": false,
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
													"value": -0.01666666666666672
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
							"x": 2.30161,
							"y": -4.55069,
							"z": 6.97621,
							"scaleX": 15,
							"scaleY": 15,
							"scaleZ": 22.5,
							"rotationX": 29.3,
							"rotationZ": 25,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"albedoStrength": 2,
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
													"value": -0.01666666666666672
												},
												{
													"time": 3.1048420333862294,
													"value": 1,
													"mode": 2
												},
												{
													"time": 5.787043431599282,
													"value": 0,
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
											"time": 5.853314955060029,
											"value": 1,
											"mode": 2
										},
										{
											"time": 5.863314955060029,
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
							"x": 3.9848,
							"y": -8.346395,
							"z": 0.09607999999999994,
							"children": [
								{
									"type": "advancedDecal",
									"name": "HighExplosion",
									"x": 3.64039,
									"y": -7.620745000000001,
									"scaleX": 20,
									"scaleY": 20,
									"scaleZ": 30,
									"rotationZ": 25.000000000000007,
									"albedoMap": "Fx/Alphas/T_circle2.png",
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
															"value": -0.01666666666666672
														},
														{
															"time": 3.1048420333862294,
															"value": 1,
															"mode": 2
														},
														{
															"time": 5.787043431599282,
															"value": 0,
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
													"time": 5.853314955060029,
													"value": 1,
													"mode": 2
												},
												{
													"time": 5.863314955060029,
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
									"x": 10.71258,
									"y": 8.625824999999999,
									"scaleX": 20,
									"scaleY": 20,
									"scaleZ": 30,
									"rotationZ": -21.999999999999996,
									"albedoMap": "Fx/Alphas/T_circle2.png",
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
															"value": -0.01666666666666672
														},
														{
															"time": 3.1048420333862294,
															"value": 1,
															"mode": 2
														},
														{
															"time": 5.787043431599282,
															"value": 0,
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
													"time": 5.853314955060029,
													"value": 1,
													"mode": 2
												},
												{
													"time": 5.863314955060029,
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
									"x": 6.9869900000000005,
									"y": -0.5953350000000004,
									"scaleX": 20,
									"scaleY": 20,
									"scaleZ": 30,
									"rotationZ": -21.999999999999996,
									"albedoMap": "Fx/Alphas/T_circle2.png",
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
															"value": -0.01666666666666672
														},
														{
															"time": 3.1048420333862294,
															"value": 1,
															"mode": 2
														},
														{
															"time": 5.787043431599282,
															"value": 0,
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
													"time": 5.853314955060029,
													"value": 1,
													"mode": 2
												},
												{
													"time": 5.863314955060029,
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
									"x": -13.5152,
									"y": -2.3149750000000004,
									"scaleX": 20,
									"scaleY": 20,
									"scaleZ": 30,
									"rotationZ": -21.200000000000003,
									"albedoMap": "Fx/Alphas/T_circle2.png",
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
															"value": -0.01666666666666672
														},
														{
															"time": 3.1048420333862294,
															"value": 1,
															"mode": 2
														},
														{
															"time": 5.787043431599282,
															"value": 0,
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
													"time": 5.853314955060029,
													"value": 1,
													"mode": 2
												},
												{
													"time": 5.863314955060029,
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
									"x": -4.1843699999999995,
									"y": -5.715515,
									"scaleX": 20,
									"scaleY": 20,
									"scaleZ": 30,
									"rotationZ": -18,
									"albedoMap": "Fx/Alphas/T_circle2.png",
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
															"value": -0.01666666666666672
														},
														{
															"time": 3.1048420333862294,
															"value": 1,
															"mode": 2
														},
														{
															"time": 5.787043431599282,
															"value": 0,
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
													"time": 5.853314955060029,
													"value": 1,
													"mode": 2
												},
												{
													"time": 5.863314955060029,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
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
							"type": "advancedDecal",
							"name": "Explo01",
							"x": -4.54344,
							"y": -3.26673,
							"z": 3.69603,
							"scaleX": 20,
							"scaleY": 20,
							"scaleZ": 50,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"albedoStrength": 3,
							"emissive": 70,
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
													"value": -0.01666666666666672
												},
												{
													"time": 0.43416950169553314,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.290583496093751,
													"value": 0,
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
							"x": 5.36626,
							"y": 9.24111,
							"z": 5.5916,
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
													"time": 0.8107857900178259,
													"value": -0.01666666666666672
												},
												{
													"time": 0.8207857900178257,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.677199784416043,
													"value": 0,
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
							"x": 12.65317,
							"y": -8.94272,
							"z": 2.12237,
							"scaleX": 20,
							"scaleY": 20,
							"scaleZ": 15,
							"albedoMap": "Fx/Alphas/T_circle2.png",
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
													"time": 1.520141071224959,
													"value": -0.01666666666666672
												},
												{
													"time": 1.5301410712249588,
													"value": 1,
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
							"x": -10.83228,
							"y": -4.83386,
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
													"value": -0.01666666666666672
												},
												{
													"time": 1.5301410712249588,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.018515625000003,
													"value": 0,
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
							"x": 4.09855,
							"y": 3.85484,
							"z": 2.12237,
							"scaleX": 20,
							"scaleY": 20,
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
													"time": 1.4560688055999584,
													"value": -0.01666666666666672
												},
												{
													"time": 1.4660688055999582,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.4774609375000023,
													"value": 0,
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
					"scaleX": 0.9,
					"scaleY": 0.9,
					"scaleZ": 0.9,
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
				}
			]
		}
	]
}