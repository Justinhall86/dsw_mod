{
	"type": "fx",
	"duration": 3,
	"cullingRadius": 20,
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
					"name": "Female01_Infiltrator",
					"source": "Character/Harkonnen/Unit/Cerberus/Male01_Cerberus.fbx",
					"editorOnly": true,
					"scaleX": 2.3,
					"scaleY": 2.3,
					"scaleZ": 2.3,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"time": -0.1,
							"animation": "Anim/Male01/Claws/Anim_Male01_Claws_AttackMelee01.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "Hit",
					"x": 8.30954,
					"z": 2.72774,
					"scaleX": 0.85,
					"scaleY": 0.85,
					"scaleZ": 0.85,
					"children": [
						{
							"type": "emitter",
							"name": "Hit_Round",
							"props": {
								"emitType": "Burst",
								"alignMode": "Screen",
								"instScale_rand": 0.25,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"warmUpTime": 0.15,
								"instScale": 1.5
							},
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 7,
									"scaleY": 7,
									"scaleZ": 7,
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
													"culling": "None",
													"depthTest": "LessEqual",
													"colorMask": 15,
													"enableStencil": false,
													"alphaKill": false,
													"parallax": 0,
													"textureWrap": true,
													"emissive": 1
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
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_FlatImpact01.png"
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
												"progress": 0.45,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1.5,
												"uvScaleY": 1.5,
												"texture": "Fx/noise/clouds.png",
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
													"keyMode": 1,
													"keys": [
														{
															"time": 0.46180444404066,
															"value": 0.01416666666666666,
															"mode": 1,
															"prevHandle": {
																"dv": 0.3775126578654911,
																"dt": -0.49657530216143814
															},
															"nextHandle": {
																"dv": 0.023114784558614043,
																"dt": 0.08500000000000008
															}
														},
														{
															"time": 0.5568044440406601,
															"value": 0.9419580650329591,
															"mode": 1,
															"prevHandle": {
																"dv": -0.22616915345191968,
																"dt": -0.039999999999999925
															},
															"nextHandle": {
																"dv": -0.8723667347431184,
																"dt": 0.07999999999999996
															}
														},
														{
															"time": 0.80180444404066,
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
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.5,
												"envColorSet": false
											}
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 200,
												"power": 23.48
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
													0.6980392156862745,
													0.34901960784313724
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keys": [
														{
															"time": 0.30180444404066004,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.85180444404066,
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
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.03236093441864362,
												"dt": -0.49997643676805403
											},
											"nextHandle": {
												"dv": 0.03333333333333333,
												"dt": 0.5149999999999999
											}
										},
										{
											"time": 0.85180444404066,
											"value": 1,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Hit_Round",
							"props": {
								"emitType": "Burst",
								"alignMode": "Screen",
								"instScale_rand": 0.25,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"warmUpTime": 0.15,
								"instScale": 1.5
							},
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 7,
									"scaleY": 7,
									"scaleZ": 7,
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
													"culling": "None",
													"depthTest": "LessEqual",
													"colorMask": 15,
													"enableStencil": false,
													"alphaKill": false,
													"parallax": 0,
													"textureWrap": true
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
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 2,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_LensFlare_05.png"
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
												"progress": 0.45,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/clouds.png",
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
													"keyMode": 1,
													"keys": [
														{
															"time": 0.46180444404066,
															"value": 0.01416666666666666,
															"mode": 1,
															"prevHandle": {
																"dv": 0.3775126578654911,
																"dt": -0.49657530216143814
															},
															"nextHandle": {
																"dv": 0.023114784558614043,
																"dt": 0.08500000000000008
															}
														},
														{
															"time": 0.5568044440406601,
															"value": 0.9419580650329591,
															"mode": 1,
															"prevHandle": {
																"dv": -0.22616915345191968,
																"dt": -0.039999999999999925
															},
															"nextHandle": {
																"dv": -0.8723667347431184,
																"dt": 0.07999999999999996
															}
														},
														{
															"time": 0.80180444404066,
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
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.5,
												"envColorSet": false
											}
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 200,
												"power": 23.48
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
													0.6980392156862745,
													0.34901960784313724
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keys": [
														{
															"time": 0.30180444404066004,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.85180444404066,
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
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.03236093441864362,
												"dt": -0.49997643676805403
											},
											"nextHandle": {
												"dv": 0.03333333333333333,
												"dt": 0.5149999999999999
											}
										},
										{
											"time": 0.85180444404066,
											"value": 1,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Impact",
							"enabled": false,
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
								"instScale": 5,
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
								"warmUpTime": -1.1
							},
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
													"depthTest": "LessEqual",
													"colorMask": 15,
													"enableStencil": false,
													"alphaKill": false,
													"parallax": 0,
													"textureWrap": true
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
												"width": 1,
												"uvScaleX": 0.28,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/Wave_01.jpg",
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
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.5,
												"envColorSet": true
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
													0.6941176470588235,
													0.6941176470588235
												]
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
				},
				{
					"type": "object",
					"name": "ArmsIn",
					"x": 1.149,
					"y": 0.06104999999999994,
					"z": 3.4586949999999996,
					"children": [
						{
							"type": "model",
							"name": "Knees",
							"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
							"x": -0.015160000000000284,
							"y": -0.8646499999999997,
							"z": -0.11673499999999937,
							"scaleX": 0.6,
							"scaleY": 0.6,
							"scaleZ": 4,
							"rotationY": 97.40000000000002,
							"rotationZ": -3.858529966739946e-15,
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
											"emissive": 0.1
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
										"wrap": false,
										"invert": false,
										"replace": false,
										"alpha": 2.27,
										"uScale": 1,
										"vScale": 1,
										"uOffset": -0.18,
										"vOffset": 0,
										"texture": "Fx/Gradients/T_Square03.jpg"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": -0.07901301043185005,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.22323618543630075,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.3813448044147719,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.050279752395452515
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.041899793662877126
													}
												},
												{
													"time": 0.5131019868968314,
													"value": 0,
													"mode": 2
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
										"useSourceUVs": true,
										"onDecal": false,
										"wrap": false,
										"invert": false,
										"replace": false,
										"alpha": 2,
										"uScale": 1,
										"vScale": 1,
										"uOffset": -0.08,
										"vOffset": 0,
										"texture": "Fx/Gradients/uGrad.png"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": -0.07901301043185005,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.22323618543630075,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.3813448044147719,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.050279752395452515
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.041899793662877126
													}
												},
												{
													"time": 0.5131019868968314,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.041899793662877126
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.041899793662877126
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
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"enabled": false,
									"props": {
										"amount": 1,
										"color": [
											1,
											0.5372549019607843,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "amount",
											"keys": [
												{
													"time": -0.027129705546872662,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.7963799292332581,
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
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.52,
										"saturation": 1,
										"width": 0.15,
										"uvScaleX": 0.14,
										"uvScaleY": 0.73,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										]
									}
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 0.53,
										"scaleY": 1,
										"shiftX": 1,
										"shiftY": 1,
										"shiftSpeedX": 0,
										"shiftSpeedY": 0
									},
									"children": [
										{
											"type": "curve",
											"name": "shiftX",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.12662692004316345,
													"value": 0.05111111111111105,
													"mode": 0,
													"prevHandle": {
														"dv": 4.082155997157844e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.07999999999999996
													}
												},
												{
													"time": 0.4096389682359344,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.10833333333333332
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.10833333333333332
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
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.79,
										"saturation": 1,
										"width": 0.12,
										"uvScaleX": 0.14,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/T_Square03.jpg",
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
											"name": "width",
											"keys": [
												{
													"time": 0.40110838178708097,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.704149901495816,
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
										"range": 16.67,
										"power": 20
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
										"progress": 0.33,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.98,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/uGrad.png",
										"uvShift": [
											0,
											0
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
										"useScale": false,
										"wrap": true,
										"progress": 0.93,
										"saturation": 1,
										"width": 0.11,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/Cyl15u_A.png",
										"uvShift": [
											0,
											0
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
									"enabled": false,
									"props": {
										"useSourceUVs": true,
										"useScale": false,
										"wrap": true,
										"progress": 0.63,
										"saturation": 1,
										"width": 0.75,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/Cyl03u_A.jpg",
										"uvShift": [
											0,
											0
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
											0,
											0,
											0
										]
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "amount",
											"keys": [
												{
													"time": 0.30557831344659003,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.31557831344659004,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.3316816045660228,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.3416816045660228,
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
							"type": "model",
							"name": "Knees",
							"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
							"x": 0.01515999999999984,
							"y": 0.8646499999999998,
							"z": 0.1167350000000007,
							"scaleX": 0.6,
							"scaleY": 0.6,
							"scaleZ": 4,
							"rotationY": 97.40000000000002,
							"rotationZ": -3.858529966739946e-15,
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
											"emissive": 0.1
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
										"wrap": false,
										"invert": false,
										"replace": false,
										"alpha": 2.27,
										"uScale": 1,
										"vScale": 1,
										"uOffset": -0.18,
										"vOffset": 0,
										"texture": "Fx/Gradients/T_Square03.jpg"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": -0.07901301043185005,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.22323618543630075,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.3813448044147719,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.050279752395452515
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.041899793662877126
													}
												},
												{
													"time": 0.5131019868968314,
													"value": 0,
													"mode": 2
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
										"useSourceUVs": true,
										"onDecal": false,
										"wrap": false,
										"invert": false,
										"replace": false,
										"alpha": 2,
										"uScale": 1,
										"vScale": 1,
										"uOffset": -0.08,
										"vOffset": 0,
										"texture": "Fx/Gradients/uGrad.png"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": -0.07901301043185005,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.22323618543630075,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.3813448044147719,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.050279752395452515
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.041899793662877126
													}
												},
												{
													"time": 0.5131019868968314,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.041899793662877126
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.041899793662877126
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
											0.5372549019607843,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "amount",
											"keys": [
												{
													"time": -0.027129705546872662,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.7963799292332581,
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
											0.9921568627450981,
											0.8235294117647058,
											0.6627450980392157
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
										"progress": 0.52,
										"saturation": 1,
										"width": 0.15,
										"uvScaleX": 0.14,
										"uvScaleY": 0.73,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										]
									}
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 0.53,
										"scaleY": 1,
										"shiftX": 1,
										"shiftY": 1,
										"shiftSpeedX": 0,
										"shiftSpeedY": 0
									},
									"children": [
										{
											"type": "curve",
											"name": "shiftX",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.12662692004316345,
													"value": 0.05111111111111105,
													"mode": 0,
													"prevHandle": {
														"dv": 4.082155997157844e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.07999999999999996
													}
												},
												{
													"time": 0.4096389682359344,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.10833333333333332
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.10833333333333332
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
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.79,
										"saturation": 1,
										"width": 0.12,
										"uvScaleX": 0.14,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/T_Square03.jpg",
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
											"name": "width",
											"keys": [
												{
													"time": 0.40110838178708097,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.704149901495816,
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
										"range": 16.67,
										"power": 20
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
										"progress": 0.33,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.98,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/uGrad.png",
										"uvShift": [
											0,
											0
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
										"useScale": false,
										"wrap": true,
										"progress": 0.93,
										"saturation": 1,
										"width": 0.11,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/Cyl15u_A.png",
										"uvShift": [
											0,
											0
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
											0,
											0,
											0
										]
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "amount",
											"keys": [
												{
													"time": 0.30557831344659003,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.31557831344659004,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.3316816045660228,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.3416816045660228,
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
					"type": "object",
					"name": "ArmsOut",
					"x": 1.149,
					"y": 0.06104999999999994,
					"z": 3.4586949999999996,
					"children": [
						{
							"type": "model",
							"name": "Knees",
							"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
							"x": 6.38797,
							"y": 0.55457,
							"z": -0.87595,
							"scaleX": 0.6,
							"scaleY": 0.6,
							"scaleZ": 4.5,
							"rotationX": -5,
							"rotationY": -97.4,
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
											"emissive": 0.1
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
										"wrap": false,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": -0.18,
										"vOffset": 0,
										"texture": "Fx/Gradients/T_Square03.jpg"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": -0.07901301043185005,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.6836244755489789,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.84173309452745,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.050279752395452515
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.041899793662877126
													}
												},
												{
													"time": 0.9734902770095095,
													"value": 0,
													"mode": 2
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
										"useSourceUVs": true,
										"onDecal": false,
										"wrap": false,
										"invert": false,
										"replace": false,
										"alpha": 2,
										"uScale": 1,
										"vScale": 1,
										"uOffset": -0.08,
										"vOffset": 0,
										"texture": "Fx/Gradients/uGrad.png"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": -0.07901301043185005,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.6836244755489789,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.84173309452745,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.050279752395452515
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.041899793662877126
													}
												},
												{
													"time": 0.9734902770095095,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.041899793662877126
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.041899793662877126
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.52,
										"saturation": 1,
										"width": 0.15,
										"uvScaleX": 0.14,
										"uvScaleY": 0.73,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										]
									}
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 0.53,
										"scaleY": 1,
										"shiftX": 1,
										"shiftY": 1,
										"shiftSpeedX": 0,
										"shiftSpeedY": 0
									},
									"children": [
										{
											"type": "curve",
											"name": "shiftX",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.5870152101558416,
													"value": 0.05111111111111105,
													"mode": 0,
													"prevHandle": {
														"dv": 4.082155997157844e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.07999999999999996
													}
												},
												{
													"time": 0.8700272583486125,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.10833333333333332
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.10833333333333332
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
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.79,
										"saturation": 1,
										"width": 0.12,
										"uvScaleX": 0.14,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/T_Square03.jpg",
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
											"name": "width",
											"keys": [
												{
													"time": 0.8614966718997591,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.1645381916084943,
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
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.33,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.98,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/uGrad.png",
										"uvShift": [
											0,
											0
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
										"useScale": false,
										"wrap": true,
										"progress": 0.93,
										"saturation": 1,
										"width": 0.11,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/Cyl15u_A.png",
										"uvShift": [
											0,
											0
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
											0,
											0,
											0
										]
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "amount",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.7909672753857442,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.04677763456582359
													}
												},
												{
													"time": 0.9313001790832149,
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
							"type": "model",
							"name": "Knees",
							"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
							"x": 6.78337,
							"y": -0.8993,
							"z": -0.51243,
							"scaleX": 0.6,
							"scaleY": 0.6,
							"scaleZ": 4.5,
							"rotationX": 3.5,
							"rotationY": -97.4,
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
											"emissive": 0.1
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
										"wrap": false,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": -0.18,
										"vOffset": 0,
										"texture": "Fx/Gradients/T_Square03.jpg"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": -0.07901301043185005,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.6836244755489789,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.84173309452745,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.050279752395452515
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.041899793662877126
													}
												},
												{
													"time": 0.9734902770095095,
													"value": 0,
													"mode": 2
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
										"useSourceUVs": true,
										"onDecal": false,
										"wrap": false,
										"invert": false,
										"replace": false,
										"alpha": 2,
										"uScale": 1,
										"vScale": 1,
										"uOffset": -0.08,
										"vOffset": 0,
										"texture": "Fx/Gradients/uGrad.png"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": -0.07901301043185005,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.6836244755489789,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.84173309452745,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.050279752395452515
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.041899793662877126
													}
												},
												{
													"time": 0.9734902770095095,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.041899793662877126
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.041899793662877126
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.52,
										"saturation": 1,
										"width": 0.15,
										"uvScaleX": 0.14,
										"uvScaleY": 0.73,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										]
									}
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 0.53,
										"scaleY": 1,
										"shiftX": 1,
										"shiftY": 1,
										"shiftSpeedX": 0,
										"shiftSpeedY": 0
									},
									"children": [
										{
											"type": "curve",
											"name": "shiftX",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.5870152101558416,
													"value": 0.05111111111111105,
													"mode": 0,
													"prevHandle": {
														"dv": 4.082155997157844e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.07999999999999996
													}
												},
												{
													"time": 0.8700272583486125,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.10833333333333332
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.10833333333333332
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
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.79,
										"saturation": 1,
										"width": 0.12,
										"uvScaleX": 0.14,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/T_Square03.jpg",
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
											"name": "width",
											"keys": [
												{
													"time": 0.8614966718997591,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.1645381916084943,
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
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.33,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.98,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/uGrad.png",
										"uvShift": [
											0,
											0
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
										"useScale": false,
										"wrap": true,
										"progress": 0.93,
										"saturation": 1,
										"width": 0.11,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/Cyl15u_A.png",
										"uvShift": [
											0,
											0
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
											0,
											0,
											0
										]
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "amount",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.7909672753857442,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.04677763456582359
													}
												},
												{
													"time": 0.9313001790832149,
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
				},
				{
					"type": "emitter",
					"name": "SandR",
					"props": {
						"instScale_rand": 0.9,
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
							30
						],
						"lifeTimeRand": 0.9,
						"useRandomColor": true,
						"emitShape": "Cylinder",
						"emitSurface": true,
						"emitOrientation": "Normal",
						"instScale": 5,
						"emitAngle": 10,
						"alignMode": "Screen",
						"lifeTime": 4.5,
						"emitRad1": 0.64,
						"emitRad2": 0.89,
						"randomColor2": [
							0.807843137254902,
							0.788235294117647,
							0.7803921568627451,
							1
						],
						"instSpeed_rand": [
							1,
							0,
							0
						],
						"instAcceleration_rand": [
							0,
							0,
							0
						],
						"emitRate": 1,
						"speedFactor": 2.5,
						"maxCount": 4,
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
						"warmUpTime": -2,
						"emitType": "Burst",
						"instWorldSpeed_rand": [
							0,
							0,
							0
						],
						"instSpeed": [
							15,
							0,
							0
						],
						"burstDelay": 0.75
					},
					"x": -0.73972,
					"y": -0.7921,
					"z": -0.14614,
					"scaleX": 0.5,
					"scaleY": 0.5,
					"scaleZ": 0.1,
					"rotationZ": 171.3,
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
							"scaleX": 2.25,
							"scaleY": 2.25,
							"scaleZ": 2.25,
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
										"alpha": 0.75
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
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -1.6472728746925278,
														"dt": -0.012445056058803479
													},
													"nextHandle": {
														"dv": 0.9454545454545454,
														"dt": 0.007142857142857143
													}
												},
												{
													"time": 0.45,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 8.922912650454184e-17,
														"dt": -0.21499999999999997
													},
													"nextHandle": {
														"dv": 0,
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
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.8745098039215686,
											0.8745098039215686,
											0.8745098039215686
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
										"useScale": false,
										"wrap": true,
										"progress": 1,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.5,
										"uvScaleY": 1,
										"texture": "Fx/noise/Wave_01.jpg",
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
													"time": 0,
													"value": 0.85,
													"mode": 0,
													"prevHandle": {
														"dv": 1.1116321015082125,
														"dt": -0.3076091494743911
													},
													"nextHandle": {
														"dv": -1,
														"dt": 0.2774350174349862
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
										"range": 1.7,
										"power": 1
									},
									"isInstance": true
								},
								{
									"type": "fakeLight",
									"name": "FakeLight",
									"normalMap": "Fx/DistortionMaps/SphereClean.png",
									"topBrighten": true,
									"topIntensity": 0.57,
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
									"value": 0.6,
									"mode": 0,
									"prevHandle": {
										"dv": -1.0967980860793232,
										"dt": -0.009802037467223067
									},
									"nextHandle": {
										"dv": 0.5569361461292616,
										"dt": 0.0049999999999999975
									}
								},
								{
									"time": 1,
									"value": 1.0582053444602273,
									"mode": 0,
									"prevHandle": {
										"dv": 0.010970089074337164,
										"dt": -0.575
									},
									"nextHandle": {
										"dv": -0.006359231507065358,
										"dt": 0.3333207316535249
									}
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
						}
					]
				}
			]
		}
	]
}