{
	"type": "fx",
	"duration": 3,
	"cullingRadius": 30,
	"blendFactor": 1,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"scaleX": 150,
			"scaleY": 150,
			"scaleZ": 150,
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
			"scaleX": 2,
			"scaleY": 2,
			"scaleZ": 2,
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
													"emissive": 30,
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
													"mode": 0,
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
												]
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
																	"emissive": 10
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
																			"mode": 0,
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
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
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
													"name": "instScale",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.3136958552692092,
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
												"lifeTime": 1.5
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
																	"emissive": 10,
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
															"emissive": 5
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
																	"mode": 0,
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
																	"value": 1.3,
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
																	"mode": 0,
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
																	"mode": 0,
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
												"warmUpTime": -0.5
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
															"mode": 0,
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
															"mode": 0,
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
															"mode": 0,
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
															"mode": 0,
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
												"instScale": 1.25
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
																			"mode": 0,
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
															"mode": 0,
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
															"mode": 0,
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
															"mode": 0,
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
															"mode": 0,
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
																	"mode": 0,
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
																	"mode": 0,
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
																	"mode": 0,
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
																	"mode": 0,
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
																	"mode": 0,
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
																	"mode": 0,
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
																	"mode": 0,
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
																	"mode": 0,
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
																	"mode": 0,
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
																	"mode": 0,
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
																	"mode": 0,
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
																	"mode": 0,
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
																	"mode": 0,
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
															"mode": 0,
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
															"mode": 0,
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
										"seedGroup": 1
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
															"emissive": 50
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
																	"mode": 0,
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
																	"mode": 0,
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
													"mode": 0,
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
													"mode": 0,
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
													"mode": 0,
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
													"mode": 0,
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
																	"mode": 0,
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
																	"mode": 0,
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
													"mode": 0,
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
															"mode": 0,
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
				},
				{
					"type": "object",
					"name": "Ally",
					"enabled": false,
					"x": 2.17921,
					"y": -1.8455375,
					"z": 0.2399825,
					"children": [
						{
							"type": "object",
							"name": "FlashDecals",
							"x": 2.316430000000001,
							"y": -1.8629625000000003,
							"z": 0.7199475,
							"scaleX": 0.7000000000000001,
							"scaleY": 0.7000000000000001,
							"scaleZ": 0.7000000000000001,
							"children": [
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
									"emissive": 4,
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
															"time": 0.9718463728318101,
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
															"time": 0.2923718629437606,
															"value": 1.189,
															"mode": 1,
															"prevHandle": {
																"dv": -0.013817089154406714,
																"dt": -0.47960471243924907
															},
															"nextHandle": {
																"dv": -0.009361516735674869,
																"dt": 0.21538497561544057
															}
														},
														{
															"time": 0.8095926312605989,
															"value": 0.2245,
															"mode": 0,
															"prevHandle": {
																"dv": 0.0972195863448159,
																"dt": -0.23531285026795024
															},
															"nextHandle": {
																"dv": -0.09436919662773625,
																"dt": 0.22230608309095284
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
															"time": 0.5345700741961202,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.5797278201898565,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.6248855661835926,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.06763285024154592,
																"dt": -0.032952949779212815
															},
															"nextHandle": {
																"dv": -0.1487347482720912,
																"dt": 0.07246846277703266
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
													0.9450980392156862,
													0.3058823529411765,
													0.16078431372549018
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keys": [
														{
															"time": 0.5791261583548705,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.6238136325331091,
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
							"type": "lookAt",
							"name": "lookAtDOWN",
							"x": 1.98097,
							"y": -1.88236,
							"z": -0.23998,
							"scaleX": 0.7500000000000001,
							"scaleY": 1.5000000000000002,
							"scaleZ": 1.5,
							"rotationZ": -3.636845535558253,
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
													"emissive": 30
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
													"enabled": false,
													"keys": [
														{
															"time": 0.4439958893019437,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.5573408022825815,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2953387653744293,
															"value": 0,
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
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0.4439958893019437,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.5573408022825815,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.9930927431144893,
															"value": 0,
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
												}
											]
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 12,
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
													"time": 0.4602092491607748,
													"value": 0.5,
													"mode": 0,
													"prevHandle": {
														"dv": -10.15619200616612,
														"dt": -0.25258960078446857
													},
													"nextHandle": {
														"dv": 1.0782508970964537,
														"dt": 0.02677310481625539
													}
												},
												{
													"time": 0.5471272353631567,
													"value": 2,
													"mode": 1,
													"prevHandle": {
														"dv": -0.6859430870012908,
														"dt": -0.07461635983805104
													},
													"nextHandle": {
														"dv": -0.6180235535074239,
														"dt": 0.0063056939880301865
													}
												},
												{
													"time": 0.614029746415166,
													"value": 0.5,
													"mode": 0,
													"prevHandle": {
														"dv": 1.9595362879724305e-17,
														"dt": -0.015493399073507545
													},
													"nextHandle": {
														"dv": -0.0028161802355345378,
														"dt": 0.016350542617711294
													}
												},
												{
													"time": 0.6609739062064581,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.003072196620583223,
														"dt": -0.018694540934144216
													},
													"nextHandle": {
														"dv": -1.2647555766655998e-15,
														"dt": 0.5
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "position.z",
											"keyMode": 1,
											"keys": [
												{
													"time": 0.46721400110706157,
													"value": 10,
													"mode": 0,
													"prevHandle": {
														"dv": 14.39636073134115,
														"dt": -0.05706043959792209
													},
													"nextHandle": {
														"dv": -6.256910104923487,
														"dt": 0.02419498391471564
													}
												},
												{
													"time": 0.6148641592675004,
													"value": 0,
													"mode": 1,
													"prevHandle": {
														"dv": 0.25537680978469357,
														"dt": -0.16158099134929055
													},
													"nextHandle": {
														"dv": 1.4423076923076792,
														"dt": 0.44823178326686186
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
								}
							]
						},
						{
							"type": "object",
							"name": "Death",
							"x": -2.17921,
							"y": 1.8455375,
							"z": -0.2399825,
							"children": [
								{
									"type": "emitter",
									"name": "emitter_flare",
									"props": {
										"lifeTime": 0.1,
										"alignMode": "Screen",
										"alignLockAxis": "Z",
										"emitType": "Burst",
										"burstDelay": 0.15,
										"instStretch": [
											5,
											0.7,
											1
										],
										"instRotation_rand": [
											0,
											0,
											-20
										],
										"instStretch_rand": [
											1,
											0,
											0
										],
										"instScale_rand": 0.2,
										"useRandomColor": true,
										"randomColor1": [
											0.48627450980392156,
											0.48627450980392156,
											0.48627450980392156,
											1
										],
										"emitAngle": 109.09,
										"warmUpTime": -0.52,
										"instRotation": [
											0,
											0,
											-30
										],
										"instOffset": [
											0,
											0,
											0.5
										]
									},
									"x": 4.22853,
									"y": -3.65,
									"z": 0.98664,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"rotationZ": 89.99999999999999,
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
															"culling": "None",
															"colorMask": 255,
															"depthTest": "LessEqual",
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
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.49516908212560384,
																	"value": 1,
																	"mode": 0
																},
																{
																	"time": 1,
																	"value": 0,
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
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.23027259684361548,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 0,
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
														}
													]
												},
												{
													"type": "shader",
													"name": "GradientMapLife",
													"source": "hrt.shader.GradientMapLife",
													"enabled": false,
													"props": {
														"destAlpha": true,
														"sourceAlpha": false,
														"colorMult": false,
														"gradient": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0,
																		"color": -100698849
																	},
																	{
																		"position": 1,
																		"color": -9088810
																	}
																],
																"resolution": 64,
																"isVertical": false,
																"interpolation": "Linear",
																"colorMode": 0
															}
														}
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.9882352941176471,
															0.9411764705882353,
															0.8666666666666667
														]
													}
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 5,
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
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3333333333333333
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
											"type": "curve",
											"name": "instStretch.x",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.7087914683036053,
														"dt": -0.3863616036602915
													},
													"nextHandle": {
														"dv": 0.40533303164394807,
														"dt": 0.22070899192578208
													}
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.010395383228392285,
														"dt": -0.5109986136922551
													},
													"nextHandle": {
														"dv": -0.00942505454810496,
														"dt": 0.4093557452432171
													}
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
										},
										{
											"type": "curve",
											"name": "instStretch.x",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.7087914683036053,
														"dt": -0.3863616036602915
													},
													"nextHandle": {
														"dv": 0.40533303164394807,
														"dt": 0.22070899192578208
													}
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.010395383228392285,
														"dt": -0.5109986136922551
													},
													"nextHandle": {
														"dv": -0.00942505454810496,
														"dt": 0.4093557452432171
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
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -1.122339506671671,
														"dt": -0.3379892151917322
													},
													"nextHandle": {
														"dv": 1.2799646653909236,
														"dt": 0.385398953113797
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 1.2799646653909236,
														"dt": -0.472615425165154
													},
													"nextHandle": {
														"dv": -0.9410191272333069,
														"dt": 0.3474841358008598
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
							"name": "Chara",
							"x": -2.17921,
							"y": 1.8455375,
							"z": -0.2399825,
							"children": [
								{
									"type": "model",
									"name": "Male01_HouseGuard",
									"source": "Character/Harkonnen/Unit/HouseGuard/Male01_HouseGuard.fbx",
									"x": 4.22853,
									"y": -3.68788,
									"scaleX": 0.8,
									"scaleY": 0.8,
									"scaleZ": 0.8,
									"children": [
										{
											"type": "animEvent",
											"name": "animEvent",
											"animation": "Anim/Male01/Anim_Male01_Idle.fbx"
										},
										{
											"type": "animEvent",
											"name": "animEvent",
											"time": 0.5,
											"animation": "Anim/Male01/Anim_Male01_Death01.fbx"
										}
									]
								},
								{
									"type": "model",
									"name": "Male01_HouseGuard",
									"source": "Character/Harkonnen/Unit/HouseGuard/Male01_HouseGuard.fbx",
									"x": 2.31268,
									"y": -4.92242,
									"scaleX": 0.8,
									"scaleY": 0.8,
									"scaleZ": 0.8,
									"children": [
										{
											"type": "animEvent",
											"name": "animEvent",
											"animation": "Anim/Male01/Anim_Male01_Idle.fbx",
											"loop": true
										}
									]
								},
								{
									"type": "model",
									"name": "Male01_HouseGuard",
									"source": "Character/Harkonnen/Unit/HouseGuard/Male01_HouseGuard.fbx",
									"enabled": false,
									"x": -2.20413,
									"y": 1.69545,
									"scaleX": 0.8,
									"scaleY": 0.8,
									"scaleZ": 0.8,
									"rotationZ": 90
								}
							]
						},
						{
							"type": "model",
							"name": "Sphere_Slide",
							"source": "Fx/Meshes_Common/Sphere.fbx",
							"x": 1.92501,
							"y": -1.85693,
							"z": 0.40241,
							"scaleX": 1.5,
							"scaleY": 1.5,
							"scaleZ": 2.26,
							"rotationY": 180,
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
													"time": 0.3732991420288492,
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
													"time": 0.8905199103456858,
													"value": 1.188780934119911,
													"mode": 0,
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
													"time": 0.4412619566286433,
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
													"time": 0.9584827249454799,
													"value": 1.188780934119911,
													"mode": 0,
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
										"alpha": 0.75
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.3844310235245545,
													"value": 0,
													"mode": 0,
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
													"time": 0.6295585226949179,
													"value": 1.0240771124078043,
													"mode": 2
												},
												{
													"time": 0.8952219173303843,
													"value": 0,
													"mode": 0,
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
													"time": 0.5064085241517,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.5382561337360124,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.9602251902057217,
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
													"time": 0.8239509364662878,
													"value": 0.9,
													"mode": 2
												},
												{
													"time": 0.9039509364662878,
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
											"time": 0.55529230938099,
											"value": 0.5,
											"mode": 2
										},
										{
											"time": 1.3670344652672783,
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
			"name": "BACKUP",
			"enabled": false,
			"scaleX": 5,
			"scaleY": 5,
			"scaleZ": 5,
			"children": [
				{
					"type": "object",
					"name": "Nefud",
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
					"type": "object",
					"name": "Skill",
					"x": 0.6965427272727274,
					"y": 0.040847272727272725,
					"z": 0.5864790909090908,
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
									"name": "HeatWave_Distort",
									"props": {
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
										"instScale": 20,
										"instRotation_rand": [
											0,
											0,
											360
										],
										"instScale_rand": 0,
										"warmUpTime": -0.5,
										"emitType": "Burst",
										"lifeTime": 0.75
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
														"distortionDir": "Fx/DistortionMaps/waveNormal02.jpg",
														"intensity": 0.015
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
								},
								{
									"type": "emitter",
									"name": "Shockwave",
									"enabled": false,
									"props": {
										"warmUpTime": -0.5,
										"emitType": "Burst",
										"instScale": 15,
										"instRotation_rand": [
											0,
											0,
											360
										]
									},
									"scaleX": 0.010000000000000002,
									"scaleY": 0.010000000000000002,
									"scaleZ": 0.010000000000000002,
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
															"drawOrder": "100"
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
														"alpha": 0.8,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_ChocWave_Blurred_02.png"
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.5,
														"saturation": 1,
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
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.41712157155829,
																		"dt": -0.45256463091700333
																	},
																	"nextHandle": {
																		"dv": -1.0333333333333334,
																		"dt": 0.33171875000000084
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
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -2.090031350705387,
														"dt": -0.3895058426314596
													},
													"nextHandle": {
														"dv": 1.1,
														"dt": 0.20671875000000048
													}
												},
												{
													"time": 0.8467187500000021,
													"value": 1,
													"mode": 2
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
													0.9725490196078431,
													0.9725490196078431,
													0.9725490196078431
												]
											}
										}
									]
								},
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
										]
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
															"emissive": 10
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
																	"mode": 0,
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
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
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
											"name": "instScale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.3136958552692092,
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
										"lifeTime": 1.5
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
															"emissive": 10,
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
													"emissive": 5
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
															"mode": 0,
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
															"value": 1.3,
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
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "advancedDecal_ImpactFrame",
							"enabled": false,
							"x": 0.6763772727272727,
							"y": -0.04084727272727271,
							"z": -0.5864790909090906,
							"scaleX": 29.999999999999996,
							"scaleY": 29.999999999999996,
							"scaleZ": 1.4999999999999998,
							"albedoMap": "Fx/Gradients/circGrad01.png",
							"emissive": 0.5,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.5,
										"sandColorSet": false,
										"envBlend": 1,
										"envColorSet": false
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
											"keyMode": 0,
											"keys": [
												{
													"time": 0.5977065855297035,
													"value": 0.011458333333333404,
													"mode": 0,
													"prevHandle": {
														"dv": -0.014976875997216066,
														"dt": -0.14224713341297948
													},
													"nextHandle": {
														"dv": 0.014976875997216066,
														"dt": 0.14224713341297948
													}
												},
												{
													"time": 0.7667946327519222,
													"value": 1.5,
													"mode": 1
												},
												{
													"time": 1.7430738582808352,
													"value": 0.011458333333333404,
													"mode": 0,
													"prevHandle": {
														"dv": -0.014976875997216033,
														"dt": -0.39671893641338385
													},
													"nextHandle": {
														"dv": 0.014976875997216033,
														"dt": 0.39671893641338385
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
											1,
											1
										]
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"enabled": false,
									"props": {
										"amount": 1,
										"color": [
											0.6274509803921569,
											0.2,
											0.11372549019607843
										]
									}
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
														"position": 0.0078125,
														"color": -167818457
													},
													{
														"position": 1,
														"color": -18059
													}
												],
												"resolution": 64,
												"isVertical": false,
												"interpolation": "Linear",
												"colorMode": 0
											}
										}
									}
								},
								{
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.7,
										"ATTENUATE": true,
										"emissiveMap": "Fx/Gradients/z_FillBlack.jpg"
									}
								}
							]
						},
						{
							"type": "object",
							"name": "FlashDecals",
							"x": 0.6663067046303967,
							"y": 0.05341389670632103,
							"z": 0.33528604211148294,
							"scaleX": 0.9999999999999998,
							"scaleY": 0.9999999999999998,
							"scaleZ": 0.9999999999999998,
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
													0.09411764705882353,
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
									"emissive": 4,
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
															"time": 0.9718463728318101,
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
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													0.9450980392156862,
													0.3058823529411765,
													0.16078431372549018
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.48142231629316923,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.00978182452443758
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.1648974277028642
															}
														},
														{
															"time": 0.7142186848148598,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.033333333333333326,
																"dt": -0.19815405177739143
															},
															"nextHandle": {
																"dv": 0.025202233235275383,
																"dt": 0.14981773888226257
															}
														}
													]
												}
											]
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
															"time": 0.4696204924539308,
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
															"time": 0.986841260770768,
															"value": 1.188780934119911,
															"mode": 0,
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
									"name": "advancedDecal_Slide2",
									"enabled": false,
									"z": 0.54481,
									"scaleX": 3.5,
									"scaleY": 3.5,
									"scaleZ": 2.6,
									"rotationX": -90,
									"rotationZ": -151.8,
									"albedoMap": "Fx/Gradients/circGrad05.jpg",
									"fadePower": 3,
									"emissive": 3,
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
															"time": 0.9621499566450302,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.9939975662293421,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.4159666226990502,
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
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													0.9450980392156862,
													0.3058823529411765,
													0.16078431372549018
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.9255425661604093,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.00978182452443758
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.1648974277028642
															}
														},
														{
															"time": 1.1583389346820998,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.033333333333333326,
																"dt": -0.19815405177739143
															},
															"nextHandle": {
																"dv": 0.025202233235275383,
																"dt": 0.14981773888226257
															}
														}
													]
												}
											]
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
													"loop": true,
													"keys": [
														{
															"time": 0.8907759660869405,
															"value": 0.07944805146316969,
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
															"time": 1.6477433682645835,
															"value": 1.188780934119911,
															"mode": 0,
															"prevHandle": {
																"dv": -0.1742726842760427,
																"dt": -0.21680833792955
															},
															"nextHandle": {
																"dv": 0.1742726842760427,
																"dt": 0.21680833792955
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "uvShift.y",
													"enabled": false,
													"keyMode": 1,
													"keys": [
														{
															"time": 0.9137407423211709,
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
															"time": 1.430961510638008,
															"value": 1.188780934119911,
															"mode": 0,
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
													"enabled": false,
													"keyMode": 1,
													"keys": [
														{
															"time": 0.9137407423211709,
															"value": 1.189,
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
															"time": 1.430961510638008,
															"value": 0.2245,
															"mode": 0,
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
															"time": 0.7591577130004956,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.7910053225848075,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.9734401323944109,
															"value": 0,
															"mode": 0,
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
													0.9450980392156862,
													0.3058823529411765,
													0.16078431372549018
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keys": [
														{
															"time": 0.8683953601976495,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.00978182452443758
															},
															"nextHandle": {
																"dv": -0.03417340777450917,
																"dt": 0.09904221378551759
															}
														},
														{
															"time": 0.9734401323944106,
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
							"type": "object",
							"name": "ShieldOK",
							"x": 0.7604872727272728,
							"y": -0.013707272727272717,
							"z": 1.2819809090909093,
							"scaleX": 1.2499999999999996,
							"scaleY": 1.2499999999999996,
							"scaleZ": 1.2499999999999996,
							"children": [
								{
									"type": "model",
									"name": "Sphere_Slide",
									"source": "Fx/Meshes_Common/Sphere.fbx",
									"scaleX": 4,
									"scaleY": 4,
									"scaleZ": 4,
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
													"enabled": false,
													"keyMode": 1,
													"keys": [
														{
															"time": 0.41377661465346993,
															"value": 0.29763513839165856,
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
															"value": 1.0121431898208673,
															"mode": 0,
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
															"mode": 0,
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
													"enabled": false,
													"keyMode": 1,
													"keys": [
														{
															"time": 0.41377661465346993,
															"value": 0.29763513839165856,
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
															"time": 0.6884080189742976,
															"value": 1.0121431898208673,
															"mode": 0,
															"prevHandle": {
																"dv": 0.006177529446548258,
																"dt": -0.11053705995725516
															},
															"nextHandle": {
																"dv": -0.006177529446548258,
																"dt": 0.11053705995725516
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
												"alpha": 4
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
															"mode": 0,
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
															"mode": 0,
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
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.42490849614917525,
															"value": 0,
															"mode": 0,
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
															"time": 0.6283976104251364,
															"value": 1.0240771124078043,
															"mode": 2
														},
														{
															"time": 0.78972218033868,
															"value": 0,
															"mode": 0,
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
									"scaleX": 3.5,
									"scaleY": 3.5,
									"scaleZ": 3.5,
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
												"texture": "Fx/Alphas/Hextile_hex02-Inside.png",
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
															"time": 0.6815420346156518,
															"value": 0,
															"mode": 0,
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
															"time": 0.7882535944106535,
															"value": 1.0240771124078043,
															"mode": 2
														},
														{
															"time": 1.2036845428162681,
															"value": 0,
															"mode": 0,
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
													"time": 0.604987090572185,
													"value": 1,
													"mode": 0,
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
													"time": 1.0744628707179071,
													"value": 1.4,
													"mode": 0,
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
								}
							]
						},
						{
							"type": "object",
							"name": "flare",
							"x": 0.7898272727272727,
							"y": 0.07659272727272728,
							"z": 3.8994709090909083,
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
										"warmUpTime": -0.7
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
													"mode": 0,
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
													"mode": 0,
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
													"mode": 0,
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
													"mode": 0,
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
										"warmUpTime": -0.75,
										"emitType": "Burst",
										"instScale": 1.25
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
																	"mode": 0,
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
													"mode": 0,
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
													"mode": 0,
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
													"mode": 0,
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
													"mode": 0,
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
									"name": "Flarescreen",
									"props": {
										"emitType": "Burst",
										"alignMode": "Screen",
										"instScale": 25,
										"lifeTime": 0.5,
										"instOffset": [
											0,
											0,
											1
										],
										"warmUpTime": -0.5
									},
									"x": -0.83892,
									"y": 0.0485,
									"z": -6.06824,
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
															"enableStencil": false,
															"parallax": 0,
															"emissive": 1,
															"drawOrder": "110"
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 15,
														"power": 1
													},
													"isInstance": true
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
														"alpha": 0.7,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_circle2.png"
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
																	"mode": 2
																},
																{
																	"time": 0.337436981201172,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -1.1333333333333333,
																		"dt": -0.050000000000000044
																	},
																	"nextHandle": {
																		"dv": 0.6141901939981789,
																		"dt": 0.029366779035477106
																	}
																},
																{
																	"time": 1.0041889953613283,
																	"value": 0,
																	"mode": 0
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
																"position": 0.0078125,
																"color": -167818457
															},
															{
																"position": 1,
																"color": -18059
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
											}
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.7,
												"ATTENUATE": true,
												"emissiveMap": "Fx/Gradients/z_FillBlack.jpg"
											}
										}
									]
								},
								{
									"type": "emitter",
									"name": "Flarescreen",
									"props": {
										"emitType": "Burst",
										"alignMode": "Screen",
										"instScale": 15,
										"lifeTime": 0.5,
										"instOffset": [
											0,
											0,
											1
										],
										"warmUpTime": -0.5
									},
									"x": -0.83892,
									"y": 0.0485,
									"z": -6.06824,
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
															"enableStencil": false,
															"parallax": 0
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 15,
														"power": 1
													},
													"isInstance": true
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
														"alpha": 0.7,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_circle2.png"
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
																	"mode": 2
																},
																{
																	"time": 0.337436981201172,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -1.1333333333333333,
																		"dt": -0.050000000000000044
																	},
																	"nextHandle": {
																		"dv": 0.6141901939981789,
																		"dt": 0.029366779035477106
																	}
																},
																{
																	"time": 1.0041889953613283,
																	"value": 0,
																	"mode": 0
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
																"position": 0.0078125,
																"color": -167818457
															},
															{
																"position": 1,
																"color": -18059
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
											}
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
																"color": -151473505
															},
															{
																"position": 0.828125,
																"color": -1
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
											}
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 1,
												"ATTENUATE": true,
												"emissiveMap": "Fx/Gradients/z_FillBlack.jpg"
											}
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "polygon",
					"name": "polygon_contrast",
					"x": 1.75932,
					"z": 0.19999999999999998,
					"scaleX": 14.999999999999998,
					"scaleY": 14.999999999999998,
					"scaleZ": 14.999999999999998,
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
									"enableStencil": false,
									"textureWrap": true
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
								"wrap": true,
								"invert": false,
								"replace": false,
								"alpha": 1,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Gradients/circGrad01.png",
								"onDecal": false
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
									0.7215686274509804,
									0.11764705882352941,
									0
								]
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.64
							},
							"isInstance": true,
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.5611517130501893,
											"value": 0,
											"mode": 0
										},
										{
											"time": 0.6571309452786225,
											"value": 1,
											"mode": 0
										},
										{
											"time": 1.526994995366451,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.32126212043692154
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.32126212043692154
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
								"envBlend": 0.75,
								"envColorSet": false
							},
							"isInstance": true
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
}