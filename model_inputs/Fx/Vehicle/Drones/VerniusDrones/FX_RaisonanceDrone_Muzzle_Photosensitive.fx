{
	"type": "fx",
	"duration": 1,
	"cullingRadius": 5,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"enabled": false,
			"editorOnly": true,
			"locked": true,
			"x": 15,
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
					"type": "object",
					"name": "AttackRange",
					"scaleX": 0.72,
					"scaleY": 0.72,
					"scaleZ": 0.72,
					"rotationX": -90,
					"children": [
						{
							"type": "object",
							"name": "Muzzle",
							"scaleX": 1.44,
							"scaleY": 1.44,
							"scaleZ": 1.44,
							"rotationZ": 89.99999999999999,
							"children": [
								{
									"type": "object",
									"name": "Shot1",
									"scaleX": 0.6,
									"scaleY": 0.5,
									"scaleZ": 0.5,
									"children": [
										{
											"type": "emitter",
											"name": "SmokeGun_big",
											"props": {
												"instScale_rand": 0.025,
												"simulationSpace": "World",
												"animationSpeed": 0,
												"randomColor1": [
													1,
													0.6901960784313725,
													0.3254901960784314,
													1
												],
												"enableSort": false,
												"instRotation_rand": [
													0,
													0,
													0
												],
												"lifeTimeRand": 0.5,
												"emitShape": "Cylinder",
												"emitSurface": true,
												"emitOrientation": "Normal",
												"instScale": 0.22,
												"emitAngle": 1,
												"lifeTime": 2.5,
												"emitRad1": 0.64,
												"emitRad2": 0.89,
												"randomColor2": [
													1,
													0.7843137254901961,
													0.5254901960784314,
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
												"speedFactor": 3.6,
												"frameDivisionX": 0,
												"frameDivisionY": 0,
												"emitType": "Burst",
												"instWorldSpeed_rand": [
													0,
													0,
													0
												],
												"warmUpTime": -0.2,
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
											"scaleX": 0.01,
											"scaleY": 0.01,
											"scaleZ": 0.01,
											"children": [
												{
													"type": "model",
													"name": "Ring_2",
													"source": "Fx/Meshes_Common/Ring_3.fbx",
													"scaleX": 0.5,
													"scaleY": 0.5,
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
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"props": {
																"useSourceUVs": true,
																"useScale": false,
																"wrap": true,
																"progress": 1,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 0.5,
																"uvScaleY": 1,
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
																			"prevHandle": {
																				"dv": 1.408519742567825,
																				"dt": -0.014085197425678224
																			},
																			"nextHandle": {
																				"dt": 0.009999999999999995
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
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
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.6549019607843137,
																	0.5764705882352941,
																	1
																]
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
															"prevHandle": {
																"dv": -1.0969964913138766,
																"dt": -7.796244552137517e-17
															},
															"nextHandle": {
																"dv": 0.9692887305398012,
																"dt": 0
															}
														},
														{
															"time": 1,
															"value": 1.0582053444602273,
															"prevHandle": {
																"dv": 0,
																"dt": -0.685
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
											"enabled": false,
											"props": {
												"emitRate": 1,
												"maxCount": 1,
												"lifeTime": 0.15,
												"frameDivisionY": 0,
												"animationSpeed": 0,
												"instScale": 4,
												"emitType": "Burst",
												"instScale_rand": 0.5,
												"frameDivisionX": 0,
												"alignMode": "Screen",
												"instRotation_rand": [
													0,
													0,
													0
												],
												"lifeTimeRand": 0.02,
												"useRandomColor": true,
												"randomColor1": [
													0.8549019607843137,
													0.8549019607843137,
													0.8549019607843137,
													1
												],
												"instRotation": [
													0,
													0,
													180
												],
												"emitOrientation": "Normal",
												"speedFactor": 1.5,
												"alignLockAxis": "Z",
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
											"scaleX": 0.01,
											"scaleY": 0.01,
											"scaleZ": 0.01,
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
																	"emissive": 20
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
																			"time": 0.2610256091340131,
																			"value": 3,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.0864952927985753
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.011804602326868493
																			}
																		},
																		{
																			"time": 0.2948996853763314,
																			"value": 0.7544444444444445
																		},
																		{
																			"time": 0.72,
																			"value": 1,
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
																			"prevHandle": {
																				"dv": 1.1462494082799496e-16,
																				"dt": -0.500118692076805
																			},
																			"nextHandle": {
																				"dv": -0.0002777777777778212,
																				"dt": 0.7424137395426957
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
																	0.011764705882352941,
																	0.00392156862745098,
																	0.01568627450980392
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
															"value": 0.7,
															"mode": 2
														},
														{
															"time": 0.3917535652877765,
															"value": 0.07441510915756222,
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
															"time": 0.5367535652877765,
															"value": 1.3,
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
												},
												{
													"type": "shader",
													"name": "ColorMap",
													"source": "shaders/ColorMap.hx",
													"props": {
														"USE_ALPHA": true,
														"colorA": [
															0.4196078431372549,
															0.37254901960784315,
															0.6352941176470588
														],
														"pointA": 1,
														"colorB": [
															0.21568627450980393,
															0.18823529411764706,
															0.3333333333333333
														],
														"pointB": 0
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
							"name": "NightEmissive",
							"source": "shaders/NightEmissive.hx",
							"props": {
								"amount": 0.9,
								"ATTENUATE": true,
								"emissiveMap": null
							}
						}
					]
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.AttackRange",
					"target": "FXAnimation.FXRoot.DroneRailGun.root.JNT_Root"
				}
			]
		}
	]
}