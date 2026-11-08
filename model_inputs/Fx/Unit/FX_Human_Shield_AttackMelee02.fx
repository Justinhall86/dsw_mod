{
	"type": "fx",
	"duration": 1.5,
	"cullingRadius": 3,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"scaleX": 50,
			"scaleY": 50,
			"scaleZ": 50,
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
					"name": "Female01_AtreideWarden",
					"source": "Character/Atreide/Unit/Warden/Female01_AtreideWarden.fbx",
					"editorOnly": true,
					"scaleX": 2.2,
					"scaleY": 2.2,
					"scaleZ": 2.2,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"time": -0.1,
							"animation": "Anim/Female01/Shield/Anim_Female01_Shield_AttackMelee02.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "Attack02",
					"x": 5.8,
					"z": 2.77667,
					"children": [
						{
							"type": "emitter",
							"name": "Sparkles02",
							"enabled": false,
							"props": {
								"emitType": "Burst",
								"burstParticleCount": 15,
								"emitOrientation": "Normal",
								"emitAngle": 57.27,
								"instSpeed": [
									13,
									0,
									0
								],
								"lifeTime": 0.2,
								"warmUpTime": -1.2,
								"emitSurface": true,
								"instStretch": [
									2.2,
									1,
									1
								],
								"instScale": 0.45,
								"instScale_rand": 0.1,
								"instSpeed_rand": [
									8,
									0,
									0
								],
								"speedFactor": 2,
								"instStretch_rand": [
									0.25,
									0,
									0
								],
								"useRandomColor": true,
								"randomColor1": [
									0.9921568627450981,
									0.8235294117647058,
									0.6627450980392157,
									1
								],
								"randomColor2": [
									0.9921568627450981,
									0.5058823529411764,
									0.4,
									1
								],
								"lifeTimeRand": 0.1,
								"burstDelay": 0.75
							},
							"rotationY": -89.99999999999999,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"rotationZ": 90,
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
													"textureWrap": true,
													"emissive": 6
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
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/Spark.png",
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
															"value": 0.9666666666666667,
															"mode": 0,
															"prevHandle": {
																"dv": -0.02352170282676526,
																"dt": -0.6051452312104698
															},
															"nextHandle": {
																"dv": 0.03222222222222226,
																"dt": 0.8296093750000002
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.26
															},
															"nextHandle": {
																"dv": -2.7214566023630135e-16,
																"dt": 0.33333569371893157
															}
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
												"amount": 0.9,
												"ATTENUATE": true,
												"emissiveMap": null
											},
											"isInstance": true
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
														"dv": -2.524747126051018,
														"dt": -0.08435811334917986
													},
													"nextHandle": {
														"dv": 1.1363636363636365,
														"dt": 0.038593750000000024
													}
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.015151515151515138,
														"dt": -0.6513281249999998
													},
													"nextHandle": {
														"dv": -0.007748222232672166,
														"dt": 0.333317624512036
													}
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "instSpeed.x",
									"keys": [
										{
											"time": 0.06,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1,
											"value": 0.325,
											"mode": 0,
											"prevHandle": {
												"dv": -0.0214444444444446,
												"dt": -0.44000000000000006
											},
											"nextHandle": {
												"dv": 0.0214444444444446,
												"dt": 0.44000000000000006
											}
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
											"value": 0.2,
											"mode": 2
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.52
											},
											"nextHandle": {
												"dv": -5.442874662877125e-16,
												"dt": 0.33333333333333326
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "hit",
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
								"instScale": 5,
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
								"warmUpTime": -0.6,
								"instRotation": [
									0,
									0,
									-30
								],
								"lifeTime": 0.2
							},
							"scaleX": 0.01,
							"scaleY": 0.01,
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
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
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
												"texture": "Fx/Alphas/T_LensFlare_05.png",
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
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9921568627450981,
													0.8235294117647058,
													0.6627450980392157
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
											"value": 0.3,
											"mode": 2
										},
										{
											"time": 1,
											"value": 1.1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.01283176810449338,
												"dt": -0.9272305319143821
											},
											"nextHandle": {
												"dv": 0.003205378105737736,
												"dt": 0.33333240186907614
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Impact",
							"props": {
								"instScale_rand": 0.8,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									0.615686274509804,
									0.6470588235294118,
									0.7490196078431373,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									360
								],
								"emitShape": "Box",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 2.5,
								"emitAngle": 1,
								"alignMode": "Screen",
								"lifeTime": 4,
								"emitRad1": 0.64,
								"emitRad2": 0.89,
								"randomColor2": [
									0.615686274509804,
									0.7490196078431373,
									0.7450980392156863,
									1
								],
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"instAcceleration_rand": [
									0,
									0,
									0
								],
								"emitRate": 1,
								"speedFactor": 3.2,
								"maxCount": 2,
								"frameDivisionX": 0,
								"frameDivisionY": 0,
								"emitType": "Burst",
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"burstDelay": 0.5,
								"seedGroup": 1,
								"warmUpTime": -1.8
							},
							"scaleX": 0.012,
							"scaleY": 0.012,
							"scaleZ": 0.012,
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
													"textureWrap": true,
													"emissive": 2
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Structure/Smoke/white.png"
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
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_ChocWave_04.png",
												"onDecal": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 2
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
															"value": 0.2833333333333333,
															"mode": 0,
															"prevHandle": {
																"dv": -1.6477951347620967,
																"dt": -9.080851668466424e-17
															},
															"nextHandle": {
																"dv": 0.8666666666666666,
																"dt": 0
															}
														},
														{
															"time": 0.45,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.29000000000000004
															},
															"nextHandle": {
																"dv": -2.9391523179536476e-16,
																"dt": 0.36
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01694444444444443,
																"dt": -0.27
															},
															"nextHandle": {
																"dv": 0.013434004892663146,
																"dt": 0.21406315992899264
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
												"useScale": false,
												"wrap": true,
												"progress": 1,
												"saturation": 1,
												"width": 0.75,
												"uvScaleX": 0.25,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/clouds.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.07,
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
															"time": 0.1,
															"value": 0.8,
															"mode": 0,
															"prevHandle": {
																"dv": 1.408519742567825,
																"dt": -0.014085197425678224
															},
															"nextHandle": {
																"dv": -1,
																"dt": 0.009999999999999995
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.4650000000000001
															},
															"nextHandle": {
																"dv": -2.1771608536988747e-16,
																"dt": 0.3333350157390327
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
													0.9921568627450981,
													0.8235294117647058,
													0.6627450980392157
												]
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
												"envBlend": 0.5,
												"envColorSet": true
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
												"dv": -1.0358306472229046,
												"dt": -0.1104807592495474
											},
											"nextHandle": {
												"dv": 1.0254649251175496,
												"dt": 0.11
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.815
											},
											"nextHandle": {
												"dv": -1.582726646250665e-16,
												"dt": 0.2500018203703057
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