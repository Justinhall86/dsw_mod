{
	"type": "fx",
	"duration": 2,
	"cullingRadius": 3,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"scaleX": 50.00000000000004,
			"scaleY": 50.00000000000004,
			"scaleZ": 50,
			"rotationZ": 89.99999999999999,
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
					"type": "object",
					"name": "Chara",
					"editorOnly": true,
					"x": -1.1102230246251565e-16,
					"y": 5.551115123125783e-17,
					"scaleX": 1.0000000000000002,
					"scaleY": 1.0000000000000002,
					"rotationZ": -2.824900030752101e-30,
					"children": [
						{
							"type": "model",
							"name": "Smuggler_Sniper",
							"source": "Character/Smuggler/Weapon/Smuggler_Sniper.fbx",
							"rotationX": -90
						},
						{
							"type": "model",
							"name": "Female01_AtreideRanger",
							"source": "Character/Smuggler/Unit/Scout/Male01_Scout.fbx",
							"x": 1.1102230246251563e-16,
							"y": -5.5511151231257815e-17,
							"scaleX": 1.9999999999999996,
							"scaleY": 1.9999999999999996,
							"scaleZ": 2,
							"rotationZ": 2.824900030752101e-30,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Male01/Sniper/Anim_Male01_Sniper_AttackRange.fbx"
								}
							]
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.Chara.Smuggler_Sniper",
							"target": "FXAnimation.FXRoot.Chara.Female01_AtreideRanger.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Gun"
						}
					]
				},
				{
					"type": "object",
					"name": "Shot",
					"x": 3.40047,
					"y": 0.42719,
					"z": 3.51701,
					"children": [
						{
							"type": "object",
							"name": "Trail",
							"x": 0.3203150000000001,
							"z": -0.00020500000000001073,
							"children": [
								{
									"type": "emitter",
									"name": "projectileVertical",
									"props": {
										"emitRate": 1,
										"maxCount": 1,
										"instStretch": [
											2,
											80,
											2
										],
										"lifeTime": 0.6,
										"instStretch_rand": [
											0,
											10,
											0
										],
										"emitType": "Burst",
										"burstDelay": 0.1,
										"warmUpTime": -0.2,
										"lifeTimeRand": 0.1
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
						},
						{
							"type": "object",
							"name": "Muzzle",
							"x": -0.3203150000000001,
							"z": 0.00020500000000001073,
							"scaleX": 1.4000000000000001,
							"scaleY": 1.4000000000000001,
							"scaleZ": 1.4,
							"rotationZ": 89.99999999999999,
							"children": [
								{
									"type": "emitter",
									"name": "SmokeGun2",
									"props": {
										"instScale_rand": 1.8,
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
										"instScale": 2.8,
										"emitAngle": 1,
										"alignMode": "Screen",
										"lifeTime": 5.1,
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
										"speedFactor": 3.1,
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
										"warmUpTime": -0.74,
										"useRandomColor": true,
										"lifeTimeRand": 0.02
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
										"lifeTime": 0.2,
										"frameDivisionY": 0,
										"animationSpeed": 0,
										"instScale": 1.5,
										"emitType": "Burst",
										"burstDelay": 0.1,
										"instScale_rand": 0.5,
										"frameDivisionX": 0,
										"alignMode": "Screen",
										"instRotation_rand": [
											0,
											0,
											0
										],
										"warmUpTime": -0.23,
										"lifeTimeRand": 0.02,
										"useRandomColor": true,
										"randomColor1": [
											0.615686274509804,
											0.6470588235294118,
											0.7490196078431373,
											1
										],
										"randomColor2": [
											0.615686274509804,
											0.7490196078431373,
											0.7450980392156863,
											1
										],
										"instRotation": [
											0,
											0,
											180
										],
										"emitOrientation": "Normal",
										"speedFactor": 1.25
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
						}
					]
				}
			]
		}
	]
}