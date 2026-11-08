{
	"type": "fx",
	"cullingRadius": 150,
	"blendFactor": 1,
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
					"x": 5.40544,
					"y": 4.45385,
					"z": 1.596,
					"rotationZ": 90,
					"children": [
						{
							"type": "advancedDecal",
							"name": "ElecBlink",
							"x": -2.6268166666666666,
							"y": -6.890017142857143,
							"z": -1.1569404761904762,
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
											"loop": true,
											"keys": [
												{
													"time": 1.302188261414698,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.595603040878905,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.806190792306738,
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
											]
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
								"seedGroup": 1
							},
							"x": -2.1678466666666667,
							"y": -7.713227142857143,
							"z": 0.8625395238095239,
							"scaleX": 20,
							"scaleY": 10,
							"scaleZ": 0.5,
							"rotationZ": -14.2,
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
															"value": 1,
															"mode": 0
														},
														{
															"time": 0.5,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
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
									"loop": true,
									"keys": [
										{
											"time": 1.302188261414698,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.595603040878905,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.806190792306738,
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
									]
								}
							]
						},
						{
							"type": "object",
							"name": "LightDecals",
							"x": 4.953013333333334,
							"y": 4.038584285714286,
							"z": 1.7041409523809523,
							"children": [
								{
									"type": "advancedDecal",
									"name": "Explo01",
									"x": -1.47921,
									"y": -10.59157,
									"scaleX": 12,
									"scaleY": 12,
									"scaleZ": 12,
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
															"time": 0.564169501695533,
															"value": -0.01666666666666672,
															"mode": 0
														},
														{
															"time": 0.5741695016955328,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.22,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.03361111111111109,
																"dt": -1.5705834960937506
															},
															"nextHandle": {
																"dv": 0.007194614712272117,
																"dt": 0.3333111668341301
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
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "Explo02",
									"x": -14.10325,
									"y": -8.9089,
									"z": -0.82443,
									"scaleX": 10,
									"scaleY": 10,
									"scaleZ": 12.5,
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
															"time": 0.7757857900178262,
															"value": -0.01666666666666672,
															"mode": 0
														},
														{
															"time": 0.785785790017826,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.885,
															"value": 0,
															"mode": 0,
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
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "ExploHigh",
									"x": -17.45072,
									"y": -13.45238,
									"z": -0.82443,
									"scaleX": 30,
									"scaleY": 30,
									"scaleZ": 30,
									"rotationX": 3.7,
									"rotationZ": -38,
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
															"time": 1.4732671146075758,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.52739878001608,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.6266129899982547,
															"value": 0,
															"mode": 0,
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
									"x": -0.17287,
									"y": -13.45238,
									"z": -0.82443,
									"scaleX": 25,
									"scaleY": 25,
									"scaleZ": 25,
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
															"time": 1.4732671146075758,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.52739878001608,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.6266129899982547,
															"value": 0,
															"mode": 0,
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
							"name": "Decals",
							"locked": true,
							"x": -6.529256666666667,
							"y": -0.3054171428571433,
							"z": -1.6569404761904762,
							"scaleX": 8,
							"scaleY": 8,
							"scaleZ": 8,
							"children": [
								{
									"type": "advancedDecal",
									"name": "Decal_Large",
									"x": 0.61,
									"y": -0.91,
									"scaleX": 4.5,
									"scaleY": 5.24,
									"scaleZ": 2.99,
									"rotationZ": 180,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
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
									"name": "Decal_TOUR",
									"x": -0.91,
									"y": -1.21,
									"z": 1.06,
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 10,
									"rotationZ": 144.55,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
									"albedoStrength": 0.8,
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
								}
							]
						},
						{
							"type": "object",
							"name": "Explosions",
							"x": 4.953013333333333,
							"y": 4.038584285714286,
							"z": 1.7041409523809523,
							"scaleX": 1.5,
							"scaleY": 1.5,
							"scaleZ": 1.5,
							"children": [
								{
									"type": "subFX",
									"name": "02 - FX_Directional_Explosion_High",
									"source": "Fx/Explosion/FX_Directional_Explosion_High.fx",
									"x": -9.37032,
									"y": -6.07834,
									"z": -0.60266,
									"scaleX": 0.5,
									"scaleY": 0.5,
									"scaleZ": 0.5,
									"rotationX": 0.8,
									"rotationY": -34.2,
									"rotationZ": -18.9,
									"time": 0.315
								},
								{
									"type": "subFX",
									"name": "01 - FX_Directional_Explosion_High",
									"source": "Fx/Explosion/FX_Directional_Explosion_High.fx",
									"x": -1.3428300000000002,
									"y": -6.8114799999999995,
									"z": -0.9155399999999999,
									"scaleX": 0.7,
									"scaleY": 0.7,
									"scaleZ": 0.7,
									"rotationX": -10.699999999999998,
									"rotationY": 7.951386703658792e-16,
									"rotationZ": 89.99999999999999,
									"time": 0.125
								},
								{
									"type": "subFX",
									"name": "FX_Directional_Explosion_High_ElectricSparks",
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_ElectricSparkles.fx",
									"x": 0.1120399999999997,
									"y": -8.78316,
									"z": -0.57832,
									"scaleX": 0.6499999999999999,
									"scaleY": 0.6499999999999999,
									"scaleZ": 0.6499999999999999,
									"rotationX": 30.4,
									"rotationY": 11.299999999999994,
									"rotationZ": 6.499999999999998,
									"time": 0.95444
								},
								{
									"type": "subFX",
									"name": "FX_Directional_Explosion_High_ElectricSparks",
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_ElectricSparkles.fx",
									"x": -10.44496,
									"y": -10.10792,
									"z": 1.47895,
									"scaleX": 0.8,
									"scaleY": 0.8,
									"scaleZ": 0.8,
									"rotationX": 69.5,
									"rotationY": 10.4,
									"rotationZ": -12.1,
									"time": 0.95444
								},
								{
									"type": "subFX",
									"name": "FX_Directional_Explosion_High_ElectricSparks",
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_ElectricSparkles.fx",
									"x": -11.81487,
									"y": -8.2647,
									"z": 0.16674,
									"scaleX": 0.6,
									"scaleY": 0.6,
									"scaleZ": 0.6,
									"rotationY": -62,
									"time": 0.95444
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
									"type": "subFX",
									"name": "FX_ScreenShake02",
									"source": "Fx/Explosion/FX_ScreenShake02.fx",
									"z": 0.5877900000000001,
									"rotationZ": 150.00000000000003,
									"time": 1.0436,
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
								}
							]
						},
						{
							"type": "object",
							"name": "BaseLights",
							"x": 1.4178933333333332,
							"y": 6.831492857142857,
							"z": -1.4569404761904763,
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
														"texture": "Fx/Gradients/dGrad03.png",
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
																	"time": 1.3975407892448641,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.5388313263572575,
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
																	"time": 2.25,
																	"value": 0,
																	"mode": 0,
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