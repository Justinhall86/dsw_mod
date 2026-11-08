{
	"type": "fx",
	"duration": 25,
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "polygon",
					"name": "Floor",
					"editorOnly": true,
					"locked": true,
					"scaleX": 500,
					"scaleY": 500,
					"scaleZ": 500,
					"color": -7895161,
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
							"color": [
								0.12549019607843137,
								0.12549019607843137,
								0.17254901960784313,
								1
							]
						}
					]
				},
				{
					"type": "model",
					"name": "CorrinoBase",
					"source": "Structure/Base/Corrino/CorrinoBase.fbx",
					"enabled": false,
					"rotationZ": -150,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Structure/Base/Corrino/Anim_CorrinoBase.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "Atterrissage",
					"x": 0.11431166666666667,
					"y": 0.7666933333333332,
					"z": 1.4206633333333332,
					"children": [
						{
							"type": "emitter",
							"name": "HeatWave_Distort",
							"props": {
								"lifeTime": 6,
								"lifeTimeRand": 2,
								"emitRate": 2,
								"useRandomColor": true,
								"randomColor1": [
									1,
									1,
									1,
									0.8313725490196078
								],
								"randomColor2": [
									0.9019607843137255,
									0.9019607843137255,
									0.9019607843137255,
									0.7294117647058823
								],
								"instScale": 250,
								"instRotation_rand": [
									0,
									0,
									360
								],
								"instScale_rand": 20
							},
							"x": -0.11431166666666667,
							"y": -0.7666933333333331,
							"z": 1.1559066666666666,
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
													"mode": "Distortion",
													"blend": "Alpha",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"depthTest": "LessEqual"
												}
											}
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
												"vOffset": 0,
												"texture": "Fx/Alphas/T_ChocWave_Blurred_02.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.1072413710626145,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.0058489084243771305,
																"dt": -0.06672153635116596
															},
															"nextHandle": {
																"dv": 0.0058489084243771305,
																"dt": 0.06672153635116596
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.8,
												"sandColorSet": false,
												"envBlend": 0.2,
												"envColorSet": false
											}
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													1,
													1
												]
											}
										},
										{
											"type": "shader",
											"name": "DistortionMap",
											"source": "shaders/DistortionMap.hx",
											"props": {
												"distortionDir": "Fx/DistortionMaps/sand-normal.png",
												"intensity": 0.04
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keyMode": 1,
									"keys": [
										{
											"time": -0.01394734457883267,
											"value": 0,
											"mode": 0
										},
										{
											"time": 1.0602391808606801,
											"value": 1,
											"mode": 1,
											"prevHandle": {
												"dv": -0.5333333333333333,
												"dt": -0.4725329589843752
											},
											"nextHandle": {
												"dv": 0.016666666666666607,
												"dt": 0.31836303710937575
											}
										},
										{
											"time": 4.798457903166657,
											"value": 0.9833333333333334,
											"mode": 0,
											"prevHandle": {
												"dv": 0.016666666666666607,
												"dt": -0.21809168368578025
											},
											"nextHandle": {
												"dv": -0.049836898730717664,
												"dt": 0.6521407892315909
											}
										},
										{
											"time": 7.929159096086367,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5
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
											"value": 0.1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.9944446984687934,
												"dt": -0.48890120703870477
											},
											"nextHandle": {
												"dv": 0.7,
												"dt": 0.3425225781956737
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Chockwave",
							"props": {
								"lifeTime": 6,
								"lifeTimeRand": 2,
								"emitRate": 2,
								"useRandomColor": true,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"randomColor2": [
									0.9019607843137255,
									0.9019607843137255,
									0.9019607843137255,
									0.7294117647058823
								],
								"instScale": 250,
								"instRotation_rand": [
									0,
									0,
									360
								],
								"instScale_rand": 20
							},
							"x": -0.11431166666666667,
							"y": -0.7666933333333331,
							"z": 1.1559066666666666,
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
													"depthTest": "LessEqual"
												}
											}
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
												"vOffset": 0,
												"texture": "Fx/Alphas/T_LensFlare_03.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.1072413710626145,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.0058489084243771305,
																"dt": -0.06672153635116596
															},
															"nextHandle": {
																"dv": 0.0058489084243771305,
																"dt": 0.06672153635116596
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.8,
												"sandColorSet": false,
												"envBlend": 0.8,
												"envColorSet": false
											}
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													1,
													1
												]
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keyMode": 1,
									"keys": [
										{
											"time": 0.40925237178103324,
											"value": 0,
											"mode": 0
										},
										{
											"time": 1.0602391808606801,
											"value": 1,
											"mode": 1,
											"prevHandle": {
												"dv": -0.5333333333333333,
												"dt": -0.4725329589843752
											},
											"nextHandle": {
												"dv": 0.016666666666666607,
												"dt": 0.31836303710937575
											}
										},
										{
											"time": 3.977760754229105,
											"value": 0.9833333333333334,
											"mode": 0,
											"prevHandle": {
												"dv": 0.016666666666666607,
												"dt": -0.21809168368578025
											},
											"nextHandle": {
												"dv": -0.049836898730717664,
												"dt": 0.6521407892315909
											}
										},
										{
											"time": 7.01325151400811,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5
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
											"value": 0.1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.9944446984687934,
												"dt": -0.48890120703870477
											},
											"nextHandle": {
												"dv": 0.7,
												"dt": 0.3425225781956737
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Sand_Center",
							"props": {
								"instScale_rand": 5,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									0.9686274509803922,
									0.9568627450980391,
									0.9490196078431372,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"lifeTimeRand": 1,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 60,
								"lifeTime": 3,
								"emitRad1": 0.25,
								"emitRad2": 0.71,
								"randomColor2": [
									0.5333333333333333,
									0.5058823529411764,
									0.49411764705882355,
									0.8588235294117647
								],
								"instSpeed_rand": [
									3,
									0,
									0
								],
								"maxCount": 70,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
								"instWorldAcceleration_rand": [
									1,
									1,
									0
								],
								"instSpeed": [
									5,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"seedGroup": 2,
								"useRandomColor": true
							},
							"x": -0.3403716666666667,
							"y": -1.0655233333333332,
							"z": -0.5779533333333332,
							"scaleX": 30.000000000000004,
							"scaleY": 30.000000000000004,
							"scaleZ": 0.1,
							"rotationZ": -57.3,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												0.27058823529411763
											]
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
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.15,
															"value": 1,
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
													1,
													1,
													1
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
												"progress": 0.7,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.02
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
															"value": 0.9,
															"mode": 0,
															"prevHandle": {
																"dv": 1.250468545740539,
																"dt": -0.330632361246651
															},
															"nextHandle": {
																"dv": -0.9833333333333334,
																"dt": 0.26
															}
														},
														{
															"time": 1.5,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.6,
											"topSpan": 0.3,
											"dirIntensity": 0.1,
											"dirSpan": 0,
											"sandBlend": 0.6,
											"envBlend": 0.7
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 29.55,
												"power": 12.12
											},
											"isInstance": true
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
											"value": 0.0035385342353464466,
											"mode": 0,
											"prevHandle": {
												"dv": -0.827144588185986,
												"dt": -0.512990755987711
											},
											"nextHandle": {
												"dv": 0.537534364642519,
												"dt": 0.3374369812011724
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": -0.0548504453716856,
												"dt": -0.5364207458496086
											},
											"nextHandle": {
												"dv": 0.03370328877818467,
												"dt": 0.33218191941495984
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keyMode": 1,
									"keys": [
										{
											"time": -0.01394734457883267,
											"value": 0,
											"mode": 0
										},
										{
											"time": 0.7508637032683003,
											"value": 1,
											"mode": 1,
											"prevHandle": {
												"dv": -0.5333333333333333,
												"dt": -0.4725329589843752
											},
											"nextHandle": {
												"dv": 0.016666666666666607,
												"dt": 0.31836303710937575
											}
										},
										{
											"time": 1.9228979925056335,
											"value": 0.9833333333333334,
											"mode": 0,
											"prevHandle": {
												"dv": 0.016666666666666607,
												"dt": -0.21809168368578025
											},
											"nextHandle": {
												"dv": -0.049836898730717664,
												"dt": 0.6521407892315909
											}
										},
										{
											"time": 4.296830530606446,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Sand_Back",
							"props": {
								"instScale_rand": 5,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									0.9686274509803922,
									0.9568627450980391,
									0.9490196078431372,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"lifeTimeRand": 1,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 30,
								"lifeTime": 3,
								"emitRad1": 0.25,
								"emitRad2": 0.71,
								"randomColor2": [
									0.5333333333333333,
									0.5058823529411764,
									0.49411764705882355,
									0.8588235294117647
								],
								"instSpeed_rand": [
									3,
									0,
									0
								],
								"emitRate": 15,
								"maxCount": 70,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
								"instWorldAcceleration_rand": [
									1,
									1,
									0
								],
								"instSpeed": [
									10,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"emitAngle": 60,
								"seedGroup": 2,
								"useRandomColor": true
							},
							"x": 4.501768333333334,
							"y": -8.703103333333333,
							"z": -0.5779533333333332,
							"scaleX": 57.27000000000001,
							"scaleY": 80,
							"scaleZ": 0.1,
							"rotationZ": -57.3,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												0.27058823529411763
											]
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
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.15,
															"value": 1,
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
													1,
													1,
													1
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
												"progress": 0.7,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.02
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
															"value": 0.9,
															"mode": 0,
															"prevHandle": {
																"dv": 1.250468545740539,
																"dt": -0.330632361246651
															},
															"nextHandle": {
																"dv": -0.9833333333333334,
																"dt": 0.26
															}
														},
														{
															"time": 1.5,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.6,
											"topSpan": 0.3,
											"dirIntensity": 0.1,
											"dirSpan": 0,
											"sandBlend": 0.6,
											"envBlend": 0.7
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 62.88,
												"power": 25.76
											},
											"isInstance": true
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
											"value": 0.0035385342353464466,
											"mode": 0,
											"prevHandle": {
												"dv": -0.827144588185986,
												"dt": -0.512990755987711
											},
											"nextHandle": {
												"dv": 0.537534364642519,
												"dt": 0.3374369812011724
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": -0.0548504453716856,
												"dt": -0.5364207458496086
											},
											"nextHandle": {
												"dv": 0.03370328877818467,
												"dt": 0.33218191941495984
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keyMode": 1,
									"keys": [
										{
											"time": -0.01394734457883267,
											"value": 0,
											"mode": 0
										},
										{
											"time": 1.0602391808606801,
											"value": 1,
											"mode": 1,
											"prevHandle": {
												"dv": -0.5333333333333333,
												"dt": -0.4725329589843752
											},
											"nextHandle": {
												"dv": 0.016666666666666607,
												"dt": 0.31836303710937575
											}
										},
										{
											"time": 3.3725649252273637,
											"value": 0.9833333333333334,
											"mode": 0
										},
										{
											"time": 3.3725649252273637,
											"value": 0.9833333333333334,
											"mode": 0
										},
										{
											"time": 3.3725649252273637,
											"value": 0.9833333333333334,
											"mode": 0,
											"prevHandle": {
												"dv": 0.016666666666666607,
												"dt": -0.21809168368578025
											},
											"nextHandle": {
												"dv": -0.049836898730717664,
												"dt": 0.6521407892315909
											}
										},
										{
											"time": 7.993478030671133,
											"value": 0,
											"mode": 0
										},
										{
											"time": 7.993478030671133,
											"value": 0,
											"mode": 0
										},
										{
											"time": 7.993478030671133,
											"value": 0,
											"mode": 0
										},
										{
											"time": 7.993478030671133,
											"value": 0,
											"mode": 0
										},
										{
											"time": 7.993478030671133,
											"value": 0,
											"mode": 0
										},
										{
											"time": 7.993478030671133,
											"value": 0,
											"mode": 0
										},
										{
											"time": 7.993478030671133,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Sand_Left",
							"props": {
								"instScale_rand": 5,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									0.9686274509803922,
									0.9568627450980391,
									0.9490196078431372,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"lifeTimeRand": 1,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 30,
								"lifeTime": 3,
								"emitRad1": 0.36,
								"emitRad2": 0.58,
								"randomColor2": [
									0.5333333333333333,
									0.5058823529411764,
									0.49411764705882355,
									0.8509803921568627
								],
								"instSpeed_rand": [
									3,
									0,
									0
								],
								"emitRate": 15,
								"maxCount": 70,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
								"instWorldAcceleration_rand": [
									1,
									1,
									0
								],
								"instSpeed": [
									10,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"emitAngle": 141.82,
								"useRandomColor": true
							},
							"x": -3.6561516666666662,
							"y": 5.2923566666666675,
							"z": -0.5779533333333332,
							"scaleX": 57.269999999999996,
							"scaleY": 80,
							"scaleZ": 0.1,
							"rotationZ": -171.8,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												0.27058823529411763
											]
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
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.15,
															"value": 1,
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
													1,
													1,
													1
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
												"progress": 0.7,
												"saturation": 0.2,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.02
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
															"value": 0.9,
															"mode": 0,
															"prevHandle": {
																"dv": 1.250468545740539,
																"dt": -0.330632361246651
															},
															"nextHandle": {
																"dv": -0.9833333333333334,
																"dt": 0.26
															}
														},
														{
															"time": 1.5,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.6,
											"topSpan": 0.3,
											"dirIntensity": 0.1,
											"dirSpan": 0,
											"sandBlend": 0.6,
											"envBlend": 0.7
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 62.88,
												"power": 25.76
											},
											"isInstance": true
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
											"value": 0.0035385342353464466,
											"mode": 0,
											"prevHandle": {
												"dv": -0.827144588185986,
												"dt": -0.512990755987711
											},
											"nextHandle": {
												"dv": 0.537534364642519,
												"dt": 0.3374369812011724
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": -0.0548504453716856,
												"dt": -0.5364207458496086
											},
											"nextHandle": {
												"dv": 0.03370328877818467,
												"dt": 0.33218191941495984
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keyMode": 1,
									"keys": [
										{
											"time": -0.01394734457883267,
											"value": 0,
											"mode": 0
										},
										{
											"time": 1.0602391808606801,
											"value": 1,
											"mode": 1,
											"prevHandle": {
												"dv": -0.5333333333333333,
												"dt": -0.4725329589843752
											},
											"nextHandle": {
												"dv": 0.016666666666666607,
												"dt": 0.31836303710937575
											}
										},
										{
											"time": 3.3725649252273637,
											"value": 0.9833333333333334,
											"mode": 0,
											"prevHandle": {
												"dv": 0.016666666666666607,
												"dt": -0.21809168368578025
											},
											"nextHandle": {
												"dv": -0.049836898730717664,
												"dt": 0.6521407892315909
											}
										},
										{
											"time": 7.993478030671133,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Sand_Right",
							"props": {
								"instScale_rand": 5,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									0.9686274509803922,
									0.9568627450980391,
									0.9490196078431372,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"lifeTimeRand": 1,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 30,
								"lifeTime": 3,
								"emitRad1": 0.36,
								"emitRad2": 0.58,
								"randomColor2": [
									0.5333333333333333,
									0.5058823529411764,
									0.49411764705882355,
									0.8509803921568627
								],
								"instSpeed_rand": [
									3,
									0,
									0
								],
								"emitRate": 15,
								"maxCount": 70,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
								"instWorldAcceleration_rand": [
									1,
									1,
									0
								],
								"instSpeed": [
									10,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"emitAngle": 141.82,
								"useRandomColor": true
							},
							"x": -0.2766216666666669,
							"y": 6.009656666666666,
							"z": -0.5779533333333332,
							"scaleX": 57.27000000000001,
							"scaleY": 80,
							"scaleZ": 0.1,
							"rotationZ": 49.1,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												0.27058823529411763
											]
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
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.15,
															"value": 1,
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
													1,
													1,
													1
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
												"progress": 0.7,
												"saturation": 0.2,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.02
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
															"value": 0.9,
															"mode": 0,
															"prevHandle": {
																"dv": 1.250468545740539,
																"dt": -0.330632361246651
															},
															"nextHandle": {
																"dv": -0.9833333333333334,
																"dt": 0.26
															}
														},
														{
															"time": 1.5,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.6,
											"topSpan": 0.3,
											"dirIntensity": 0.1,
											"dirSpan": 0,
											"sandBlend": 0.6,
											"envBlend": 0.7
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 62.88,
												"power": 25.76
											},
											"isInstance": true
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
											"value": 0.0035385342353464466,
											"mode": 0,
											"prevHandle": {
												"dv": -0.827144588185986,
												"dt": -0.512990755987711
											},
											"nextHandle": {
												"dv": 0.537534364642519,
												"dt": 0.3374369812011724
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": -0.0548504453716856,
												"dt": -0.5364207458496086
											},
											"nextHandle": {
												"dv": 0.03370328877818467,
												"dt": 0.33218191941495984
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keyMode": 1,
									"keys": [
										{
											"time": -0.01394734457883267,
											"value": 0,
											"mode": 0
										},
										{
											"time": -0.01394734457883267,
											"value": 0,
											"mode": 0
										},
										{
											"time": -0.01394734457883267,
											"value": 0,
											"mode": 0
										},
										{
											"time": -0.01394734457883267,
											"value": 0,
											"mode": 0
										},
										{
											"time": -0.01394734457883267,
											"value": 0,
											"mode": 0
										},
										{
											"time": 1.0602391808606801,
											"value": 1,
											"mode": 1
										},
										{
											"time": 1.0602391808606801,
											"value": 1,
											"mode": 1
										},
										{
											"time": 1.0602391808606801,
											"value": 1,
											"mode": 1
										},
										{
											"time": 1.0602391808606801,
											"value": 1,
											"mode": 1
										},
										{
											"time": 1.0602391808606801,
											"value": 1,
											"mode": 1,
											"prevHandle": {
												"dv": -0.5333333333333333,
												"dt": -0.4725329589843752
											},
											"nextHandle": {
												"dv": 0.016666666666666607,
												"dt": 0.31836303710937575
											}
										},
										{
											"time": 3.3725649252273637,
											"value": 0.9833333333333334,
											"mode": 0
										},
										{
											"time": 3.3725649252273637,
											"value": 0.9833333333333334,
											"mode": 0
										},
										{
											"time": 3.3725649252273637,
											"value": 0.9833333333333334,
											"mode": 0
										},
										{
											"time": 3.3725649252273637,
											"value": 0.9833333333333334,
											"mode": 0
										},
										{
											"time": 3.3725649252273637,
											"value": 0.9833333333333334,
											"mode": 0
										},
										{
											"time": 3.3725649252273637,
											"value": 0.9833333333333334,
											"mode": 0
										},
										{
											"time": 3.3725649252273637,
											"value": 0.9833333333333334,
											"mode": 0,
											"prevHandle": {
												"dv": 0.016666666666666607,
												"dt": -0.21809168368578025
											},
											"nextHandle": {
												"dv": -0.049836898730717664,
												"dt": 0.6521407892315909
											}
										},
										{
											"time": 7.993478030671133,
											"value": 0,
											"mode": 0
										},
										{
											"time": 7.993478030671133,
											"value": 0,
											"mode": 0
										},
										{
											"time": 7.993478030671133,
											"value": 0,
											"mode": 0
										},
										{
											"time": 7.993478030671133,
											"value": 0,
											"mode": 0
										},
										{
											"time": 7.993478030671133,
											"value": 0,
											"mode": 0
										},
										{
											"time": 7.993478030671133,
											"value": 0,
											"mode": 0
										},
										{
											"time": 7.993478030671133,
											"value": 0,
											"mode": 0
										},
										{
											"time": 7.993478030671133,
											"value": 0,
											"mode": 0
										},
										{
											"time": 7.993478030671133,
											"value": 0,
											"mode": 0
										},
										{
											"time": 7.993478030671133,
											"value": 0,
											"mode": 0
										},
										{
											"time": 7.993478030671133,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5
											}
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Deploiement",
					"enabled": false,
					"x": 0.11431166666666667,
					"y": 0.7666933333333332,
					"z": 1.4206633333333332,
					"children": [
						{
							"type": "emitter",
							"name": "SandFloor_G",
							"props": {
								"instScale_rand": 5,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									0.9686274509803922,
									0.9568627450980391,
									0.9490196078431372,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"lifeTimeRand": 1,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 24,
								"lifeTime": 3,
								"emitRad1": 0.36,
								"emitRad2": 0.58,
								"randomColor2": [
									0.5333333333333333,
									0.5058823529411764,
									0.49411764705882355,
									0.8509803921568627
								],
								"instSpeed_rand": [
									3,
									0,
									0
								],
								"emitRate": 20,
								"maxCount": 70,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
								"instWorldAcceleration_rand": [
									1,
									1,
									0
								],
								"instSpeed": [
									6,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"emitAngle": 80,
								"useRandomColor": true,
								"seedGroup": 16,
								"warmUpTime": -3,
								"instStretch": [
									1,
									0.6,
									1
								],
								"instStretch_rand": [
									0,
									0.25,
									0
								]
							},
							"x": -6.06452,
							"y": 3.28818,
							"z": -0.57795,
							"scaleX": 47.89,
							"scaleY": 61.82,
							"scaleZ": 0.1,
							"rotationZ": -171.8,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												0.27058823529411763
											]
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
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.15,
															"value": 1,
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
													1,
													1,
													1
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
												"progress": 0.7,
												"saturation": 0.1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.02
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
															"value": 0.9,
															"mode": 0,
															"prevHandle": {
																"dv": 1.250468545740539,
																"dt": -0.330632361246651
															},
															"nextHandle": {
																"dv": -0.9833333333333334,
																"dt": 0.26
															}
														},
														{
															"time": 1.5,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.6,
											"topSpan": 0.3,
											"dirIntensity": 0.1,
											"dirSpan": 0,
											"sandBlend": 0.6,
											"envBlend": 0.7
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 62.88,
												"power": 25.76
											},
											"isInstance": true
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
											"value": 0.0035385342353464466,
											"mode": 0,
											"prevHandle": {
												"dv": -0.827144588185986,
												"dt": -0.512990755987711
											},
											"nextHandle": {
												"dv": 0.537534364642519,
												"dt": 0.3374369812011724
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": -0.0548504453716856,
												"dt": -0.5364207458496086
											},
											"nextHandle": {
												"dv": 0.03370328877818467,
												"dt": 0.33218191941495984
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keyMode": 1,
									"keys": [
										{
											"time": -0.008955438443594144,
											"value": 0,
											"mode": 0
										},
										{
											"time": 0.8799149246089122,
											"value": 1,
											"mode": 1,
											"prevHandle": {
												"dv": -0.5333333333333333,
												"dt": -0.4725329589843752
											},
											"nextHandle": {
												"dv": 0.016666666666666607,
												"dt": 0.31836303710937575
											}
										},
										{
											"time": 2.2142308846637193,
											"value": 0.9833333333333334,
											"mode": 0,
											"prevHandle": {
												"dv": 0.016666666666666607,
												"dt": -0.21809168368578025
											},
											"nextHandle": {
												"dv": -0.049836898730717664,
												"dt": 0.6521407892315909
											}
										},
										{
											"time": 4.916861774193876,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "SandFloor_D",
							"props": {
								"instScale_rand": 5,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									0.9686274509803922,
									0.9568627450980391,
									0.9490196078431372,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"lifeTimeRand": 1,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 24,
								"lifeTime": 3,
								"emitRad1": 0.36,
								"emitRad2": 0.58,
								"randomColor2": [
									0.5333333333333333,
									0.5058823529411764,
									0.49411764705882355,
									0.8509803921568627
								],
								"instSpeed_rand": [
									3,
									0,
									0
								],
								"emitRate": 20,
								"maxCount": 70,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
								"instWorldAcceleration_rand": [
									1,
									1,
									0
								],
								"instSpeed": [
									6,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"emitAngle": 80,
								"useRandomColor": true,
								"warmUpTime": -3,
								"instStretch": [
									1,
									0.6,
									1
								],
								"instStretch_rand": [
									0,
									0.25,
									0
								]
							},
							"x": 0.59661,
							"y": 5.57885,
							"z": -0.57795,
							"scaleX": 47.89,
							"scaleY": 61.82,
							"scaleZ": 0.1,
							"rotationZ": 49.1,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												0.27058823529411763
											]
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
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.15,
															"value": 1,
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
													1,
													1,
													1
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
												"progress": 0.7,
												"saturation": 0.1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.02
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
															"value": 0.9,
															"mode": 0,
															"prevHandle": {
																"dv": 1.250468545740539,
																"dt": -0.330632361246651
															},
															"nextHandle": {
																"dv": -0.9833333333333334,
																"dt": 0.26
															}
														},
														{
															"time": 1.5,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.6,
											"topSpan": 0.3,
											"dirIntensity": 0.1,
											"dirSpan": 0,
											"sandBlend": 0.6,
											"envBlend": 0.7
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 62.88,
												"power": 25.76
											},
											"isInstance": true
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
											"value": 0.0035385342353464466,
											"mode": 0,
											"prevHandle": {
												"dv": -0.827144588185986,
												"dt": -0.512990755987711
											},
											"nextHandle": {
												"dv": 0.537534364642519,
												"dt": 0.3374369812011724
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": -0.0548504453716856,
												"dt": -0.5364207458496086
											},
											"nextHandle": {
												"dv": 0.03370328877818467,
												"dt": 0.33218191941495984
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keyMode": 1,
									"keys": [
										{
											"time": -0.008955438443594144,
											"value": 0,
											"mode": 0
										},
										{
											"time": -0.008955438443594144,
											"value": 0,
											"mode": 0
										},
										{
											"time": -0.008955438443594144,
											"value": 0,
											"mode": 0
										},
										{
											"time": -0.008955438443594144,
											"value": 0,
											"mode": 0
										},
										{
											"time": -0.008955438443594144,
											"value": 0,
											"mode": 0
										},
										{
											"time": 0.8799149246089122,
											"value": 1,
											"mode": 1
										},
										{
											"time": 0.8799149246089122,
											"value": 1,
											"mode": 1
										},
										{
											"time": 0.8799149246089122,
											"value": 1,
											"mode": 1
										},
										{
											"time": 0.8799149246089122,
											"value": 1,
											"mode": 1
										},
										{
											"time": 0.8799149246089122,
											"value": 1,
											"mode": 1,
											"prevHandle": {
												"dv": -0.5333333333333333,
												"dt": -0.4725329589843752
											},
											"nextHandle": {
												"dv": 0.016666666666666607,
												"dt": 0.31836303710937575
											}
										},
										{
											"time": 2.2142308846637193,
											"value": 0.9833333333333334,
											"mode": 0
										},
										{
											"time": 2.2142308846637193,
											"value": 0.9833333333333334,
											"mode": 0
										},
										{
											"time": 2.2142308846637193,
											"value": 0.9833333333333334,
											"mode": 0
										},
										{
											"time": 2.2142308846637193,
											"value": 0.9833333333333334,
											"mode": 0
										},
										{
											"time": 2.2142308846637193,
											"value": 0.9833333333333334,
											"mode": 0
										},
										{
											"time": 2.2142308846637193,
											"value": 0.9833333333333334,
											"mode": 0
										},
										{
											"time": 2.2142308846637193,
											"value": 0.9833333333333334,
											"mode": 0,
											"prevHandle": {
												"dv": 0.016666666666666607,
												"dt": -0.21809168368578025
											},
											"nextHandle": {
												"dv": -0.049836898730717664,
												"dt": 0.6521407892315909
											}
										},
										{
											"time": 4.916861774193876,
											"value": 0,
											"mode": 0
										},
										{
											"time": 4.916861774193876,
											"value": 0,
											"mode": 0
										},
										{
											"time": 4.916861774193876,
											"value": 0,
											"mode": 0
										},
										{
											"time": 4.916861774193876,
											"value": 0,
											"mode": 0
										},
										{
											"time": 4.916861774193876,
											"value": 0,
											"mode": 0
										},
										{
											"time": 4.916861774193876,
											"value": 0,
											"mode": 0
										},
										{
											"time": 4.916861774193876,
											"value": 0,
											"mode": 0
										},
										{
											"time": 4.916861774193876,
											"value": 0,
											"mode": 0
										},
										{
											"time": 4.916861774193876,
											"value": 0,
											"mode": 0
										},
										{
											"time": 4.916861774193876,
											"value": 0,
											"mode": 0
										},
										{
											"time": 4.916861774193876,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "SandFloor_Arière",
							"props": {
								"instScale_rand": 5,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									0.9686274509803922,
									0.9568627450980391,
									0.9490196078431372,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"lifeTimeRand": 1,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 24,
								"lifeTime": 3,
								"emitRad1": 0.36,
								"emitRad2": 0.58,
								"randomColor2": [
									0.5333333333333333,
									0.5058823529411764,
									0.49411764705882355,
									0.8509803921568627
								],
								"instSpeed_rand": [
									3,
									0,
									0
								],
								"emitRate": 20,
								"maxCount": 70,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
								"instWorldAcceleration_rand": [
									1,
									1,
									0
								],
								"instSpeed": [
									6,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"emitAngle": 152.73,
								"useRandomColor": true,
								"warmUpTime": -3,
								"instStretch": [
									1,
									0.6,
									1
								],
								"instStretch_rand": [
									0,
									0.25,
									0
								],
								"seedGroup": 14
							},
							"x": 3.15763,
							"y": -7.83966,
							"z": -0.57795,
							"scaleX": 47.89,
							"scaleY": 33.82,
							"scaleZ": 0.1,
							"rotationZ": -55.7,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												0.27058823529411763
											]
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
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.15,
															"value": 1,
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
													1,
													1,
													1
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
												"progress": 0.7,
												"saturation": 0.1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.02
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
															"value": 0.9,
															"mode": 0,
															"prevHandle": {
																"dv": 1.250468545740539,
																"dt": -0.330632361246651
															},
															"nextHandle": {
																"dv": -0.9833333333333334,
																"dt": 0.26
															}
														},
														{
															"time": 1.5,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.6,
											"topSpan": 0.3,
											"dirIntensity": 0.1,
											"dirSpan": 0,
											"sandBlend": 0.6,
											"envBlend": 0.7
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 62.88,
												"power": 25.76
											},
											"isInstance": true
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
											"value": 0.0035385342353464466,
											"mode": 0,
											"prevHandle": {
												"dv": -0.827144588185986,
												"dt": -0.512990755987711
											},
											"nextHandle": {
												"dv": 0.537534364642519,
												"dt": 0.3374369812011724
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": -0.0548504453716856,
												"dt": -0.5364207458496086
											},
											"nextHandle": {
												"dv": 0.03370328877818467,
												"dt": 0.33218191941495984
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keyMode": 1,
									"keys": [
										{
											"time": -0.008955438443594144,
											"value": 0,
											"mode": 0
										},
										{
											"time": -0.008955438443594144,
											"value": 0,
											"mode": 0
										},
										{
											"time": -0.008955438443594144,
											"value": 0,
											"mode": 0
										},
										{
											"time": -0.008955438443594144,
											"value": 0,
											"mode": 0
										},
										{
											"time": -0.008955438443594144,
											"value": 0,
											"mode": 0
										},
										{
											"time": 0.8799149246089122,
											"value": 1,
											"mode": 1
										},
										{
											"time": 0.8799149246089122,
											"value": 1,
											"mode": 1
										},
										{
											"time": 0.8799149246089122,
											"value": 1,
											"mode": 1
										},
										{
											"time": 0.8799149246089122,
											"value": 1,
											"mode": 1
										},
										{
											"time": 0.8799149246089122,
											"value": 1,
											"mode": 1,
											"prevHandle": {
												"dv": -0.5333333333333333,
												"dt": -0.4725329589843752
											},
											"nextHandle": {
												"dv": 0.016666666666666607,
												"dt": 0.31836303710937575
											}
										},
										{
											"time": 2.2142308846637193,
											"value": 0.9833333333333334,
											"mode": 0
										},
										{
											"time": 2.2142308846637193,
											"value": 0.9833333333333334,
											"mode": 0
										},
										{
											"time": 2.2142308846637193,
											"value": 0.9833333333333334,
											"mode": 0
										},
										{
											"time": 2.2142308846637193,
											"value": 0.9833333333333334,
											"mode": 0
										},
										{
											"time": 2.2142308846637193,
											"value": 0.9833333333333334,
											"mode": 0
										},
										{
											"time": 2.2142308846637193,
											"value": 0.9833333333333334,
											"mode": 0
										},
										{
											"time": 2.2142308846637193,
											"value": 0.9833333333333334,
											"mode": 0,
											"prevHandle": {
												"dv": 0.016666666666666607,
												"dt": -0.21809168368578025
											},
											"nextHandle": {
												"dv": -0.049836898730717664,
												"dt": 0.6521407892315909
											}
										},
										{
											"time": 4.916861774193876,
											"value": 0,
											"mode": 0
										},
										{
											"time": 4.916861774193876,
											"value": 0,
											"mode": 0
										},
										{
											"time": 4.916861774193876,
											"value": 0,
											"mode": 0
										},
										{
											"time": 4.916861774193876,
											"value": 0,
											"mode": 0
										},
										{
											"time": 4.916861774193876,
											"value": 0,
											"mode": 0
										},
										{
											"time": 4.916861774193876,
											"value": 0,
											"mode": 0
										},
										{
											"time": 4.916861774193876,
											"value": 0,
											"mode": 0
										},
										{
											"time": 4.916861774193876,
											"value": 0,
											"mode": 0
										},
										{
											"time": 4.916861774193876,
											"value": 0,
											"mode": 0
										},
										{
											"time": 4.916861774193876,
											"value": 0,
											"mode": 0
										},
										{
											"time": 4.916861774193876,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Distort",
							"props": {
								"lifeTime": 6,
								"lifeTimeRand": 2,
								"emitRate": 2,
								"useRandomColor": true,
								"randomColor1": [
									1,
									1,
									1,
									0.8313725490196078
								],
								"randomColor2": [
									0.9019607843137255,
									0.9019607843137255,
									0.9019607843137255,
									0.7294117647058823
								],
								"instScale": 150,
								"instRotation_rand": [
									0,
									0,
									360
								],
								"instScale_rand": 20,
								"warmUpTime": -3
							},
							"x": -0.11431166666666667,
							"y": -0.7666933333333331,
							"z": 1.1559066666666666,
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
													"mode": "Distortion",
													"blend": "Alpha",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"depthTest": "LessEqual"
												}
											}
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
												"vOffset": 0,
												"texture": "Fx/Alphas/T_ChocWave_Blurred_02.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.1072413710626145,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.0058489084243771305,
																"dt": -0.06672153635116596
															},
															"nextHandle": {
																"dv": 0.0058489084243771305,
																"dt": 0.06672153635116596
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.8,
												"sandColorSet": false,
												"envBlend": 0.2,
												"envColorSet": false
											}
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													1,
													1
												]
											}
										},
										{
											"type": "shader",
											"name": "DistortionMap",
											"source": "shaders/DistortionMap.hx",
											"props": {
												"distortionDir": "Fx/DistortionMaps/sand-normal.png",
												"intensity": 0.02
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keyMode": 1,
									"keys": [
										{
											"time": -0.008955438443594144,
											"value": 0,
											"mode": 0
										},
										{
											"time": 1.199261029354163,
											"value": 1,
											"mode": 1,
											"prevHandle": {
												"dv": -0.5333333333333333,
												"dt": -0.4725329589843752
											},
											"nextHandle": {
												"dv": 0.016666666666666607,
												"dt": 0.31836303710937575
											}
										},
										{
											"time": 3.140094610862653,
											"value": 0.9833333333333334,
											"mode": 0,
											"prevHandle": {
												"dv": 0.016666666666666607,
												"dt": -0.21809168368578025
											},
											"nextHandle": {
												"dv": -0.049836898730717664,
												"dt": 0.6521407892315909
											}
										},
										{
											"time": 5.952119635515775,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5
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
											"value": 0.1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.9944446984687934,
												"dt": -0.48890120703870477
											},
											"nextHandle": {
												"dv": 0.7,
												"dt": 0.3425225781956737
											}
										},
										{
											"time": 1,
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
					"name": "Depressure",
					"x": 3.9106662500000007,
					"y": -6.324911249999999,
					"z": 2.4083762500000003,
					"children": [
						{
							"type": "emitter",
							"name": "Pressure Center",
							"props": {
								"instScale_rand": 2,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									0.9686274509803922,
									0.9568627450980391,
									0.9490196078431372,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"lifeTimeRand": 1,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 7,
								"emitRad1": 0.08,
								"emitRad2": 0.07,
								"instSpeed_rand": [
									0.1,
									0,
									0
								],
								"maxCount": 30,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
								"instWorldAcceleration_rand": [
									0.1,
									0.1,
									0
								],
								"instSpeed": [
									0.2,
									0,
									0.5
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"useRandomColor": true,
								"lifeTime": 10,
								"warmUpTime": -2,
								"seedGroup": 25,
								"randomColor2": [
									0.8901960784313725,
									0.8470588235294118,
									0.8156862745098039,
									0.8509803921568627
								]
							},
							"x": 3.29334,
							"y": -6.42191,
							"z": 2.36973,
							"scaleX": 55.8,
							"scaleY": 112,
							"scaleZ": 0.1,
							"rotationZ": 31.3,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												1
											]
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1.5
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.3280520128350777,
															"value": 1,
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
													0.9019607843137255,
													0.8431372549019608,
													0.7803921568627451
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
												"progress": 1,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.02
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
															"value": 0.9,
															"mode": 0,
															"prevHandle": {
																"dv": 0.9463220446358772,
																"dt": -1.7078404576593575
															},
															"nextHandle": {
																"dv": -0.32999999999999996,
																"dt": 0.5944444444444446
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.42,
											"topSpan": 0.32,
											"dirIntensity": 0.12,
											"dirSpan": 0,
											"sandBlend": 0.2,
											"envBlend": 0.1
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 24.24,
												"power": 100
											},
											"isInstance": true
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
											"value": 0.1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.41267536311015834,
												"dt": -0.5213528615163341
											},
											"nextHandle": {
												"dv": 0.41267536311015834,
												"dt": 0.5213528615163341
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": -0.3515556034082936,
												"dt": -0.3532141113281235
											},
											"nextHandle": {
												"dv": 0.40346224950900955,
												"dt": 0.40442840601229685
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keyMode": 1,
									"keys": [
										{
											"time": 0.42086154869291964,
											"value": 1,
											"mode": 1,
											"prevHandle": {
												"dv": -0.5333333333333333,
												"dt": -0.4725329589843752
											},
											"nextHandle": {
												"dv": 0.016666666666666607,
												"dt": 0.31836303710937575
											}
										},
										{
											"time": 1.458757491909638,
											"value": 0.9833333333333334,
											"mode": 0,
											"prevHandle": {
												"dv": 0.016666666666666607,
												"dt": -0.21809168368578025
											},
											"nextHandle": {
												"dv": -0.049836898730717664,
												"dt": 0.6521407892315909
											}
										},
										{
											"time": 2.609526880310006,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Pressure Platform",
							"enabled": false,
							"props": {
								"instScale_rand": 2,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									0.9686274509803922,
									0.9568627450980391,
									0.9490196078431372,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"lifeTimeRand": 1,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 6,
								"emitRad1": 0.08,
								"emitRad2": 0.07,
								"instSpeed_rand": [
									0.1,
									0,
									0
								],
								"emitRate": 4,
								"maxCount": 30,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
								"instWorldAcceleration_rand": [
									0.1,
									0.1,
									0
								],
								"instSpeed": [
									0.2,
									0,
									0.5
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"useRandomColor": true,
								"lifeTime": 10,
								"warmUpTime": -1,
								"randomColor2": [
									0.8901960784313725,
									0.8470588235294118,
									0.8156862745098039,
									0.8509803921568627
								],
								"emitAngle": 160.91
							},
							"x": -2.12649,
							"y": 3.42742,
							"z": 0.5302099999999998,
							"scaleX": 130,
							"scaleY": 59.99999999999999,
							"scaleZ": 0.1,
							"rotationZ": 121.79999999999997,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												1
											]
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1.5
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.3280520128350777,
															"value": 1,
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
													0.9019607843137255,
													0.8431372549019608,
													0.7803921568627451
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
												"progress": 1,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.02
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
															"value": 0.9,
															"mode": 0,
															"prevHandle": {
																"dv": 0.9463220446358772,
																"dt": -1.7078404576593575
															},
															"nextHandle": {
																"dv": -0.32999999999999996,
																"dt": 0.5944444444444446
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.42,
											"topSpan": 0.32,
											"dirIntensity": 0.12,
											"dirSpan": 0,
											"sandBlend": 0.2,
											"envBlend": 0.1
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 24.24,
												"power": 100
											},
											"isInstance": true
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
											"value": 0.1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0429526893013092,
												"dt": -0.5538778397447126
											},
											"nextHandle": {
												"dv": -0.01757778017041467,
												"dt": 0.22555555555555562
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": -0.8261556680094899,
												"dt": -0.28555555555555545
											},
											"nextHandle": {
												"dv": 0.7778945158654572,
												"dt": 0.2678281853767885
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keyMode": 1,
									"keys": [
										{
											"time": 0.42086154869291964,
											"value": 1,
											"mode": 1,
											"prevHandle": {
												"dv": -0.5333333333333333,
												"dt": -0.4725329589843752
											},
											"nextHandle": {
												"dv": 0.016666666666666607,
												"dt": 0.31836303710937575
											}
										},
										{
											"time": 1.458757491909638,
											"value": 0.9833333333333334,
											"mode": 0,
											"prevHandle": {
												"dv": 0.016666666666666607,
												"dt": -0.21809168368578025
											},
											"nextHandle": {
												"dv": -0.049836898730717664,
												"dt": 0.6521407892315909
											}
										},
										{
											"time": 2.609526880310006,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Pressure_Colonne_D1",
							"props": {
								"instScale_rand": 2,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									0.9686274509803922,
									0.9568627450980391,
									0.9490196078431372,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"lifeTimeRand": 1,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 4,
								"emitRad1": 0.08,
								"emitRad2": 0.07,
								"instSpeed_rand": [
									0.1,
									0,
									0
								],
								"emitRate": 2,
								"maxCount": 30,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
								"instWorldAcceleration_rand": [
									0.1,
									0.1,
									0
								],
								"instSpeed": [
									0.2,
									0,
									0.5
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"useRandomColor": true,
								"lifeTime": 7,
								"warmUpTime": -5,
								"randomColor2": [
									0.8901960784313725,
									0.8470588235294118,
									0.8156862745098039,
									0.8509803921568627
								],
								"seedGroup": 5
							},
							"x": 13.03965,
							"y": 3.98286,
							"z": 2.47519,
							"scaleX": 48,
							"scaleY": 24,
							"scaleZ": 0.1,
							"rotationZ": 163,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												1
											]
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1.5
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.3280520128350777,
															"value": 1,
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
													0.9019607843137255,
													0.8431372549019608,
													0.7803921568627451
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
												"progress": 1,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.02
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
															"value": 0.9,
															"mode": 0,
															"prevHandle": {
																"dv": 0.9463220446358772,
																"dt": -1.7078404576593575
															},
															"nextHandle": {
																"dv": -0.32999999999999996,
																"dt": 0.5944444444444446
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.42,
											"topSpan": 0.32,
											"dirIntensity": 0.12,
											"dirSpan": 0,
											"sandBlend": 0.2,
											"envBlend": 0.1
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 24.24,
												"power": 100
											},
											"isInstance": true
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
											"value": 0.2,
											"mode": 0,
											"prevHandle": {
												"dv": -0.37558737412947696,
												"dt": -0.5198084514812148
											},
											"nextHandle": {
												"dv": 0.37558737412947696,
												"dt": 0.5198084514812148
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": -0.5800667456236845,
												"dt": -0.34720733642578017
											},
											"nextHandle": {
												"dv": 0.6053026426914663,
												"dt": 0.3666838857209956
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keyMode": 1,
									"keys": [
										{
											"time": 0.9122923708247508,
											"value": 1.0333333333333332,
											"mode": 1,
											"prevHandle": {
												"dv": -0.5333333333333333,
												"dt": -0.4725329589843752
											},
											"nextHandle": {
												"dv": 0.016666666666666607,
												"dt": 0.31836303710937575
											}
										},
										{
											"time": 1.9266005454778665,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Pressure_Colonne_D2",
							"props": {
								"instScale_rand": 2,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									0.9686274509803922,
									0.9568627450980391,
									0.9490196078431372,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"lifeTimeRand": 1,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 4,
								"emitRad1": 0.08,
								"emitRad2": 0.07,
								"instSpeed_rand": [
									0.1,
									0,
									0
								],
								"emitRate": 2,
								"maxCount": 30,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
								"instWorldAcceleration_rand": [
									0.1,
									0.1,
									0
								],
								"instSpeed": [
									0.2,
									0,
									0.5
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"useRandomColor": true,
								"lifeTime": 7,
								"warmUpTime": -5,
								"randomColor2": [
									0.8901960784313725,
									0.8470588235294118,
									0.8156862745098039,
									0.8509803921568627
								],
								"seedGroup": 8
							},
							"x": 14.07261,
							"y": 8.02255,
							"z": 2.4653,
							"scaleX": 48,
							"scaleY": 24,
							"scaleZ": 0.1,
							"rotationZ": 163,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												1
											]
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1.5
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.3280520128350777,
															"value": 1,
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
													0.9019607843137255,
													0.8431372549019608,
													0.7803921568627451
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
												"progress": 1,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.02
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
															"value": 0.9,
															"mode": 0,
															"prevHandle": {
																"dv": 0.9463220446358772,
																"dt": -1.7078404576593575
															},
															"nextHandle": {
																"dv": -0.32999999999999996,
																"dt": 0.5944444444444446
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.42,
											"topSpan": 0.32,
											"dirIntensity": 0.12,
											"dirSpan": 0,
											"sandBlend": 0.2,
											"envBlend": 0.1
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 24.24,
												"power": 100
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keyMode": 1,
									"keys": [
										{
											"time": 0.9122923708247508,
											"value": 1.0333333333333332,
											"mode": 1,
											"prevHandle": {
												"dv": -0.5333333333333333,
												"dt": -0.4725329589843752
											},
											"nextHandle": {
												"dv": 0.016666666666666607,
												"dt": 0.31836303710937575
											}
										},
										{
											"time": 1.9266005454778665,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5
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
											"value": 0.2,
											"mode": 0,
											"prevHandle": {
												"dv": -0.37558737412947696,
												"dt": -0.5198084514812148
											},
											"nextHandle": {
												"dv": 0.37558737412947696,
												"dt": 0.5198084514812148
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": -0.5800667456236845,
												"dt": -0.34720733642578017
											},
											"nextHandle": {
												"dv": 0.6053026426914663,
												"dt": 0.3666838857209956
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Pressure_Colonne_G1",
							"props": {
								"instScale_rand": 2,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									0.9686274509803922,
									0.9568627450980391,
									0.9490196078431372,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"lifeTimeRand": 1,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 4,
								"emitRad1": 0.08,
								"emitRad2": 0.07,
								"instSpeed_rand": [
									0.1,
									0,
									0
								],
								"emitRate": 2,
								"maxCount": 30,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
								"instWorldAcceleration_rand": [
									0.1,
									0.1,
									0
								],
								"instSpeed": [
									0.2,
									0,
									0.5
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"useRandomColor": true,
								"lifeTime": 7,
								"warmUpTime": -5,
								"randomColor2": [
									0.8901960784313725,
									0.8470588235294118,
									0.8156862745098039,
									0.8509803921568627
								],
								"emitAngle": 357.27,
								"seedGroup": 20
							},
							"x": -10.30762,
							"y": -9.4307,
							"z": 2.48194,
							"scaleX": 48,
							"scaleY": 24,
							"scaleZ": 0.1,
							"rotationZ": 74,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												1
											]
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1.5
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.3280520128350777,
															"value": 1,
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
													0.9019607843137255,
													0.8431372549019608,
													0.7803921568627451
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
												"progress": 1,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.02
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
															"value": 0.9,
															"mode": 0,
															"prevHandle": {
																"dv": 0.9463220446358772,
																"dt": -1.7078404576593575
															},
															"nextHandle": {
																"dv": -0.32999999999999996,
																"dt": 0.5944444444444446
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.42,
											"topSpan": 0.32,
											"dirIntensity": 0.12,
											"dirSpan": 0,
											"sandBlend": 0.2,
											"envBlend": 0.1
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 24.24,
												"power": 100
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keyMode": 1,
									"keys": [
										{
											"time": 0.9122923708247508,
											"value": 1.0333333333333332,
											"mode": 1,
											"prevHandle": {
												"dv": -0.5333333333333333,
												"dt": -0.4725329589843752
											},
											"nextHandle": {
												"dv": 0.016666666666666607,
												"dt": 0.31836303710937575
											}
										},
										{
											"time": 1.9266005454778665,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5
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
											"value": 0.2,
											"mode": 0,
											"prevHandle": {
												"dv": -0.37558737412947696,
												"dt": -0.5198084514812148
											},
											"nextHandle": {
												"dv": 0.37558737412947696,
												"dt": 0.5198084514812148
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": -0.5800667456236845,
												"dt": -0.34720733642578017
											},
											"nextHandle": {
												"dv": 0.6053026426914663,
												"dt": 0.3666838857209956
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Pressure_Colonne_G2",
							"props": {
								"instScale_rand": 2,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									0.9686274509803922,
									0.9568627450980391,
									0.9490196078431372,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"lifeTimeRand": 1,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 4,
								"emitRad1": 0.08,
								"emitRad2": 0.07,
								"instSpeed_rand": [
									0.1,
									0,
									0
								],
								"emitRate": 2,
								"maxCount": 30,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
								"instWorldAcceleration_rand": [
									0.1,
									0.1,
									0
								],
								"instSpeed": [
									0.2,
									0,
									0.5
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"useRandomColor": true,
								"lifeTime": 7,
								"warmUpTime": -5,
								"randomColor2": [
									0.8901960784313725,
									0.8470588235294118,
									0.8156862745098039,
									0.8509803921568627
								]
							},
							"x": -14.30177,
							"y": -8.36761,
							"z": 2.50391,
							"scaleX": 48,
							"scaleY": 24,
							"scaleZ": 0.1,
							"rotationZ": 76.2,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												1
											]
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1.5
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.3280520128350777,
															"value": 1,
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
													0.9019607843137255,
													0.8431372549019608,
													0.7803921568627451
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
												"progress": 1,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.02
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
															"value": 0.9,
															"mode": 0,
															"prevHandle": {
																"dv": 0.9463220446358772,
																"dt": -1.7078404576593575
															},
															"nextHandle": {
																"dv": -0.32999999999999996,
																"dt": 0.5944444444444446
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.42,
											"topSpan": 0.32,
											"dirIntensity": 0.12,
											"dirSpan": 0,
											"sandBlend": 0.2,
											"envBlend": 0.1
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 24.24,
												"power": 100
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keyMode": 1,
									"keys": [
										{
											"time": 0.9122923708247508,
											"value": 1.0333333333333332,
											"mode": 1,
											"prevHandle": {
												"dv": -0.5333333333333333,
												"dt": -0.4725329589843752
											},
											"nextHandle": {
												"dv": 0.016666666666666607,
												"dt": 0.31836303710937575
											}
										},
										{
											"time": 1.9266005454778665,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5
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
											"value": 0.2,
											"mode": 0,
											"prevHandle": {
												"dv": -0.37558737412947696,
												"dt": -0.5198084514812148
											},
											"nextHandle": {
												"dv": 0.37558737412947696,
												"dt": 0.5198084514812148
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": -0.5800667456236845,
												"dt": -0.34720733642578017
											},
											"nextHandle": {
												"dv": 0.6053026426914663,
												"dt": 0.3666838857209956
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Pressure_Triangle",
							"props": {
								"instScale_rand": 1,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									0.9686274509803922,
									0.9568627450980391,
									0.9490196078431372,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"lifeTimeRand": 2,
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 2,
								"emitRad1": 0,
								"emitRad2": 0,
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"emitRate": 1,
								"maxCount": 30,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"useRandomColor": true,
								"lifeTime": 7,
								"warmUpTime": -5,
								"randomColor2": [
									0.8901960784313725,
									0.8470588235294118,
									0.8156862745098039,
									0.8509803921568627
								],
								"seedGroup": 13,
								"emitAngle": 46.36,
								"instWorldSpeed": [
									0,
									0,
									0.15
								]
							},
							"x": -7.62147,
							"y": 31.60608,
							"z": -0.25009,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"rotationZ": 76.2,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												1
											]
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1.5
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.3280520128350777,
															"value": 1,
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
													0.9019607843137255,
													0.8431372549019608,
													0.7803921568627451
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
												"progress": 1,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.02
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
															"value": 0.9,
															"mode": 0,
															"prevHandle": {
																"dv": 0.9463220446358772,
																"dt": -1.7078404576593575
															},
															"nextHandle": {
																"dv": -0.32999999999999996,
																"dt": 0.5944444444444446
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.42,
											"topSpan": 0.32,
											"dirIntensity": 0.12,
											"dirSpan": 0,
											"sandBlend": 0.2,
											"envBlend": 0.1
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 24.24,
												"power": 100
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keyMode": 1,
									"keys": [
										{
											"time": 0.9122923708247508,
											"value": 1.0333333333333332,
											"mode": 1,
											"prevHandle": {
												"dv": -0.5333333333333333,
												"dt": -0.4725329589843752
											},
											"nextHandle": {
												"dv": 0.016666666666666607,
												"dt": 0.31836303710937575
											}
										},
										{
											"time": 1.9266005454778665,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5
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
											"value": 0.2,
											"mode": 0,
											"prevHandle": {
												"dv": -0.37558737412947696,
												"dt": -0.5198084514812148
											},
											"nextHandle": {
												"dv": 0.37558737412947696,
												"dt": 0.5198084514812148
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": -0.5800667456236845,
												"dt": -0.34720733642578017
											},
											"nextHandle": {
												"dv": 0.6053026426914663,
												"dt": 0.3666838857209956
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Pressure_Triangle",
							"props": {
								"instScale_rand": 1,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									0.9686274509803922,
									0.9568627450980391,
									0.9490196078431372,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"lifeTimeRand": 2,
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 2,
								"emitRad1": 0,
								"emitRad2": 0,
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"emitRate": 1,
								"maxCount": 30,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"useRandomColor": true,
								"lifeTime": 7,
								"warmUpTime": -5,
								"randomColor2": [
									0.8901960784313725,
									0.8470588235294118,
									0.8156862745098039,
									0.8509803921568627
								],
								"seedGroup": 13,
								"emitAngle": 46.36,
								"instWorldSpeed": [
									0,
									0,
									0.15
								]
							},
							"x": -23.84052,
							"y": 22.46929,
							"z": -0.29246,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"rotationZ": 26.1,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												1
											]
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1.5
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.3280520128350777,
															"value": 1,
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
													0.9019607843137255,
													0.8431372549019608,
													0.7803921568627451
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
												"progress": 1,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.02
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
															"value": 0.9,
															"mode": 0,
															"prevHandle": {
																"dv": 0.9463220446358772,
																"dt": -1.7078404576593575
															},
															"nextHandle": {
																"dv": -0.32999999999999996,
																"dt": 0.5944444444444446
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.42,
											"topSpan": 0.32,
											"dirIntensity": 0.12,
											"dirSpan": 0,
											"sandBlend": 0.2,
											"envBlend": 0.1
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 24.24,
												"power": 100
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keyMode": 1,
									"keys": [
										{
											"time": 0.9122923708247508,
											"value": 1.0333333333333332,
											"mode": 1,
											"prevHandle": {
												"dv": -0.5333333333333333,
												"dt": -0.4725329589843752
											},
											"nextHandle": {
												"dv": 0.016666666666666607,
												"dt": 0.31836303710937575
											}
										},
										{
											"time": 1.9266005454778665,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5
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
											"value": 0.2,
											"mode": 0,
											"prevHandle": {
												"dv": -0.37558737412947696,
												"dt": -0.5198084514812148
											},
											"nextHandle": {
												"dv": 0.37558737412947696,
												"dt": 0.5198084514812148
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": -0.5800667456236845,
												"dt": -0.34720733642578017
											},
											"nextHandle": {
												"dv": 0.6053026426914663,
												"dt": 0.3666838857209956
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Pressure_Triangle",
							"props": {
								"instScale_rand": 1,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									0.9686274509803922,
									0.9568627450980391,
									0.9490196078431372,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"lifeTimeRand": 2,
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 2,
								"emitRad1": 0,
								"emitRad2": 0,
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"emitRate": 1,
								"maxCount": 30,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"useRandomColor": true,
								"lifeTime": 7,
								"warmUpTime": -5,
								"randomColor2": [
									0.8901960784313725,
									0.8470588235294118,
									0.8156862745098039,
									0.8509803921568627
								],
								"emitAngle": 46.36,
								"seedGroup": 10,
								"instWorldSpeed": [
									0,
									0,
									0.15
								]
							},
							"x": -1.71457,
							"y": 27.40205,
							"z": -0.33447,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"rotationZ": 76.2,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												1
											]
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1.5
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.3280520128350777,
															"value": 1,
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
													0.9019607843137255,
													0.8431372549019608,
													0.7803921568627451
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
												"progress": 1,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.02
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
															"value": 0.9,
															"mode": 0,
															"prevHandle": {
																"dv": 0.9463220446358772,
																"dt": -1.7078404576593575
															},
															"nextHandle": {
																"dv": -0.32999999999999996,
																"dt": 0.5944444444444446
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.42,
											"topSpan": 0.32,
											"dirIntensity": 0.12,
											"dirSpan": 0,
											"sandBlend": 0.2,
											"envBlend": 0.1
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 24.24,
												"power": 100
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keyMode": 1,
									"keys": [
										{
											"time": 0.9122923708247508,
											"value": 1.0333333333333332,
											"mode": 1,
											"prevHandle": {
												"dv": -0.5333333333333333,
												"dt": -0.4725329589843752
											},
											"nextHandle": {
												"dv": 0.016666666666666607,
												"dt": 0.31836303710937575
											}
										},
										{
											"time": 1.9266005454778665,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5
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
											"value": 0.2,
											"mode": 0,
											"prevHandle": {
												"dv": -0.37558737412947696,
												"dt": -0.5198084514812148
											},
											"nextHandle": {
												"dv": 0.37558737412947696,
												"dt": 0.5198084514812148
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": -0.5800667456236845,
												"dt": -0.34720733642578017
											},
											"nextHandle": {
												"dv": 0.6053026426914663,
												"dt": 0.3666838857209956
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Pressure_Triangle",
							"props": {
								"instScale_rand": 1,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									0.9686274509803922,
									0.9568627450980391,
									0.9490196078431372,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"lifeTimeRand": 2,
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 2,
								"emitRad1": 0,
								"emitRad2": 0,
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"emitRate": 1,
								"maxCount": 30,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"useRandomColor": true,
								"lifeTime": 7,
								"warmUpTime": -5,
								"randomColor2": [
									0.8901960784313725,
									0.8470588235294118,
									0.8156862745098039,
									0.8509803921568627
								],
								"emitAngle": 46.36,
								"seedGroup": 10,
								"instWorldSpeed": [
									0,
									0,
									0.15
								]
							},
							"x": -23.51143,
							"y": 14.86219,
							"z": -0.33447,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"rotationZ": 26.1,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												1
											]
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1.5
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.3280520128350777,
															"value": 1,
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
													0.9019607843137255,
													0.8431372549019608,
													0.7803921568627451
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
												"progress": 1,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.02
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
															"value": 0.9,
															"mode": 0,
															"prevHandle": {
																"dv": 0.9463220446358772,
																"dt": -1.7078404576593575
															},
															"nextHandle": {
																"dv": -0.32999999999999996,
																"dt": 0.5944444444444446
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.42,
											"topSpan": 0.32,
											"dirIntensity": 0.12,
											"dirSpan": 0,
											"sandBlend": 0.2,
											"envBlend": 0.1
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 24.24,
												"power": 100
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keyMode": 1,
									"keys": [
										{
											"time": 0.9122923708247508,
											"value": 1.0333333333333332,
											"mode": 1,
											"prevHandle": {
												"dv": -0.5333333333333333,
												"dt": -0.4725329589843752
											},
											"nextHandle": {
												"dv": 0.016666666666666607,
												"dt": 0.31836303710937575
											}
										},
										{
											"time": 1.9266005454778665,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5
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
											"value": 0.2,
											"mode": 0,
											"prevHandle": {
												"dv": -0.37558737412947696,
												"dt": -0.5198084514812148
											},
											"nextHandle": {
												"dv": 0.37558737412947696,
												"dt": 0.5198084514812148
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": -0.5800667456236845,
												"dt": -0.34720733642578017
											},
											"nextHandle": {
												"dv": 0.6053026426914663,
												"dt": 0.3666838857209956
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Pressure_Triangle",
							"props": {
								"instScale_rand": 1,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									0.9686274509803922,
									0.9568627450980391,
									0.9490196078431372,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"lifeTimeRand": 2,
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 2,
								"emitRad1": 0,
								"emitRad2": 0,
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"emitRate": 1,
								"maxCount": 30,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"useRandomColor": true,
								"lifeTime": 7,
								"warmUpTime": -5,
								"randomColor2": [
									0.8901960784313725,
									0.8470588235294118,
									0.8156862745098039,
									0.8509803921568627
								],
								"emitAngle": 46.36,
								"seedGroup": 33,
								"instWorldSpeed": [
									0,
									0,
									0.15
								]
							},
							"x": 4.49017,
							"y": 23.224,
							"z": -0.42834,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"rotationZ": 76.2,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												1
											]
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1.5
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.3280520128350777,
															"value": 1,
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
													0.9019607843137255,
													0.8431372549019608,
													0.7803921568627451
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
												"progress": 1,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.02
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
															"value": 0.9,
															"mode": 0,
															"prevHandle": {
																"dv": 0.9463220446358772,
																"dt": -1.7078404576593575
															},
															"nextHandle": {
																"dv": -0.32999999999999996,
																"dt": 0.5944444444444446
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.42,
											"topSpan": 0.32,
											"dirIntensity": 0.12,
											"dirSpan": 0,
											"sandBlend": 0.2,
											"envBlend": 0.1
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 24.24,
												"power": 100
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keyMode": 1,
									"keys": [
										{
											"time": 0.9122923708247508,
											"value": 1.0333333333333332,
											"mode": 1,
											"prevHandle": {
												"dv": -0.5333333333333333,
												"dt": -0.4725329589843752
											},
											"nextHandle": {
												"dv": 0.016666666666666607,
												"dt": 0.31836303710937575
											}
										},
										{
											"time": 1.9266005454778665,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5
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
											"value": 0.2,
											"mode": 0,
											"prevHandle": {
												"dv": -0.37558737412947696,
												"dt": -0.5198084514812148
											},
											"nextHandle": {
												"dv": 0.37558737412947696,
												"dt": 0.5198084514812148
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": -0.5800667456236845,
												"dt": -0.34720733642578017
											},
											"nextHandle": {
												"dv": 0.6053026426914663,
												"dt": 0.3666838857209956
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Pressure_Triangle",
							"props": {
								"instScale_rand": 1,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									0.9686274509803922,
									0.9568627450980391,
									0.9490196078431372,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"lifeTimeRand": 2,
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 2,
								"emitRad1": 0,
								"emitRad2": 0,
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"emitRate": 1,
								"maxCount": 30,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"useRandomColor": true,
								"lifeTime": 7,
								"warmUpTime": -5,
								"randomColor2": [
									0.8901960784313725,
									0.8470588235294118,
									0.8156862745098039,
									0.8509803921568627
								],
								"emitAngle": 46.36,
								"seedGroup": 33,
								"instWorldSpeed": [
									0,
									0,
									0.15
								]
							},
							"x": -22.98797,
							"y": 7.38785,
							"z": -0.42834,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"rotationZ": 26.1,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												1
											]
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1.5
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.3280520128350777,
															"value": 1,
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
													0.9019607843137255,
													0.8431372549019608,
													0.7803921568627451
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
												"progress": 1,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.02
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
															"value": 0.9,
															"mode": 0,
															"prevHandle": {
																"dv": 0.9463220446358772,
																"dt": -1.7078404576593575
															},
															"nextHandle": {
																"dv": -0.32999999999999996,
																"dt": 0.5944444444444446
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.42,
											"topSpan": 0.32,
											"dirIntensity": 0.12,
											"dirSpan": 0,
											"sandBlend": 0.2,
											"envBlend": 0.1
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 24.24,
												"power": 100
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keyMode": 1,
									"keys": [
										{
											"time": 0.9122923708247508,
											"value": 1.0333333333333332,
											"mode": 1,
											"prevHandle": {
												"dv": -0.5333333333333333,
												"dt": -0.4725329589843752
											},
											"nextHandle": {
												"dv": 0.016666666666666607,
												"dt": 0.31836303710937575
											}
										},
										{
											"time": 1.9266005454778665,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5
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
											"value": 0.2,
											"mode": 0,
											"prevHandle": {
												"dv": -0.37558737412947696,
												"dt": -0.5198084514812148
											},
											"nextHandle": {
												"dv": 0.37558737412947696,
												"dt": 0.5198084514812148
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": -0.5800667456236845,
												"dt": -0.34720733642578017
											},
											"nextHandle": {
												"dv": 0.6053026426914663,
												"dt": 0.3666838857209956
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Pressure_Triangle",
							"props": {
								"instScale_rand": 1,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									0.9686274509803922,
									0.9568627450980391,
									0.9490196078431372,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"lifeTimeRand": 2,
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 2,
								"emitRad1": 0,
								"emitRad2": 0,
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"emitRate": 1,
								"maxCount": 30,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"useRandomColor": true,
								"lifeTime": 7,
								"warmUpTime": -5,
								"randomColor2": [
									0.8901960784313725,
									0.8470588235294118,
									0.8156862745098039,
									0.8509803921568627
								],
								"emitAngle": 46.36,
								"seedGroup": 48,
								"instWorldSpeed": [
									0,
									0,
									0.15
								]
							},
							"x": 10.73195,
							"y": 18.75974,
							"z": -0.23042,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"rotationZ": 76.2,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												1
											]
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1.5
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.3280520128350777,
															"value": 1,
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
													0.9019607843137255,
													0.8431372549019608,
													0.7803921568627451
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
												"progress": 1,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.02
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
															"value": 0.9,
															"mode": 0,
															"prevHandle": {
																"dv": 0.9463220446358772,
																"dt": -1.7078404576593575
															},
															"nextHandle": {
																"dv": -0.32999999999999996,
																"dt": 0.5944444444444446
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.42,
											"topSpan": 0.32,
											"dirIntensity": 0.12,
											"dirSpan": 0,
											"sandBlend": 0.2,
											"envBlend": 0.1
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 24.24,
												"power": 100
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keyMode": 1,
									"keys": [
										{
											"time": 0.9122923708247508,
											"value": 1.0333333333333332,
											"mode": 1,
											"prevHandle": {
												"dv": -0.5333333333333333,
												"dt": -0.4725329589843752
											},
											"nextHandle": {
												"dv": 0.016666666666666607,
												"dt": 0.31836303710937575
											}
										},
										{
											"time": 1.9266005454778665,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5
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
											"value": 0.2,
											"mode": 0,
											"prevHandle": {
												"dv": -0.37558737412947696,
												"dt": -0.5198084514812148
											},
											"nextHandle": {
												"dv": 0.37558737412947696,
												"dt": 0.5198084514812148
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": -0.5800667456236845,
												"dt": -0.34720733642578017
											},
											"nextHandle": {
												"dv": 0.6053026426914663,
												"dt": 0.3666838857209956
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Pressure_Triangle",
							"props": {
								"instScale_rand": 1,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									0.9686274509803922,
									0.9568627450980391,
									0.9490196078431372,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"lifeTimeRand": 2,
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 2,
								"emitRad1": 0,
								"emitRad2": 0,
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"emitRate": 1,
								"maxCount": 30,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"useRandomColor": true,
								"lifeTime": 7,
								"warmUpTime": -5,
								"randomColor2": [
									0.8901960784313725,
									0.8470588235294118,
									0.8156862745098039,
									0.8509803921568627
								],
								"emitAngle": 46.36,
								"seedGroup": 48,
								"instWorldSpeed": [
									0,
									0,
									0.15
								]
							},
							"x": -22.58644,
							"y": -0.01501,
							"z": -0.23042,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"rotationZ": 26.1,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												1
											]
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1.5
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.3280520128350777,
															"value": 1,
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
													0.9019607843137255,
													0.8431372549019608,
													0.7803921568627451
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
												"progress": 1,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.02
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
															"value": 0.9,
															"mode": 0,
															"prevHandle": {
																"dv": 0.9463220446358772,
																"dt": -1.7078404576593575
															},
															"nextHandle": {
																"dv": -0.32999999999999996,
																"dt": 0.5944444444444446
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.42,
											"topSpan": 0.32,
											"dirIntensity": 0.12,
											"dirSpan": 0,
											"sandBlend": 0.2,
											"envBlend": 0.1
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 24.24,
												"power": 100
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keyMode": 1,
									"keys": [
										{
											"time": 0.9122923708247508,
											"value": 1.0333333333333332,
											"mode": 1,
											"prevHandle": {
												"dv": -0.5333333333333333,
												"dt": -0.4725329589843752
											},
											"nextHandle": {
												"dv": 0.016666666666666607,
												"dt": 0.31836303710937575
											}
										},
										{
											"time": 1.9266005454778665,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5
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
											"value": 0.2,
											"mode": 0,
											"prevHandle": {
												"dv": -0.37558737412947696,
												"dt": -0.5198084514812148
											},
											"nextHandle": {
												"dv": 0.37558737412947696,
												"dt": 0.5198084514812148
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": -0.5800667456236845,
												"dt": -0.34720733642578017
											},
											"nextHandle": {
												"dv": 0.6053026426914663,
												"dt": 0.3666838857209956
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