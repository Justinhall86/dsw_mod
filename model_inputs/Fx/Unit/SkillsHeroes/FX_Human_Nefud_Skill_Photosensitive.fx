{
	"type": "fx",
	"duration": 3,
	"cullingRadius": 15,
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
			"scaleX": 2.2,
			"scaleY": 2.2,
			"scaleZ": 2.2,
			"children": [
				{
					"type": "object",
					"name": "NEFUD",
					"x": 0.44370568181818176,
					"y": 0.03216431818181819,
					"z": 0.1466197727272727,
					"children": [
						{
							"type": "object",
							"name": "Nefud",
							"editorOnly": true,
							"x": -0.4437056818181817,
							"y": -0.03216431818181819,
							"z": -0.1466197727272727,
							"children": [
								{
									"type": "model",
									"name": "Male01_HarkonnenNefud",
									"source": "Character/Harkonnen/Unit/Nefud/Male01_HarkonnenNefud.fbx",
									"children": [
										{
											"type": "animEvent",
											"name": "animEvent",
											"animation": "Anim/Male01/Nefud/Anim_Male01_Nefud_Skill.fbx"
										}
									]
								},
								{
									"type": "model",
									"name": "NefudMace",
									"source": "Character/Harkonnen/Weapon/NefudMace.fbx",
									"y": 0.16031,
									"rotationX": -90
								},
								{
									"type": "model",
									"name": "NefudShield",
									"source": "Character/Harkonnen/Weapon/NefudShield.fbx",
									"rotationX": -90
								},
								{
									"type": "constraint",
									"name": "constraint",
									"object": "FXAnimation.FXRoot.Nefud.NefudMace",
									"target": "FXAnimation.FXRoot.Nefud.Male01_HarkonnenNefud.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Weapon"
								},
								{
									"type": "constraint",
									"name": "constraint",
									"object": "FXAnimation.FXRoot.Nefud.NefudShield",
									"target": "FXAnimation.FXRoot.Nefud.Male01_HarkonnenNefud.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_lClavicleJ.B_lShoulderJ.B_lElbowJ.B_lWristJ.B_Shield"
								}
							]
						},
						{
							"type": "lookAt",
							"name": "lookAtUP",
							"x": 0.6345743181818182,
							"y": 0.05564568181818181,
							"z": -0.1466197727272727,
							"scaleY": 3.5,
							"scaleZ": 1.5,
							"rotationZ": -9.99983099586397,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								1
							],
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 0.3751215045642074,
									"scaleY": 15,
									"scaleZ": 0.7499392354141005,
									"rotationX": 90,
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
													"emissive": 10,
													"drawOrder": "100"
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
												"texture": "Fx/Alphas/T_Flare06_512.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0.5237465553610555,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.6370914683416937,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.3750894314335393,
															"value": 0,
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
												}
											]
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 15,
												"power": 0.8
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.7529411764705882,
													0.27058823529411763,
													0.16078431372549018
												]
											}
										},
										{
											"type": "curve",
											"name": "scale.z",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.5404856216433235,
													"value": 0.25,
													"prevHandle": {
														"dv": 0.002404241294978398,
														"dt": -0.015494497741857334
													},
													"nextHandle": {
														"dv": -0.01414688773777184,
														"dt": 0.1249143940058296
													}
												},
												{
													"time": 0.6639991735109443,
													"value": 1.75,
													"mode": 2
												}
											]
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.72,
												"ATTENUATE": true,
												"emissiveMap": null
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Skill",
							"x": 0.25283704545454566,
							"y": 0.008682954545454542,
							"z": 0.4398593181818181,
							"children": [
								{
									"type": "object",
									"name": "Step",
									"x": 0.7261872727272723,
									"y": 0.2638927272727272,
									"z": -0.48961909090909056,
									"scaleX": 0.9999999999999998,
									"scaleY": 0.9999999999999998,
									"scaleZ": 0.9999999999999998,
									"children": [
										{
											"type": "emitter",
											"name": "SandProjectionMesh",
											"props": {
												"enableSort": false,
												"emitSurface": true,
												"frameCount": 2,
												"frameDivisionY": 2,
												"animationSpeed": 0,
												"instStretch": [
													2,
													2,
													1.3
												],
												"lifeTime": 0.35,
												"lifeTimeRand": 0.1,
												"warmUpTime": -0.5,
												"emitType": "Burst",
												"instStretch_rand": [
													0.1,
													0.1,
													0.3
												],
												"instScale": 8,
												"instScale_rand": 0.1,
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
													360
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
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"children": [
												{
													"type": "model",
													"name": "CylinderCone_StraightUV",
													"source": "Fx/Meshes_Common/CylinderCone_StraightUV_01_larger.fbx",
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
																	"emissive": 5
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
																"uScale": 7,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_FlatFlash.png"
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
																"progress": 1,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 5,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/vGrad_inv.jpg",
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
																			"value": 0.5,
																			"mode": 1,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.16666666666666666
																			}
																		},
																		{
																			"time": 0.9964190873914609,
																			"value": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.16666666666666666
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.16666666666666666
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
																"progress": 1,
																"saturation": 1,
																"width": 0.77,
																"uvScaleX": 2,
																"uvScaleY": 0.25,
																"texture": "Fx/noise/clouds.png",
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
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.1595451461401853,
																			"value": 0.5,
																			"mode": 1
																		},
																		{
																			"time": 0.1595451461401853,
																			"value": 0.5,
																			"mode": 1,
																			"prevHandle": {
																				"dv": -0.23923913632747057,
																				"dt": -0.14321733235582138
																			},
																			"nextHandle": {
																				"dv": 0.023114784558614043,
																				"dt": 0.08500000000000008
																			}
																		},
																		{
																			"time": 1,
																			"value": 0
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.28015161795327154
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.28015161795327154
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
																	0.7529411764705882,
																	0.27058823529411763,
																	0.16078431372549018
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "amount",
																	"keys": [
																		{
																			"time": 0.8644284090909091,
																			"value": 0.9,
																			"mode": 2
																		},
																		{
																			"time": 0.9444284090909091,
																			"value": 0.2,
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
													"name": "instStretch.z",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.6,
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
													"name": "instScale",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.3136958552692092,
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
											"name": "Hit",
											"props": {
												"emitType": "Burst",
												"instScale_rand": 0,
												"instRotation_rand": [
													0,
													0,
													180
												],
												"warmUpTime": 0.5,
												"lifeTime": 1.5,
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
																	"blend": "Alpha",
																	"shadows": false,
																	"culling": "None",
																	"depthTest": "LessEqual",
																	"colorMask": 15,
																	"enableStencil": false,
																	"alphaKill": false,
																	"parallax": 0,
																	"textureWrap": true,
																	"emissive": 5,
																	"drawOrder": "120"
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
																"texture": "Fx/Alphas/T_FlatImpact.png"
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
																			"time": 0.61,
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
																			"time": 0.7050000000000001,
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
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.7529411764705882,
																	0.27058823529411763,
																	0.16078431372549018
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "amount",
																	"keys": [
																		{
																			"time": 0.8644284090909091,
																			"value": 0.9,
																			"mode": 2
																		},
																		{
																			"time": 0.9444284090909091,
																			"value": 0.2,
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
															"time": 1,
															"value": 1,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "model",
											"name": "Knee",
											"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
											"x": -0.43112,
											"y": -0.06794,
											"z": 1.9819,
											"scaleX": 0.5,
											"scaleY": 0.63,
											"scaleZ": 1.4,
											"rotationX": 2.9,
											"rotationY": 157.9,
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
															"emissive": 2
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
														"alpha": 3.56,
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
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.39231237815798403,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.5517285018979307,
																	"value": 2,
																	"mode": 2
																},
																{
																	"time": 0.6845752716812201,
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
															0.5098039215686274,
															0.8117647058823529,
															1
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keys": [
																{
																	"time": 0.007974160185266754,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.94717023317423,
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
														"progress": 0.4,
														"saturation": 1,
														"width": 0.11,
														"uvScaleX": 0.14,
														"uvScaleY": 0.28,
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
																	"time": 0.3790277011796558,
																	"value": 0.06666666666666667,
																	"prevHandle": {
																		"dv": -0.808452083454443,
																		"dt": -0.48507125007266594
																	},
																	"nextHandle": {
																		"dv": 0.13333333333333336,
																		"dt": 0.08000000000000007
																	}
																},
																{
																	"time": 0.5418253020441062,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.8503682554943017,
																	"value": 1.3
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
														"width": 0.11,
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
																	"time": 0.5716555173654243,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.8772030878669894,
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
														"range": 15.15,
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
														"uvScaleY": 2,
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
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.7529411764705882,
															0.27058823529411763,
															0.16078431372549018
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keys": [
																{
																	"time": 0.8858752971070736,
																	"value": 0.9,
																	"mode": 2
																},
																{
																	"time": 0.9658752971070735,
																	"value": 0.2,
																	"mode": 2
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
												"amount": 0.71,
												"ATTENUATE": true,
												"emissiveMap": null
											}
										}
									]
								},
								{
									"type": "object",
									"name": "FlashDecals",
									"enabled": false,
									"x": 0.6663067046303967,
									"y": 0.05341389670632103,
									"z": 0.33528604211148294,
									"scaleX": 0.9,
									"scaleY": 0.9,
									"scaleZ": 0.9,
									"children": [
										{
											"type": "advancedDecal",
											"name": "advancedDecal_Black",
											"x": -0.62428,
											"z": 0.33459,
											"scaleX": 3,
											"scaleY": 3.5,
											"scaleZ": 2,
											"rotationY": 90,
											"albedoMap": "Fx/Gradients/circGrad05.jpg",
											"emissive": 1,
											"renderMode": "BeforeTonemapping",
											"children": [
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 5
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keys": [
																{
																	"time": 0.4579379496801437,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.4779364804001308,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.5197224323298366,
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
													}
												}
											]
										},
										{
											"type": "advancedDecal",
											"name": "advancedDecal_Red",
											"x": -0.16694,
											"z": 0.54481,
											"scaleX": 3.5,
											"scaleY": 3.5,
											"scaleZ": 2.6,
											"rotationY": 90,
											"albedoMap": "Fx/Gradients/circGrad05.jpg",
											"fadePower": 3,
											"emissive": 2,
											"renderMode": "BeforeTonemapping",
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
															"colorMask": 255,
															"emissive": 2
														}
													}
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
															"keys": [
																{
																	"time": 0.5180297067777901,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.549877316362102,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.27040920342591,
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
														"sandBlend": 0.5,
														"sandColorSet": false,
														"envBlend": 0.6,
														"envColorSet": false
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
															0.2588235294117647,
															0
														]
													}
												}
											]
										},
										{
											"type": "advancedDecal",
											"name": "advancedDecal_Slide",
											"x": -0.19809,
											"z": 0.54481,
											"scaleX": 3.5,
											"scaleY": 3.5,
											"scaleZ": 2.6,
											"rotationX": -90,
											"rotationZ": -90,
											"albedoMap": "Fx/Gradients/circGrad05.jpg",
											"fadePower": 3,
											"emissive": 6,
											"renderMode": "BeforeTonemapping",
											"blendMode": 2,
											"children": [
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 2
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keys": [
																{
																	"time": 0.5724323937478997,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.604280003332212,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.0262490598019203,
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
														"sandBlend": 0.5,
														"sandColorSet": false,
														"envBlend": 0.6,
														"envColorSet": false
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap-Slide",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.32,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl16u_A.png",
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
															"name": "uvShift.y",
															"keyMode": 1,
															"keys": [
																{
																	"time": 0.5072858262248421,
																	"value": 0.22450165968855162,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.013817089154406714,
																		"dt": -0.47960471243924907
																	},
																	"nextHandle": {
																		"dv": 0.036641438534831205,
																		"dt": 0.21394131780378267
																	}
																},
																{
																	"time": 1.0245065945416785,
																	"value": 1.188780934119911,
																	"prevHandle": {
																		"dv": -0.006177529446548258,
																		"dt": -0.22334533177317972
																	},
																	"nextHandle": {
																		"dv": 0.006177529446548258,
																		"dt": 0.22334533177317972
																	}
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "advancedDecal",
											"name": "advancedDecal_White",
											"x": -0.29235,
											"z": 0.54481,
											"scaleX": 3.5,
											"scaleY": 3.5,
											"scaleZ": 2.6,
											"rotationY": 89.99999999999999,
											"albedoMap": "Fx/Gradients/circGrad05.jpg",
											"fadePower": 3,
											"emissive": 2,
											"renderMode": "BeforeTonemapping",
											"blendMode": 2,
											"children": [
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 2
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.5174810120397054,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.5493286216240173,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.697110112378903,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08163119444600841
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08163119444600841
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
														"sandBlend": 0.5,
														"sandColorSet": false,
														"envBlend": 0.6,
														"envColorSet": false
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.996078431372549,
															0.9019607843137255,
															0.8352941176470589
														]
													}
												}
											]
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.55,
												"ATTENUATE": true,
												"emissiveMap": null
											}
										}
									]
								},
								{
									"type": "object",
									"name": "flare",
									"enabled": false,
									"x": 0.78983,
									"y": 0.23887,
									"z": -0.30312,
									"scaleX": 0.49999999999999994,
									"scaleY": 0.49999999999999994,
									"scaleZ": 0.49999999999999994,
									"children": [
										{
											"type": "emitter",
											"name": "emitter_FlareBlack",
											"props": {
												"lifeTime": 0.35,
												"alignMode": "Screen",
												"alignLockAxis": "Z",
												"burstDelay": 0.5,
												"instScale": 1.5,
												"instStretch": [
													15,
													8,
													1
												],
												"instRotation_rand": [
													0,
													0,
													0
												],
												"instStretch_rand": [
													0,
													0,
													0
												],
												"instScale_rand": 0,
												"useRandomColor": true,
												"randomColor1": [
													0.48627450980392156,
													0.48627450980392156,
													0.48627450980392156,
													1
												],
												"emitType": "Burst",
												"warmUpTime": -0.5,
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
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"rotationX": 45,
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
																	"emissive": 5
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
																"texture": "Fx/Alphas/T_Flare06_512.png"
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
																	0.29411764705882354,
																	0.15294117647058825
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
															"value": 1,
															"prevHandle": {
																"dv": 1.2334981930436706,
																"dt": -0.4276798037244547
															},
															"nextHandle": {
																"dv": -0.7166666666666667,
																"dt": 0.24848342791614272
															}
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5240317437099238
															},
															"nextHandle": {
																"dv": -3.8880269028916045e-16,
																"dt": 0.3333333333333333
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
															"value": 1,
															"prevHandle": {
																"dv": 1.2334981930436706,
																"dt": -0.4276798037244547
															},
															"nextHandle": {
																"dv": -0.7166666666666667,
																"dt": 0.24848342791614272
															}
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5240317437099238
															},
															"nextHandle": {
																"dv": -3.8880269028916045e-16,
																"dt": 0.3333333333333333
															}
														}
													]
												}
											]
										},
										{
											"type": "emitter",
											"name": "emitter_Flare",
											"props": {
												"lifeTime": 0.2,
												"alignMode": "Screen",
												"alignLockAxis": "Z",
												"burstDelay": 0.45,
												"instStretch": [
													12,
													4,
													1
												],
												"instRotation_rand": [
													0,
													0,
													0
												],
												"instStretch_rand": [
													0,
													0,
													0
												],
												"instScale_rand": 0,
												"useRandomColor": true,
												"randomColor1": [
													0.48627450980392156,
													0.48627450980392156,
													0.48627450980392156,
													1
												],
												"warmUpTime": -0.55,
												"emitType": "Burst",
												"instScale": 1.25,
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
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"rotationX": 45,
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
																	"emissive": 6,
																	"drawOrder": "100"
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
																"texture": "Fx/Alphas/T_Flare06_512.png"
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
																			"prevHandle": {
																				"dv": 0.06196351517869349,
																				"dt": -0.49990757001492336
																			},
																			"nextHandle": {
																				"dv": -0.01666666666666672,
																				"dt": 0.13446288206139395
																			}
																		},
																		{
																			"time": 0.18100772585187647,
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
													"type": "curve",
													"name": "instScale",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"prevHandle": {
																"dv": 1.2334981930436706,
																"dt": -0.4276798037244547
															},
															"nextHandle": {
																"dv": -0.7166666666666667,
																"dt": 0.24848342791614272
															}
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5240317437099238
															},
															"nextHandle": {
																"dv": -3.8880269028916045e-16,
																"dt": 0.3333333333333333
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
															"value": 1,
															"prevHandle": {
																"dv": 1.2334981930436706,
																"dt": -0.4276798037244547
															},
															"nextHandle": {
																"dv": -0.7166666666666667,
																"dt": 0.24848342791614272
															}
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5240317437099238
															},
															"nextHandle": {
																"dv": -3.8880269028916045e-16,
																"dt": 0.3333333333333333
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
												"amount": 0.7,
												"ATTENUATE": true,
												"emissiveMap": null
											}
										}
									]
								},
								{
									"type": "object",
									"name": "ShieldOK",
									"enabled": false,
									"x": 0.39996,
									"y": 0.06947,
									"z": 1.28198,
									"scaleX": 1.2499999999999996,
									"scaleY": 1.2499999999999996,
									"scaleZ": 1.2499999999999996,
									"children": [
										{
											"type": "model",
											"name": "Sphere_Slide",
											"source": "Fx/Meshes_Common/Sphere.fbx",
											"z": -0.31137,
											"scaleX": 2,
											"scaleY": 2,
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
															"culling": "Back",
															"colorMask": 255,
															"emissive": 30
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.42,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/Alphas/T_SpiceAlpha.png",
														"uvShift": [
															0.2,
															0.5
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
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.27,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/Gradients/vGrad.png",
														"uvShift": [
															0.2,
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
													"name": "DissolveMap-Slide",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.32,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 0.5,
														"texture": "Fx/Gradients/Cyl16u_A.png",
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
															"name": "uvShift.y",
															"enabled": false,
															"keyMode": 1,
															"keys": [
																{
																	"time": 0.41377661465346993,
																	"value": 0.6388276730851642,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.013817089154406714,
																		"dt": -0.47960471243924907
																	},
																	"nextHandle": {
																		"dv": 0.036641438534831205,
																		"dt": 0.21394131780378267
																	}
																},
																{
																	"time": 0.9309973829703071,
																	"value": 1.188780934119911,
																	"prevHandle": {
																		"dv": -0.006177529446548258,
																		"dt": -0.22334533177317972
																	},
																	"nextHandle": {
																		"dv": 0.006177529446548258,
																		"dt": 0.22334533177317972
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "uvShift.y",
															"keyMode": 1,
															"keys": [
																{
																	"time": 0.4817394292532641,
																	"value": 0.6388,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.013817089154406714,
																		"dt": -0.47960471243924907
																	},
																	"nextHandle": {
																		"dv": 0.036641438534831205,
																		"dt": 0.21394131780378267
																	}
																},
																{
																	"time": 0.9989601975701012,
																	"value": 1.188780934119911,
																	"prevHandle": {
																		"dv": -0.006177529446548258,
																		"dt": -0.22334533177317972
																	},
																	"nextHandle": {
																		"dv": 0.006177529446548258,
																		"dt": 0.22334533177317972
																	}
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "DissolveMap-Pattern",
													"source": "shaders/DissolveMap.hx",
													"enabled": false,
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.94,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/Hextile_hex02-Both.png",
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
													"name": "Fresnel",
													"source": "shaders/Fresnel.hx",
													"props": {
														"RGB": false,
														"ALPHA": true,
														"REVERSE": false,
														"bias": 0,
														"scale": 1,
														"power": 1,
														"color": [
															1,
															0,
															0
														]
													}
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.42490849614917525,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.10913754046752937
																	}
																},
																{
																	"time": 0.6700359953195392,
																	"value": 1.0240771124078043,
																	"mode": 2
																},
																{
																	"time": 0.9356993899550056,
																	"value": 0,
																	"prevHandle": {
																		"dv": -0.017222222222223582,
																		"dt": -0.1692722514491467
																	},
																	"nextHandle": {
																		"dv": 0.0067485114873715125,
																		"dt": 0.06582174954353627
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "alpha",
															"keys": [
																{
																	"time": 0.5468859967763213,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.5787336063606338,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.000702662830343,
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
															0.8352941176470589,
															0.19607843137254902,
															0.050980392156862744
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"enabled": false,
															"keys": [
																{
																	"time": 0.8644284090909091,
																	"value": 0.9,
																	"mode": 2
																},
																{
																	"time": 0.9444284090909091,
																	"value": 0.2,
																	"mode": 2
																}
															]
														}
													]
												},
												{
													"type": "curve",
													"name": "rotation.z",
													"enabled": false,
													"keys": [
														{
															"time": 0.5957697820056113,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 1.4075119378918988,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "model",
											"name": "Sphere_Slide",
											"source": "Fx/Meshes_Common/CylinderStraight.fbx",
											"enabled": false,
											"z": -1.38543,
											"scaleX": 0.8,
											"scaleY": 0.8,
											"scaleZ": 1.2,
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.42,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/Alphas/T_SpiceAlpha.png",
														"uvShift": [
															0.2,
															0.5
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
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.27,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/Gradients/vGrad.png",
														"uvShift": [
															0.2,
															0.02
														],
														"uvShiftSpeed": [
															0,
															0
														]
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap-Slide",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.32,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 0.5,
														"texture": "Fx/Gradients/Cyl16u_A.png",
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
															"name": "uvShift.y",
															"enabled": false,
															"keyMode": 1,
															"keys": [
																{
																	"time": 0.41377661465346993,
																	"value": 0.6388276730851642,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.013817089154406714,
																		"dt": -0.47960471243924907
																	},
																	"nextHandle": {
																		"dv": 0.036641438534831205,
																		"dt": 0.21394131780378267
																	}
																},
																{
																	"time": 0.9309973829703071,
																	"value": 1.188780934119911,
																	"prevHandle": {
																		"dv": -0.006177529446548258,
																		"dt": -0.22334533177317972
																	},
																	"nextHandle": {
																		"dv": 0.006177529446548258,
																		"dt": 0.22334533177317972
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "uvShift.y",
															"keyMode": 1,
															"keys": [
																{
																	"time": 0.4817394292532641,
																	"value": 0.6388,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.013817089154406714,
																		"dt": -0.47960471243924907
																	},
																	"nextHandle": {
																		"dv": 0.036641438534831205,
																		"dt": 0.21394131780378267
																	}
																},
																{
																	"time": 0.9989601975701012,
																	"value": 1.188780934119911,
																	"prevHandle": {
																		"dv": -0.006177529446548258,
																		"dt": -0.22334533177317972
																	},
																	"nextHandle": {
																		"dv": 0.006177529446548258,
																		"dt": 0.22334533177317972
																	}
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "DissolveMap-Pattern",
													"source": "shaders/DissolveMap.hx",
													"enabled": false,
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.94,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/Hextile_hex02-Both.png",
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
													"name": "Fresnel",
													"source": "shaders/Fresnel.hx",
													"props": {
														"RGB": false,
														"ALPHA": true,
														"REVERSE": false,
														"bias": 0,
														"scale": 1,
														"power": 1,
														"color": [
															1,
															0,
															0
														]
													}
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.42490849614917525,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.10913754046752937
																	}
																},
																{
																	"time": 0.6700359953195392,
																	"value": 1.0240771124078043,
																	"mode": 2
																},
																{
																	"time": 0.9356993899550056,
																	"value": 0,
																	"prevHandle": {
																		"dv": -0.017222222222223582,
																		"dt": -0.1692722514491467
																	},
																	"nextHandle": {
																		"dv": 0.0067485114873715125,
																		"dt": 0.06582174954353627
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "alpha",
															"keys": [
																{
																	"time": 0.5468859967763213,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.5787336063606338,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.000702662830343,
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
															0.8352941176470589,
															0.19607843137254902,
															0.050980392156862744
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"enabled": false,
															"keys": [
																{
																	"time": 0.8644284090909091,
																	"value": 0.9,
																	"mode": 2
																},
																{
																	"time": 0.9444284090909091,
																	"value": 0.2,
																	"mode": 2
																}
															]
														}
													]
												},
												{
													"type": "curve",
													"name": "rotation.z",
													"enabled": false,
													"keys": [
														{
															"time": 0.5957697820056113,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 1.4075119378918988,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "model",
											"name": "Sphere_Slide",
											"source": "Fx/Meshes_Common/Sphere.fbx",
											"enabled": false,
											"z": -0.31137,
											"scaleX": 3,
											"scaleY": 3,
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
															"culling": "Back",
															"colorMask": 255,
															"emissive": 20
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.42,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/Alphas/T_SpiceAlpha.png",
														"uvShift": [
															0.2,
															0.5
														],
														"uvShiftSpeed": [
															0,
															0
														]
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap-Slide",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.32,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 0.5,
														"texture": "Fx/Gradients/Cyl16u_A.png",
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
															"name": "uvShift.y",
															"keyMode": 1,
															"keys": [
																{
																	"time": 0.41377661465346993,
																	"value": 0.6388276730851642,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.013817089154406714,
																		"dt": -0.47960471243924907
																	},
																	"nextHandle": {
																		"dv": 0.036641438534831205,
																		"dt": 0.21394131780378267
																	}
																},
																{
																	"time": 0.9309973829703071,
																	"value": 1.188780934119911,
																	"prevHandle": {
																		"dv": -0.006177529446548258,
																		"dt": -0.22334533177317972
																	},
																	"nextHandle": {
																		"dv": 0.006177529446548258,
																		"dt": 0.22334533177317972
																	}
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "DissolveMap-Pattern",
													"source": "shaders/DissolveMap.hx",
													"enabled": false,
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.94,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/Hextile_hex02-Both.png",
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
													"name": "Fresnel",
													"source": "shaders/Fresnel.hx",
													"props": {
														"RGB": false,
														"ALPHA": true,
														"REVERSE": false,
														"bias": 0,
														"scale": 1,
														"power": 1,
														"color": [
															1,
															0,
															0
														]
													}
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.42490849614917525,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.10913754046752937
																	}
																},
																{
																	"time": 0.6700359953195392,
																	"value": 1.0240771124078043,
																	"mode": 2
																},
																{
																	"time": 0.9356993899550056,
																	"value": 0,
																	"prevHandle": {
																		"dv": -0.017222222222223582,
																		"dt": -0.1692722514491467
																	},
																	"nextHandle": {
																		"dv": 0.0067485114873715125,
																		"dt": 0.06582174954353627
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
															0.8352941176470589,
															0.19607843137254902,
															0.050980392156862744
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keys": [
																{
																	"time": 0.8644284090909091,
																	"value": 0.9,
																	"mode": 2
																},
																{
																	"time": 0.9444284090909091,
																	"value": 0.2,
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
											"name": "Sphere_shieldpart",
											"source": "Fx/Meshes_Common/Sphere.fbx",
											"enabled": false,
											"z": -0.31137,
											"scaleX": 2.5,
											"scaleY": 2.5,
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
															"culling": "Back",
															"colorMask": 255,
															"emissive": 1.1
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.42,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/Alphas/T_SpiceAlpha.png",
														"uvShift": [
															0.2,
															0.5
														],
														"uvShiftSpeed": [
															0,
															0
														]
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap-Pattern",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.24,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/EcazPattern02.png",
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
													"name": "EnvColorMult",
													"source": "shaders/EnvColorMult.hx",
													"props": {
														"sandBlend": 0.6,
														"sandColorSet": false,
														"envBlend": 0.4,
														"envColorSet": false
													}
												},
												{
													"type": "shader",
													"name": "Fresnel",
													"source": "shaders/Fresnel.hx",
													"props": {
														"RGB": false,
														"ALPHA": true,
														"REVERSE": false,
														"bias": 0,
														"scale": 1,
														"power": 1,
														"color": [
															1,
															0,
															0
														]
													}
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.5472544130291934,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.10913754046752937
																	}
																},
																{
																	"time": 0.6539659728241951,
																	"value": 1.0240771124078043,
																	"mode": 2
																},
																{
																	"time": 1.0693969212298073,
																	"value": 0,
																	"prevHandle": {
																		"dv": -0.017222222222223582,
																		"dt": -0.39945283500539863
																	},
																	"nextHandle": {
																		"dv": 0.002860912163282381,
																		"dt": 0.06584847044374452
																	}
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
															"time": 0.47069946898572657,
															"value": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.014545454545454528
															}
														},
														{
															"time": 0.9401752491314472,
															"value": 1.4,
															"prevHandle": {
																"dv": 0,
																"dt": -0.07920085175008922
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.07920085175008922
															}
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
															1,
															1
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"enabled": false,
															"keys": [
																{
																	"time": 0.7301407875044508,
																	"value": 0.9,
																	"mode": 2
																},
																{
																	"time": 0.8101407875044507,
																	"value": 0.2,
																	"mode": 2
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
												"amount": 0.7,
												"ATTENUATE": true,
												"emissiveMap": null
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "SPIRALES",
							"x": 0.67259,
							"y": -0.03216,
							"z": -0.14662,
							"scaleX": 0.8,
							"scaleY": 0.8,
							"scaleZ": 0.8,
							"children": [
								{
									"type": "emitter",
									"name": "Particles",
									"props": {
										"emitType": "Burst",
										"lifeTimeRand": 0.5,
										"burstParticleCount": 15,
										"emitSurface": true,
										"alignMode": "Screen",
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"animationSpeed": 0,
										"instSpeed": [
											0,
											0,
											25
										],
										"instSpeed_rand": [
											0,
											0,
											15
										],
										"instAcceleration_rand": [
											0,
											0,
											0
										],
										"instScale_rand": 0.12,
										"spriteSheet": "Fx/Alphas/T_Sparks_4x4.jpg",
										"lifeTime": 0.9,
										"emitShape": "Cylinder",
										"emitRad2": 0.55,
										"instRotation_rand": [
											0,
											0,
											360
										],
										"emitAngle": 360,
										"warmUpTime": -0.52,
										"useRandomColor": true,
										"randomColor1": [
											1,
											0.28627450980392155,
											0.28627450980392155,
											1
										],
										"randomColor2": [
											1,
											0.9019607843137255,
											0.7843137254901961,
											1
										],
										"instScale": 0.9,
										"instOrbitSpeed": [
											0,
											0,
											0.2
										],
										"instOrbitSpeed_rand": [
											0,
											0,
											0.1
										],
										"seedGroup": 1,
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
									"z": -0.26559,
									"scaleX": 3,
									"scaleY": 3,
									"scaleZ": 0.25,
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
															"emissive": 10
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
													},
													"children": [
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.065,
																	"value": 1,
																	"prevHandle": {
																		"dv": 0.11089160652646488,
																		"dt": -0.015692208470726162
																	},
																	"nextHandle": {
																		"dv": -0.8833333333333333,
																		"dt": 0.12500000000000003
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"prevHandle": {
																		"dv": -0.01666666666666672,
																		"dt": -0.8384636488340191
																	},
																	"nextHandle": {
																		"dv": 0.006154423696995358,
																		"dt": 0.30991955512506614
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
														"envBlend": 0.7,
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
													"value": 1,
													"mode": 2
												},
												{
													"time": 1,
													"value": 0,
													"prevHandle": {
														"dv": -0.06666666666666667,
														"dt": -0.56
													},
													"nextHandle": {
														"dv": 0.03967621425974007,
														"dt": 0.3332801997818148
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
													"mode": 2
												},
												{
													"time": 1,
													"value": 0,
													"prevHandle": {
														"dv": 0.013194444444444398,
														"dt": -0.8841852909175679
													},
													"nextHandle": {
														"dv": -0.006407488794313876,
														"dt": 0.33335250704975594
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
														"dv": 2.844272778839864,
														"dt": -0.2607250047269874
													},
													"nextHandle": {
														"dv": -1.2,
														"dt": 0.11
													}
												},
												{
													"time": 1,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.835
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
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.85,
										"ATTENUATE": true,
										"emissiveMap": null
									}
								}
							]
						},
						{
							"type": "object",
							"name": "Passive",
							"enabled": false,
							"y": 0.1,
							"scaleX": 0.9,
							"scaleY": 0.9,
							"scaleZ": 0.9,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt",
									"x": 0.05628,
									"y": 0.00233,
									"scaleX": 0.9999999999999998,
									"scaleY": 0.9999999999999999,
									"scaleZ": 0.9999999999999999,
									"rotationY": -38.3155323490468,
									"rotationZ": 42.31532939996876,
									"lockAxis": [
										0,
										0,
										0
									],
									"children": [
										{
											"type": "polygon",
											"name": "WhiteFlames",
											"z": 0.25,
											"scaleX": 1.5,
											"scaleY": 1.5,
											"scaleZ": 1.5,
											"rotationX": -90,
											"rotationZ": -90,
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
															"emissive": 10,
															"drawOrder": "100"
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
														"texture": "Fx/Alphas/FireMask03.png"
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.25,
														"saturation": 0.75,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/FireMask05.png",
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
															"enabled": false,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.1701327223836298,
																	"value": 0.25,
																	"prevHandle": {
																		"dv": 0.26643086747757283,
																		"dt": -0.07011519803730601
																	},
																	"nextHandle": {
																		"dv": -0.26643086747757283,
																		"dt": 0.07011519803730601
																	}
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "UVDistortion",
													"source": "shaders/UVDistortion.hx",
													"props": {
														"noiseTexture": "Fx/noise/T_Fire.png",
														"directionalNoise": false,
														"intensity": 0.3,
														"scrollSpeed": [
															0,
															1
														],
														"scale": [
															1.25,
															1
														]
													}
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 1.2,
														"power": 0.8
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.8352941176470589,
															0.14509803921568626,
															0.050980392156862744
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "BlackFlames",
											"x": -0.00322,
											"y": -0.01796,
											"z": 0.4886,
											"scaleX": 1.25,
											"scaleY": 1.25,
											"scaleZ": 1.25,
											"rotationX": -90,
											"rotationZ": -90,
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
															"drawOrder": "110"
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
														"alpha": 5,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/FireMask04.png"
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.2,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl05v_A_Tapered.png",
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
														"progress": 0.45,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/Water_03.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															1
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"enabled": false,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.1701327223836298,
																	"value": 0.45,
																	"prevHandle": {
																		"dv": 0.26643086747757283,
																		"dt": -0.07011519803730601
																	},
																	"nextHandle": {
																		"dv": -0.26643086747757283,
																		"dt": 0.07011519803730601
																	}
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "UVDistortion",
													"source": "shaders/UVDistortion.hx",
													"props": {
														"noiseTexture": "Fx/noise/T_Fire.png",
														"directionalNoise": false,
														"intensity": 0.3,
														"scrollSpeed": [
															0,
															1
														],
														"scale": [
															1.25,
															1
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
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "BlackFlamesSmall",
											"x": -0.0083,
											"y": -0.07982,
											"z": 0.22997,
											"scaleY": 1.2,
											"scaleZ": 0.94,
											"rotationX": -90,
											"rotationZ": -90,
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
														"onDecal": false,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 5,
														"uScale": 2,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/FireMask04.png"
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.36,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 2,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl05v_A_Tapered.png",
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
														"useScale": true,
														"wrap": true,
														"progress": 0.5,
														"saturation": 1,
														"width": 0.49,
														"uvScaleX": 0.5,
														"uvScaleY": 1,
														"texture": "Fx/noise/Water_03.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															1
														]
													}
												},
												{
													"type": "shader",
													"name": "UVDistortion",
													"source": "shaders/UVDistortion.hx",
													"props": {
														"noiseTexture": "Fx/noise/T_Fire.png",
														"directionalNoise": false,
														"intensity": 0.3,
														"scrollSpeed": [
															0,
															1
														],
														"scale": [
															1.25,
															1
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
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 1,
											"keys": [
												{
													"time": 0.7729267379847091,
													"value": 0,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.056710907461209936
													}
												},
												{
													"time": 1.0368466386775577,
													"value": 1,
													"prevHandle": {
														"dv": 0.40844782039338057,
														"dt": -0.1405444228386507
													},
													"nextHandle": {
														"dv": -0.40844782039338057,
														"dt": 0.1405444228386507
													}
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_WhiteFlames",
									"x": -0.17259,
									"y": 0.01993,
									"z": 0.01374,
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
									"rotationX": 166.4,
									"rotationY": -7.6,
									"rotationZ": -84,
									"albedoMap": "Fx/Alphas/T_circle.png",
									"emissive": 2,
									"renderMode": "BeforeTonemapping",
									"children": [
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.6
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.7427903913665953,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.056710907461209936
															}
														},
														{
															"time": 1.0067102920594448,
															"value": 1,
															"prevHandle": {
																"dv": 0.40844782039338057,
																"dt": -0.1405444228386507
															},
															"nextHandle": {
																"dv": -0.40844782039338057,
																"dt": 0.1405444228386507
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
												"progress": 0.39,
												"saturation": 0.5,
												"width": 1,
												"uvScaleX": 1.5,
												"uvScaleY": 5,
												"texture": "Fx/noise/T_Fire.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													1,
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
													0.8352941176470589,
													0.14509803921568626,
													0.050980392156862744
												]
											}
										}
									]
								},
								{
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.8,
										"ATTENUATE": true,
										"emissiveMap": null
									}
								}
							]
						},
						{
							"type": "constraint",
							"name": "constraint",
							"enabled": false,
							"object": "FXAnimation.FXRoot.NEFUD.Passive",
							"target": "FXAnimation.FXRoot.NEFUD.Nefud.Male01_HarkonnenNefud.root.B_ROOTJ.B_Spine01J.B_Spine02J"
						}
					]
				}
			]
		}
	]
}