{
	"type": "fx",
	"duration": 5,
	"cullingRadius": 3,
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
			"children": [
				{
					"type": "model",
					"name": "SietchTuek_mesh",
					"source": "Structure/Base/SietchTuek/SietchTuek.fbx",
					"editorOnly": true,
					"locked": true,
					"scaleX": 14.099999999999998,
					"scaleY": 14.099999999999998,
					"scaleZ": 14.1
				},
				{
					"type": "object",
					"name": "Debris",
					"x": -2.25867,
					"y": -9.65589,
					"z": -1.06174,
					"scaleX": 0.4,
					"scaleY": 0.4,
					"scaleZ": 0.4,
					"rotationZ": 90,
					"children": [
						{
							"type": "emitter",
							"name": "Debris",
							"props": {
								"lifeTime": 1.75,
								"lifeTimeRand": 0.35,
								"warmUpTime": -1.2,
								"emitType": "Burst",
								"burstParticleCount": 10,
								"emitShape": "Cone",
								"alignMode": "Screen",
								"frameCount": 16,
								"frameDivisionX": 4,
								"animationSpeed": 0,
								"instScale": 50,
								"instSpeed": [
									1400,
									0,
									190
								],
								"instRotation_rand": [
									0,
									0,
									360
								],
								"instScale_rand": 30,
								"instSpeed_rand": [
									760,
									0,
									50
								],
								"instWorldSpeed": [
									0,
									0,
									-5
								],
								"instWorldSpeed_rand": [
									0,
									0,
									-1
								],
								"seedGroup": 5,
								"useRandomColor": true,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"randomColor2": [
									0.7098039215686275,
									0.7098039215686275,
									0.7098039215686275,
									1
								],
								"simulationSpace": "World",
								"speedFactor": 1.75,
								"emitOrientation": "Normal",
								"maxCount": 25,
								"emitRad1": 0.48,
								"instAcceleration": [
									25,
									0,
									0
								],
								"emitAngle": 60,
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
							"scaleX": 9,
							"scaleY": 9,
							"scaleZ": 3,
							"rotationY": -3.8,
							"children": [
								{
									"type": "model",
									"name": "M_debris",
									"source": "Fx/Explosion/M_debris.fbx",
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "PBR",
													"blend": "Alpha",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"textureWrap": true
												}
											},
											"wrapRepeat": true,
											"color": [
												0.403921568627451,
												0.403921568627451,
												0.403921568627451,
												1
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
												"uvScaleX": 8,
												"uvScaleY": 8,
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
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1.0142450142450146,
															"prevHandle": {
																"dv": 0.00815077011741522,
																"dt": -0.21165545373561706
															},
															"nextHandle": {
																"dv": -0.01690408357075024,
																"dt": 0.43895747599451307
															}
														},
														{
															"time": 0.9491220850480115,
															"value": 0,
															"prevHandle": {
																"dv": 1.1494776828110165,
																"dt": -0.235281207133059
															},
															"nextHandle": {
																"dv": -0.9533918695597478,
																"dt": 0.1951453197353988
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9450980392156862,
													0.9450980392156862,
													0.9450980392156862
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "color.h",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
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
													"name": "color.s",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
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
													"name": "color.l",
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0.6666666666666666,
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
									"name": "instSpeed.x",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"prevHandle": {
												"dv": 3.1322290064091,
												"dt": -0.05293908179846354
											},
											"nextHandle": {
												"dv": -1.1833333333333333,
												"dt": 0.020000000000000004
											}
										},
										{
											"time": 0.9903769144228197,
											"value": 0,
											"prevHandle": {
												"dv": 0.08333333333333331,
												"dt": -0.9203769144228198
											},
											"nextHandle": {
												"dv": -0.05935425160502109,
												"dt": 0.6552709377194234
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instAcceleration.x",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"prevHandle": {
												"dv": 3.1322290064091,
												"dt": -0.05293908179846354
											},
											"nextHandle": {
												"dv": -1.1833333333333333,
												"dt": 0.020000000000000004
											}
										},
										{
											"time": 0.9903769144228197,
											"value": 0,
											"prevHandle": {
												"dv": 0.08333333333333331,
												"dt": -0.9203769144228198
											},
											"nextHandle": {
												"dv": -0.05935425160502109,
												"dt": 0.6552709377194234
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instSpeed.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"prevHandle": {
												"dv": 3.1322290064091,
												"dt": -0.05293908179846354
											},
											"nextHandle": {
												"dv": -1.1833333333333333,
												"dt": 0.020000000000000004
											}
										},
										{
											"time": 0.9903769144228197,
											"value": 0,
											"prevHandle": {
												"dv": 0.08333333333333331,
												"dt": -0.9203769144228198
											},
											"nextHandle": {
												"dv": -0.05935425160502109,
												"dt": 0.6552709377194234
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "InstWorldSpeed.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"prevHandle": {
												"dv": -0.08281631008272207,
												"dt": -0.49938234979881435
											},
											"nextHandle": {
												"dv": 0.16666666666666669,
												"dt": 1.005
											}
										},
										{
											"time": 1,
											"value": 1,
											"prevHandle": {
												"dv": -1.1666666666666665,
												"dt": -0.010000000000000009
											},
											"nextHandle": {
												"dv": 0.7916682837335377,
												"dt": 0.006785728146287541
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
								},
								{
									"type": "curve",
									"name": "instRotation.y",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1,
											"value": 180,
											"prevHandle": {
												"dv": -20.832511379552443,
												"dt": -0.7927662658691406
											},
											"nextHandle": {
												"dv": 8.900741354483111,
												"dt": 0.3331398036585995
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
					"name": "testholes",
					"editorOnly": true,
					"x": -1.7990374999999998,
					"y": -0.12413999999999992,
					"z": 7.657765000000001,
					"children": [
						{
							"type": "emitter",
							"name": "FireExplo_holes",
							"props": {
								"emitType": "Burst",
								"instScale": 3,
								"lifeTime": 2,
								"instRotation_rand": [
									0,
									0,
									0
								],
								"maxCount": 5,
								"instStretch": [
									1.25,
									0.8,
									1
								],
								"warmUpTime": -0.7,
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
							"x": -6.431567500000001,
							"y": 1.8683474999999996,
							"z": -2.5296350000000007,
							"scaleX": 0.1,
							"scaleY": 0.10000000000000002,
							"scaleZ": 0.10000000000000002,
							"rotationX": -76.2,
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
													"emissive": 25,
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
												"texture": "Fx/Gradients/circGrad05.jpg"
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.2
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
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 2,
												"power": 0.8
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
									"type": "curve",
									"name": "instScale",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
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
						},
						{
							"type": "emitter",
							"name": "FireExplo_holes",
							"enabled": false,
							"props": {
								"emitType": "Burst",
								"instScale": 3,
								"lifeTime": 2,
								"instRotation_rand": [
									0,
									0,
									0
								],
								"maxCount": 5,
								"instStretch": [
									2.5,
									1,
									1
								],
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
							"x": 7.807312499999999,
							"y": 1.5367674999999998,
							"z": -0.8088750000000005,
							"scaleX": 0.1,
							"scaleY": 0.10000000000000002,
							"scaleZ": 0.10000000000000002,
							"rotationX": -76.2,
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
													"emissive": 25,
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
												"texture": "Fx/Gradients/T_Square02.jpg"
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.2
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
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 2,
												"power": 0.8
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
									"type": "curve",
									"name": "instScale",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
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
						},
						{
							"type": "emitter",
							"name": "FireExplo_holes",
							"props": {
								"emitType": "Burst",
								"instScale": 3,
								"lifeTime": 2,
								"instRotation_rand": [
									0,
									0,
									0
								],
								"maxCount": 5,
								"warmUpTime": -0.7,
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
							"x": -16.279237499999997,
							"y": -1.0906925,
							"z": 1.9841749999999987,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"rotationX": 25.000000000000007,
							"rotationY": -19,
							"rotationZ": -21.599999999999994,
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
													"emissive": 25,
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
												"texture": "Fx/Gradients/T_Square02.jpg"
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.2
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
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 2,
												"power": 0.8
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
									"type": "curve",
									"name": "instScale",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
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
						},
						{
							"type": "emitter",
							"name": "FireExplo_holes",
							"props": {
								"emitType": "Burst",
								"instScale": 3,
								"lifeTime": 2,
								"instRotation_rand": [
									0,
									0,
									0
								],
								"maxCount": 5,
								"warmUpTime": -0.7,
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
							"x": 14.9034925,
							"y": -2.3144225,
							"z": 1.354334999999999,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"rotationX": 28,
							"rotationY": -17.5,
							"rotationZ": 28,
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
													"emissive": 25,
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
												"texture": "Fx/Gradients/T_Square02.jpg"
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.2
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
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 2,
												"power": 0.8
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
									"type": "curve",
									"name": "instScale",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
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
						},
						{
							"type": "emitter",
							"name": "FireExplo_holes",
							"props": {
								"emitType": "Burst",
								"instScale": 1.8,
								"lifeTime": 2,
								"instRotation_rand": [
									0,
									0,
									0
								],
								"maxCount": 5,
								"warmUpTime": -0.7,
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
							"x": 4.33663,
							"y": -4.32821,
							"z": 2.84219,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"rotationZ": 55,
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
													"emissive": 25,
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
												"texture": "Fx/Gradients/T_Square02.jpg"
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.2
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
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 2,
												"power": 0.8
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
									"type": "curve",
									"name": "instScale",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
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
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 2
							}
						}
					]
				},
				{
					"type": "object",
					"name": "FireDoor",
					"x": -2.626025,
					"y": 1.2517175,
					"z": 1.45459,
					"scaleY": 0.9,
					"children": [
						{
							"type": "emitter",
							"name": "FireExplo_floorfire",
							"props": {
								"warmUpTime": -0.7,
								"emitType": "Burst",
								"instScale": 15,
								"lifeTime": 6,
								"instRotation_rand": [
									0,
									0,
									0
								],
								"maxCount": 5,
								"instStretch": [
									0.8,
									2,
									1
								],
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
							"x": 0.09132,
							"y": 3.81937,
							"z": -0.5009,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
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
													"emissive": 3,
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
												"texture": "Fx/Alphas/T_circle5.png"
											},
											"isInstance": true
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
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 1,
												"power": 0.8
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
													0.7058823529411764,
													0.3176470588235294,
													0.19607843137254902
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
												"progress": 0.66,
												"saturation": 0.25,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Wave_02.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													-0.05
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
															"value": 1,
															"prevHandle": {
																"dv": 2.942491792923777,
																"dt": -0.4808822806105675
															},
															"nextHandle": {
																"dv": -1.1,
																"dt": 0.18019275266053364
															}
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.49096045782441833
															},
															"nextHandle": {
																"dv": -7.865461723911139e-16,
																"dt": 0.4224127050774995
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
															"prevHandle": {
																"dv": 0.4501476276915423,
																"dt": -0.6144515117989549
															},
															"nextHandle": {
																"dv": -0.33333333333333337,
																"dt": 0.455
															}
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": 0.2833333333333333,
																"dt": -0.29500000000000004
															},
															"nextHandle": {
																"dv": -0.40250763363430087,
																"dt": 0.41908147737218393
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "uvShift.y",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"prevHandle": {
																"dv": -4.648840347948921,
																"dt": -0.016645246701604628
															},
															"nextHandle": {
																"dv": 0.6888255777144666,
																"dt": 0.0018497631910221503
															}
														},
														{
															"time": 1,
															"value": 0.5,
															"prevHandle": {
																"dv": 0.006489395378284302,
																"dt": -0.9710203766739863
															},
															"nextHandle": {
																"dv": -0.003474774353306732,
																"dt": 0.3333322597043977
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "uvShift.y",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"prevHandle": {
																"dv": -4.647007584240214,
																"dt": -1.4767580173568582e-15
															},
															"nextHandle": {
																"dv": 0.12354781622042693,
																"dt": 0
															}
														},
														{
															"time": 1,
															"value": 0.1,
															"prevHandle": {
																"dv": 0.006489395378284302,
																"dt": -0.9710203766739863
															},
															"nextHandle": {
																"dv": -0.003474774353306732,
																"dt": 0.3333322597043977
															}
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "instStretch.x",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
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
						},
						{
							"type": "emitter",
							"name": "FireExplo_floor",
							"props": {
								"warmUpTime": -0.7,
								"emitType": "Burst",
								"instScale": 38,
								"lifeTime": 2.5,
								"instRotation_rand": [
									0,
									0,
									0
								],
								"maxCount": 5,
								"instStretch": [
									0.8,
									1.9,
									1
								],
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
							"x": 0.09132499999999988,
							"y": 1.8560625,
							"z": 0.6116799999999998,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
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
													"emissive": 3,
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
												"alpha": 1.5,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_circle5.png"
											},
											"isInstance": true
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
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 30,
												"power": 0.8
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
									"type": "curve",
									"name": "instScale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
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
						},
						{
							"type": "emitter",
							"name": "FireExplo_door",
							"props": {
								"warmUpTime": -0.7,
								"emitType": "Burst",
								"instScale": 18,
								"lifeTime": 3,
								"instRotation_rand": [
									0,
									0,
									0
								],
								"maxCount": 5,
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
							"x": 0.09132499999999988,
							"y": -0.14960750000000012,
							"z": 1.4846499999999998,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"rotationX": -89.99999999999999,
							"rotationY": 89.99999999999999,
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
													"emissive": 3,
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
												"texture": "Fx/Alphas/T_circle5.png"
											},
											"isInstance": true
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
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 8,
												"power": 0.8
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
									"type": "curve",
									"name": "instScale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
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
						},
						{
							"type": "emitter",
							"name": "FireMainDoor",
							"props": {
								"enableSort": false,
								"emitSurface": true,
								"frameCount": 4,
								"animationSpeed": 0,
								"emitType": "Burst",
								"instScale": 0.75,
								"instScale_rand": 0,
								"seedGroup": 3,
								"useRandomColor": true,
								"randomColor1": [
									0.8235294117647058,
									0.7686274509803921,
									0.7176470588235294,
									1
								],
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"maxCount": 1,
								"randomColor2": [
									0.9764705882352941,
									0.9647058823529412,
									0.9529411764705882,
									1
								],
								"instRotation_rand": [
									0,
									0,
									0
								],
								"frameDivisionX": 2,
								"frameDivisionY": 2,
								"spriteSheet": "Fx/Alphas/T_DirectionalSmoke_Mesh_2x2.png",
								"lifeTime": 6,
								"warmUpTime": -0.7,
								"instStretch": [
									6,
									1.2,
									1.7
								],
								"instRotation": [
									0,
									0,
									180
								],
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
							"x": -0.27398,
							"y": -3.56252,
							"z": -1.19045,
							"scaleX": 0.09999999999999999,
							"scaleY": 0.09999999999999999,
							"scaleZ": 0.1,
							"rotationY": -13.6,
							"rotationZ": 90,
							"children": [
								{
									"type": "model",
									"name": "M_MainDoor05",
									"source": "Fx/Structure/SietchTuek/M_MainDoor07.fbx",
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
													"drawOrder": "-80",
													"depthWrite": "Off",
													"emissive": 3
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.5
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
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
															"prevHandle": {
																"dv": 0,
																"dt": -0.63
															},
															"nextHandle": {
																"dv": -2.7211090888961944e-16,
																"dt": 0.3332931287768935
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
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": 1.1833333333333333,
																"dt": -0.5326143844963243
															},
															"nextHandle": {
																"dv": -0.7106176262935818,
																"dt": 0.31991713222538554
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
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.66,
												"saturation": 0.25,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/T_Noise_Wave_02.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.05
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
															"value": 1,
															"prevHandle": {
																"dv": 2.942491792923777,
																"dt": -0.4808822806105675
															},
															"nextHandle": {
																"dv": -1.1,
																"dt": 0.18019275266053364
															}
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.49096045782441833
															},
															"nextHandle": {
																"dv": -7.865461723911139e-16,
																"dt": 0.4224127050774995
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
															"prevHandle": {
																"dv": 0.4501476276915423,
																"dt": -0.6144515117989549
															},
															"nextHandle": {
																"dv": -0.33333333333333337,
																"dt": 0.455
															}
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": 0.2833333333333333,
																"dt": -0.29500000000000004
															},
															"nextHandle": {
																"dv": -0.40250763363430087,
																"dt": 0.41908147737218393
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "uvShift.y",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"prevHandle": {
																"dv": -4.648840347948921,
																"dt": -0.016645246701604628
															},
															"nextHandle": {
																"dv": 0.6888255777144666,
																"dt": 0.0018497631910221503
															}
														},
														{
															"time": 1,
															"value": 0.5,
															"prevHandle": {
																"dv": 0.006489395378284302,
																"dt": -0.9710203766739863
															},
															"nextHandle": {
																"dv": -0.003474774353306732,
																"dt": 0.3333322597043977
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "uvShift.y",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"prevHandle": {
																"dv": -4.647007584240214,
																"dt": -1.4767580173568582e-15
															},
															"nextHandle": {
																"dv": 0.12354781622042693,
																"dt": 0
															}
														},
														{
															"time": 1,
															"value": 0.1,
															"prevHandle": {
																"dv": 0.006489395378284302,
																"dt": -0.9710203766739863
															},
															"nextHandle": {
																"dv": -0.003474774353306732,
																"dt": 0.3333322597043977
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
												"progress": 0.33,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad_uneaven.png",
												"uvShift": [
													0.5,
													0.05
												],
												"uvShiftSpeed": [
													0,
													0
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "uvShift.y",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"prevHandle": {
																"dv": -4.5873478210854435,
																"dt": -0.08620197733444586
															},
															"nextHandle": {
																"dv": 0.11666666666666664,
																"dt": 0.002615486322407691
															}
														},
														{
															"time": 1,
															"value": 0.1,
															"prevHandle": {
																"dv": -0.03078505856283631,
																"dt": -0.965
															},
															"nextHandle": {
																"dv": 0.010496026753190169,
																"dt": 0.33329640953501305
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
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.725,
												"ATTENUATE": true,
												"emissiveMap": null
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instStretch.x",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.7,
											"prevHandle": {
												"dv": -0.8856956078152938,
												"dt": -0.008741136025810942
											},
											"nextHandle": {
												"dv": 0.3618749999999997,
												"dt": 0.0035714285714285587
											}
										},
										{
											"time": 1,
											"value": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -1.1332393435959967
											},
											"nextHandle": {
												"dv": -1.2260459771389204e-16,
												"dt": 0.33333778335634656
											}
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "light",
					"name": "light_1",
					"enabled": false,
					"x": -2.60462,
					"y": -1.76907,
					"z": 4.97667,
					"scaleX": 110,
					"scaleY": 110,
					"scaleZ": 110,
					"color": 11623490,
					"range": 110,
					"zNear": 0.02,
					"children": [
						{
							"type": "curve",
							"name": "power",
							"keys": [
								{
									"time": 0.646785888671875,
									"value": 0,
									"mode": 2
								},
								{
									"time": 0.646785888671875,
									"value": 0,
									"mode": 2
								},
								{
									"time": 0.6989925247058286,
									"value": 5,
									"mode": 2
								},
								{
									"time": 3.996507568359376,
									"value": 0,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "Distort",
					"props": {
						"instScale_rand": 0,
						"maxCount": 50,
						"simulationSpace": "World",
						"animationSpeed": 0.2,
						"randomColor1": [
							1,
							1,
							1,
							1
						],
						"randomColor2": [
							0.9098039215686274,
							0.615686274509804,
							1,
							0.8509803921568627
						],
						"emitRate": 10,
						"enableSort": false,
						"instRotation_rand": [
							0,
							0,
							0
						],
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
						"lifeTime": 2,
						"emitType": "Burst",
						"burstDelay": 0.1,
						"instScale": 90,
						"emitShape": "Cylinder",
						"emitSurface": true,
						"warmUpTime": -0.7,
						"instStretch": [
							1,
							1,
							0.01
						],
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
					"z": 1,
					"scaleX": 0.1,
					"scaleY": 0.1,
					"scaleZ": 0.1,
					"rotationZ": 90,
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
							"kind": 1,
							"args": [
								6,
								141.82,
								0.2,
								4
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
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false,
											"culling": "None"
										}
									},
									"diffuseMap": "Fx/noise/causticTexture_03-2.png"
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
										"alpha": 0.5,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_circle5.png"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DistortionMap",
									"source": "shaders/DistortionMap.hx",
									"props": {
										"distortionDir": "Fx/DistortionMaps/water-normal.png",
										"intensity": 0.05
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "intensity",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.8043636363636364,
													"prevHandle": {
														"dv": 1.1438836500205134,
														"dt": -0.4763721338556696
													},
													"nextHandle": {
														"dv": -0.2551111111111112,
														"dt": 0.10551280456700678
													}
												},
												{
													"time": 1,
													"value": 0.004242424242424214,
													"prevHandle": {
														"dv": 0.03333333333333333,
														"dt": -0.51
													},
													"nextHandle": {
														"dv": -0.02178544542538359,
														"dt": 0.33331731500836026
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 0.5,
										"scaleY": 0.5,
										"shiftX": 0,
										"shiftY": 0,
										"shiftSpeedX": 0,
										"shiftSpeedY": -0.01
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"enabled": false,
									"props": {
										"REVERSE": false,
										"range": 3,
										"power": 1
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
									"value": 0.012707392165911546,
									"prevHandle": {
										"dv": -2.476916055641238,
										"dt": -0.11081055179448417
									},
									"nextHandle": {
										"dv": 1.1289962707111405,
										"dt": 0.05
									}
								},
								{
									"time": 1,
									"value": 1.01469963255798,
									"prevHandle": {
										"dv": -0.12648137998854092,
										"dt": -0.69
									},
									"nextHandle": {
										"dv": 0.04797846416818524,
										"dt": 0.2699185912801351
									}
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "LensFlare",
					"enabled": false,
					"x": -3.47466,
					"y": -6.87448,
					"z": -5.62254,
					"scaleX": 7,
					"scaleY": 7,
					"scaleZ": 7,
					"children": [
						{
							"type": "emitter",
							"name": "LensFlare_circle",
							"props": {
								"alignMode": "Screen",
								"instScale_rand": 1.5,
								"maxCount": 5,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"randomColor2": [
									0.9215686274509803,
									0.9215686274509803,
									0.9215686274509803,
									0.8509803921568627
								],
								"emitAngle": 0,
								"emitRate": 1,
								"instRotation_rand": [
									0,
									0,
									150
								],
								"instScale": 10,
								"emitType": "Burst",
								"burstDelay": 0.12,
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"instStretch_rand": [
									0,
									0,
									0
								],
								"instOffset": [
									1,
									0,
									0
								],
								"instRotation": [
									0,
									0,
									25
								],
								"instOffset_rand": [
									0.2,
									0,
									0
								],
								"lifeTime": 1.8,
								"warmUpTime": -0.75,
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
							"x": 0.40694,
							"y": -0.2175,
							"z": 2.57515,
							"scaleX": 0.15,
							"scaleY": 0.15,
							"scaleZ": 0.15,
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
													"blend": "Add",
													"shadows": false,
													"culling": "Back",
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false,
													"alphaKill": true,
													"parallax": 0,
													"textureWrap": true,
													"emissive": 10
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.15,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_LensFlare_01.png",
												"onDecal": false
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.0049999999999999975,
															"value": 1,
															"prevHandle": {
																"dv": 1.2619278819653144,
																"dt": -0.3266166282733753
															},
															"nextHandle": {
																"dv": -0.85,
																"dt": 0.22000000000000003
															}
														},
														{
															"time": 1,
															"value": 0.033333333333333326,
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
													0.6941176470588235,
													0.3607843137254902,
													0.2588235294117647
												]
											},
											"isInstance": true
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
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.8,
												"ATTENUATE": true,
												"emissiveMap": null
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"keys": [
										{
											"time": 0,
											"value": 1.0666666666666667,
											"mode": 2
										},
										{
											"time": 1,
											"value": 1.1,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "LensFlare_color_big2",
							"props": {
								"alignMode": "Screen",
								"instScale_rand": 0,
								"maxCount": 50,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"randomColor2": [
									0.9215686274509803,
									0.9215686274509803,
									0.9215686274509803,
									0.8509803921568627
								],
								"emitAngle": 0,
								"emitRate": 1,
								"instRotation_rand": [
									0,
									0,
									0
								],
								"instScale": 18,
								"emitType": "Burst",
								"burstDelay": 0.12,
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"instStretch_rand": [
									0,
									0,
									0
								],
								"warmUpTime": -0.75,
								"instRotation": [
									20,
									0,
									0
								],
								"lifeTime": 3,
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
							"z": 1.25,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false,
													"alphaKill": true,
													"parallax": 0,
													"textureWrap": true,
													"emissive": 15
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Gradients/T_circleGradient_color_double.png",
											"color": [
												0.9411764705882353,
												0.807843137254902,
												0.7058823529411764,
												1
											]
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.8,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_LensFlare_Double.png",
												"onDecal": false
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.0049999999999999975,
															"value": 1,
															"prevHandle": {
																"dv": 1.2619278819653144,
																"dt": -0.3266166282733753
															},
															"nextHandle": {
																"dv": -0.85,
																"dt": 0.22000000000000003
															}
														},
														{
															"time": 1,
															"value": 0.033333333333333326,
															"mode": 2
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
												"range": 24.24,
												"power": 0.8
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.8,
												"ATTENUATE": true,
												"emissiveMap": null
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"keys": [
										{
											"time": 0,
											"value": 1.0666666666666667,
											"mode": 2
										},
										{
											"time": 1,
											"value": 1.1,
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
								"alpha": 0.6
							}
						}
					]
				},
				{
					"type": "object",
					"name": "Shockwave",
					"scaleX": 1.2,
					"scaleY": 1.2,
					"scaleZ": 1.2,
					"children": [
						{
							"type": "object",
							"name": "SandShockWave",
							"z": 2,
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 2,
							"children": [
								{
									"type": "emitter",
									"name": "Impact_Burst_Mid_SandJet_R",
									"props": {
										"instScale_rand": 3.5,
										"simulationSpace": "World",
										"animationSpeed": 0,
										"randomColor1": [
											1,
											1,
											1,
											1
										],
										"enableSort": false,
										"instRotation_rand": [
											0,
											0,
											15
										],
										"lifeTimeRand": 3,
										"emitShape": "Cylinder",
										"emitSurface": true,
										"emitOrientation": "Normal",
										"instScale": 7,
										"lifeTime": 4,
										"emitRad1": 0.8,
										"randomColor2": [
											0.8431372549019608,
											0.7607843137254902,
											0.7254901960784313,
											1
										],
										"instSpeed_rand": [
											1,
											0,
											0
										],
										"emitRate": 20,
										"maxCount": 100,
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_Grunge_4x4_01.png",
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
										"instStretch_rand": [
											0,
											0.25,
											0
										],
										"instStretch": [
											1,
											2,
											1
										],
										"warmUpTime": -0.65,
										"emitType": "Burst",
										"burstParticleCount": 9,
										"emitAngle": 100,
										"instRotation": [
											0,
											0,
											30
										],
										"emitDuration": 20,
										"burstDelay": 1.35,
										"seedGroup": 2,
										"instSpeed": [
											2,
											0,
											0
										],
										"emitRad2": 0.9,
										"useRandomColor": true,
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
									"x": -0.7514,
									"z": -0.32935,
									"scaleX": 40,
									"scaleY": 40,
									"scaleZ": 0.2,
									"rotationZ": 90,
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
														"scale": 0.8
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
														"progress": 0.58,
														"saturation": 0,
														"width": 0.7,
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
																	"prevHandle": {
																		"dv": 1.1946815774171073,
																		"dt": -0.37422467067608545
																	},
																	"nextHandle": {
																		"dv": -1.0693652343750002,
																		"dt": 0.3379705070727756
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
													"topIntensity": 0.3,
													"topSpan": 0.3,
													"dirIntensity": 0.1,
													"dirSpan": 0,
													"sandBlend": 0.7,
													"envBlend": 0.7
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
													"value": -0.004801283442754212,
													"prevHandle": {
														"dv": -1.388476860780481,
														"dt": -0.06199247660355442
													},
													"nextHandle": {
														"dv": 0.7972549709272361,
														"dt": 0.03559570312500002
													}
												},
												{
													"time": 1,
													"value": 1.0582053444602273,
													"prevHandle": {
														"dv": 0,
														"dt": -0.92880859375
													},
													"nextHandle": {
														"dv": -2.5729900539317147e-16,
														"dt": 0.42212406308208533
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "Impact_Burst_Far_SandJet_R",
									"props": {
										"instScale_rand": 4,
										"simulationSpace": "World",
										"animationSpeed": 0,
										"randomColor1": [
											1,
											1,
											1,
											1
										],
										"enableSort": false,
										"instRotation_rand": [
											0,
											0,
											15
										],
										"lifeTimeRand": 3,
										"emitShape": "Cylinder",
										"emitSurface": true,
										"emitOrientation": "Normal",
										"instScale": 8,
										"lifeTime": 4,
										"emitRad1": 0.8,
										"randomColor2": [
											0.8431372549019608,
											0.7607843137254902,
											0.7254901960784313,
											1
										],
										"instSpeed_rand": [
											0.5,
											0,
											0
										],
										"emitRate": 20,
										"maxCount": 100,
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_Grunge_4x4_01.png",
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
										"instStretch_rand": [
											0,
											0.25,
											0
										],
										"instStretch": [
											1,
											2,
											1
										],
										"warmUpTime": -0.8,
										"emitType": "Burst",
										"burstParticleCount": 15,
										"emitAngle": 100,
										"instRotation": [
											0,
											0,
											30
										],
										"emitDuration": 20,
										"burstDelay": 1.35,
										"seedGroup": 5,
										"instSpeed": [
											3,
											0,
											0
										],
										"useRandomColor": true,
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
									"x": -0.7514,
									"z": -0.32935,
									"scaleX": 55,
									"scaleY": 55,
									"scaleZ": 0.2,
									"rotationZ": 90,
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
														"scale": 0.8
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
														"progress": 0.58,
														"saturation": 0,
														"width": 0.7,
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
																	"prevHandle": {
																		"dv": 1.1946815774171073,
																		"dt": -0.37422467067608545
																	},
																	"nextHandle": {
																		"dv": -1.0693652343750002,
																		"dt": 0.3379705070727756
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
													"topIntensity": 0.3,
													"topSpan": 0.3,
													"dirIntensity": 0.1,
													"dirSpan": 0,
													"sandBlend": 0.7,
													"envBlend": 0.7
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
													"value": -0.004801283442754212,
													"prevHandle": {
														"dv": -1.388476860780481,
														"dt": -0.06199247660355442
													},
													"nextHandle": {
														"dv": 0.7972549709272361,
														"dt": 0.03559570312500002
													}
												},
												{
													"time": 1,
													"value": 1.0582053444602273,
													"prevHandle": {
														"dv": 0,
														"dt": -0.92880859375
													},
													"nextHandle": {
														"dv": -2.5729900539317147e-16,
														"dt": 0.42212406308208533
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
										"range": 7,
										"power": 0.8
									},
									"isInstance": true
								}
							]
						}
					]
				}
			]
		}
	]
}