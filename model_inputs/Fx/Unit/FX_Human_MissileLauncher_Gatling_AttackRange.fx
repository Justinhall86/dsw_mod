{
	"type": "fx",
	"duration": 5,
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"x": -0.1092677924158452,
			"y": 0.049577590407192035,
			"z": 0.24757302922975288,
			"children": [
				{
					"type": "object",
					"name": "Character",
					"editorOnly": true,
					"scaleX": 1.8,
					"scaleY": 1.8,
					"scaleZ": 1.8,
					"children": [
						{
							"type": "model",
							"name": "Gatling",
							"source": "Character/Harkonnen/Weapon/Gatling/Gatling.fbx",
							"x": -0.1373,
							"y": 0.11129,
							"z": 0.03666,
							"scaleX": 0.9,
							"scaleY": 0.9,
							"scaleZ": 0.9,
							"rotationX": -92,
							"rotationY": -5.4,
							"rotationZ": -16.4,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"time": -0.1,
									"animation": "Character/Harkonnen/Weapon/Gatling/Anim_Gatling_AttackRange.fbx"
								}
							]
						},
						{
							"type": "model",
							"name": "Female01_FreeCompany",
							"source": "Character/Harkonnen/Unit/Gunner/Female01_HarkonnenGunner.fbx",
							"animation": "Anim/Female01/MissileLauncher/Anim_Female01_Gatling_AttackRange.fbx",
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"time": -0.1,
									"animation": "Anim/Female01/MissileLauncher/Anim_Female01_MissileLauncher_GatlingRange.fbx"
								}
							]
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.Character.Gatling",
							"target": "FXAnimation.FXRoot.Character.Female01_FreeCompany.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Weapon"
						}
					]
				},
				{
					"type": "object",
					"name": "Shot",
					"x": -0.11735,
					"y": 0.14423,
					"z": -0.30227,
					"scaleX": 0.28,
					"scaleY": 0.28,
					"scaleZ": 0.28,
					"rotationZ": -16,
					"children": [
						{
							"type": "object",
							"name": "Douille_L",
							"x": 0.2657,
							"y": 0.91548,
							"z": 1.16853,
							"scaleX": 1.75,
							"scaleY": 1.75,
							"scaleZ": 1.75,
							"rotationX": -68.2,
							"rotationY": -102.1,
							"rotationZ": -37.3,
							"children": [
								{
									"type": "emitter",
									"name": "Douille",
									"props": {
										"warmUpTime": -0.1,
										"emitType": "BurstDuration",
										"simulationSpace": "World",
										"emitShape": "Cone",
										"emitAngle": 35.45,
										"alignMode": "Screen",
										"instSpeed": [
											20,
											0,
											-3
										],
										"instAcceleration": [
											0,
											0,
											-50
										],
										"instScale": 0.4,
										"instRotation": [
											0,
											0,
											720
										],
										"instRotation_rand": [
											0,
											0,
											360
										],
										"instStretch": [
											1,
											0.4,
											1
										],
										"burstCount": 4,
										"burstDelay": 0.09,
										"emitDuration": 2.5
									},
									"x": 0.06085,
									"y": 0.0051,
									"z": 0.00268,
									"scaleX": 0.9999999999999999,
									"rotationX": -24.1,
									"rotationY": -51.3,
									"rotationZ": 122.9,
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
															"emissive": 10
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
														"alpha": 2,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_circle5.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															1,
															0.3686274509803922,
															0.14901960784313725
														]
													}
												},
												{
													"type": "shader",
													"name": "Dissolve",
													"source": "shaders/Dissolve.hx",
													"props": {
														"progress": 0.23,
														"saturation": 1,
														"width": 1,
														"useAlpha": false
													},
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
																	"time": 0.2611111111111111,
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
											"name": "instSpeed.x",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 8.273459945837056,
														"dt": -0.3668803370090847
													},
													"nextHandle": {
														"dv": -0.8333333333333334,
														"dt": 0.037593570889227004
													}
												},
												{
													"time": 0.20405557181738693,
													"value": 0.1,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "instAcceleration.z",
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.06240034389496513,
													"value": 0.1,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "instRotation.z",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 360,
													"mode": 0,
													"prevHandle": {
														"dv": -531.7918680100018,
														"dt": -0.49544779633626745
													},
													"nextHandle": {
														"dv": 306.5487670898442,
														"dt": 0.28258183947003385
													}
												},
												{
													"time": 1.000096363511866,
													"value": 720,
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
							"name": "group",
							"z": 4.16328,
							"rotationY": -90,
							"rotationZ": 90,
							"children": [
								{
									"type": "object",
									"name": "Trail_L",
									"scaleX": 0.9999999999999999,
									"scaleY": 0.9999999999999999,
									"scaleZ": 0.9999999999999999,
									"children": [
										{
											"type": "emitter",
											"name": "projectileVertical",
											"props": {
												"emitRate": 1,
												"maxCount": 10,
												"instStretch": [
													2,
													80,
													2
												],
												"lifeTime": 0.2,
												"instStretch_rand": [
													1,
													30,
													1
												],
												"emitType": "Burst",
												"burstDelay": 0.1,
												"warmUpTime": -0.1,
												"lifeTimeRand": 0.1,
												"burstCount": 25,
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
												],
												"emitDuration": 2
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
									"name": "Muzzle_L",
									"scaleX": 1.7499999999999998,
									"scaleY": 1.7499999999999998,
									"scaleZ": 1.7499999999999998,
									"children": [
										{
											"type": "emitter",
											"name": "SmokeGun2",
											"props": {
												"instScale_rand": 1.2,
												"simulationSpace": "World",
												"animationSpeed": 0,
												"randomColor1": [
													0.803921568627451,
													0.8274509803921568,
													0.9019607843137255,
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
												"instScale": 3.3,
												"emitAngle": 1,
												"alignMode": "Screen",
												"lifeTime": 6,
												"emitRad1": 0.64,
												"emitRad2": 0.89,
												"randomColor2": [
													0.7843137254901961,
													0.8784313725490196,
													0.8745098039215686,
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
												"frameDivisionX": 0,
												"frameDivisionY": 0,
												"emitType": "Burst",
												"instWorldSpeed_rand": [
													0,
													0,
													0
												],
												"burstDelay": 0.32,
												"seedGroup": 1,
												"warmUpTime": -0.1,
												"useRandomColor": true,
												"lifeTimeRand": 2,
												"burstCount": 25,
												"emitDuration": 2.5
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
																	"emissive": 0.5
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
														},
														{
															"type": "shader",
															"name": "EnvColorMult",
															"source": "shaders/EnvColorMult.hx",
															"props": {
																"sandBlend": 0.1,
																"sandColorSet": false,
																"envBlend": 0.3,
																"envColorSet": false
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
												"lifeTime": 0.25,
												"frameDivisionY": 0,
												"animationSpeed": 0,
												"instScale": 1.4,
												"emitType": "Burst",
												"burstDelay": 0.15,
												"instScale_rand": 0.5,
												"frameDivisionX": 0,
												"alignMode": "Screen",
												"instRotation_rand": [
													0,
													0,
													6
												],
												"lifeTimeRand": 0.08,
												"useRandomColor": true,
												"randomColor1": [
													0.8431372549019608,
													0.8588235294117647,
													0.9137254901960784,
													1
												],
												"randomColor2": [
													0.8117647058823529,
													0.8941176470588235,
													0.8901960784313725,
													1
												],
												"instRotation": [
													0,
													0,
													170
												],
												"emitOrientation": "Normal",
												"speedFactor": 1.5,
												"burstCount": 25,
												"emitDuration": 2.5
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
										},
										{
											"type": "emitter",
											"name": "FlareBlack",
											"props": {
												"emitRate": 1,
												"lifeTime": 0.25,
												"frameDivisionY": 0,
												"animationSpeed": 0,
												"instScale": 0.6,
												"emitType": "Burst",
												"burstDelay": 0.15,
												"instScale_rand": 0.1,
												"frameDivisionX": 0,
												"alignMode": "Screen",
												"instRotation_rand": [
													0,
													0,
													6
												],
												"lifeTimeRand": 0.08,
												"useRandomColor": true,
												"randomColor1": [
													0.8431372549019608,
													0.8588235294117647,
													0.9137254901960784,
													1
												],
												"randomColor2": [
													0.8117647058823529,
													0.8941176470588235,
													0.8901960784313725,
													1
												],
												"instRotation": [
													0,
													0,
													190
												],
												"emitOrientation": "Normal",
												"speedFactor": 1.5,
												"burstCount": 25,
												"seedGroup": 1,
												"emitDuration": 2.5
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
																	"colorMask": 255
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
																"texture": "Fx/Gradients/circGrad02.jpg",
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
																			"time": 0.5,
																			"value": 0.9618218800909709,
																			"mode": 0
																		},
																		{
																			"time": 0.51,
																			"value": 0,
																			"mode": 0
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
																	"enabled": false,
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
									"type": "emitter",
									"name": "Distort",
									"props": {
										"instScale_rand": 0,
										"maxCount": 50,
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
										"instRotation_rand": [
											0,
											0,
											0
										],
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
										"lifeTime": 2.5,
										"emitType": "Burst",
										"burstDelay": 0.15,
										"instScale": 120,
										"emitShape": "Cylinder",
										"emitSurface": true,
										"animationLoop": false,
										"instRotation": [
											-10,
											0,
											0
										]
									},
									"scaleX": 0.1,
									"scaleY": 0.1,
									"rotationZ": 90,
									"children": [
										{
											"type": "model",
											"name": "Ring",
											"source": "Fx/Meshes_Common/Disk_StraightUVs.fbx",
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"rotationX": 90,
											"rotationY": 90,
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
														"texture": "Fx/Gradients/circGrad01.png"
													}
												},
												{
													"type": "shader",
													"name": "DistortionMap",
													"source": "shaders/DistortionMap.hx",
													"props": {
														"distortionDir": "Fx/DistortionMaps/waveNormal02.jpg",
														"intensity": 0.003
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "UVTransform",
													"source": "shaders/UVTransform.hx",
													"props": {
														"scaleX": 0.75,
														"scaleY": 0.75,
														"shiftX": 0,
														"shiftY": 0,
														"shiftSpeedX": 0,
														"shiftSpeedY": 1
													},
													"isInstance": true
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
											"name": "instScale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.009999999999999995,
													"value": -0.02419093677588713,
													"mode": 0,
													"prevHandle": {
														"dv": -1.570962778644659,
														"dt": -6.582209931760484e-17
													},
													"nextHandle": {
														"dv": 1.1837501327803475,
														"dt": 0
													}
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.006110104718118903,
														"dt": -0.815
													},
													"nextHandle": {
														"dv": -0.006110104718118903,
														"dt": 0.815
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
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Shot",
					"target": "FXAnimation.FXRoot.Character.Female01_FreeCompany.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Weapon"
				}
			]
		}
	]
}