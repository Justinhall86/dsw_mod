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
					"name": "MajorSietch_01",
					"source": "Structure/Sietch/MajorSietch/MajorSietch_01/MajorSietch_01.fbx",
					"editorOnly": true,
					"x": 0.02199,
					"y": 0.01227,
					"scaleX": 0.35,
					"scaleY": 0.35,
					"scaleZ": 0.35,
					"rotationZ": -180,
					"children": [
						{
							"type": "shader",
							"name": "SandBlend",
							"source": "shaders/SandBlend.hx",
							"props": {
								"colorMask": "Structure/Sietch/MajorSietch/MajorSietch_01/SietchMajor_MASK_Albedo.png"
							}
						}
					]
				},
				{
					"type": "object",
					"name": "SmallExplosions",
					"scaleX": 0.1,
					"scaleY": 0.1,
					"scaleZ": 0.1,
					"children": [
						{
							"type": "subFX",
							"name": "01 - FX_Directional_Explosion_High",
							"source": "Fx/Explosion/FX_Directional_Explosion_High02.fx",
							"x": 6.46493,
							"y": -2.00036,
							"z": 4.33724,
							"scaleX": 1.1,
							"scaleY": 1.1,
							"scaleZ": 1.1,
							"rotationX": -54.9,
							"rotationY": 5.4,
							"rotationZ": 10.1
						},
						{
							"type": "subFX",
							"name": "01 - FX_Directional_Explosion_High",
							"source": "Fx/Explosion/FX_Directional_Explosion_High02.fx",
							"x": -5.47511,
							"y": 4.59469,
							"z": 3.29021,
							"scaleX": 0.5,
							"scaleY": 0.5,
							"scaleZ": 0.5,
							"rotationX": -47.3,
							"rotationY": 9.5,
							"rotationZ": -4.4,
							"time": 0.025
						},
						{
							"type": "subFX",
							"name": "02 - FX_Directional_Explosion_Medium",
							"source": "Fx/Explosion/FX_Directional_Explosion_Medium.fx",
							"x": 7.52039,
							"y": 4.32703,
							"z": 4.13816,
							"scaleX": 0.9,
							"scaleY": 0.9,
							"scaleZ": 0.9,
							"rotationX": -34.4,
							"rotationY": -23.4,
							"rotationZ": -7.6,
							"time": 1.1
						},
						{
							"type": "subFX",
							"name": "07 - FX_Explosion_Mid_Slow_SmallDistort",
							"source": "Fx/Explosion/BasesExplosions/FX_Explosion_Mid_Slow_NoFlare_Base.fx",
							"x": 0.91698,
							"y": 0.19262,
							"z": 2.04016,
							"scaleX": 1.2,
							"scaleY": 1.2,
							"scaleZ": 1.2,
							"rotationX": 63.3,
							"rotationZ": -180,
							"time": 0.10412
						},
						{
							"type": "subFX",
							"name": "09 - FX_Directional_Explosion_trails",
							"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base.fx",
							"x": 15.28835,
							"y": -0.43541,
							"z": 0.32801,
							"scaleX": 1.15,
							"scaleY": 1.15,
							"scaleZ": 1.15,
							"rotationX": 15.8,
							"rotationY": 34.3,
							"rotationZ": 23.9,
							"time": 1.555
						},
						{
							"type": "subFX",
							"name": "10 - FX_Directional_Explosion_trails",
							"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base.fx",
							"x": -11.82678,
							"y": -7.67107,
							"z": -1.75679,
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
					"scaleX": 0.1,
					"scaleY": 0.1,
					"scaleZ": 0.1,
					"rotationZ": 180,
					"children": [
						{
							"type": "subFX",
							"name": "01 - FX_MajorSietch_Anticipation02",
							"source": "Fx/Structure/SietchTabr/FX_MajorSietch_Anticipation02.fx",
							"x": -0.24431,
							"y": 4.25173,
							"scaleX": 0.71,
							"scaleY": 0.71,
							"scaleZ": 0.71,
							"rotationZ": -18,
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
							"time": 2.55161
						},
						{
							"type": "subFX",
							"name": "02 - FX_SietchTabr_Anticipation",
							"source": "Fx/Structure/SietchTabr/FX_MajorSietch_Anticipation.fx",
							"x": -0.24431,
							"y": 4.25173,
							"scaleX": 0.71,
							"scaleY": 0.71,
							"scaleZ": 0.71,
							"rotationZ": -18,
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
							"y": -3.83188,
							"z": -2,
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 2,
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
							"rotationZ": -180,
							"time": 2.115
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
					"scaleX": 0.1,
					"scaleY": 0.1,
					"scaleZ": 0.1,
					"children": [
						{
							"type": "advancedDecal",
							"name": "HighExplosionAnticipation",
							"x": 1.11645,
							"y": 1.75267,
							"z": 2.06716,
							"scaleX": 35,
							"scaleY": 35,
							"scaleZ": 40,
							"rotationX": -37.7,
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
							"name": "Explo01",
							"x": -5.33652,
							"y": 4.98421,
							"z": 3.50965,
							"scaleX": 15,
							"scaleY": 15,
							"scaleZ": 15,
							"rotationX": -61.4,
							"rotationY": -11.2,
							"rotationZ": -21.8,
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
													"time": 0.44700409992142887,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 0.45700409992142865,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.3134180943196463,
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
											"time": 0.35492155375832724,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.36492155375832747,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.3979375869309343,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.4148125869309345,
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
							"x": 5.5409,
							"y": 0.77213,
							"z": 5.87232,
							"scaleX": 15,
							"scaleY": 15,
							"scaleZ": 15,
							"rotationX": -48.3,
							"rotationY": -14.4,
							"rotationZ": 15.6,
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
													"time": 0.5779382379942994,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 0.5879382379942992,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.4443522323925166,
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
											"time": 0.4845602767694035,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.49456027676940373,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.5218468063104202,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.53184680631042,
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
							"x": 18.38702,
							"y": -0.8081,
							"z": 2.5441,
							"scaleX": 18,
							"scaleY": 18,
							"scaleZ": 15,
							"rotationY": 21.6,
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
							"x": -14.88187,
							"y": -8.98153,
							"z": 3.48647,
							"scaleX": 15,
							"scaleY": 15,
							"scaleZ": 15,
							"rotationY": -24.8,
							"rotationZ": 18.1,
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
					"name": "DECAL",
					"children": [
						{
							"type": "advancedDecal",
							"name": "Decal_Large",
							"x": 1.09478,
							"y": 0.06292,
							"scaleX": 5,
							"scaleY": 5.84,
							"scaleZ": 3.34,
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
							"name": "Decal_Large",
							"x": -0.40833,
							"y": 0.57748,
							"z": 0.9668,
							"scaleX": 6,
							"scaleY": 6,
							"scaleZ": 2.57,
							"rotationX": 4.2,
							"rotationY": 0.09999999999999983,
							"rotationZ": 88.19999999999999,
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
							"x": -0.76019,
							"y": -0.58031,
							"z": 0.29995,
							"scaleX": 3,
							"scaleY": 3,
							"scaleZ": 1.34,
							"rotationX": 2.1,
							"rotationY": 15.5,
							"rotationZ": -166.9,
							"albedoMap": "Structure/Base/Destruction/Destruction_Decal_01_Albedo.png",
							"albedoStrength": 0.75
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 1
							},
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keys": [
										{
											"time": 2.944409743981381,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.0705086623531748,
											"value": 1,
											"mode": 2
										}
									]
								}
							]
						}
					]
				}
			]
		}
	]
}