{
	"type": "fx",
	"duration": 3,
	"markers": [
		{
			"t": 0
		}
	],
	"cullingRadius": 99999,
	"children": [
		{
			"type": "object",
			"name": "group",
			"enabled": false,
			"editorOnly": true,
			"visible": false,
			"children": [
				{
					"type": "advancedDecal",
					"name": "advancedDecal",
					"x": 23.118145833333333,
					"y": 0.17853083333333333,
					"z": -2.550703333333333,
					"scaleX": 2000,
					"scaleY": 2000,
					"scaleZ": 100,
					"visible": false,
					"albedoMap": "Fx/Alphas/T_circle2.png",
					"fadePower": 2,
					"fadeEnd": 2,
					"renderMode": "AfterTonemapping",
					"children": [
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 1.8
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
											"mode": 0,
											"prevHandle": {
												"dv": 0.02457304813177874,
												"dt": -0.4999417385222912
											},
											"nextHandle": {
												"dv": -0.032194444444444525,
												"dt": 0.6549999999999999
											}
										},
										{
											"time": 0.8480245798826219,
											"value": -0.11268055555555556,
											"mode": 0,
											"prevHandle": {
												"dv": -0.2826274999610447,
												"dt": -0.07258413669395426
											},
											"nextHandle": {
												"dv": 1.4629392956255214,
												"dt": 0.3732254201173789
											}
										},
										{
											"time": 2.0987500000000017,
											"value": 0.9658333333333333,
											"mode": 2
										},
										{
											"time": 4.029597377181054,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.7565694444444444,
												"dt": -0.6394969111680986
											},
											"nextHandle": {
												"dv": -0.38865729915912894,
												"dt": 0.32951729901956367
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
									0.8666666666666667,
									0.7764705882352941
								]
							}
						}
					]
				},
				{
					"type": "shader",
					"name": "EnvColorMult",
					"source": "shaders/EnvColorMult.hx",
					"enabled": false,
					"props": {
						"sandBlend": 1,
						"sandColorSet": false,
						"envBlend": 1,
						"envColorSet": false
					},
					"isInstance": true
				},
				{
					"type": "object",
					"name": "group",
					"enabled": false,
					"x": -6.881854166666667,
					"y": 0.17853083333333333,
					"z": -2.550703333333333,
					"children": [
						{
							"type": "emitter",
							"name": "emitter",
							"enabled": false,
							"props": {
								"lifeTime": 0.5,
								"emitType": "Burst",
								"emitRate": 10,
								"burstCount": 5,
								"burstDelay": 0.1,
								"burstParticleCount": 3,
								"alignMode": "Screen",
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"animationSpeed": 0,
								"instScale_rand": 20,
								"instScale": 70,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_04.png",
								"instRotation_rand": [
									0,
									0,
									180
								]
							},
							"z": 42.1394,
							"scaleX": 30,
							"scaleY": 30,
							"scaleZ": 20,
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
													"emissive": 7.88
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
												"texture": "Fx/Alphas/T_circle3.png"
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
												"progress": 0.32,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Voronoi_01.png",
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
													"name": "width",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 1.178511301977579,
																"dt": -0.35355339059327373
															},
															"nextHandle": {
																"dv": -0.9166666666666667,
																"dt": 0.275
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
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													0.6745098039215687,
													0.49411764705882355
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "color.h",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.37341928182204265,
															"mode": 0,
															"prevHandle": {
																"dv": -0.026245905548016705,
																"dt": -0.49998450068971556
															},
															"nextHandle": {
																"dv": 0.026245905548016705,
																"dt": 0.49998450068971556
															}
														},
														{
															"time": 0.9949999999999999,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "color.s",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.013020435987223782,
																"dt": -0.49998474190939385
															},
															"nextHandle": {
																"dv": -0.016666666666666607,
																"dt": 0.6399999999999999
															}
														},
														{
															"time": 0.9949999999999999,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "color.l",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.7470588235294118,
															"mode": 0,
															"prevHandle": {
																"dv": 0.04692974128068688,
																"dt": -0.4998017446393115
															},
															"nextHandle": {
																"dv": -0.06372549019607843,
																"dt": 0.71
															}
														},
														{
															"time": 0.9949999999999999,
															"value": 0.11764705882352941,
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
							"type": "emitter",
							"name": "emitter",
							"props": {
								"lifeTime": 0.25,
								"emitType": "Burst",
								"alignMode": "Screen",
								"instScale": 2,
								"warmUpTime": -0.32,
								"instOffset": [
									0,
									0,
									50
								]
							},
							"visible": false,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 50,
									"scaleY": 49.999999999999986,
									"scaleZ": 50.00000000000001,
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
													"alphaKill": false,
													"enableStencil": false,
													"drawOrder": "100",
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
												"wrap": false,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 0.9,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Flare06_512.png"
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.71,
															"value": 0.9833333333333334,
															"mode": 0,
															"prevHandle": {
																"dv": 0.03144094491268983,
																"dt": -0.49991102411176125
															},
															"nextHandle": {
																"dv": -0.01666666666666672,
																"dt": 0.2649999999999999
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.5,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/NoisyWave_01.png",
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
													"keys": [
														{
															"time": 0.7749999999999999,
															"value": 1,
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
													"name": "width",
													"enabled": false,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
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
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"enabled": false,
											"props": {
												"scaleX": 1,
												"scaleY": 1,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVSweep",
											"source": "shaders/UVSweep.hx",
											"enabled": false,
											"props": {
												"saturation": 0,
												"width": 0.48,
												"useU": false,
												"progress": 0.5
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.9949999999999999,
															"value": 0.9666666666666667,
															"mode": 0,
															"prevHandle": {
																"dv": -0.2666666666666667,
																"dt": -1.79
															},
															"nextHandle": {
																"dv": 0.09929240604583035,
																"dt": 0.6665002755826369
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
													0,
													0,
													0
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "color.h",
													"keys": [
														{
															"time": 0.12000000000000001,
															"value": 0.21448624542580919,
															"mode": 2
														},
														{
															"time": 0.33,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.47000000000000003,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.6749999999999999,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0.21448624542580919,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "color.s",
													"keys": [
														{
															"time": 0.12000000000000001,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.33,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.47000000000000003,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.6749999999999999,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1,
															"value": 1,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "color.l",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.12000000000000001,
															"value": 0.6745098039215687,
															"mode": 0,
															"prevHandle": {
																"dv": 1.177032890353281,
																"dt": -0.3531098671059842
															},
															"nextHandle": {
																"dv": -0.457843137254902,
																"dt": 0.135
															}
														},
														{
															"time": 0.33,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.47000000000000003,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.6749999999999999,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1,
															"value": 0.6745098039215687,
															"mode": 0
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
												"range": 50,
												"power": 0.5
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "ShockWave",
							"enabled": false,
							"props": {
								"emitType": "Burst",
								"instScale": 500
							},
							"z": 2.27,
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
													"colorMask": 255,
													"depthTest": "LessEqual"
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
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 2,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_ChocWave_Blurred_02.png",
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
																"dt": -0.5708015990978788
															},
															"nextHandle": {
																"dv": 0.009785546759570019,
																"dt": 0.33328019978181483
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
												"power": 0.5
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.8,
												"envColorSet": false
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
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.9865403685451437,
												"dt": -0.40000000000000013
											},
											"nextHandle": {
												"dv": 0.9,
												"dt": 0.3683798050158908
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
							"type": "object",
							"name": "LensFlare",
							"enabled": false,
							"x": 0.14333,
							"y": -2.33833,
							"z": 53.43612,
							"scaleX": 20,
							"scaleY": 20,
							"scaleZ": 20,
							"children": [
								{
									"type": "object",
									"name": "LensFlare_Colored",
									"x": -0.14,
									"y": 0.06,
									"z": 0.49,
									"scaleX": 0.9999999999999998,
									"scaleY": 0.9999999999999998,
									"scaleZ": 0.9999999999999998,
									"rotationX": -40,
									"children": [
										{
											"type": "emitter",
											"name": "LensFlare_color_small2",
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
												"instScale": 4,
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
												"warmUpTime": -0.18,
												"instOffset": [
													0,
													1,
													0
												],
												"instRotation": [
													0,
													0,
													-30
												],
												"lifeTime": 0.3
											},
											"y": 5.551115123125783e-17,
											"scaleX": 0.09999999999999999,
											"scaleY": 0.09999999999999999,
											"scaleZ": 0.09999999999999999,
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
																	"emissive": 20
																}
															},
															"wrapRepeat": true,
															"diffuseMap": "Fx/Gradients/T_circleGradient_color02.png",
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
																"alpha": 0.2,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_LensFlare_04.png",
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
																			"mode": 0,
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
																"range": 1,
																"power": 1
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
											"name": "LensFlare_color2",
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
												"instScale": 7,
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
												"warmUpTime": -0.18,
												"instOffset": [
													0,
													1,
													0
												],
												"instRotation": [
													0,
													0,
													-30
												]
											},
											"y": 5.551115123125783e-17,
											"scaleX": 0.09999999999999999,
											"scaleY": 0.09999999999999999,
											"scaleZ": 0.09999999999999999,
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
															"diffuseMap": "Fx/Gradients/T_circleGradient_color02.png",
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
																"alpha": 0.1,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_LensFlare_04.png",
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
																			"mode": 0,
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
																"range": 1,
																"power": 1
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
											"name": "LensFlare_color_small",
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
												"instScale": 4,
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
												"warmUpTime": -0.1,
												"instOffset": [
													0,
													1,
													0
												],
												"instRotation": [
													0,
													0,
													-30
												],
												"lifeTime": 0.04
											},
											"y": 5.551115123125783e-17,
											"scaleX": 0.09999999999999999,
											"scaleY": 0.09999999999999999,
											"scaleZ": 0.09999999999999999,
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
																	"emissive": 20
																}
															},
															"wrapRepeat": true,
															"diffuseMap": "Fx/Gradients/T_circleGradient_color02.png",
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
																"alpha": 0.2,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_LensFlare_04.png",
																"onDecal": false
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0.0049999999999999975,
																			"value": 1,
																			"mode": 0,
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
																"range": 1,
																"power": 1
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
											"name": "LensFlare_color",
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
												"instScale": 7,
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
												"warmUpTime": -0.1,
												"instOffset": [
													0,
													1,
													0
												],
												"instRotation": [
													0,
													0,
													-30
												],
												"lifeTime": 0.04
											},
											"y": 5.551115123125783e-17,
											"scaleX": 0.09999999999999999,
											"scaleY": 0.09999999999999999,
											"scaleZ": 0.09999999999999999,
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
															"diffuseMap": "Fx/Gradients/T_circleGradient_color02.png",
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
																"alpha": 0.1,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_LensFlare_04.png",
																"onDecal": false
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0.0049999999999999975,
																			"value": 1,
																			"mode": 0,
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
																"range": 1,
																"power": 1
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
										}
									]
								},
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
										"instScale": 5.5,
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
										"warmUpTime": -0.1,
										"instOffset": [
											1.5,
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
										]
									},
									"x": -0.14,
									"y": -0.23,
									"z": 0.55,
									"scaleX": 0.09999999999999999,
									"scaleY": 0.09999999999999999,
									"scaleZ": 0.09999999999999999,
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
														"alpha": 0.07,
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
																	"mode": 0,
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
														"range": 1,
														"power": 1
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
															0.6941176470588235,
															0.3607843137254902,
															0.2588235294117647
														]
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
								}
							]
						},
						{
							"type": "object",
							"name": "AncientNuke",
							"enabled": false,
							"x": -0.125,
							"y": 0.125,
							"z": 26.76112375,
							"children": [
								{
									"type": "model",
									"name": "Ground",
									"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign.fbx",
									"x": 0.125,
									"y": -0.125,
									"z": -24.65495375,
									"scaleX": 200,
									"scaleY": 200,
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
													"alphaKill": false,
													"enableStencil": false,
													"parallax": 0,
													"drawOrder": "100"
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "VertexDisplacement",
											"source": "shaders/VertexDisplacement.hx",
											"enabled": false,
											"props": {
												"X": true,
												"Y": true,
												"Z": true,
												"texScale": 5,
												"tex": "Fx/DistortionMaps/waveNormal02.jpg",
												"intensity": 3.71,
												"scrollSpeed": [
													0.1,
													0.1
												],
												"smoothEdge": 9.85
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"onDecal": false,
												"wrap": false,
												"invert": false,
												"replace": false,
												"alpha": 2,
												"uScale": 1,
												"vScale": 0.95,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/GradientSpice_2.png"
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
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
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.52,
												"saturation": 0,
												"width": 0.33,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													-0.4
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
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.14233523557739344,
																"dt": -0.4981733245208754
															},
															"nextHandle": {
																"dv": -0.25,
																"dt": 0.875
															}
														},
														{
															"time": 1,
															"value": 0.6,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"enabled": false,
											"props": {
												"scaleX": 1,
												"scaleY": 1,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVSweep",
											"source": "shaders/UVSweep.hx",
											"props": {
												"saturation": 1,
												"width": 1,
												"useU": false,
												"progress": 0.78
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
															"mode": 2
														},
														{
															"time": 2,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.2666666666666667,
																"dt": -1.79
															},
															"nextHandle": {
																"dv": 0.09929240604583035,
																"dt": 0.6665002755826369
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorMap3",
											"source": "shaders/ColorMap3.hx",
											"enabled": false,
											"props": {
												"colorA": [
													0,
													0,
													0
												],
												"pointA": 0.33,
												"colorB": [
													1,
													0.23529411764705882,
													0
												],
												"pointB": 0.69,
												"colorC": [
													1,
													0.3607843137254902,
													0
												],
												"pointC": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													1,
													0.796078431372549,
													0.580392156862745
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.3254901960784314,
													0.3254901960784314,
													0.3254901960784314
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 1,
												"sandColorSet": false,
												"envBlend": 0,
												"envColorSet": false
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
												"range": 10,
												"power": 0.8
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "model",
									"name": "Tete_Deform",
									"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign.fbx",
									"x": -0.875,
									"y": 0.875,
									"z": 26.56099625,
									"scaleX": 80,
									"scaleY": 80,
									"scaleZ": 5,
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
													"alphaKill": false,
													"enableStencil": false,
													"parallax": 0,
													"drawOrder": "110",
													"emissive": 10
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "VertexDisplacement",
											"source": "shaders/VertexDisplacement.hx",
											"enabled": false,
											"props": {
												"X": true,
												"Y": true,
												"Z": true,
												"texScale": 5,
												"tex": "Fx/DistortionMaps/waveNormal02.jpg",
												"intensity": 3.71,
												"scrollSpeed": [
													0.1,
													0.1
												],
												"smoothEdge": 9.85
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"onDecal": false,
												"wrap": false,
												"invert": false,
												"replace": false,
												"alpha": 2,
												"uScale": 1,
												"vScale": 0.95,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/GradientSpice_2.png"
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
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
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.52,
												"saturation": 0,
												"width": 0.33,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													-0.4
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
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.14233523557739344,
																"dt": -0.4981733245208754
															},
															"nextHandle": {
																"dv": -0.25,
																"dt": 0.875
															}
														},
														{
															"time": 1,
															"value": 0.6,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"enabled": false,
											"props": {
												"scaleX": 1,
												"scaleY": 1,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVSweep",
											"source": "shaders/UVSweep.hx",
											"props": {
												"saturation": 1,
												"width": 1,
												"useU": false,
												"progress": 0.78
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
															"mode": 2
														},
														{
															"time": 2.2,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.033333333333333326,
																"dt": -1.7750000000000001
															},
															"nextHandle": {
																"dv": 0.012528732457351834,
																"dt": 0.6671550033539847
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorMap3",
											"source": "shaders/ColorMap3.hx",
											"enabled": false,
											"props": {
												"colorA": [
													0,
													0,
													0
												],
												"pointA": 0.33,
												"colorB": [
													1,
													0.23529411764705882,
													0
												],
												"pointB": 0.69,
												"colorC": [
													1,
													0.3607843137254902,
													0
												],
												"pointC": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													1,
													0.796078431372549,
													0.580392156862745
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"enabled": false,
											"props": {
												"sandBlend": 1,
												"sandColorSet": false,
												"envBlend": 0,
												"envColorSet": false
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
												"range": 10,
												"power": 0.8
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													0.396078431372549,
													0.1843137254901961
												]
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "model",
									"name": "Nuke_Tete_Fire",
									"source": "Fx/Meshes_Common/Nuke_5.fbx",
									"x": 0.125,
									"y": -0.125,
									"z": 27.01960625,
									"scaleX": 2.2,
									"scaleY": 2.2,
									"scaleZ": 2.2,
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
													"alphaKill": false,
													"enableStencil": false,
													"parallax": 0,
													"emissive": 10,
													"drawOrder": "100"
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "VertexDisplacement",
											"source": "shaders/VertexDisplacement.hx",
											"enabled": false,
											"props": {
												"X": true,
												"Y": true,
												"Z": true,
												"texScale": 5,
												"tex": "Fx/DistortionMaps/waveNormal02.jpg",
												"intensity": 3.71,
												"scrollSpeed": [
													0.1,
													0.1
												],
												"smoothEdge": 100
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"onDecal": false,
												"wrap": false,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 0.91,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/GradientSpice_2.png"
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
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
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.29,
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
													0.5
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
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.14233523557739344,
																"dt": -0.4981733245208754
															},
															"nextHandle": {
																"dv": -0.25,
																"dt": 0.875
															}
														},
														{
															"time": 1,
															"value": 0.6,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"enabled": false,
											"props": {
												"scaleX": 1,
												"scaleY": 1,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVSweep",
											"source": "shaders/UVSweep.hx",
											"props": {
												"saturation": 1,
												"width": 0.33,
												"useU": false,
												"progress": 0.7
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
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.5,
															"value": 1.3,
															"mode": 0,
															"prevHandle": {
																"dv": -1.078256415940511,
																"dt": -1.785
															},
															"nextHandle": {
																"dv": 1.078256415940511,
																"dt": 1.785
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorMap3",
											"source": "shaders/ColorMap3.hx",
											"enabled": false,
											"props": {
												"colorA": [
													0,
													0,
													0
												],
												"pointA": 0.33,
												"colorB": [
													1,
													0.23529411764705882,
													0
												],
												"pointB": 0.69,
												"colorC": [
													1,
													0.3607843137254902,
													0
												],
												"pointC": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													1,
													0.796078431372549,
													0.580392156862745
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													0.396078431372549,
													0.1843137254901961
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
												"range": 10,
												"power": 0.8
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "model",
									"name": "Nuke_Tete_Smoke",
									"source": "Fx/Meshes_Common/Nuke_5.fbx",
									"x": 0.125,
									"y": -0.125,
									"z": 27.01960625,
									"scaleX": 2.2,
									"scaleY": 2.2,
									"scaleZ": 2.2,
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
													"alphaKill": false,
													"enableStencil": false,
													"parallax": 0,
													"drawOrder": "110"
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "VertexDisplacement",
											"source": "shaders/VertexDisplacement.hx",
											"props": {
												"X": true,
												"Y": true,
												"Z": true,
												"texScale": 1.21,
												"tex": "Fx/DistortionMaps/waveNormal.jpg",
												"intensity": 4,
												"scrollSpeed": [
													0.1,
													0.1
												],
												"smoothEdge": 0,
												"texScaleX": 1,
												"texScaleY": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"onDecal": false,
												"wrap": false,
												"invert": true,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/GradientSpice_2.png"
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
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
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.48,
												"saturation": 1,
												"width": 0.21,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.4
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
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.14233523557739344,
																"dt": -0.4981733245208754
															},
															"nextHandle": {
																"dv": -0.25,
																"dt": 0.875
															}
														},
														{
															"time": 1,
															"value": 0.6,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"enabled": false,
											"props": {
												"scaleX": 1,
												"scaleY": 1,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorMap3",
											"source": "shaders/ColorMap3.hx",
											"enabled": false,
											"props": {
												"colorA": [
													0,
													0,
													0
												],
												"pointA": 0.33,
												"colorB": [
													1,
													0.23529411764705882,
													0
												],
												"pointB": 0.69,
												"colorC": [
													1,
													0.3607843137254902,
													0
												],
												"pointC": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVSweep",
											"source": "shaders/UVSweep.hx",
											"props": {
												"saturation": 1,
												"width": 1,
												"useU": false,
												"progress": 0.8
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
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.5,
															"value": 1.3,
															"mode": 0,
															"prevHandle": {
																"dv": -1.078256415940511,
																"dt": -1.785
															},
															"nextHandle": {
																"dv": 1.078256415940511,
																"dt": 1.785
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
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													1,
													0.796078431372549,
													0.580392156862745
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.15294117647058825,
													0.15294117647058825,
													0.15294117647058825
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
												"range": 10,
												"power": 0.8
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "model",
									"name": "Nuke_Tete_Sand",
									"source": "Fx/Meshes_Common/Nuke_5.fbx",
									"x": 0.125,
									"y": -0.125,
									"z": 27.01960625,
									"scaleX": 2.2,
									"scaleY": 2.2,
									"scaleZ": 2.2,
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
													"alphaKill": false,
													"enableStencil": false,
													"parallax": 0,
													"emissive": 10,
													"drawOrder": "100"
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "VertexDisplacement",
											"source": "shaders/VertexDisplacement.hx",
											"enabled": false,
											"props": {
												"X": true,
												"Y": true,
												"Z": true,
												"texScale": 5,
												"tex": "Fx/DistortionMaps/waveNormal02.jpg",
												"intensity": 3.71,
												"scrollSpeed": [
													0.1,
													0.1
												],
												"smoothEdge": 100
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"onDecal": false,
												"wrap": false,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 0.91,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/GradientSpice_2.png"
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
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
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.61,
												"saturation": 0,
												"width": 0.39,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.4
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
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.14233523557739344,
																"dt": -0.4981733245208754
															},
															"nextHandle": {
																"dv": -0.25,
																"dt": 0.875
															}
														},
														{
															"time": 1,
															"value": 0.6,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"enabled": false,
											"props": {
												"scaleX": 1,
												"scaleY": 1,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorMap3",
											"source": "shaders/ColorMap3.hx",
											"enabled": false,
											"props": {
												"colorA": [
													0,
													0,
													0
												],
												"pointA": 0.33,
												"colorB": [
													1,
													0.23529411764705882,
													0
												],
												"pointB": 0.69,
												"colorC": [
													1,
													0.3607843137254902,
													0
												],
												"pointC": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVSweep",
											"source": "shaders/UVSweep.hx",
											"props": {
												"saturation": 1,
												"width": 1,
												"useU": false,
												"progress": 0.7
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
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.5,
															"value": 1.3,
															"mode": 0,
															"prevHandle": {
																"dv": -1.078256415940511,
																"dt": -1.785
															},
															"nextHandle": {
																"dv": 1.078256415940511,
																"dt": 1.785
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
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													1,
													0.796078431372549,
													0.580392156862745
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.611764705882353,
													0.611764705882353,
													0.611764705882353
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 1,
												"sandColorSet": false,
												"envBlend": 0,
												"envColorSet": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 10,
												"power": 0.8
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "model",
									"name": "Nuke",
									"source": "Fx/Meshes_Common/Nuke_4.fbx",
									"x": 0.125,
									"y": -0.125,
									"z": -27.65495375,
									"scaleX": 2.2,
									"scaleY": 2.2,
									"scaleZ": 2.5,
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
													"alphaKill": false,
													"enableStencil": false,
													"parallax": 0,
													"drawOrder": "100"
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "VertexDisplacement",
											"source": "shaders/VertexDisplacement.hx",
											"props": {
												"X": true,
												"Y": true,
												"Z": true,
												"texScale": 5,
												"tex": "Fx/DistortionMaps/waveNormal02.jpg",
												"intensity": 3.71,
												"scrollSpeed": [
													0.1,
													0.1
												],
												"smoothEdge": 9.85,
												"texScaleX": 1,
												"texScaleY": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"onDecal": false,
												"wrap": false,
												"invert": false,
												"replace": false,
												"alpha": 2,
												"uScale": 1,
												"vScale": 0.95,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/GradientSpice_2.png"
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1,
															"value": 1,
															"mode": 2
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
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.52,
												"saturation": 0,
												"width": 0.33,
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.4
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
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.14233523557739344,
																"dt": -0.4981733245208754
															},
															"nextHandle": {
																"dv": -0.25,
																"dt": 0.875
															}
														},
														{
															"time": 1,
															"value": 0.6,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0.6,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"enabled": false,
											"props": {
												"scaleX": 1,
												"scaleY": 1,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVSweep",
											"source": "shaders/UVSweep.hx",
											"props": {
												"saturation": 1,
												"width": 1,
												"useU": false,
												"progress": 0.78
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
															"value": 0,
															"mode": 2
														},
														{
															"time": 2,
															"value": 1.3,
															"mode": 0,
															"prevHandle": {
																"dv": -0.6072222222222223,
																"dt": -1.7149999999999999
															},
															"nextHandle": {
																"dv": 0.23673363834399366,
																"dt": 0.6631549379019129
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorMap3",
											"source": "shaders/ColorMap3.hx",
											"enabled": false,
											"props": {
												"colorA": [
													0,
													0,
													0
												],
												"pointA": 0.33,
												"colorB": [
													1,
													0.23529411764705882,
													0
												],
												"pointB": 0.69,
												"colorC": [
													1,
													0.3607843137254902,
													0
												],
												"pointC": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													1,
													0.796078431372549,
													0.580392156862745
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.15294117647058825,
													0.15294117647058825,
													0.15294117647058825
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 1,
												"sandColorSet": false,
												"envBlend": 0,
												"envColorSet": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 10,
												"power": 0.8
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "model",
									"name": "Nuke",
									"source": "Fx/Meshes_Common/Nuke_4.fbx",
									"x": 0.125,
									"y": -0.125,
									"z": -27.65495375,
									"scaleX": 2.2,
									"scaleY": 2.2,
									"scaleZ": 2.5,
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
													"alphaKill": false,
													"enableStencil": false,
													"parallax": 0,
													"emissive": 10
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "VertexDisplacement",
											"source": "shaders/VertexDisplacement.hx",
											"enabled": false,
											"props": {
												"X": true,
												"Y": true,
												"Z": true,
												"texScale": 5,
												"tex": "Fx/DistortionMaps/waveNormal02.jpg",
												"intensity": 3.71,
												"scrollSpeed": [
													0.1,
													0.1
												],
												"smoothEdge": 100
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"onDecal": false,
												"wrap": false,
												"invert": false,
												"replace": false,
												"alpha": 0.5,
												"uScale": 1,
												"vScale": 0.95,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/GradientSpice_2.png"
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1,
															"value": 1,
															"mode": 2
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
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.61,
												"saturation": 0,
												"width": 0.39,
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.4
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
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.14233523557739344,
																"dt": -0.4981733245208754
															},
															"nextHandle": {
																"dv": -0.25,
																"dt": 0.875
															}
														},
														{
															"time": 1,
															"value": 0.6,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0.6,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"enabled": false,
											"props": {
												"scaleX": 1,
												"scaleY": 1,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVSweep",
											"source": "shaders/UVSweep.hx",
											"props": {
												"saturation": 1,
												"width": 1,
												"useU": false,
												"progress": 0.78
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
															"value": 0,
															"mode": 2
														},
														{
															"time": 2,
															"value": 1.3,
															"mode": 0,
															"prevHandle": {
																"dv": -0.2666666666666667,
																"dt": -1.79
															},
															"nextHandle": {
																"dv": 0.09929240604583035,
																"dt": 0.6665002755826369
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorMap3",
											"source": "shaders/ColorMap3.hx",
											"enabled": false,
											"props": {
												"colorA": [
													0,
													0,
													0
												],
												"pointA": 0.33,
												"colorB": [
													1,
													0.23529411764705882,
													0
												],
												"pointB": 0.69,
												"colorC": [
													1,
													0.3607843137254902,
													0
												],
												"pointC": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													1,
													0.796078431372549,
													0.580392156862745
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.611764705882353,
													0.611764705882353,
													0.611764705882353
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 1,
												"sandColorSet": false,
												"envBlend": 0,
												"envColorSet": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 10,
												"power": 0.8
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "model",
									"name": "Nuke",
									"source": "Fx/Meshes_Common/Nuke_4.fbx",
									"x": 0.125,
									"y": -0.125,
									"z": -27.65495375,
									"scaleX": 2,
									"scaleY": 2,
									"scaleZ": 2.5,
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
													"alphaKill": false,
													"enableStencil": false,
													"parallax": 0,
													"emissive": 12
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "VertexDisplacement",
											"source": "shaders/VertexDisplacement.hx",
											"enabled": false,
											"props": {
												"X": true,
												"Y": true,
												"Z": true,
												"texScale": 5,
												"tex": "Fx/DistortionMaps/waveNormal02.jpg",
												"intensity": 3.71,
												"scrollSpeed": [
													0.1,
													0.1
												],
												"smoothEdge": 100
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"onDecal": false,
												"wrap": false,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/GradientSpice_2.png"
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.15000000000000002,
															"value": 0.15000000000000002,
															"mode": 2
														},
														{
															"time": 1,
															"value": 1,
															"mode": 2
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
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.26,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/causticTexture_04.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.5
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
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.14233523557739344,
																"dt": -0.4981733245208754
															},
															"nextHandle": {
																"dv": -0.25,
																"dt": 0.875
															}
														},
														{
															"time": 1,
															"value": 0.6,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0.6,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"enabled": false,
											"props": {
												"scaleX": 1,
												"scaleY": 1,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVSweep",
											"source": "shaders/UVSweep.hx",
											"props": {
												"saturation": 1,
												"width": 1,
												"useU": false,
												"progress": 0.78
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
															"value": 0,
															"mode": 2
														},
														{
															"time": 2,
															"value": 1.3,
															"mode": 0,
															"prevHandle": {
																"dv": -0.8666666666666667,
																"dt": -1.72
															},
															"nextHandle": {
																"dv": 0.334961932188022,
																"dt": 0.6647706038808452
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorMap3",
											"source": "shaders/ColorMap3.hx",
											"enabled": false,
											"props": {
												"colorA": [
													0,
													0,
													0
												],
												"pointA": 0.33,
												"colorB": [
													1,
													0.23529411764705882,
													0
												],
												"pointB": 0.69,
												"colorC": [
													1,
													0.3607843137254902,
													0
												],
												"pointC": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													1,
													0.796078431372549,
													0.580392156862745
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													0.396078431372549,
													0.1843137254901961
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
												"range": 10,
												"power": 0.8
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "advancedDecal",
							"z": 10.84637,
							"scaleX": 2500,
							"scaleY": 2500,
							"scaleZ": 100,
							"visible": false,
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
										"alpha": 0.7
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
													"mode": 0,
													"prevHandle": {
														"dv": -0.0813884639086944,
														"dt": -0.49977459679029407
													},
													"nextHandle": {
														"dv": 0.05083333333333334,
														"dt": 0.312091144642585
													}
												},
												{
													"time": 0.43,
													"value": 1.0166666666666666,
													"mode": 2
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.01694444444444443,
														"dt": -0.92
													},
													"nextHandle": {
														"dv": 0.0036483096695542616,
														"dt": 0.19808527255022765
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
											0,
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
							"z": 10.84637,
							"scaleX": 2500,
							"scaleY": 2500,
							"scaleZ": 100,
							"visible": false,
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
										"alpha": 0.7
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
													"mode": 0,
													"prevHandle": {
														"dv": -0.0813884639086944,
														"dt": -0.49977459679029407
													},
													"nextHandle": {
														"dv": 0.05083333333333334,
														"dt": 0.312091144642585
													}
												},
												{
													"time": 0.43,
													"value": 1.0166666666666666,
													"mode": 2
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.95
													},
													"nextHandle": {
														"dv": -1.6442080811911285e-16,
														"dt": 0.19808819793730628
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
											0,
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
							"enabled": false,
							"z": 10.84637,
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
										"alpha": 0.5
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.0049999999999999975,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.01646169970710893,
														"dt": -0.5003277255242591
													},
													"nextHandle": {
														"dv": -0.03388888888888886,
														"dt": 1.03
													}
												},
												{
													"time": 0.48000000000000004,
													"value": 1.0166666666666666,
													"mode": 2
												},
												{
													"time": 3,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 1.0166666666666666,
														"dt": -0.15000000000000036
													},
													"nextHandle": {
														"dv": -0.6004279831960728,
														"dt": 0.08858773522565007
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
											0.7333333333333333,
											0.5450980392156862
										]
									}
								}
							]
						},
						{
							"type": "emitter",
							"name": "Distort_Chockwave",
							"props": {
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
									360
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
								"emitType": "Burst",
								"burstDelay": 0.3,
								"useRandomColor": true,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"warmUpTime": -0.5,
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instScale": 1.8,
								"alignMode": "Screen",
								"instOffset": [
									0,
									0,
									30
								]
							},
							"z": 31.57076,
							"scaleX": 0.5,
							"scaleY": 0.5,
							"scaleZ": 0.05,
							"visible": false,
							"children": [
								{
									"type": "model",
									"name": "Ring",
									"source": "Fx/Meshes_Common/DiskFlat.fbx",
									"scaleX": 200,
									"scaleY": 200,
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
													"culling": "None",
													"depthWrite": "On",
													"drawOrder": "-100",
													"emissive": 2.2
												}
											},
											"diffuseMap": "Fx/noise/causticTexture_03-2.png"
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
															"mode": 0,
															"prevHandle": {
																"dv": 0.5969588995728569,
																"dt": -0.2623791435549754
															},
															"nextHandle": {
																"dv": -0.5969588995728569,
																"dt": 0.2623791435549754
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.08425454545454536,
																"dt": -0.2350000000000001
															},
															"nextHandle": {
																"dv": -0.08425454545454536,
																"dt": 0.2350000000000001
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
												"texture": "Fx/noise/Water_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.5
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
													"keyMode": 0,
													"keys": [
														{
															"time": 0.5350976805491343,
															"value": 0.9422222222222223,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.03695353771889259
															},
															"nextHandle": {
																"dv": -6.922428196740585e-16,
																"dt": 0.24478506621704163
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.5,
																"dt": -0.18500000000000005
															},
															"nextHandle": {
																"dv": -0.8474237452673484,
																"dt": 0.3135467857489186
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
									"name": "instScale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.0049999999999999975,
											"value": 0.0402048299726524,
											"mode": 0,
											"prevHandle": {
												"dv": -0.9239350146379692,
												"dt": -0.3456633226416698
											},
											"nextHandle": {
												"dv": 0.12028199966650588,
												"dt": 0.045000000000000005
											}
										},
										{
											"time": 1,
											"value": 1.0158254939343108,
											"mode": 0,
											"prevHandle": {
												"dv": -0.026729333259223442,
												"dt": -0.865
											},
											"nextHandle": {
												"dv": 0.0103433736750329,
												"dt": 0.33472657705803693
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
					"name": "group",
					"x": -3.757814166666667,
					"y": -0.31127916666666666,
					"z": -2.550703333333333,
					"visible": false,
					"children": [
						{
							"type": "emitter",
							"name": "emitter",
							"enabled": false,
							"props": {
								"lifeTime": 0.5,
								"emitType": "Burst",
								"emitRate": 10,
								"burstCount": 5,
								"burstDelay": 0.1,
								"burstParticleCount": 3,
								"alignMode": "Screen",
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"animationSpeed": 0,
								"instScale_rand": 20,
								"instScale": 70,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_04.png",
								"instRotation_rand": [
									0,
									0,
									180
								]
							},
							"z": 42.1394,
							"scaleX": 30,
							"scaleY": 30,
							"scaleZ": 20,
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
													"emissive": 7.88
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
												"texture": "Fx/Alphas/T_circle3.png"
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
												"progress": 0.32,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Voronoi_01.png",
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
													"name": "width",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 1.178511301977579,
																"dt": -0.35355339059327373
															},
															"nextHandle": {
																"dv": -0.9166666666666667,
																"dt": 0.275
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
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													0.6745098039215687,
													0.49411764705882355
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "color.h",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.37341928182204265,
															"mode": 0,
															"prevHandle": {
																"dv": -0.026245905548016705,
																"dt": -0.49998450068971556
															},
															"nextHandle": {
																"dv": 0.026245905548016705,
																"dt": 0.49998450068971556
															}
														},
														{
															"time": 0.9949999999999999,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "color.s",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.013020435987223782,
																"dt": -0.49998474190939385
															},
															"nextHandle": {
																"dv": -0.016666666666666607,
																"dt": 0.6399999999999999
															}
														},
														{
															"time": 0.9949999999999999,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "color.l",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.7470588235294118,
															"mode": 0,
															"prevHandle": {
																"dv": 0.04692974128068688,
																"dt": -0.4998017446393115
															},
															"nextHandle": {
																"dv": -0.06372549019607843,
																"dt": 0.71
															}
														},
														{
															"time": 0.9949999999999999,
															"value": 0.11764705882352941,
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
							"type": "emitter",
							"name": "emitter",
							"props": {
								"lifeTime": 0.5,
								"emitType": "Burst",
								"emitRate": 10,
								"burstCount": 7,
								"burstDelay": 0.1,
								"burstParticleCount": 3,
								"alignMode": "Screen",
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"animationSpeed": 0,
								"instScale_rand": 20,
								"instScale": 70,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_04.png",
								"instRotation_rand": [
									0,
									0,
									180
								],
								"warmUpTime": -0.2
							},
							"z": 42.11861,
							"scaleX": 20,
							"scaleY": 20,
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
													"emissive": 5,
													"drawOrder": "-90"
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
												"texture": "Fx/Alphas/T_circle3.png"
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
												"progress": 0.3,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Voronoi_01.png",
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
													"name": "width",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 1.178511301977579,
																"dt": -0.35355339059327373
															},
															"nextHandle": {
																"dv": -0.9166666666666667,
																"dt": 0.275
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
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													0.5686274509803921,
													0.32941176470588235
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "color.h",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.37341928182204265,
															"mode": 0,
															"prevHandle": {
																"dv": -0.026245905548016705,
																"dt": -0.49998450068971556
															},
															"nextHandle": {
																"dv": 0.026245905548016705,
																"dt": 0.49998450068971556
															}
														},
														{
															"time": 0.9949999999999999,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "color.s",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.013020435987223782,
																"dt": -0.49998474190939385
															},
															"nextHandle": {
																"dv": -0.016666666666666607,
																"dt": 0.6399999999999999
															}
														},
														{
															"time": 0.9949999999999999,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "color.l",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.7470588235294118,
															"mode": 0,
															"prevHandle": {
																"dv": 0.04692974128068688,
																"dt": -0.4998017446393115
															},
															"nextHandle": {
																"dv": -0.06372549019607843,
																"dt": 0.71
															}
														},
														{
															"time": 0.9949999999999999,
															"value": 0.11764705882352941,
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
							"type": "model",
							"name": "HugeCircle",
							"source": "Fx/Meshes_Common/Nuke_Circle.fbx",
							"z": 0.77564,
							"scaleX": 5,
							"scaleY": 5,
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
											"alphaKill": false,
											"emissive": 10,
											"enableStencil": false
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"onDecal": false,
										"wrap": false,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 0.9,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/GradientSpice_2.png"
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
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
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.47,
										"saturation": 0,
										"width": 0.04,
										"uvScaleX": 2,
										"uvScaleY": 2,
										"texture": "Fx/noise/perlin06.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0.5
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
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.21500000000000002,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.0100000000000002,
													"value": 0,
													"mode": 2
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
										"scaleX": 1,
										"scaleY": 1,
										"shiftX": 0,
										"shiftY": 0,
										"shiftSpeedX": 0,
										"shiftSpeedY": 0
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "UVSweep",
									"source": "shaders/UVSweep.hx",
									"props": {
										"saturation": 0,
										"width": 0.48,
										"useU": false,
										"progress": 1
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
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.9949999999999999,
													"value": 0.9666666666666667,
													"mode": 0,
													"prevHandle": {
														"dv": -0.2666666666666667,
														"dt": -1.79
													},
													"nextHandle": {
														"dv": 0.09929240604583035,
														"dt": 0.6665002755826369
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "ColorMap3",
									"source": "shaders/ColorMap3.hx",
									"enabled": false,
									"props": {
										"colorA": [
											0,
											0,
											0
										],
										"pointA": 0.33,
										"colorB": [
											1,
											0.23529411764705882,
											0
										],
										"pointB": 0.69,
										"colorC": [
											1,
											0.3607843137254902,
											0
										],
										"pointC": 1
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "VertexDisplacement",
									"source": "shaders/VertexDisplacement.hx",
									"enabled": false,
									"props": {
										"X": true,
										"Y": true,
										"Z": true,
										"texScale": 1,
										"tex": "Fx/noise/perlin1_normal.png",
										"intensity": 1,
										"scrollSpeed": [
											1,
											1
										],
										"smoothEdge": 0
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
											1,
											0.4627450980392157,
											0.4627450980392157
										]
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "color.h",
											"keys": [
												{
													"time": 0,
													"value": 0.23718577014281914,
													"mode": 2
												},
												{
													"time": 1.9949999999999999,
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
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.9949999999999999,
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
													"value": 0.5411764705882353,
													"mode": 2
												},
												{
													"time": 1.9949999999999999,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -1.6242132481694627,
												"dt": -0.4783317130411524
											},
											"nextHandle": {
												"dv": 2.108828125,
												"dt": 0.615
											}
										},
										{
											"time": 3.0050000000000003,
											"value": 3,
											"mode": 0,
											"prevHandle": {
												"dv": -0.1602734374999999,
												"dt": -0.365
											},
											"nextHandle": {
												"dv": 0.1602734374999999,
												"dt": 0.365
											}
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "LittleCircle",
							"source": "Fx/Meshes_Common/Nuke_Circle.fbx",
							"z": 56.77703,
							"scaleX": 1.2,
							"scaleY": 1.2,
							"scaleZ": 2,
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
											"alphaKill": false,
											"emissive": 30,
											"enableStencil": false,
											"textureWrap": true
										}
									},
									"wrapRepeat": true,
									"diffuseMap": "Fx/Alphas/T_Nuke.png"
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"onDecal": false,
										"wrap": false,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 0.9,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/GradientSpice_2.png"
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
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
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.64,
										"saturation": 1,
										"width": 0.21,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/perlin06.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0.5
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
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.5,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "ColorMap3",
									"source": "shaders/ColorMap3.hx",
									"enabled": false,
									"props": {
										"colorA": [
											0,
											0,
											0
										],
										"pointA": 0.33,
										"colorB": [
											1,
											0.23529411764705882,
											0
										],
										"pointB": 0.69,
										"colorC": [
											1,
											0.3607843137254902,
											0
										],
										"pointC": 1
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "VertexDisplacement",
									"source": "shaders/VertexDisplacement.hx",
									"enabled": false,
									"props": {
										"X": true,
										"Y": true,
										"Z": true,
										"texScale": 1,
										"tex": "Fx/noise/perlin1_normal.png",
										"intensity": 1,
										"scrollSpeed": [
											1,
											1
										],
										"smoothEdge": 0,
										"texScaleX": 1,
										"texScaleY": 1
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "UVSweep",
									"source": "shaders/UVSweep.hx",
									"props": {
										"saturation": 0,
										"width": 0.48,
										"useU": false,
										"progress": 1
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
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.9949999999999999,
													"value": 0.9666666666666667,
													"mode": 0,
													"prevHandle": {
														"dv": -0.2666666666666667,
														"dt": -1.79
													},
													"nextHandle": {
														"dv": 0.09929240604583035,
														"dt": 0.6665002755826369
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
									"enabled": false,
									"props": {
										"amount": 1,
										"color": [
											1,
											0.33725490196078434,
											0
										]
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "color.h",
											"keys": [
												{
													"time": 0,
													"value": 0.3677658066702336,
													"mode": 2
												},
												{
													"time": 0.99,
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
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.99,
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
													"value": 0.6705882352941177,
													"mode": 2
												},
												{
													"time": 0.99,
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
										"amount": 0.58,
										"color": [
											0,
											0,
											0
										]
									},
									"isInstance": true
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.8,
											"mode": 2
										},
										{
											"time": 2,
											"value": 1.5,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.3333333333333333
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.3333333333333333
											}
										}
									]
								},
								{
									"type": "shader",
									"name": "Level",
									"source": "shaders/Level.hx",
									"props": {
										"levelMin": 0.18,
										"levelMax": 0.7
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "Fresnel",
									"source": "shaders/Fresnel.hx",
									"props": {
										"RGB": true,
										"ALPHA": true,
										"REVERSE": false,
										"bias": 0.23,
										"scale": 0.09,
										"power": 0,
										"color": [
											0.24705882352941178,
											0.08235294117647059,
											0
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 2,
										"scaleY": 1,
										"shiftX": 0,
										"shiftY": 0,
										"shiftSpeedX": 0,
										"shiftSpeedY": 0
									},
									"recursiveApply": false,
									"isInstance": true
								}
							]
						},
						{
							"type": "model",
							"name": "Bigcircle",
							"source": "Fx/Meshes_Common/Nuke_Circle.fbx",
							"z": 24.83221,
							"scaleX": 1.7,
							"scaleY": 1.7,
							"scaleZ": 3,
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
											"alphaKill": false,
											"emissive": 30,
											"enableStencil": false,
											"textureWrap": true
										}
									},
									"wrapRepeat": true,
									"diffuseMap": "Fx/Alphas/T_Nuke.png"
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"onDecal": false,
										"wrap": false,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 0.9,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/GradientSpice_2.png"
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
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
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.64,
										"saturation": 1,
										"width": 0.21,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/perlin06.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0.5
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
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 2
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
									"type": "shader",
									"name": "ColorMap3",
									"source": "shaders/ColorMap3.hx",
									"enabled": false,
									"props": {
										"colorA": [
											0,
											0,
											0
										],
										"pointA": 0.33,
										"colorB": [
											1,
											0.23529411764705882,
											0
										],
										"pointB": 0.69,
										"colorC": [
											1,
											0.3607843137254902,
											0
										],
										"pointC": 1
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "VertexDisplacement",
									"source": "shaders/VertexDisplacement.hx",
									"enabled": false,
									"props": {
										"X": true,
										"Y": true,
										"Z": true,
										"texScale": 1,
										"tex": "Fx/noise/perlin1_normal.png",
										"intensity": 1,
										"scrollSpeed": [
											1,
											1
										],
										"smoothEdge": 0
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "UVSweep",
									"source": "shaders/UVSweep.hx",
									"props": {
										"saturation": 0,
										"width": 0.48,
										"useU": false,
										"progress": 1
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
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.9949999999999999,
													"value": 0.9666666666666667,
													"mode": 0,
													"prevHandle": {
														"dv": -0.2666666666666667,
														"dt": -1.79
													},
													"nextHandle": {
														"dv": 0.09929240604583035,
														"dt": 0.6665002755826369
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
									"enabled": false,
									"props": {
										"amount": 1,
										"color": [
											1,
											0.33725490196078434,
											0
										]
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "color.h",
											"keys": [
												{
													"time": 0,
													"value": 0.3677658066702336,
													"mode": 2
												},
												{
													"time": 0.99,
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
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.99,
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
													"value": 0.6705882352941177,
													"mode": 2
												},
												{
													"time": 0.99,
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
										"amount": 0.58,
										"color": [
											0,
											0,
											0
										]
									},
									"isInstance": true
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.8,
											"mode": 2
										},
										{
											"time": 1.5,
											"value": 1.7,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.3333333333333333
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.3333333333333333
											}
										}
									]
								},
								{
									"type": "shader",
									"name": "Level",
									"source": "shaders/Level.hx",
									"props": {
										"levelMin": 0.18,
										"levelMax": 0.7
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "Fresnel",
									"source": "shaders/Fresnel.hx",
									"props": {
										"RGB": true,
										"ALPHA": true,
										"REVERSE": false,
										"bias": 0.23,
										"scale": 0.09,
										"power": 0,
										"color": [
											0.24705882352941178,
											0.08235294117647059,
											0
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 2,
										"scaleY": 1,
										"shiftX": 0,
										"shiftY": 0,
										"shiftSpeedX": 0,
										"shiftSpeedY": 0
									},
									"recursiveApply": false,
									"isInstance": true
								}
							]
						},
						{
							"type": "emitter",
							"name": "emitter",
							"props": {
								"lifeTime": 0.15,
								"emitType": "Burst",
								"alignMode": "Screen",
								"instScale": 20
							},
							"z": 89.9454,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 50,
									"scaleY": 49.999999999999986,
									"scaleZ": 50.00000000000001,
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
													"alphaKill": false,
													"enableStencil": false,
													"drawOrder": "-80"
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
												"wrap": false,
												"invert": false,
												"replace": false,
												"alpha": 0.1,
												"uScale": 1,
												"vScale": 0.9,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/z_FillWhite.jpg"
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.71,
															"value": 0.9833333333333334,
															"mode": 0,
															"prevHandle": {
																"dv": 0.03144094491268983,
																"dt": -0.49991102411176125
															},
															"nextHandle": {
																"dv": -0.01666666666666672,
																"dt": 0.2649999999999999
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.5,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/NoisyWave_01.png",
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
													"keys": [
														{
															"time": 0.7749999999999999,
															"value": 1,
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
													"name": "width",
													"enabled": false,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
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
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"enabled": false,
											"props": {
												"scaleX": 1,
												"scaleY": 1,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVSweep",
											"source": "shaders/UVSweep.hx",
											"enabled": false,
											"props": {
												"saturation": 0,
												"width": 0.48,
												"useU": false,
												"progress": 0.5
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.9949999999999999,
															"value": 0.9666666666666667,
															"mode": 0,
															"prevHandle": {
																"dv": -0.2666666666666667,
																"dt": -1.79
															},
															"nextHandle": {
																"dv": 0.09929240604583035,
																"dt": 0.6665002755826369
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
													0,
													0,
													0
												]
											},
											"isInstance": true,
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
															"time": 0.9949999999999999,
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
															"time": 0.9949999999999999,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "color.l",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.10757957457813568,
																"dt": -0.49832876061615644
															},
															"nextHandle": {
																"dv": -0.06543209876543199,
																"dt": 0.305
															}
														},
														{
															"time": 0.9949999999999999,
															"value": 0,
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
											"enabled": false,
											"props": {
												"REVERSE": false,
												"range": 1,
												"power": 1
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "emitter",
							"props": {
								"lifeTime": 0.25,
								"emitType": "Burst",
								"alignMode": "Screen",
								"instScale": 2
							},
							"z": 39.76733,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 50,
									"scaleY": 49.999999999999986,
									"scaleZ": 50.00000000000001,
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
													"alphaKill": false,
													"enableStencil": false,
													"drawOrder": "100",
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
												"wrap": false,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 0.9,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Flare06_512.png"
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.71,
															"value": 0.9833333333333334,
															"mode": 0,
															"prevHandle": {
																"dv": 0.03144094491268983,
																"dt": -0.49991102411176125
															},
															"nextHandle": {
																"dv": -0.01666666666666672,
																"dt": 0.2649999999999999
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.5,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/NoisyWave_01.png",
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
													"keys": [
														{
															"time": 0.7749999999999999,
															"value": 1,
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
													"name": "width",
													"enabled": false,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
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
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"enabled": false,
											"props": {
												"scaleX": 1,
												"scaleY": 1,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVSweep",
											"source": "shaders/UVSweep.hx",
											"enabled": false,
											"props": {
												"saturation": 0,
												"width": 0.48,
												"useU": false,
												"progress": 0.5
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.9949999999999999,
															"value": 0.9666666666666667,
															"mode": 0,
															"prevHandle": {
																"dv": -0.2666666666666667,
																"dt": -1.79
															},
															"nextHandle": {
																"dv": 0.09929240604583035,
																"dt": 0.6665002755826369
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
													0,
													0,
													0
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "color.h",
													"keys": [
														{
															"time": 0.12000000000000001,
															"value": 0.21448624542580919,
															"mode": 2
														},
														{
															"time": 0.33,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.47000000000000003,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.6749999999999999,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0.21448624542580919,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "color.s",
													"keys": [
														{
															"time": 0.12000000000000001,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.33,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.47000000000000003,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.6749999999999999,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1,
															"value": 1,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "color.l",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.12000000000000001,
															"value": 0.6745098039215687,
															"mode": 0,
															"prevHandle": {
																"dv": 1.177032890353281,
																"dt": -0.3531098671059842
															},
															"nextHandle": {
																"dv": -0.457843137254902,
																"dt": 0.135
															}
														},
														{
															"time": 0.33,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.47000000000000003,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.6749999999999999,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1,
															"value": 0.6745098039215687,
															"mode": 0
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
												"range": 50,
												"power": 0.5
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "GrenadeExplosion",
							"y": 3.00933,
							"z": -8.38559,
							"scaleX": 5,
							"scaleY": 5,
							"scaleZ": 7,
							"children": [
								{
									"type": "object",
									"name": "Explosion_medium",
									"z": 0.12,
									"scaleX": 0.75,
									"scaleY": 0.75,
									"scaleZ": 0.75,
									"children": [
										{
											"type": "object",
											"name": "-----------------------------Fireball",
											"z": 5.91507,
											"children": [
												{
													"type": "emitter",
													"name": "Fireball",
													"enabled": false,
													"props": {
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
														"emitRate": 1,
														"instRotation_rand": [
															0,
															0,
															180
														],
														"frameCount": 32,
														"frameDivisionX": 8,
														"frameDivisionY": 8,
														"spriteSheet": "Fx/Alphas/T_Dust_16x16_01.png",
														"instScale": 20,
														"emitType": "Burst",
														"burstDelay": 0.15,
														"instStretch_rand": [
															0,
															0,
															0
														],
														"burstParticleCount": 4,
														"emitShape": "Cylinder",
														"emitRad1": 0.83,
														"emitSurface": true,
														"lifeTimeRand": 0.2,
														"lifeTime": 1.5,
														"warmUpTime": -0.1
													},
													"y": -1.49022,
													"z": -0.57245,
													"scaleX": 0.1,
													"scaleY": 0.1,
													"scaleZ": 0.1,
													"rotationZ": 43.6,
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
																			"emissive": 50
																		}
																	},
																	"wrapRepeat": true,
																	"diffuseMap": "Fx/Structure/Smoke/white.png"
																},
																{
																	"type": "shader",
																	"name": "AutoAlpha",
																	"source": "shaders/AutoAlpha.hx",
																	"props": {
																		"scale": 1
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
																			"enabled": false,
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": -0.0050000000000000044,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.039999999999999994,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.029812589848475162,
																						"dt": -0.03384131820637717
																					},
																					"nextHandle": {
																						"dv": -0.6166666666666667,
																						"dt": 0.7
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
																			"name": "alpha",
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": -0.0050000000000000044,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.039999999999999994,
																					"value": 0.8,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.029812589848475162,
																						"dt": -0.03384131820637717
																					},
																					"nextHandle": {
																						"dv": -0.6166666666666667,
																						"dt": 0.7
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
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"props": {
																		"amount": 1,
																		"color": [
																			1,
																			0.6509803921568628,
																			0.5490196078431373
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
																		"saturation": 0,
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
																					"value": 1,
																					"mode": 0,
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
																					"mode": 0,
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
																			"name": "width",
																			"enabled": false,
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.0520769766684747,
																						"dt": -0.49993897601734766
																					},
																					"nextHandle": {
																						"dv": -0.06666666666666665,
																						"dt": 0.6399999999999999
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
																	"name": "NightEmissive",
																	"source": "shaders/NightEmissive.hx",
																	"props": {
																		"amount": 0.7,
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
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0.012707392165911546,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.05166666666666666
																	}
																},
																{
																	"time": 0.05499999999999999,
																	"value": -0.509348731270885,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.6178478332448459,
																		"dt": -0.024810868515554432
																	},
																	"nextHandle": {
																		"dv": 0.8715807006116155,
																		"dt": 0.03500000000000003
																	}
																},
																{
																	"time": 0.1959318440816542,
																	"value": 0.377995077377486,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.09186223587130012,
																		"dt": -0.05987522403665296
																	},
																	"nextHandle": {
																		"dv": 0.636704555180494,
																		"dt": 0.4140681559183458
																	}
																},
																{
																	"time": 1,
																	"value": 1.01469963255798,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.1819155871944269,
																		"dt": -0.38
																	},
																	"nextHandle": {
																		"dv": 0.12673911289324527,
																		"dt": 0.2647429153388605
																	}
																}
															]
														},
														{
															"type": "shader",
															"name": "DepthBlend",
															"source": "shaders/DepthBlend.hx",
															"props": {
																"REVERSE": false,
																"range": 10,
																"power": 1
															},
															"isInstance": true
														}
													]
												},
												{
													"type": "emitter",
													"name": "Smoke_Screen",
													"enabled": false,
													"props": {
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
														"emitRate": 1,
														"instRotation_rand": [
															0,
															0,
															180
														],
														"frameCount": 32,
														"frameDivisionX": 8,
														"frameDivisionY": 8,
														"spriteSheet": "Fx/Alphas/T_Dust_16x16_01.png",
														"instScale": 16,
														"emitType": "Burst",
														"burstDelay": 0.15,
														"instStretch_rand": [
															0,
															0,
															0
														],
														"burstParticleCount": 2,
														"emitShape": "Cylinder",
														"emitRad1": 0.83,
														"emitSurface": true,
														"lifeTimeRand": 0.3,
														"lifeTime": 1.2,
														"alignMode": "Screen"
													},
													"z": 1.56,
													"scaleX": 3,
													"scaleY": 3,
													"scaleZ": 0.1,
													"rotationZ": 43.6,
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
																			"textureWrap": true
																		}
																	},
																	"wrapRepeat": true,
																	"diffuseMap": "Fx/Structure/Smoke/white.png"
																},
																{
																	"type": "shader",
																	"name": "AutoAlpha",
																	"source": "shaders/AutoAlpha.hx",
																	"props": {
																		"scale": 2
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
																					"time": 0.3,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": -1.4631592881906408,
																						"dt": -0.2394260653402867
																					},
																					"nextHandle": {
																						"dv": 0.3666666666666667,
																						"dt": 0.06
																					}
																				},
																				{
																					"time": 0.44,
																					"value": 0.9833333333333334,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": -0.05499999999999999
																					},
																					"nextHandle": {
																						"dv": -2.85750919801049e-16,
																						"dt": 0.3499999999999999
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": -0.18666666666666668
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.18666666666666668
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
																			0.24705882352941178,
																			0.24705882352941178,
																			0.24705882352941178
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
																		"progress": 0.4,
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
																					"value": 0.016666666666666663,
																					"mode": 0,
																					"prevHandle": {
																						"dv": -2.071010349029589,
																						"dt": -0.0988436757491396
																					},
																					"nextHandle": {
																						"dv": 0.7333333333333334,
																						"dt": 0.035
																					}
																				},
																				{
																					"time": 0.19,
																					"value": 0.8833333333333333,
																					"mode": 0
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.3,
																						"dt": -0.39
																					},
																					"nextHandle": {
																						"dv": -0.3268941348737974,
																						"dt": 0.42496237533593706
																					}
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "width",
																			"enabled": false,
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.0520769766684747,
																						"dt": -0.49993897601734766
																					},
																					"nextHandle": {
																						"dv": -0.06666666666666665,
																						"dt": 0.6399999999999999
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
																	"name": "DepthBlend",
																	"source": "shaders/DepthBlend.hx",
																	"props": {
																		"REVERSE": false,
																		"range": 1,
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
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.05166666666666666
																	}
																},
																{
																	"time": 1,
																	"value": 1.01469963255798,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.07620241819144336,
																		"dt": -0.9450000000000001
																	},
																	"nextHandle": {
																		"dv": 0.021440078189261927,
																		"dt": 0.265882295729136
																	}
																}
															]
														}
													]
												},
												{
													"type": "emitter",
													"name": "Smoke",
													"enabled": false,
													"props": {
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
														"emitRate": 1,
														"instRotation_rand": [
															0,
															0,
															180
														],
														"frameCount": 32,
														"frameDivisionX": 8,
														"frameDivisionY": 8,
														"spriteSheet": "Fx/Alphas/T_Dust_16x16_01.png",
														"instScale": 18,
														"emitType": "Burst",
														"burstDelay": 0.15,
														"instStretch_rand": [
															0,
															0,
															0
														],
														"burstParticleCount": 2,
														"emitShape": "Cylinder",
														"emitRad1": 0.83,
														"emitSurface": true,
														"lifeTimeRand": 0.3,
														"lifeTime": 1.2,
														"warmUpTime": -0.05
													},
													"z": -1.65,
													"scaleX": 3,
													"scaleY": 3,
													"scaleZ": 0.1,
													"rotationZ": 43.6,
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
																			"textureWrap": true
																		}
																	},
																	"wrapRepeat": true,
																	"diffuseMap": "Fx/Structure/Smoke/white.png"
																},
																{
																	"type": "shader",
																	"name": "AutoAlpha",
																	"source": "shaders/AutoAlpha.hx",
																	"props": {
																		"scale": 2
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
																					"time": 0.3,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": -1.4631592881906408,
																						"dt": -0.2394260653402867
																					},
																					"nextHandle": {
																						"dv": 0.3666666666666667,
																						"dt": 0.06
																					}
																				},
																				{
																					"time": 0.44,
																					"value": 0.9833333333333334,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": -0.05499999999999999
																					},
																					"nextHandle": {
																						"dv": -2.85750919801049e-16,
																						"dt": 0.3499999999999999
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": -0.18666666666666668
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.18666666666666668
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
																			0.24705882352941178,
																			0.24705882352941178,
																			0.24705882352941178
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
																		"progress": 0.4,
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
																					"value": 0.016666666666666663,
																					"mode": 0,
																					"prevHandle": {
																						"dv": -2.071010349029589,
																						"dt": -0.0988436757491396
																					},
																					"nextHandle": {
																						"dv": 0.7333333333333334,
																						"dt": 0.035
																					}
																				},
																				{
																					"time": 0.19,
																					"value": 0.8833333333333333,
																					"mode": 0
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.3386111111111111,
																						"dt": -0.385
																					},
																					"nextHandle": {
																						"dv": -0.3675355137339586,
																						"dt": 0.4178869745982501
																					}
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "width",
																			"enabled": false,
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.0520769766684747,
																						"dt": -0.49993897601734766
																					},
																					"nextHandle": {
																						"dv": -0.06666666666666665,
																						"dt": 0.6399999999999999
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
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.05166666666666666
																	}
																},
																{
																	"time": 1,
																	"value": 1.01469963255798,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.07620241819144336,
																		"dt": -0.9450000000000001
																	},
																	"nextHandle": {
																		"dv": 0.021440078189261927,
																		"dt": 0.265882295729136
																	}
																}
															]
														}
													]
												},
												{
													"type": "emitter",
													"name": "Fireball_Screen",
													"props": {
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
														"emitRate": 1,
														"instRotation_rand": [
															0,
															0,
															180
														],
														"frameCount": 32,
														"frameDivisionX": 8,
														"frameDivisionY": 8,
														"spriteSheet": "Fx/Alphas/T_Dust_16x16_01.png",
														"instScale": 15,
														"emitType": "Burst",
														"burstDelay": 0.15,
														"instStretch_rand": [
															0,
															0,
															0
														],
														"burstParticleCount": 4,
														"emitShape": "Cylinder",
														"emitRad1": 0.83,
														"emitSurface": true,
														"alignMode": "Screen",
														"warmUpTime": -0.1
													},
													"y": -1.49022,
													"z": 5.16632,
													"scaleX": 0.1,
													"scaleY": 0.1,
													"scaleZ": 0.1,
													"rotationZ": 43.6,
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
																			"emissive": 35
																		}
																	},
																	"wrapRepeat": true,
																	"diffuseMap": "Fx/Structure/Smoke/white.png"
																},
																{
																	"type": "shader",
																	"name": "AutoAlpha",
																	"source": "shaders/AutoAlpha.hx",
																	"props": {
																		"scale": 1
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
																			"enabled": false,
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": -0.0050000000000000044,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.039999999999999994,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.029812589848475162,
																						"dt": -0.03384131820637717
																					},
																					"nextHandle": {
																						"dv": -0.6166666666666667,
																						"dt": 0.7
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
																			"name": "alpha",
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": -0.0050000000000000044,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.039999999999999994,
																					"value": 0.8,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.029812589848475162,
																						"dt": -0.03384131820637717
																					},
																					"nextHandle": {
																						"dv": -0.6166666666666667,
																						"dt": 0.7
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
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"props": {
																		"amount": 1,
																		"color": [
																			1,
																			0.6509803921568628,
																			0.5490196078431373
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
																		"range": 1,
																		"power": 1
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
																		"saturation": 0,
																		"width": 1,
																		"uvScaleX": 0.8,
																		"uvScaleY": 0.8,
																		"texture": "Fx/noise/T_Noise_Wave_02.png",
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
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": -0.021397407793399287,
																						"dt": -0.6290837891259519
																					},
																					"nextHandle": {
																						"dv": 0.016666666666666607,
																						"dt": 0.49000000000000005
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.23333333333333334,
																						"dt": -0.040000000000000036
																					},
																					"nextHandle": {
																						"dv": -1.2622263339976019,
																						"dt": 0.21638165725673145
																					}
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "width",
																			"enabled": false,
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.0520769766684747,
																						"dt": -0.49993897601734766
																					},
																					"nextHandle": {
																						"dv": -0.06666666666666665,
																						"dt": 0.6399999999999999
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
																	"name": "NightEmissive",
																	"source": "shaders/NightEmissive.hx",
																	"props": {
																		"amount": 0.7,
																		"ATTENUATE": true,
																		"emissiveMap": null
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "DepthBlend",
																	"source": "shaders/DepthBlend.hx",
																	"props": {
																		"REVERSE": false,
																		"range": 10,
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
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.05166666666666666
																	}
																},
																{
																	"time": 0.05499999999999999,
																	"value": -0.6831296854521036,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.6178478332448459,
																		"dt": -0.024810868515554432
																	},
																	"nextHandle": {
																		"dv": 0.8715807006116155,
																		"dt": 0.03500000000000003
																	}
																},
																{
																	"time": 0.12499999999999999,
																	"value": 0.30347706277117636,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.09186223587130012,
																		"dt": -0.05987522403665296
																	},
																	"nextHandle": {
																		"dv": 0.636704555180494,
																		"dt": 0.4140681559183458
																	}
																},
																{
																	"time": 1,
																	"value": 1.01469963255798,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.1819155871944269,
																		"dt": -0.38
																	},
																	"nextHandle": {
																		"dv": 0.12673911289324527,
																		"dt": 0.2647429153388605
																	}
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
									"type": "emitter",
									"name": "SandProjectionMesh",
									"enabled": false,
									"props": {
										"enableSort": false,
										"emitSurface": true,
										"frameCount": 2,
										"frameDivisionY": 2,
										"animationSpeed": 0,
										"instStretch": [
											1.1,
											1.1,
											1.7
										],
										"lifeTime": 4,
										"lifeTimeRand": 0.1,
										"warmUpTime": -0.2,
										"emitType": "Burst",
										"instStretch_rand": [
											0.1,
											0.1,
											0.4
										],
										"instScale": 4,
										"instScale_rand": 1,
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
										"maxCount": 2,
										"randomColor2": [
											0.9764705882352941,
											0.9647058823529412,
											0.9529411764705882,
											1
										],
										"instRotation_rand": [
											0,
											0,
											360
										]
									},
									"z": -1.78,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"children": [
										{
											"type": "model",
											"name": "CylinderCone_StraightUV",
											"source": "Fx/Meshes_Common/CylinderCone.fbx",
											"scaleX": 0.5,
											"scaleY": 0.25,
											"scaleZ": 0.5,
											"rotationX": 90,
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
															"emissive": 0.3
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
													"children": [
														{
															"type": "shader",
															"name": "AlphaMap",
															"source": "shaders/AlphaMap.hx",
															"props": {
																"useSourceUVs": false,
																"wrap": true,
																"invert": false,
																"replace": false,
																"alpha": 2,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_SandProjection_Mesh6.png",
																"onDecal": false
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
																	0.9764705882352941,
																	0.9607843137254902,
																	0.9490196078431372
																]
															},
															"isInstance": true
														},
														{
															"type": "shader",
															"name": "DissolveMapNoise",
															"source": "shaders/DissolveMap.hx",
															"props": {
																"useSourceUVs": true,
																"useScale": true,
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
																			"value": 0.7,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 1.4807997904821406,
																				"dt": -0.4951636786304198
																			},
																			"nextHandle": {
																				"dv": -0.8169921875000001,
																				"dt": 0.27309197069853475
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
															"name": "DissolveMapGradient",
															"source": "shaders/DissolveMap.hx",
															"props": {
																"useSourceUVs": true,
																"useScale": false,
																"wrap": true,
																"progress": 0.5,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 0.5,
																"uvScaleY": 1,
																"texture": "Fx/Alphas/T_SandProjection_Gradient.png",
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
																			"value": 0.5,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.644021307982501,
																				"dt": -0.3649454078567505
																			},
																			"nextHandle": {
																				"dv": -0.6,
																				"dt": 0.34
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
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
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
											"name": "instStretch.z",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.6,
													"mode": 0,
													"prevHandle": {
														"dv": -0.8360452004908794,
														"dt": -0.004266167276962038
													},
													"nextHandle": {
														"dv": 0.4833333333333333,
														"dt": 0.0017933693486200664
													}
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.885
													},
													"nextHandle": {
														"dv": -1.3607186657192811e-16,
														"dt": 0.33333333333333326
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
													"mode": 0,
													"prevHandle": {
														"dv": 3.0890297805850073,
														"dt": -0.11575828486016804
													},
													"nextHandle": {
														"dv": -0.9363636363636363,
														"dt": 0.03508928571428571
													}
												},
												{
													"time": 0.6549999999999999,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.009090909090909038,
														"dt": -0.6245892857142856
													},
													"nextHandle": {
														"dv": 0.008774267419493307,
														"dt": 0.6028344762228577
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
													"value": 0.7,
													"mode": 2
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.033333333333333326,
														"dt": -0.7849999999999999
													},
													"nextHandle": {
														"dv": 0.014153133342954432,
														"dt": 0.33330629022657665
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "SandFloor",
									"props": {
										"instScale_rand": 3,
										"maxCount": 50,
										"simulationSpace": "World",
										"animationSpeed": 0.3,
										"randomColor1": [
											1,
											1,
											1,
											1
										],
										"randomColor2": [
											1,
											1,
											1,
											0.8509803921568627
										],
										"emitRate": 1,
										"enableSort": false,
										"instRotation_rand": [
											0,
											0,
											180
										],
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
										"lifeTime": 3.5,
										"emitType": "Burst",
										"burstParticleCount": 8,
										"emitOrientation": "Normal",
										"emitShape": "Cylinder",
										"emitRad1": 0.73,
										"emitRad2": 0.73,
										"emitSurface": true,
										"instScale": 30,
										"instSpeed_rand": [
											0,
											0,
											0
										],
										"instStartSpeed_rand": [
											0,
											0,
											0
										],
										"lifeTimeRand": 1,
										"instStretch_rand": [
											0,
											0,
											0
										],
										"instAcceleration_rand": [
											0.2,
											0,
											0
										],
										"instAcceleration": [
											1,
											0,
											0
										],
										"warmUpTime": -0.15
									},
									"z": 1.69432,
									"scaleX": 14,
									"scaleY": 14,
									"scaleZ": 0.01,
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
															"depthTest": "LessEqual",
															"colorMask": 15,
															"enableStencil": false,
															"alphaKill": false,
															"parallax": 0,
															"textureWrap": true
														}
													},
													"wrapRepeat": true,
													"diffuseMap": "Fx/Structure/Smoke/white.png",
													"color": [
														1,
														1,
														1,
														0.12941176470588234
													]
												},
												{
													"type": "shader",
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 1
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
																	"value": -0.032777777777777795,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.05083333333333336
																	}
																},
																{
																	"time": 0.045,
																	"value": 0.9833333333333334,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.07562525672400151,
																		"dt": -0.02399211269568948
																	},
																	"nextHandle": {
																		"dv": -0.8333333333333334,
																		"dt": 0.2643750000000001
																	}
																},
																{
																	"time": 0.95,
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
														"progress": 0.5,
														"saturation": 0,
														"width": 0.5,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/T_Noise_Grunge_01.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.01,
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
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.8483515290485304,
																		"dt": -0.43041364341432775
																	},
																	"nextHandle": {
																		"dv": -1.1333333333333333,
																		"dt": 0.575
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
													"normalMap": "Fx/DistortionMaps/SphereClean.png",
													"topIntensity": 0.4,
													"topSpan": 0.5,
													"dirIntensity": 0.5,
													"dirSpan": 0.9,
													"sandBlend": 0.6,
													"envBlend": 0.5
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
													"value": 0.75,
													"mode": 0,
													"prevHandle": {
														"dv": -0.22802103774116936,
														"dt": -4.6905750256010215e-17
													},
													"nextHandle": {
														"dv": 0.3021941037419147,
														"dt": 0
													}
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.01592731329366892,
														"dt": -0.97
													},
													"nextHandle": {
														"dv": 0.005310297331676772,
														"dt": 0.33332890503740775
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "SandResiduel",
									"props": {
										"lifeTime": 1.5,
										"lifeTimeRand": 0.25,
										"speedFactor": 0.8,
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
											25,
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
											3,
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
											0.9803921568627451,
											0.9254901960784314,
											0.8980392156862745,
											1
										],
										"randomColor2": [
											0.7490196078431373,
											0.6705882352941176,
											0.6313725490196078,
											1
										]
									},
									"z": -1.34,
									"scaleX": 5,
									"scaleY": 25,
									"scaleZ": 25,
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
														"scale": 1.5
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
																	"time": 0.85,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.6533333333333333,
																		"dt": -0.2350000000000001
																	},
																	"nextHandle": {
																		"dv": -0.7068174305257382,
																		"dt": 0.25423790230645144
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
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 50,
														"power": 1
													},
													"isInstance": true
												},
												{
													"type": "fakeLight",
													"name": "FakeLight",
													"normalMap": "Fx/DistortionMaps/SphereClean.png",
													"topBrighten": true,
													"topIntensity": 0.4,
													"topSpan": 0.5,
													"dirIntensity": 0.5,
													"dirSpan": 0.9,
													"sandBlend": 0.6,
													"envBlend": 0.5
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
								},
								{
									"type": "emitter",
									"name": "LensFlare",
									"enabled": false,
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
										"instScale": 30,
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
										"warmUpTime": -0.1,
										"lifeTime": 2,
										"instOffset": [
											0,
											1,
											0
										],
										"instRotation": [
											0,
											0,
											-30
										]
									},
									"y": -0.06435,
									"z": 5,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"rotationX": 80,
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
															"emissive": 10
														}
													},
													"wrapRepeat": true,
													"diffuseMap": "Fx/Structure/Smoke/white.png",
													"color": [
														1,
														0.5176470588235293,
														0.396078431372549,
														1
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
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "color.h",
															"keys": [
																{
																	"time": 0.07,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 0.5,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "color.s",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.07,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.8292408182447606,
																		"dt": -0.04975097874181577
																	},
																	"nextHandle": {
																		"dv": -0.4984816778273811,
																		"dt": 0.03
																	}
																},
																{
																	"time": 1,
																	"value": 0.2,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.016141183035714435,
																		"dt": -0.825
																	},
																	"nextHandle": {
																		"dv": 0.006832777717488028,
																		"dt": 0.3333180810095513
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "color.l",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.07,
																	"value": 0.9,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 2.071477403999602,
																		"dt": -0.053266561817132525
																	},
																	"nextHandle": {
																		"dv": -0.575,
																		"dt": 0.015
																	}
																},
																{
																	"time": 1,
																	"value": 0.1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.01666666666666669,
																		"dt": -0.7575
																	},
																	"nextHandle": {
																		"dv": 0.016736189146834297,
																		"dt": 0.6100340944021245
																	}
																}
															]
														}
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
														"alpha": 0.5,
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
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.617043442076404,
																		"dt": -0.0906101928749708
																	},
																	"nextHandle": {
																		"dv": -1.1600000000000001,
																		"dt": 0.065
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.015000000000000013,
																		"dt": -0.5549999999999999
																	},
																	"nextHandle": {
																		"dv": 0.00962757060494111,
																		"dt": 0.33165320808055654
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
														"power": 1
													},
													"isInstance": true
												},
												{
													"type": "fakeLight",
													"name": "fakeLight",
													"props": {},
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
													"value": 0.35,
													"mode": 0,
													"prevHandle": {
														"dv": -1.355618157057399,
														"dt": -0.009802037467223065
													},
													"nextHandle": {
														"dv": 0.696892120609183,
														"dt": 0.0049999999999999975
													}
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.029098184229935598,
														"dt": -0.96
													},
													"nextHandle": {
														"dv": -0.009415313697513316,
														"dt": 0.33331525031417913
													}
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "ShockWave",
							"props": {
								"emitType": "Burst",
								"instScale": 500
							},
							"z": 2.27,
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
													"colorMask": 255,
													"depthTest": "LessEqual"
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
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 2,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_ChocWave_Blurred_02.png",
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
																"dt": -0.5708015990978788
															},
															"nextHandle": {
																"dv": 0.009785546759570019,
																"dt": 0.33328019978181483
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
												"power": 0.5
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.8,
												"envColorSet": false
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
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.9865403685451437,
												"dt": -0.40000000000000013
											},
											"nextHandle": {
												"dv": 0.9,
												"dt": 0.3683798050158908
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
							"type": "object",
							"name": "LensFlare",
							"x": 0.14333,
							"y": -2.33833,
							"z": 53.43612,
							"scaleX": 20,
							"scaleY": 20,
							"scaleZ": 20,
							"children": [
								{
									"type": "object",
									"name": "LensFlare_Colored",
									"x": -0.14,
									"y": 0.06,
									"z": 0.49,
									"scaleX": 0.9999999999999998,
									"scaleY": 0.9999999999999998,
									"scaleZ": 0.9999999999999998,
									"rotationX": -40,
									"children": [
										{
											"type": "emitter",
											"name": "LensFlare_color_small2",
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
												"instScale": 4,
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
												"warmUpTime": -0.18,
												"instOffset": [
													0,
													1,
													0
												],
												"instRotation": [
													0,
													0,
													-30
												],
												"lifeTime": 0.3
											},
											"y": 5.551115123125783e-17,
											"scaleX": 0.09999999999999999,
											"scaleY": 0.09999999999999999,
											"scaleZ": 0.09999999999999999,
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
																	"emissive": 20
																}
															},
															"wrapRepeat": true,
															"diffuseMap": "Fx/Gradients/T_circleGradient_color02.png",
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
																"alpha": 0.2,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_LensFlare_04.png",
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
																			"mode": 0,
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
																"range": 1,
																"power": 1
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
											"name": "LensFlare_color2",
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
												"instScale": 7,
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
												"warmUpTime": -0.18,
												"instOffset": [
													0,
													1,
													0
												],
												"instRotation": [
													0,
													0,
													-30
												]
											},
											"y": 5.551115123125783e-17,
											"scaleX": 0.09999999999999999,
											"scaleY": 0.09999999999999999,
											"scaleZ": 0.09999999999999999,
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
															"diffuseMap": "Fx/Gradients/T_circleGradient_color02.png",
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
																"alpha": 0.1,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_LensFlare_04.png",
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
																			"mode": 0,
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
																"range": 1,
																"power": 1
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
											"name": "LensFlare_color_small",
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
												"instScale": 4,
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
												"warmUpTime": -0.1,
												"instOffset": [
													0,
													1,
													0
												],
												"instRotation": [
													0,
													0,
													-30
												],
												"lifeTime": 0.04
											},
											"y": 5.551115123125783e-17,
											"scaleX": 0.09999999999999999,
											"scaleY": 0.09999999999999999,
											"scaleZ": 0.09999999999999999,
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
																	"emissive": 20
																}
															},
															"wrapRepeat": true,
															"diffuseMap": "Fx/Gradients/T_circleGradient_color02.png",
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
																"alpha": 0.2,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_LensFlare_04.png",
																"onDecal": false
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0.0049999999999999975,
																			"value": 1,
																			"mode": 0,
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
																"range": 1,
																"power": 1
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
											"name": "LensFlare_color",
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
												"instScale": 7,
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
												"warmUpTime": -0.1,
												"instOffset": [
													0,
													1,
													0
												],
												"instRotation": [
													0,
													0,
													-30
												],
												"lifeTime": 0.04
											},
											"y": 5.551115123125783e-17,
											"scaleX": 0.09999999999999999,
											"scaleY": 0.09999999999999999,
											"scaleZ": 0.09999999999999999,
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
															"diffuseMap": "Fx/Gradients/T_circleGradient_color02.png",
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
																"alpha": 0.1,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_LensFlare_04.png",
																"onDecal": false
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0.0049999999999999975,
																			"value": 1,
																			"mode": 0,
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
																"range": 1,
																"power": 1
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
										}
									]
								},
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
										"instScale": 5.5,
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
										"warmUpTime": -0.1,
										"instOffset": [
											1.5,
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
										]
									},
									"x": -0.14,
									"y": -0.23,
									"z": 0.55,
									"scaleX": 0.09999999999999999,
									"scaleY": 0.09999999999999999,
									"scaleZ": 0.09999999999999999,
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
														"alpha": 0.07,
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
																	"mode": 0,
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
														"range": 1,
														"power": 1
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
															0.6941176470588235,
															0.3607843137254902,
															0.2588235294117647
														]
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
								}
							]
						},
						{
							"type": "object",
							"name": "AncientNuke",
							"enabled": false,
							"x": -0.125,
							"y": 0.125,
							"z": 26.76112375,
							"children": [
								{
									"type": "model",
									"name": "Ground",
									"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign.fbx",
									"x": 0.125,
									"y": -0.125,
									"z": -24.65495375,
									"scaleX": 200,
									"scaleY": 200,
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
													"alphaKill": false,
													"enableStencil": false,
													"parallax": 0,
													"drawOrder": "100"
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "VertexDisplacement",
											"source": "shaders/VertexDisplacement.hx",
											"enabled": false,
											"props": {
												"X": true,
												"Y": true,
												"Z": true,
												"texScale": 5,
												"tex": "Fx/DistortionMaps/waveNormal02.jpg",
												"intensity": 3.71,
												"scrollSpeed": [
													0.1,
													0.1
												],
												"smoothEdge": 9.85
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"onDecal": false,
												"wrap": false,
												"invert": false,
												"replace": false,
												"alpha": 2,
												"uScale": 1,
												"vScale": 0.95,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/GradientSpice_2.png"
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
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
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.52,
												"saturation": 0,
												"width": 0.33,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													-0.4
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
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.14233523557739344,
																"dt": -0.4981733245208754
															},
															"nextHandle": {
																"dv": -0.25,
																"dt": 0.875
															}
														},
														{
															"time": 1,
															"value": 0.6,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"enabled": false,
											"props": {
												"scaleX": 1,
												"scaleY": 1,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVSweep",
											"source": "shaders/UVSweep.hx",
											"props": {
												"saturation": 1,
												"width": 1,
												"useU": false,
												"progress": 0.78
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
															"mode": 2
														},
														{
															"time": 2,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.2666666666666667,
																"dt": -1.79
															},
															"nextHandle": {
																"dv": 0.09929240604583035,
																"dt": 0.6665002755826369
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorMap3",
											"source": "shaders/ColorMap3.hx",
											"enabled": false,
											"props": {
												"colorA": [
													0,
													0,
													0
												],
												"pointA": 0.33,
												"colorB": [
													1,
													0.23529411764705882,
													0
												],
												"pointB": 0.69,
												"colorC": [
													1,
													0.3607843137254902,
													0
												],
												"pointC": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													1,
													0.796078431372549,
													0.580392156862745
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.3254901960784314,
													0.3254901960784314,
													0.3254901960784314
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 1,
												"sandColorSet": false,
												"envBlend": 0,
												"envColorSet": false
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
												"range": 10,
												"power": 0.8
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "model",
									"name": "Tete_Deform",
									"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign.fbx",
									"x": -0.875,
									"y": 0.875,
									"z": 26.56099625,
									"scaleX": 80,
									"scaleY": 80,
									"scaleZ": 5,
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
													"alphaKill": false,
													"enableStencil": false,
													"parallax": 0,
													"drawOrder": "110",
													"emissive": 10
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "VertexDisplacement",
											"source": "shaders/VertexDisplacement.hx",
											"enabled": false,
											"props": {
												"X": true,
												"Y": true,
												"Z": true,
												"texScale": 5,
												"tex": "Fx/DistortionMaps/waveNormal02.jpg",
												"intensity": 3.71,
												"scrollSpeed": [
													0.1,
													0.1
												],
												"smoothEdge": 9.85
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"onDecal": false,
												"wrap": false,
												"invert": false,
												"replace": false,
												"alpha": 2,
												"uScale": 1,
												"vScale": 0.95,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/GradientSpice_2.png"
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
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
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.52,
												"saturation": 0,
												"width": 0.33,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													-0.4
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
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.14233523557739344,
																"dt": -0.4981733245208754
															},
															"nextHandle": {
																"dv": -0.25,
																"dt": 0.875
															}
														},
														{
															"time": 1,
															"value": 0.6,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"enabled": false,
											"props": {
												"scaleX": 1,
												"scaleY": 1,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVSweep",
											"source": "shaders/UVSweep.hx",
											"props": {
												"saturation": 1,
												"width": 1,
												"useU": false,
												"progress": 0.78
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
															"mode": 2
														},
														{
															"time": 2.2,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.033333333333333326,
																"dt": -1.7750000000000001
															},
															"nextHandle": {
																"dv": 0.012528732457351834,
																"dt": 0.6671550033539847
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorMap3",
											"source": "shaders/ColorMap3.hx",
											"enabled": false,
											"props": {
												"colorA": [
													0,
													0,
													0
												],
												"pointA": 0.33,
												"colorB": [
													1,
													0.23529411764705882,
													0
												],
												"pointB": 0.69,
												"colorC": [
													1,
													0.3607843137254902,
													0
												],
												"pointC": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													1,
													0.796078431372549,
													0.580392156862745
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"enabled": false,
											"props": {
												"sandBlend": 1,
												"sandColorSet": false,
												"envBlend": 0,
												"envColorSet": false
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
												"range": 10,
												"power": 0.8
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													0.396078431372549,
													0.1843137254901961
												]
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "model",
									"name": "Nuke_Tete_Fire",
									"source": "Fx/Meshes_Common/Nuke_5.fbx",
									"x": 0.125,
									"y": -0.125,
									"z": 27.01960625,
									"scaleX": 2.2,
									"scaleY": 2.2,
									"scaleZ": 2.2,
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
													"alphaKill": false,
													"enableStencil": false,
													"parallax": 0,
													"emissive": 10,
													"drawOrder": "100"
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "VertexDisplacement",
											"source": "shaders/VertexDisplacement.hx",
											"enabled": false,
											"props": {
												"X": true,
												"Y": true,
												"Z": true,
												"texScale": 5,
												"tex": "Fx/DistortionMaps/waveNormal02.jpg",
												"intensity": 3.71,
												"scrollSpeed": [
													0.1,
													0.1
												],
												"smoothEdge": 100
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"onDecal": false,
												"wrap": false,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 0.91,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/GradientSpice_2.png"
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
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
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.29,
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
													0.5
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
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.14233523557739344,
																"dt": -0.4981733245208754
															},
															"nextHandle": {
																"dv": -0.25,
																"dt": 0.875
															}
														},
														{
															"time": 1,
															"value": 0.6,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"enabled": false,
											"props": {
												"scaleX": 1,
												"scaleY": 1,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVSweep",
											"source": "shaders/UVSweep.hx",
											"props": {
												"saturation": 1,
												"width": 0.33,
												"useU": false,
												"progress": 0.7
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
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.5,
															"value": 1.3,
															"mode": 0,
															"prevHandle": {
																"dv": -1.078256415940511,
																"dt": -1.785
															},
															"nextHandle": {
																"dv": 1.078256415940511,
																"dt": 1.785
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorMap3",
											"source": "shaders/ColorMap3.hx",
											"enabled": false,
											"props": {
												"colorA": [
													0,
													0,
													0
												],
												"pointA": 0.33,
												"colorB": [
													1,
													0.23529411764705882,
													0
												],
												"pointB": 0.69,
												"colorC": [
													1,
													0.3607843137254902,
													0
												],
												"pointC": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													1,
													0.796078431372549,
													0.580392156862745
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													0.396078431372549,
													0.1843137254901961
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
												"range": 10,
												"power": 0.8
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "model",
									"name": "Nuke_Tete_Smoke",
									"source": "Fx/Meshes_Common/Nuke_5.fbx",
									"x": 0.125,
									"y": -0.125,
									"z": 27.01960625,
									"scaleX": 2.2,
									"scaleY": 2.2,
									"scaleZ": 2.2,
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
													"alphaKill": false,
													"enableStencil": false,
													"parallax": 0,
													"drawOrder": "110"
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "VertexDisplacement",
											"source": "shaders/VertexDisplacement.hx",
											"props": {
												"X": true,
												"Y": true,
												"Z": true,
												"texScale": 1.21,
												"tex": "Fx/DistortionMaps/waveNormal.jpg",
												"intensity": 4,
												"scrollSpeed": [
													0.1,
													0.1
												],
												"smoothEdge": 0,
												"texScaleX": 1,
												"texScaleY": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"onDecal": false,
												"wrap": false,
												"invert": true,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/GradientSpice_2.png"
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
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
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.48,
												"saturation": 1,
												"width": 0.21,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.4
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
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.14233523557739344,
																"dt": -0.4981733245208754
															},
															"nextHandle": {
																"dv": -0.25,
																"dt": 0.875
															}
														},
														{
															"time": 1,
															"value": 0.6,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"enabled": false,
											"props": {
												"scaleX": 1,
												"scaleY": 1,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorMap3",
											"source": "shaders/ColorMap3.hx",
											"enabled": false,
											"props": {
												"colorA": [
													0,
													0,
													0
												],
												"pointA": 0.33,
												"colorB": [
													1,
													0.23529411764705882,
													0
												],
												"pointB": 0.69,
												"colorC": [
													1,
													0.3607843137254902,
													0
												],
												"pointC": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVSweep",
											"source": "shaders/UVSweep.hx",
											"props": {
												"saturation": 1,
												"width": 1,
												"useU": false,
												"progress": 0.8
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
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.5,
															"value": 1.3,
															"mode": 0,
															"prevHandle": {
																"dv": -1.078256415940511,
																"dt": -1.785
															},
															"nextHandle": {
																"dv": 1.078256415940511,
																"dt": 1.785
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
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													1,
													0.796078431372549,
													0.580392156862745
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.15294117647058825,
													0.15294117647058825,
													0.15294117647058825
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
												"range": 10,
												"power": 0.8
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "model",
									"name": "Nuke_Tete_Sand",
									"source": "Fx/Meshes_Common/Nuke_5.fbx",
									"x": 0.125,
									"y": -0.125,
									"z": 27.01960625,
									"scaleX": 2.2,
									"scaleY": 2.2,
									"scaleZ": 2.2,
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
													"alphaKill": false,
													"enableStencil": false,
													"parallax": 0,
													"emissive": 10,
													"drawOrder": "100"
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "VertexDisplacement",
											"source": "shaders/VertexDisplacement.hx",
											"enabled": false,
											"props": {
												"X": true,
												"Y": true,
												"Z": true,
												"texScale": 5,
												"tex": "Fx/DistortionMaps/waveNormal02.jpg",
												"intensity": 3.71,
												"scrollSpeed": [
													0.1,
													0.1
												],
												"smoothEdge": 100
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"onDecal": false,
												"wrap": false,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 0.91,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/GradientSpice_2.png"
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
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
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.61,
												"saturation": 0,
												"width": 0.39,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.4
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
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.14233523557739344,
																"dt": -0.4981733245208754
															},
															"nextHandle": {
																"dv": -0.25,
																"dt": 0.875
															}
														},
														{
															"time": 1,
															"value": 0.6,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"enabled": false,
											"props": {
												"scaleX": 1,
												"scaleY": 1,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorMap3",
											"source": "shaders/ColorMap3.hx",
											"enabled": false,
											"props": {
												"colorA": [
													0,
													0,
													0
												],
												"pointA": 0.33,
												"colorB": [
													1,
													0.23529411764705882,
													0
												],
												"pointB": 0.69,
												"colorC": [
													1,
													0.3607843137254902,
													0
												],
												"pointC": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVSweep",
											"source": "shaders/UVSweep.hx",
											"props": {
												"saturation": 1,
												"width": 1,
												"useU": false,
												"progress": 0.7
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
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.5,
															"value": 1.3,
															"mode": 0,
															"prevHandle": {
																"dv": -1.078256415940511,
																"dt": -1.785
															},
															"nextHandle": {
																"dv": 1.078256415940511,
																"dt": 1.785
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
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													1,
													0.796078431372549,
													0.580392156862745
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.611764705882353,
													0.611764705882353,
													0.611764705882353
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 1,
												"sandColorSet": false,
												"envBlend": 0,
												"envColorSet": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 10,
												"power": 0.8
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "model",
									"name": "Nuke",
									"source": "Fx/Meshes_Common/Nuke_4.fbx",
									"x": 0.125,
									"y": -0.125,
									"z": -27.65495375,
									"scaleX": 2.2,
									"scaleY": 2.2,
									"scaleZ": 2.5,
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
													"alphaKill": false,
													"enableStencil": false,
													"parallax": 0,
													"drawOrder": "100"
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "VertexDisplacement",
											"source": "shaders/VertexDisplacement.hx",
											"props": {
												"X": true,
												"Y": true,
												"Z": true,
												"texScale": 5,
												"tex": "Fx/DistortionMaps/waveNormal02.jpg",
												"intensity": 3.71,
												"scrollSpeed": [
													0.1,
													0.1
												],
												"smoothEdge": 9.85,
												"texScaleX": 1,
												"texScaleY": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"onDecal": false,
												"wrap": false,
												"invert": false,
												"replace": false,
												"alpha": 2,
												"uScale": 1,
												"vScale": 0.95,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/GradientSpice_2.png"
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1,
															"value": 1,
															"mode": 2
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
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.52,
												"saturation": 0,
												"width": 0.33,
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.4
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
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.14233523557739344,
																"dt": -0.4981733245208754
															},
															"nextHandle": {
																"dv": -0.25,
																"dt": 0.875
															}
														},
														{
															"time": 1,
															"value": 0.6,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0.6,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"enabled": false,
											"props": {
												"scaleX": 1,
												"scaleY": 1,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVSweep",
											"source": "shaders/UVSweep.hx",
											"props": {
												"saturation": 1,
												"width": 1,
												"useU": false,
												"progress": 0.78
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
															"value": 0,
															"mode": 2
														},
														{
															"time": 2,
															"value": 1.3,
															"mode": 0,
															"prevHandle": {
																"dv": -0.6072222222222223,
																"dt": -1.7149999999999999
															},
															"nextHandle": {
																"dv": 0.23673363834399366,
																"dt": 0.6631549379019129
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorMap3",
											"source": "shaders/ColorMap3.hx",
											"enabled": false,
											"props": {
												"colorA": [
													0,
													0,
													0
												],
												"pointA": 0.33,
												"colorB": [
													1,
													0.23529411764705882,
													0
												],
												"pointB": 0.69,
												"colorC": [
													1,
													0.3607843137254902,
													0
												],
												"pointC": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													1,
													0.796078431372549,
													0.580392156862745
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.15294117647058825,
													0.15294117647058825,
													0.15294117647058825
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 1,
												"sandColorSet": false,
												"envBlend": 0,
												"envColorSet": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 10,
												"power": 0.8
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "model",
									"name": "Nuke",
									"source": "Fx/Meshes_Common/Nuke_4.fbx",
									"x": 0.125,
									"y": -0.125,
									"z": -27.65495375,
									"scaleX": 2.2,
									"scaleY": 2.2,
									"scaleZ": 2.5,
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
													"alphaKill": false,
													"enableStencil": false,
													"parallax": 0,
													"emissive": 10
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "VertexDisplacement",
											"source": "shaders/VertexDisplacement.hx",
											"enabled": false,
											"props": {
												"X": true,
												"Y": true,
												"Z": true,
												"texScale": 5,
												"tex": "Fx/DistortionMaps/waveNormal02.jpg",
												"intensity": 3.71,
												"scrollSpeed": [
													0.1,
													0.1
												],
												"smoothEdge": 100
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"onDecal": false,
												"wrap": false,
												"invert": false,
												"replace": false,
												"alpha": 0.5,
												"uScale": 1,
												"vScale": 0.95,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/GradientSpice_2.png"
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1,
															"value": 1,
															"mode": 2
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
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.61,
												"saturation": 0,
												"width": 0.39,
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.4
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
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.14233523557739344,
																"dt": -0.4981733245208754
															},
															"nextHandle": {
																"dv": -0.25,
																"dt": 0.875
															}
														},
														{
															"time": 1,
															"value": 0.6,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0.6,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"enabled": false,
											"props": {
												"scaleX": 1,
												"scaleY": 1,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVSweep",
											"source": "shaders/UVSweep.hx",
											"props": {
												"saturation": 1,
												"width": 1,
												"useU": false,
												"progress": 0.78
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
															"value": 0,
															"mode": 2
														},
														{
															"time": 2,
															"value": 1.3,
															"mode": 0,
															"prevHandle": {
																"dv": -0.2666666666666667,
																"dt": -1.79
															},
															"nextHandle": {
																"dv": 0.09929240604583035,
																"dt": 0.6665002755826369
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorMap3",
											"source": "shaders/ColorMap3.hx",
											"enabled": false,
											"props": {
												"colorA": [
													0,
													0,
													0
												],
												"pointA": 0.33,
												"colorB": [
													1,
													0.23529411764705882,
													0
												],
												"pointB": 0.69,
												"colorC": [
													1,
													0.3607843137254902,
													0
												],
												"pointC": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													1,
													0.796078431372549,
													0.580392156862745
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.611764705882353,
													0.611764705882353,
													0.611764705882353
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 1,
												"sandColorSet": false,
												"envBlend": 0,
												"envColorSet": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 10,
												"power": 0.8
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "model",
									"name": "Nuke",
									"source": "Fx/Meshes_Common/Nuke_4.fbx",
									"x": 0.125,
									"y": -0.125,
									"z": -27.65495375,
									"scaleX": 2,
									"scaleY": 2,
									"scaleZ": 2.5,
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
													"alphaKill": false,
													"enableStencil": false,
													"parallax": 0,
													"emissive": 12
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "VertexDisplacement",
											"source": "shaders/VertexDisplacement.hx",
											"enabled": false,
											"props": {
												"X": true,
												"Y": true,
												"Z": true,
												"texScale": 5,
												"tex": "Fx/DistortionMaps/waveNormal02.jpg",
												"intensity": 3.71,
												"scrollSpeed": [
													0.1,
													0.1
												],
												"smoothEdge": 100
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"onDecal": false,
												"wrap": false,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/GradientSpice_2.png"
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.15000000000000002,
															"value": 0.15000000000000002,
															"mode": 2
														},
														{
															"time": 1,
															"value": 1,
															"mode": 2
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
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.26,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/causticTexture_04.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.5
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
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.14233523557739344,
																"dt": -0.4981733245208754
															},
															"nextHandle": {
																"dv": -0.25,
																"dt": 0.875
															}
														},
														{
															"time": 1,
															"value": 0.6,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0.6,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"enabled": false,
											"props": {
												"scaleX": 1,
												"scaleY": 1,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVSweep",
											"source": "shaders/UVSweep.hx",
											"props": {
												"saturation": 1,
												"width": 1,
												"useU": false,
												"progress": 0.78
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
															"value": 0,
															"mode": 2
														},
														{
															"time": 2,
															"value": 1.3,
															"mode": 0,
															"prevHandle": {
																"dv": -0.8666666666666667,
																"dt": -1.72
															},
															"nextHandle": {
																"dv": 0.334961932188022,
																"dt": 0.6647706038808452
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorMap3",
											"source": "shaders/ColorMap3.hx",
											"enabled": false,
											"props": {
												"colorA": [
													0,
													0,
													0
												],
												"pointA": 0.33,
												"colorB": [
													1,
													0.23529411764705882,
													0
												],
												"pointB": 0.69,
												"colorC": [
													1,
													0.3607843137254902,
													0
												],
												"pointC": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													1,
													0.796078431372549,
													0.580392156862745
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													0.396078431372549,
													0.1843137254901961
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
												"range": 10,
												"power": 0.8
											},
											"isInstance": true
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Units",
					"enabled": false,
					"x": -6.881854166666667,
					"y": 0.17853083333333333,
					"z": -2.550703333333333,
					"children": [
						{
							"type": "model",
							"name": "Male01_AtreideSoldier",
							"source": "Character/Atreide/Unit/Soldier/Male01_AtreideSoldier.fbx",
							"x": -1.5,
							"y": -1.5,
							"scaleX": 1.84,
							"scaleY": 1.84,
							"scaleZ": 1.84,
							"rotationZ": 89.99999999999999
						},
						{
							"type": "model",
							"name": "Male01_AtreideSoldier",
							"source": "Character/Atreide/Unit/Soldier/Male01_AtreideSoldier.fbx",
							"x": 1.5,
							"y": -1.5,
							"scaleX": 1.84,
							"scaleY": 1.84,
							"scaleZ": 1.84,
							"rotationZ": 89.99999999999999
						},
						{
							"type": "model",
							"name": "Male01_AtreideSoldier",
							"source": "Character/Atreide/Unit/Soldier/Male01_AtreideSoldier.fbx",
							"x": 1.5,
							"y": 1.5,
							"scaleX": 1.84,
							"scaleY": 1.84,
							"scaleZ": 1.84,
							"rotationZ": 89.99999999999999
						},
						{
							"type": "model",
							"name": "Male01_AtreideSoldier",
							"source": "Character/Atreide/Unit/Soldier/Male01_AtreideSoldier.fbx",
							"x": -1.5,
							"y": 1.5,
							"scaleX": 1.84,
							"scaleY": 1.84,
							"scaleZ": 1.84,
							"rotationZ": 89.99999999999999
						}
					]
				},
				{
					"type": "object",
					"name": "group",
					"x": -1.8388091666666666,
					"y": 0.08696583333333334,
					"z": 12.753516666666666,
					"visible": false,
					"children": [
						{
							"type": "model",
							"name": "Nuke_Tete_Smoke",
							"source": "Fx/Meshes_Common/Nuke_5.fbx",
							"x": 5.043045,
							"y": -0.091565,
							"z": 20.27444,
							"scaleX": 2.2000000000000006,
							"scaleY": 2.2000000000000006,
							"scaleZ": 2.2,
							"rotationZ": 89.99999999999999,
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
											"alphaKill": false,
											"enableStencil": false,
											"parallax": 0,
											"drawOrder": "-80",
											"emissive": 1,
											"textureWrap": true,
											"depthWrite": "On"
										}
									},
									"wrapRepeat": true,
									"diffuseMap": "Fx/Alphas/T_Nuke.png"
								},
								{
									"type": "shader",
									"name": "VertexDisplacement",
									"source": "shaders/VertexDisplacement.hx",
									"props": {
										"X": true,
										"Y": true,
										"Z": true,
										"texScale": 1,
										"tex": "Fx/Alphas/T_NukeVertex.png",
										"intensity": 7,
										"scrollSpeed": [
											0.01,
											0.03
										],
										"smoothEdge": 0,
										"texScaleX": 2,
										"texScaleY": 0.6
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 2,
										"scaleY": 0.6,
										"shiftX": 0,
										"shiftY": 0,
										"shiftSpeedX": 0.005,
										"shiftSpeedY": 0.05
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "Fresnel",
									"source": "shaders/Fresnel.hx",
									"props": {
										"RGB": true,
										"ALPHA": false,
										"REVERSE": false,
										"bias": 0.02,
										"scale": 0.07,
										"power": 1,
										"color": [
											1,
											0.33725490196078434,
											0
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "Level",
									"source": "shaders/Level.hx",
									"props": {
										"levelMin": 0,
										"levelMax": 0.81
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.25,
										"saturation": 1,
										"width": 0.25,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0.4
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
													"mode": 0,
													"prevHandle": {
														"dv": 0.14233523557739344,
														"dt": -0.4981733245208754
													},
													"nextHandle": {
														"dv": -0.25,
														"dt": 0.875
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
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"enabled": false,
									"props": {
										"scaleX": 1,
										"scaleY": 1,
										"shiftX": 0,
										"shiftY": 0,
										"shiftSpeedX": 0,
										"shiftSpeedY": 0
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorMap3",
									"source": "shaders/ColorMap3.hx",
									"enabled": false,
									"props": {
										"colorA": [
											0,
											0,
											0
										],
										"pointA": 0.33,
										"colorB": [
											1,
											0.23529411764705882,
											0
										],
										"pointB": 0.69,
										"colorC": [
											1,
											0.3607843137254902,
											0
										],
										"pointC": 1
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "UVSweep",
									"source": "shaders/UVSweep.hx",
									"enabled": false,
									"props": {
										"saturation": 1,
										"width": 1,
										"useU": false,
										"progress": 1
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
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.5,
													"value": 1.3,
													"mode": 0,
													"prevHandle": {
														"dv": -1.6028836951790304,
														"dt": -1.784694634022979
													},
													"nextHandle": {
														"dv": 1.6028836951790304,
														"dt": 1.784694634022979
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
									"enabled": false,
									"props": {
										"amount": 1,
										"color": [
											1,
											0.796078431372549,
											0.580392156862745
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorMult",
									"source": "shaders/ColorMult.hx",
									"enabled": false,
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
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"enabled": false,
									"props": {
										"REVERSE": false,
										"range": 10,
										"power": 0.8
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "model",
							"name": "Nuke_Tete_Smoke",
							"source": "Fx/Meshes_Common/Nuke_4.fbx",
							"x": -5.043045,
							"y": 0.091565,
							"z": -20.27444,
							"scaleX": 1.5000000000000004,
							"scaleY": 1.5000000000000004,
							"scaleZ": 2.2,
							"rotationZ": 89.99999999999999,
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
											"alphaKill": false,
											"enableStencil": false,
											"parallax": 0,
											"drawOrder": "-80",
											"textureWrap": true,
											"depthWrite": "On",
											"emissive": 2
										}
									},
									"wrapRepeat": true,
									"diffuseMap": "Fx/Alphas/T_Nuke.png"
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 0.7,
										"scaleY": 0.7,
										"shiftX": 0,
										"shiftY": 0,
										"shiftSpeedX": 0,
										"shiftSpeedY": 0.1
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "VertexDisplacement",
									"source": "shaders/VertexDisplacement.hx",
									"props": {
										"X": true,
										"Y": true,
										"Z": true,
										"texScale": 1,
										"tex": "Fx/Alphas/T_NukeVertex.png",
										"intensity": 4,
										"scrollSpeed": [
											0,
											0.07
										],
										"smoothEdge": 0,
										"texScaleX": 0.7,
										"texScaleY": 0.7
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "Fresnel",
									"source": "shaders/Fresnel.hx",
									"props": {
										"RGB": true,
										"ALPHA": false,
										"REVERSE": false,
										"bias": 0.02,
										"scale": 0.07,
										"power": 1,
										"color": [
											1,
											0.33725490196078434,
											0
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "Level",
									"source": "shaders/Level.hx",
									"props": {
										"levelMin": 0,
										"levelMax": 0.81
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 0.9,
										"power": 1.52
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "UVSweep",
									"source": "shaders/UVSweep.hx",
									"enabled": false,
									"props": {
										"saturation": 1,
										"width": 1,
										"useU": false,
										"progress": 0.8
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
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.5,
													"value": 1.3,
													"mode": 0,
													"prevHandle": {
														"dv": -1.078256415940511,
														"dt": -1.785
													},
													"nextHandle": {
														"dv": 1.078256415940511,
														"dt": 1.785
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
									"enabled": false,
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
											0.4
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
													"mode": 0,
													"prevHandle": {
														"dv": 0.14233523557739344,
														"dt": -0.4981733245208754
													},
													"nextHandle": {
														"dv": -0.25,
														"dt": 0.875
													}
												},
												{
													"time": 1,
													"value": 0.6,
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
									"enabled": false,
									"props": {
										"RGB": true,
										"ALPHA": true,
										"REVERSE": false,
										"bias": 0.08,
										"scale": 0.03,
										"power": 0,
										"color": [
											1,
											0.33725490196078434,
											0
										]
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
										"range": 15.15,
										"power": 3.03
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"onDecal": false,
										"wrap": false,
										"invert": true,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/TestNuke.png"
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
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
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"enabled": false,
									"props": {
										"scaleX": 1,
										"scaleY": 1,
										"shiftX": 0,
										"shiftY": 0,
										"shiftSpeedX": 0,
										"shiftSpeedY": 0
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorMap3",
									"source": "shaders/ColorMap3.hx",
									"enabled": false,
									"props": {
										"colorA": [
											0,
											0,
											0
										],
										"pointA": 0.33,
										"colorB": [
											1,
											0.23529411764705882,
											0
										],
										"pointB": 0.69,
										"colorC": [
											1,
											0.3607843137254902,
											0
										],
										"pointC": 1
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"enabled": false,
									"props": {
										"amount": 1,
										"color": [
											1,
											0.796078431372549,
											0.580392156862745
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorMult",
									"source": "shaders/ColorMult.hx",
									"enabled": false,
									"props": {
										"amount": 1,
										"color": [
											1,
											1,
											1
										]
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "curve",
							"name": "scale",
							"keyMode": 0,
							"keys": [
								{
									"time": 1.9867407989501957,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": -2.7903464047254443,
										"dt": -0.1681681984990783
									},
									"nextHandle": {
										"dv": 0.6644531250000002,
										"dt": 0.03759880065917964
									}
								},
								{
									"time": 2.138787288665772,
									"value": 0.9333333333333333,
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
			"name": "FXRoot",
			"children": [
				{
					"type": "event",
					"name": "Dmg",
					"time": 2.855
				},
				{
					"type": "object",
					"name": "group",
					"children": [
						{
							"type": "subFX",
							"name": "FX_Missile",
							"source": "Fx/Projectiles/FX_Missile.fx",
							"scaleX": 0.8,
							"scaleY": 0.8,
							"scaleZ": 0.8,
							"rotationX": 30
						},
						{
							"type": "subFX",
							"name": "FX_MissileLauncher_Impact",
							"source": "Fx/Unit/FX_MissileLauncher_Impact.fx",
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 2,
							"rotationZ": 122.73,
							"time": 0.95
						}
					]
				},
				{
					"type": "curve",
					"name": "shake",
					"keyMode": 1,
					"keys": [
						{
							"time": 2.847472924365212,
							"value": 0.03333333333333333,
							"mode": 1,
							"prevHandle": {
								"dv": 3.688081717680229e-17,
								"dt": -0.11044304128169422
							},
							"nextHandle": {
								"dv": -0.023615912555977482,
								"dt": 0.14951926313478925
							}
						},
						{
							"time": 3.0325878906250012,
							"value": 1.0773986004547538,
							"mode": 2
						},
						{
							"time": 3.3315917968750015,
							"value": 0.18442888654274825,
							"mode": 1,
							"prevHandle": {
								"dv": 0.48499313154322493,
								"dt": -0.04999999999999938
							},
							"nextHandle": {
								"dv": 0,
								"dt": 1.2192675662813421
							}
						},
						{
							"time": 10.080880508596096,
							"value": 0,
							"mode": 0,
							"prevHandle": {
								"dv": 0.048542190947443054,
								"dt": -0.5753846942001832
							},
							"nextHandle": {
								"dv": -0.048542190947443054,
								"dt": 0.5753846942001832
							}
						}
					]
				}
			]
		}
	]
}