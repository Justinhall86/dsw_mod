{
	"type": "fx",
	"duration": 5,
	"cullingRadius": 10,
	"blendFactor": 1,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "Shot",
					"enabled": false,
					"x": 3.60424,
					"z": 0.32246,
					"rotationY": 6.9,
					"children": [
						{
							"type": "object",
							"name": "Muzzle",
							"scaleX": 1.75,
							"scaleY": 1.75,
							"scaleZ": 1.75,
							"rotationZ": 90,
							"children": [
								{
									"type": "emitter",
									"name": "SmokeGun2",
									"props": {
										"instScale_rand": 1.2,
										"simulationSpace": "World",
										"animationSpeed": 0,
										"randomColor1": [
											0.8,
											0.8235294117647058,
											0.9058823529411765,
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
										"instScale": 3.1,
										"emitAngle": 1,
										"alignMode": "Screen",
										"lifeTime": 6,
										"emitRad1": 0.64,
										"emitRad2": 0.89,
										"randomColor2": [
											0.7803921568627451,
											0.8823529411764706,
											0.8784313725490196,
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
										"burstDelay": 0.24,
										"seedGroup": 1,
										"warmUpTime": -0.2,
										"useRandomColor": true,
										"lifeTimeRand": 2,
										"burstCount": 2
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
															"depthTest": "LessEqual",
															"colorMask": 15,
															"enableStencil": false,
															"alphaKill": false,
															"parallax": 0,
															"textureWrap": true,
															"emissive": 10
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
														"texture": "Fx/Alphas/T_ChocWave_Blurred.png",
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
																	"time": 0,
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
																		"dt": -0.62
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
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 1.7,
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
													"value": 0.07599276417989542,
													"mode": 0,
													"prevHandle": {
														"dv": -1.0967067405187236,
														"dt": -0.009753923835968315
													},
													"nextHandle": {
														"dv": 1.1243749274261694,
														"dt": 0.009999999999999995
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
								},
								{
									"type": "emitter",
									"name": "FlareStar2",
									"props": {
										"emitRate": 1,
										"maxCount": 1,
										"lifeTime": 0.25,
										"frameDivisionY": 0,
										"animationSpeed": 0,
										"instScale": 1.4,
										"emitType": "Burst",
										"burstDelay": 0.225,
										"instScale_rand": 0.5,
										"frameDivisionX": 0,
										"alignMode": "Screen",
										"instRotation_rand": [
											0,
											0,
											0
										],
										"warmUpTime": -0.1,
										"lifeTimeRand": 0.08,
										"useRandomColor": true,
										"randomColor1": [
											0.796078431372549,
											0.8196078431372549,
											0.8862745098039215,
											1
										],
										"randomColor2": [
											0.792156862745098,
											0.8862745098039215,
											0.8823529411764706,
											1
										],
										"instRotation": [
											0,
											0,
											180
										],
										"emitOrientation": "Normal",
										"speedFactor": 1.5,
										"burstCount": 2
									},
									"scaleX": 0.10000000000000002,
									"scaleY": 0.10000000000000002,
									"scaleZ": 0.1,
									"children": [
										{
											"type": "model",
											"name": "PlanePivBot_NoVrtx",
											"source": "Fx/Meshes_Common/PlanePivCenter_NoVrtx.fbx",
											"rotationY": 90,
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
															"emissive": 8
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_Flare05.png",
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
																	"value": 0.43333333333333335,
																	"mode": 2
																},
																{
																	"time": 0.275,
																	"value": 2,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.09166666666666667
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.006666666666666654
																	}
																},
																{
																	"time": 0.295,
																	"value": 0.7677242533365886,
																	"mode": 0
																},
																{
																	"time": 0.72,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.022847819119101713,
																		"dt": -0.2399021007505667
																	},
																	"nextHandle": {
																		"dv": -0.016666666666666607,
																		"dt": 0.17499999999999993
																	}
																},
																{
																	"time": 1,
																	"value": 0.7,
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
														"progress": 0.5,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/causticTexture_03-2-Blured.png",
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
																		"dv": -0.009691703115208502,
																		"dt": -0.5000918807447791
																	},
																	"nextHandle": {
																		"dv": 0.016666666666666607,
																		"dt": 0.86
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
															0,
															0,
															0
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.5,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.51,
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
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.265,
													"value": 1.4883021831512457,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.08666666666666667
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.05000000000000001
													}
												},
												{
													"time": 0.41000000000000003,
													"value": 0.7166666666666667,
													"mode": 0,
													"prevHandle": {
														"dv": -0.016666666666666607,
														"dt": -0.14
													},
													"nextHandle": {
														"dv": 0.04420191197517367,
														"dt": 0.37129606059146064
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
							"name": "Trail",
							"children": [
								{
									"type": "emitter",
									"name": "projectileVertical",
									"props": {
										"emitRate": 1,
										"maxCount": 5,
										"instStretch": [
											2,
											80,
											2
										],
										"lifeTime": 0.4,
										"instStretch_rand": [
											1,
											30,
											1
										],
										"emitType": "Burst",
										"burstDelay": 0.12,
										"warmUpTime": -0.2,
										"lifeTimeRand": 0.3,
										"burstCount": 2,
										"seedGroup": 1,
										"useRandomColor": true,
										"randomColor1": [
											1,
											1,
											1,
											1
										],
										"randomColor2": [
											0.7568627450980392,
											0.8745098039215686,
											0.8901960784313725,
											0.5490196078431373
										]
									},
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"rotationZ": 90,
									"children": [
										{
											"type": "model",
											"name": "PlanePivBot_NoVrtx",
											"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
											"scaleX": 0.08,
											"scaleY": 0.11,
											"scaleZ": 0.08,
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
															"emissive": 4
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
														"alpha": 0.35,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Gradients/T_Square03.jpg",
														"onDecal": false
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
														"progress": 0.56,
														"saturation": 0,
														"width": 0.7,
														"uvScaleX": 2,
														"uvScaleY": 1,
														"texture": "Fx/noise/Dissolve_lines.jpg.png",
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
																	"value": 1.005,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.7856981969617335,
																		"dt": -0.42607514163596477
																	},
																	"nextHandle": {
																		"dv": -1.005,
																		"dt": 0.5449999999999999
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
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.5,
														"saturation": 0,
														"width": 0.76,
														"uvScaleX": 1,
														"uvScaleY": 0.12,
														"texture": "Fx/noise/perlin4.jpg",
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
																	"value": 1.005,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.26396493179483227,
																		"dt": -0.4799362396269668
																	},
																	"nextHandle": {
																		"dv": -0.36849999999999994,
																		"dt": 0.6699999999999999
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
														"range": 1.2,
														"power": 1.2
													},
													"isInstance": true
												}
											]
										},
										{
											"type": "curve",
											"name": "instStretch.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.94,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.033333333333333326,
														"dt": -0.865
													},
													"nextHandle": {
														"dv": 0.012845000567937064,
														"dt": 0.33332776473798326
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
					"type": "model",
					"name": "FightingMek",
					"source": "Character/Vernius/Unit/FightingMek/FightingMek.fbx",
					"editorOnly": true,
					"scaleX": 2,
					"scaleY": 2,
					"scaleZ": 2,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/FightingMek/Anim_FightingMek_AttackMelee02.fbx"
						},
						{
							"type": "shader",
							"name": "ColorSet",
							"source": "shaders/ColorSet.hx",
							"enabled": false,
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
					"type": "object",
					"name": "AttackMelee",
					"x": 2.58922,
					"y": -0.05321,
					"z": 1.96428,
					"children": [
						{
							"type": "object",
							"name": "Attack02",
							"y": 0.47242,
							"z": 0.64585,
							"scaleX": 1.1,
							"scaleY": 1.1,
							"scaleZ": 1.1,
							"children": [
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
										"warmUpTime": -2.02
									},
									"z": -2.220446049250313e-16,
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
															"emissive": 4
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
													"enabled": false,
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
										"warmUpTime": -0.72,
										"instRotation": [
											0,
											0,
											-30
										],
										"lifeTime": 0.2
									},
									"z": -2.220446049250313e-16,
									"scaleX": 0.007999999999999998,
									"scaleY": 0.007999999999999998,
									"scaleZ": 0.007999999999999998,
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
													"enabled": false,
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
									"name": "emitter_ElecticiteFin",
									"props": {
										"alignMode": "Screen",
										"lifeTime": 0.25,
										"lifeTimeRand": 0.05,
										"maxCount": 40,
										"frameCount": 4,
										"frameDivisionX": 2,
										"frameDivisionY": 2,
										"animationLoop": false,
										"instScale": 0.6,
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
										"instScale_rand": 0.3,
										"animationBlendBetweenFrames": false,
										"emitRate": 20,
										"instSpeed_rand": [
											0,
											0,
											0
										],
										"emitAngle": 360,
										"emitSurface": true,
										"seedGroup": 1,
										"warmUpTime": -0.85,
										"emitType": "Burst",
										"burstCount": 2,
										"burstDelay": 0.1
									},
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
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Attack02",
							"x": -0.10565,
							"y": -0.35472,
							"z": 0.38037,
							"scaleX": 1.1,
							"scaleY": 1.1,
							"scaleZ": 1.1,
							"children": [
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
										"warmUpTime": -2.08
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
															"emissive": 4
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
										"warmUpTime": -0.78,
										"instRotation": [
											0,
											0,
											-30
										],
										"lifeTime": 0.2
									},
									"scaleX": 0.007999999999999998,
									"scaleY": 0.007999999999999998,
									"scaleZ": 0.007999999999999998,
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
									"name": "emitter_ElecticiteFin",
									"props": {
										"alignMode": "Screen",
										"lifeTime": 0.25,
										"lifeTimeRand": 0.05,
										"maxCount": 40,
										"frameCount": 4,
										"frameDivisionX": 2,
										"frameDivisionY": 2,
										"animationLoop": false,
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
										"instScale_rand": 0.3,
										"animationBlendBetweenFrames": false,
										"emitRate": 20,
										"instSpeed_rand": [
											0,
											0,
											0
										],
										"emitAngle": 360,
										"emitSurface": true,
										"seedGroup": 3,
										"warmUpTime": -0.9,
										"emitType": "Burst",
										"burstCount": 2,
										"burstDelay": 0.1,
										"instScale": 0.6
									},
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
												"position": 0.08203125,
												"color": -9609477
											},
											{
												"position": 1,
												"color": -4920323
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
					"type": "object",
					"name": "AttackMelee",
					"enabled": false,
					"x": 2.58922,
					"y": -0.05321,
					"z": 2.05032,
					"children": [
						{
							"type": "object",
							"name": "Attack02",
							"y": 0.47242,
							"z": 0.64585,
							"scaleX": 1.1,
							"scaleY": 1.1,
							"scaleZ": 1.1,
							"children": [
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
										"warmUpTime": -1.82
									},
									"z": -2.220446049250313e-16,
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
															"emissive": 4
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
													"enabled": false,
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
										"warmUpTime": -0.62,
										"instRotation": [
											0,
											0,
											-30
										],
										"lifeTime": 0.2
									},
									"z": -2.220446049250313e-16,
									"scaleX": 0.007999999999999998,
									"scaleY": 0.007999999999999998,
									"scaleZ": 0.007999999999999998,
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
													"enabled": false,
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
									"name": "emitter_ElecticiteFin",
									"props": {
										"alignMode": "Screen",
										"lifeTime": 0.25,
										"lifeTimeRand": 0.05,
										"maxCount": 40,
										"frameCount": 4,
										"frameDivisionX": 2,
										"frameDivisionY": 2,
										"animationLoop": false,
										"instScale": 0.6,
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
										"instScale_rand": 0.3,
										"animationBlendBetweenFrames": false,
										"emitRate": 20,
										"instSpeed_rand": [
											0,
											0,
											0
										],
										"emitAngle": 360,
										"emitSurface": true,
										"seedGroup": 1,
										"warmUpTime": -0.75,
										"emitType": "Burst",
										"burstCount": 2,
										"burstDelay": 0.1
									},
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
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Attack02",
							"x": -0.10565,
							"y": -0.47242,
							"z": 0.26398,
							"scaleX": 1.1,
							"scaleY": 1.1,
							"scaleZ": 1.1,
							"children": [
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
															"emissive": 4
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
										"warmUpTime": -0.6,
										"instRotation": [
											0,
											0,
											-30
										],
										"lifeTime": 0.2
									},
									"scaleX": 0.007999999999999998,
									"scaleY": 0.007999999999999998,
									"scaleZ": 0.007999999999999998,
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
									"name": "emitter_ElecticiteFin",
									"props": {
										"alignMode": "Screen",
										"lifeTime": 0.25,
										"lifeTimeRand": 0.05,
										"maxCount": 40,
										"frameCount": 4,
										"frameDivisionX": 2,
										"frameDivisionY": 2,
										"animationLoop": false,
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
										"instScale_rand": 0.3,
										"animationBlendBetweenFrames": false,
										"emitRate": 20,
										"instSpeed_rand": [
											0,
											0,
											0
										],
										"emitAngle": 360,
										"emitSurface": true,
										"seedGroup": 3,
										"warmUpTime": -0.7,
										"emitType": "Burst",
										"burstCount": 2,
										"burstDelay": 0.1,
										"instScale": 0.6
									},
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
												"position": 0.08203125,
												"color": -9609477
											},
											{
												"position": 1,
												"color": -4920323
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
				}
			]
		}
	]
}