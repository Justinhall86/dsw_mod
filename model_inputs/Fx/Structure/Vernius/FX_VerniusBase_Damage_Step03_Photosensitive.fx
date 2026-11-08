{
	"type": "fx",
	"cullingRadius": 150,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"x": 15,
			"scaleX": 200,
			"scaleY": 200,
			"scaleZ": 140,
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
			"children": [
				{
					"type": "model",
					"name": "VerniusBase",
					"source": "Structure/Base/Vernius/VerniusBase.fbx",
					"editorOnly": true,
					"locked": true
				},
				{
					"type": "object",
					"name": "group",
					"x": 0.63046,
					"y": 10.95181,
					"z": 0.90376,
					"rotationZ": 90,
					"children": [
						{
							"type": "object",
							"name": "Decals",
							"x": -4.17768,
							"y": 1.9765197619047616,
							"z": -1.4037569047619047,
							"rotationZ": 89.99999999999999,
							"children": [
								{
									"type": "advancedDecal",
									"name": "Decal_Large",
									"x": -5.11477,
									"y": -11.59766,
									"z": -0.3,
									"scaleX": 27,
									"scaleY": 27,
									"scaleZ": 36,
									"rotationZ": 26.8,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
									"albedoStrength": 1.2,
									"children": [
										{
											"type": "curve",
											"name": "color.a",
											"keys": [
												{
													"time": 1.303416253344502,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.5084162533445036,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Explosions",
							"x": -4.17768,
							"y": 1.9765197619047616,
							"z": -1.2915469047619048,
							"children": [
								{
									"type": "subFX",
									"name": "FX_Directional_Explosion_High_ElectricSparks",
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_ElectricSparkles_Photosensitive.fx",
									"x": 11.50765,
									"y": 2.14864,
									"z": 3.07821,
									"scaleX": 0.7,
									"scaleY": 0.7,
									"scaleZ": 0.7,
									"rotationX": -33.8,
									"time": 0.8264500000000026
								},
								{
									"type": "subFX",
									"name": "FX_Directional_Explosion_High_ElectricSparks",
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_ElectricSparkles_Photosensitive.fx",
									"x": 8.15579,
									"y": -9.07782,
									"z": 3.06093,
									"scaleZ": 1.34,
									"rotationX": -7.8,
									"rotationY": -15.6,
									"rotationZ": 82,
									"time": 0.8100000000000027
								},
								{
									"type": "subFX",
									"name": "FX_Directional_Explosion_High_ElectricSparks",
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_ElectricSparkles_Photosensitive.fx",
									"x": 17.74584,
									"y": -1.79492,
									"z": 2.64959,
									"scaleX": 0.5,
									"scaleY": 0.5,
									"scaleZ": 0.67,
									"rotationY": -17.4,
									"rotationZ": 55.2,
									"time": 0.8100000000000027
								},
								{
									"type": "subFX",
									"name": "FX_ScreenShake02",
									"source": "Fx/Explosion/FX_ScreenShake02.fx",
									"x": 6.91202,
									"y": -3.99066,
									"z": 0.58779,
									"rotationZ": 150.00000000000003,
									"time": 0.895,
									"children": [
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.6
											}
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
							"type": "advancedDecal",
							"name": "ElecBlink",
							"enabled": false,
							"x": 6.929940000000001,
							"y": -2.620120238095238,
							"z": -0.40375690476190473,
							"scaleX": 40,
							"scaleY": 40,
							"scaleZ": 50,
							"rotationZ": -24.1,
							"albedoMap": "Fx/Gradients/circGrad01.png",
							"albedoStrength": 3,
							"emissive": 40,
							"blendMode": 2,
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
											"colorMask": 255
										}
									}
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.6
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 1.1296257708778938,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.4230405503421009,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.633628301769934,
													"value": 0,
													"mode": 2
												},
												{
													"time": 3.867685110865627,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.120501620914263,
													"value": 1,
													"mode": 2
												},
												{
													"time": 4.370501620914263,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.5807505073142325,
													"value": 0.7149213038453268,
													"mode": 2
												},
												{
													"time": 4.841873046858794,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.454506697328727,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.870501620914263,
													"value": 0.95,
													"mode": 2
												},
												{
													"time": 6.270501620914263,
													"value": 0,
													"mode": 2
												}
											],
											"loop": true
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaCycle",
									"source": "shaders/AlphaCycle.hx",
									"props": {
										"minAlpha": 0,
										"maxAlpha": 0.5,
										"frequency": 10
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.45098039215686275,
											0.30196078431372547,
											0.8352941176470589
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.7,
										"ATTENUATE": true,
										"emissiveMap": null
									}
								}
							]
						},
						{
							"type": "emitter",
							"name": "emitter_ElecticiteFin",
							"enabled": false,
							"props": {
								"alignMode": "Screen",
								"lifeTime": 0.4,
								"lifeTimeRand": 0.05,
								"frameCount": 4,
								"frameDivisionX": 2,
								"frameDivisionY": 2,
								"animationLoop": false,
								"instScale": 2.2,
								"spriteSheet": "Fx/Alphas/T_ElectricArc_2x2_03.png",
								"instRotation_rand": [
									0,
									0,
									360
								],
								"instOffset_rand": [
									0,
									0,
									0
								],
								"instScale_rand": 0.7,
								"animationBlendBetweenFrames": false,
								"emitRate": 15,
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"emitShape": "Cylinder",
								"emitAngle": 360,
								"emitSurface": true,
								"seedGroup": 1,
								"randomGradient": {
									"stops": [
										{
											"position": 0,
											"color": -16777216
										},
										{
											"position": 1,
											"color": -1
										}
									],
									"resolution": 64,
									"isVertical": false,
									"interpolation": "Linear",
									"colorMode": 0
								}
							},
							"x": 8.58962,
							"y": -2.4725902380952385,
							"z": 1.3454930952380952,
							"scaleX": 20,
							"scaleY": 9.5,
							"scaleZ": 0.5,
							"rotationZ": 71.09999999999998,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 1.5,
									"scaleY": 1.5,
									"scaleZ": 1.5,
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
													"emissive": 5
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											}
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
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/clouds3.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keys": [
														{
															"time": 0.24726183384056316,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.3176167024895698,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.3845396263264298,
															"value": 1
														},
														{
															"time": 0.5,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.16666666666666666
															},
															"nextHandle": {
																"dv": 0,
																"dt": -0.5
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "GradientMap",
											"source": "shaders/GradientMap.hx",
											"props": {
												"USE_ALPHA": true,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -12444212
															},
															{
																"position": 1,
																"color": -18584
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keys": [
										{
											"time": 1.1487993809375387,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.4422141604017458,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.6528019118295787,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.867685110865627,
											"value": 0,
											"mode": 2
										},
										{
											"time": 4.120501620914263,
											"value": 1,
											"mode": 2
										},
										{
											"time": 4.370501620914263,
											"value": 0,
											"mode": 2
										},
										{
											"time": 4.5807505073142325,
											"value": 0.7149213038453268,
											"mode": 2
										},
										{
											"time": 4.841873046858794,
											"value": 0,
											"mode": 2
										},
										{
											"time": 5.454506697328727,
											"value": 0,
											"mode": 2
										},
										{
											"time": 5.870501620914263,
											"value": 0.95,
											"mode": 2
										},
										{
											"time": 6.270501620914263,
											"value": 0,
											"mode": 2
										}
									],
									"loop": true
								}
							]
						},
						{
							"type": "object",
							"name": "LightDecals",
							"enabled": false,
							"x": -1.8145399999999992,
							"y": -0.8266188095238096,
							"z": 2.4573245238095236,
							"children": [
								{
									"type": "advancedDecal",
									"name": "ExploHigh",
									"x": 12.01927,
									"y": 3.11788,
									"z": -0.82443,
									"scaleX": 25,
									"scaleY": 25,
									"scaleZ": 30,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"albedoStrength": 3,
									"emissive": 50,
									"children": [
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
															"time": 1.3588482516939826,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4129799171024868,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.512194127084665,
															"value": 0,
															"prevHandle": {
																"dv": 0.01722222222222225,
																"dt": -1.1150000000000002
															},
															"nextHandle": {
																"dv": -0.00506531867811874,
																"dt": 0.33331457662242014
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
													0.9529411764705882,
													0.5686274509803921,
													0.3568627450980392
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
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "ExploHigh",
									"x": 5.87847,
									"y": -6.28798,
									"z": -0.82443,
									"scaleX": 20,
									"scaleY": 20,
									"scaleZ": 30,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"albedoStrength": 3,
									"emissive": 50,
									"children": [
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
															"time": 1.3588482516939826,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4129799171024868,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.512194127084665,
															"value": 0,
															"prevHandle": {
																"dv": 0.01722222222222225,
																"dt": -1.1150000000000002
															},
															"nextHandle": {
																"dv": -0.00506531867811874,
																"dt": 0.33331457662242014
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
													0.9529411764705882,
													0.5686274509803921,
													0.3568627450980392
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
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "BaseLights",
							"enabled": false,
							"x": -5.34966,
							"y": 1.9662897619047617,
							"z": -0.7037569047619048,
							"scaleX": 0.55,
							"scaleY": 0.55,
							"scaleZ": 0.55,
							"rotationZ": 90.5,
							"children": [
								{
									"type": "object",
									"name": "PatternLights",
									"x": -0.27147,
									"y": 0.26033,
									"children": [
										{
											"type": "polygon",
											"name": "Purple",
											"x": 0.46315,
											"y": -0.42839,
											"z": 3.6,
											"scaleX": 77,
											"scaleY": 77,
											"scaleZ": 77,
											"rotationZ": 8.155268414009016e-17,
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
															"emissive": 1
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.3,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/T_CircuitPattern_VerniusBase04.png",
														"uvShift": [
															0,
															0.05
														],
														"uvShiftSpeed": [
															0,
															0
														]
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.33725490196078434,
															0.27058823529411763,
															0.984313725490196
														]
													}
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 0.2
													}
												},
												{
													"type": "shader",
													"name": "AlphaKill",
													"source": "shaders/AlphaKill.hx",
													"props": {
														"threshold": 0.001,
														"useRGB": false
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.35,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 3,
														"uvScaleY": 1,
														"texture": "Fx/noise/DissolveCircuit.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.01,
															-0.04
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "Light",
											"x": 0.46315,
											"y": -0.42839,
											"z": 3.6,
											"scaleX": 77,
											"scaleY": 77,
											"scaleZ": 77,
											"rotationZ": 8.155268414009016e-17,
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
															"emissive": 40
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"props": {
														"useSourceUVs": true,
														"onDecal": false,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0.05,
														"texture": "Fx/Alphas/T_CircuitPattern_VerniusBase03.png"
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.25,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/dGrad04.png",
														"uvShift": [
															0,
															0.05
														],
														"uvShiftSpeed": [
															0,
															0
														]
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.32,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/circGrad3.jpg",
														"uvShift": [
															0,
															0.05
														],
														"uvShiftSpeed": [
															0,
															0
														]
													}
												},
												{
													"type": "shader",
													"name": "GradientMap",
													"source": "shaders/GradientMap.hx",
													"props": {
														"USE_ALPHA": true,
														"gradient": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0,
																		"color": -13754522
																	},
																	{
																		"position": 0.30859375,
																		"color": -12444212
																	},
																	{
																		"position": 1,
																		"color": -4033215
																	}
																],
																"resolution": 64,
																"isVertical": false,
																"interpolation": "Linear",
																"colorMode": 0
															}
														}
													}
												},
												{
													"type": "shader",
													"name": "AlphaKill",
													"source": "shaders/AlphaKill.hx",
													"props": {
														"threshold": 0.001,
														"useRGB": false
													}
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 0.7
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"keys": [
																{
																	"time": 1.3081016776474654,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.4493922147598588,
																	"value": 1,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.9666666666666667,
																		"dt": -0.038011622428894
																	},
																	"nextHandle": {
																		"dv": -0.9007681473970794,
																		"dt": 0.03771385499139823
																	}
																},
																{
																	"time": 2.160560888402601,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.23705622454758082
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": -0.5
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
															1,
															0.45098039215686275,
															0.2901960784313725
														]
													},
													"isInstance": true
												}
											]
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.7,
												"ATTENUATE": true,
												"emissiveMap": null
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
	]
}