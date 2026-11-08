{
	"type": "fx",
	"duration": 5,
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
			"scaleX": 0.9,
			"scaleY": 0.9,
			"scaleZ": 0.9,
			"children": [
				{
					"type": "object",
					"name": "Chara",
					"editorOnly": true,
					"y": -1.0092936587501423e-17,
					"children": [
						{
							"type": "model",
							"name": "Male01_HarkonnenRabban",
							"source": "Character/Ecaz/Unit/WhitmoreBludd/Male01_WhitmoreBludd.fbx",
							"scaleX": 2.2,
							"scaleY": 2.2,
							"scaleZ": 2.2,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Male01/Duncan/Anim_Male01_AltDuncan_Skill.fbx"
								}
							]
						},
						{
							"type": "model",
							"name": "Atreide_Sword_01",
							"source": "Character/Ecaz/Weapon/SwordWhitmore/SwordWhitmore.fbx",
							"y": -0.28272,
							"scaleY": 1.0000000000000002,
							"scaleZ": 1.0000000000000002,
							"rotationX": -90
						},
						{
							"type": "model",
							"name": "Atreide_Sword_02",
							"source": "Character/Ecaz/Weapon/SwordWhitmore/SwordWhitmore.fbx",
							"x": -0.07328,
							"y": -0.02477,
							"z": 0.34657,
							"scaleY": 1.0000000000000002,
							"scaleZ": 1.0000000000000002,
							"rotationX": 180
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
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.Chara.Atreide_Sword_01",
							"target": "FXAnimation.FXRoot.Chara.Male01_HarkonnenRabban.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Weapon"
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.Chara.Atreide_Sword_02",
							"target": "FXAnimation.FXRoot.Chara.Male01_HarkonnenRabban.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_lClavicleJ.B_lShoulderJ.B_lElbowJ.B_lWristJ.B_lPalmJ.B_lFinger1J1"
						}
					]
				},
				{
					"type": "object",
					"name": "SlashTrail",
					"z": 3.14225,
					"scaleX": 1.15,
					"scaleY": 1.15,
					"scaleZ": 1.15,
					"children": [
						{
							"type": "polygon",
							"name": "Slashtrail",
							"x": -0.39977,
							"y": 0.36728,
							"z": -0.6149,
							"scaleX": 3,
							"scaleY": 3,
							"scaleZ": 3,
							"rotationX": 102.4,
							"rotationY": -75.6,
							"rotationZ": -1,
							"kind": 1,
							"args": [
								24,
								289.09,
								0.36,
								4
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
											"emissive": 4
										}
									},
									"diffuseMap": "Fx/Alphas/T_Slash_2_blurry.png"
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.5
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 1.8528191805799903,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.86281918057999,
													"value": 5,
													"mode": 2
												},
												{
													"time": 1.9938871189095666,
													"value": 5,
													"mode": 2
												},
												{
													"time": 2.0625489778656774,
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
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 2,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/T_Square02.jpg",
										"onDecal": false
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 0.6,
										"scaleY": 1,
										"shiftX": 1.5,
										"shiftY": 0,
										"shiftSpeedX": 0,
										"shiftSpeedY": 0
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "shiftX",
											"keyMode": 1,
											"keys": [
												{
													"time": 1.6827515194747247,
													"value": -0.893336452322869,
													"mode": 0,
													"prevHandle": {
														"dv": 4.777854810345815e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.06741443310884698
													}
												},
												{
													"time": 1.9647442036692713,
													"value": -0.09214407539152399,
													"mode": 1,
													"prevHandle": {
														"dv": 0.0040056628364816965,
														"dt": -0.1554033826908523
													},
													"nextHandle": {
														"dv": -0.008194307463030778,
														"dt": 0.02763239329741851
													}
												},
												{
													"time": 2.02546112389117,
													"value": -0.11497834721396988,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.020238973407299632
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.020238973407299632
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "scaleX",
											"keys": [
												{
													"time": 1.9627146378777098,
													"value": 3,
													"mode": 2
												},
												{
													"time": 2.114888550921188,
													"value": 26.15980177681118,
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
										"progress": 0.18,
										"saturation": 1,
										"width": 0.44,
										"uvScaleX": 1,
										"uvScaleY": 4,
										"texture": "Fx/Gradients/uGrad_uneaven.png",
										"uvShift": [
											0.1,
											0.5
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
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.2980392156862745,
											0.2784313725490196,
											0.27058823529411763
										]
									}
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0,
										"sandColorSet": false,
										"envBlend": 0.8,
										"envColorSet": false
									}
								}
							]
						},
						{
							"type": "polygon",
							"name": "Slashtrail",
							"x": -1.20046,
							"y": 0.41509,
							"z": -0.66801,
							"scaleX": 4,
							"scaleY": 3,
							"scaleZ": 4,
							"rotationX": -20.9,
							"rotationY": -92.9,
							"rotationZ": 59,
							"kind": 1,
							"args": [
								24,
								289.09,
								0.42,
								4
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
											"emissive": 4
										}
									},
									"diffuseMap": "Fx/Alphas/T_Slash_2_blurry.png"
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.5
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 1.8528191805799894,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.8628191805799892,
													"value": 5,
													"mode": 2
												},
												{
													"time": 1.9938871189095657,
													"value": 5,
													"mode": 2
												},
												{
													"time": 2.0625489778656765,
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
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 2,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/T_Square02.jpg",
										"onDecal": false
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 0.6,
										"scaleY": 1,
										"shiftX": 1.5,
										"shiftY": 0,
										"shiftSpeedX": 0,
										"shiftSpeedY": 0
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "shiftX",
											"keyMode": 1,
											"keys": [
												{
													"time": 1.6827515194747238,
													"value": -0.6920369423809122,
													"mode": 0,
													"prevHandle": {
														"dv": 4.777854810345815e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.06741443310884698
													}
												},
												{
													"time": 2.040113042747537,
													"value": -0.08250533984884734,
													"mode": 1,
													"prevHandle": {
														"dv": -0.026839934658927533,
														"dt": -0.22269555236735217
													},
													"nextHandle": {
														"dv": -0.2117372623093173,
														"dt": 0.06891295757220317
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "scaleX",
											"keys": [
												{
													"time": 1.962714637877709,
													"value": 5,
													"mode": 2
												},
												{
													"time": 2.114888550921187,
													"value": 26.15980177681118,
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
										"progress": 0.18,
										"saturation": 1,
										"width": 0.44,
										"uvScaleX": 1,
										"uvScaleY": 4,
										"texture": "Fx/Gradients/uGrad_uneaven.png",
										"uvShift": [
											0.1,
											0.5
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
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.2980392156862745,
											0.2784313725490196,
											0.27058823529411763
										]
									}
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0,
										"sandColorSet": false,
										"envBlend": 0.8,
										"envColorSet": false
									}
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Skill",
					"x": 0.6965427272727274,
					"y": 0.040847272727272725,
					"z": 0.5864790909090908,
					"scaleX": 2.2,
					"scaleY": 2.2,
					"scaleZ": 2.2,
					"children": [
						{
							"type": "object",
							"name": "Impact",
							"enabled": false,
							"x": -0.08931,
							"y": 0.11704,
							"z": -0.48962,
							"scaleX": 0.9999999999999998,
							"scaleY": 0.9999999999999998,
							"scaleZ": 0.9999999999999998,
							"children": [
								{
									"type": "model",
									"name": "Knee",
									"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
									"y": -0.03574,
									"z": 5.28059,
									"scaleX": 0.3,
									"scaleY": 0.3,
									"scaleZ": 2.5,
									"rotationY": 178.5,
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
													"emissive": 1
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
															"time": 0.6025621156556582,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.1023306419612637,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.1871863683524524,
															"value": 2,
															"mode": 2
														},
														{
															"time": 1.2871373873368783,
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
															"time": 0.9815898168353141,
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
															"time": 1.1443874176997644,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.45293037114996,
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
															"time": 1.1742176330210825,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.4797652035226476,
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
													1,
													0.5176470588235293,
													0.7450980392156863
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.113831168722276,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.4409859213544627,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666607,
																"dt": -0.27126358287551344
															},
															"nextHandle": {
																"dv": 0.006159978327926369,
																"dt": 0.10033547494629665
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
									"name": "XFlare",
									"enabled": false,
									"x": 0.30475,
									"y": -0.03564,
									"z": 3.35122,
									"children": [
										{
											"type": "lookAt",
											"name": "lookAt",
											"x": -1.1102230246251565e-16,
											"y": 1.3877787807814457e-17,
											"scaleX": 0.9999999999999999,
											"scaleY": 0.9999999999999999,
											"scaleZ": 0.9999999999999998,
											"rotationX": 2.1858452127443156e-16,
											"rotationY": -24.57497232711864,
											"rotationZ": -2.5822309102829735,
											"target": "camera",
											"lockAxis": [
												0,
												0,
												0
											],
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"scaleX": 8,
													"scaleY": 8,
													"scaleZ": 8,
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
																	"blend": "Add",
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
																"alpha": 2,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_Flare_Cross.png"
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keys": [
																		{
																			"time": 1.1717060614584414,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.251581837855957,
																			"value": 1,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 1,
																	"keys": [
																		{
																			"time": 1.1717060614584414,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.2266020823880863,
																			"value": 1,
																			"mode": 1,
																			"prevHandle": {
																				"dv": -0.43333333333333335,
																				"dt": -0.033124876700941996
																			},
																			"nextHandle": {
																				"dv": -0.9,
																				"dt": 0.07234520194117766
																			}
																		},
																		{
																			"time": 1.634786218952856,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.033333333333333326,
																				"dt": -0.3580431617061435
																			},
																			"nextHandle": {
																				"dv": 0.014644286010596256,
																				"dt": 0.1572985939248905
																			}
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "progress",
																	"enabled": false,
																	"keyMode": 1,
																	"keys": [
																		{
																			"time": 1.1973771179454138,
																			"value": 0.5,
																			"mode": 1,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0.29111814826726923,
																				"dt": 0.06915880636768901
																			}
																		},
																		{
																			"time": 1.7211234445189247,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.003619090616702847,
																				"dt": -0.5207616528940111
																			},
																			"nextHandle": {
																				"dv": 0.003619090616702847,
																				"dt": 0.5207616528940111
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
																	"time": 1.1817984308202751,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -1.9753114253183501,
																		"dt": -0.16987474999645236
																	},
																	"nextHandle": {
																		"dv": 0.7888157172241844,
																		"dt": 0.06996487095856696
																	}
																},
																{
																	"time": 1.8318487343105008,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.03707704056933192,
																		"dt": -0.34390138337015075
																	},
																	"nextHandle": {
																		"dv": -0.03707704056933192,
																		"dt": 0.34390138337015075
																	}
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
																	0.9529411764705882,
																	0.32156862745098036,
																	0.615686274509804
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "amount",
																	"keys": [
																		{
																			"time": 1.2017635175424013,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.4294660787609617,
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
											"name": "flarealt",
											"x": -1.1102230246251565e-16,
											"y": 1.3877787807814457e-17,
											"scaleX": 0.24999999999999997,
											"scaleY": 0.24999999999999997,
											"scaleZ": 0.24999999999999997,
											"children": [
												{
													"type": "emitter",
													"name": "emitter_Flare",
													"props": {
														"lifeTime": 0.2,
														"alignMode": "Screen",
														"alignLockAxis": "Z",
														"burstDelay": 0.45,
														"instStretch": [
															40,
															4,
															1
														],
														"instRotation_rand": [
															0,
															0,
															5
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
														"warmUpTime": -1.15,
														"emitType": "Burst",
														"instScale": 1.25,
														"instRotation": [
															0,
															0,
															65
														]
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
													"name": "emitter_Flare",
													"props": {
														"lifeTime": 0.2,
														"alignMode": "Screen",
														"alignLockAxis": "Z",
														"burstDelay": 0.45,
														"instStretch": [
															40,
															4,
															1
														],
														"instRotation_rand": [
															0,
															0,
															5
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
														"warmUpTime": -1.15,
														"emitType": "Burst",
														"instScale": 1.25,
														"instRotation": [
															0,
															0,
															-65
														]
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
														"amount": 0.85,
														"ATTENUATE": true,
														"emissiveMap": null
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "position.z",
											"keys": [
												{
													"time": 1.0779980421983597,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.228049051735128,
													"value": -1.6333333333333333,
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
							"name": "FlashDecals",
							"enabled": false,
							"x": -0.25166,
							"y": 0.05341,
							"z": 0.5677,
							"rotationZ": 90,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Black",
									"x": 0.10469,
									"z": 0.84977,
									"scaleX": 4.2,
									"scaleY": 2.4,
									"scaleZ": 2.4,
									"rotationY": 89.99999999999999,
									"rotationZ": 90,
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
															"time": 1.0648402732154207,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.0748402732154205,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.1615657368364811,
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
									"name": "advancedDecal_Pink",
									"x": 0.10469,
									"z": 0.41905,
									"scaleX": 2.6,
									"scaleY": 2,
									"scaleZ": 2,
									"rotationY": 89.99999999999999,
									"rotationZ": 90,
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
															"time": 1.1547680265589748,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.2383629609005342,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.9133131086421613,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.31988251172550664
															},
															"nextHandle": {
																"dv": 0.21666666666666667,
																"dt": 0.030952001010344565
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
													0.9372549019607843,
													0.21568627450980393,
													0.5529411764705883
												]
											}
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_White",
									"x": 0.10469,
									"z": 0.41905,
									"scaleX": 2.6,
									"scaleY": 2,
									"scaleZ": 2,
									"rotationY": 89.99999999999999,
									"rotationZ": 90,
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
															"time": 1.1066445465904484,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.1746235730041819,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.4362606121036476,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": -0.050000000000000044,
																"dt": -0.19927400323396371
															},
															"nextHandle": {
																"dv": 0.21666666666666667,
																"dt": 0.030952001010344565
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
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "spinSwordL",
							"y": -0.7273,
							"z": 1.07529,
							"scaleX": 1.2,
							"scaleY": 1.2,
							"scaleZ": 1.2,
							"children": [
								{
									"type": "polygon",
									"name": "SlashFoot",
									"x": 0.03323,
									"y": -0.04787,
									"z": -0.01353,
									"scaleX": 0.75,
									"scaleY": 0.75,
									"scaleZ": 0.75,
									"rotationX": -180,
									"kind": 1,
									"args": [
										24,
										259.09,
										0.75,
										4
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
													"emissive": 1
												}
											},
											"diffuseMap": "Fx/Alphas/T_Slash_blurry.png"
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
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.5,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/T_Square02.jpg",
												"onDecal": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad.png",
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
															"time": 0.14359681329292873,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 0.12898350993794783,
																"dt": -0.4998174849364267
															},
															"nextHandle": {
																"dv": 0.02907755692715791,
																"dt": 0.12119947235397059
															}
														},
														{
															"time": 0.393312925170068,
															"value": 1.0416666666666667,
															"mode": 1,
															"prevHandle": {
																"dv": -0.9895833333333335,
																"dt": -0.04999999999999993
															},
															"nextHandle": {
																"dv": 0.01736111111111116,
																"dt": 0.10630843540074725
															}
														},
														{
															"time": 0.6373672101267515,
															"value": 1.0416666666666667,
															"mode": 1
														},
														{
															"time": 0.7215641387315155,
															"value": 0,
															"mode": 1
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
												"progress": 0.71,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
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
											}
										},
										{
											"type": "curve",
											"name": "rotation.z",
											"keys": [
												{
													"time": 0.2,
													"value": -0.16125,
													"mode": 2
												},
												{
													"time": 0.8901292517006801,
													"value": 4.089999999999999,
													"mode": 2
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
													0.9098039215686274,
													0.30196078431372547,
													0.4784313725490196
												]
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "position.y",
									"keyMode": 1,
									"keys": [
										{
											"time": 0.3418356168775651,
											"value": 0,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.0292074065350702
											}
										},
										{
											"time": 0.6661412021203833,
											"value": 1.7569816589355476,
											"mode": 1,
											"prevHandle": {
												"dv": -0.4730335235595704,
												"dt": -0.23240470233802685
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.032868809315150495
											}
										},
										{
											"time": 0.7647476300658348,
											"value": 1.6894054412841806,
											"mode": 2
										},
										{
											"time": 0.8874578515090633,
											"value": 1.1487957000732427,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "position.x",
									"keyMode": 1,
									"keys": [
										{
											"time": 0.3418356168775651,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.42752635468190703,
											"value": 0.702792663574219,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.02856357926811398
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.07953828247949209
											}
										},
										{
											"time": 0.6377852176402219,
											"value": -0.6641871095448741,
											"mode": 2
										},
										{
											"time": 0.7779577929457653,
											"value": -0.2472471260279422,
											"mode": 2
										},
										{
											"time": 0.8874578515090633,
											"value": 0.3781628492474556,
											"mode": 2
										},
										{
											"time": 0.9777037127561644,
											"value": -0.205553127676249,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.0300819537490337
											},
											"nextHandle": {
												"dv": 0,
												"dt": -0.5
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
											"time": 0.3418356168775651,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.5143891268276946,
											"value": 0.9370568847656254,
											"mode": 1,
											"prevHandle": {
												"dv": -0.29283027648925797,
												"dt": -0.0492238398878177
											},
											"nextHandle": {
												"dv": -0.0878490829467774,
												"dt": 0.10090887177002617
											}
										},
										{
											"time": 0.7647476300658348,
											"value": -0.20498119354248057,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.08345283441271341
											},
											"nextHandle": {
												"dv": -0.029283027648925763,
												"dt": 0.0695964560326745
											}
										},
										{
											"time": 0.9352529578685355,
											"value": 1.0834720230102544,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "spinSwordR",
							"x": -1.07694,
							"y": -0.24389,
							"z": 1.35915,
							"scaleX": 1.2,
							"scaleY": 1.2,
							"scaleZ": 1.2,
							"children": [
								{
									"type": "object",
									"name": "SlashR",
									"scaleX": 0.9999999999999999,
									"scaleY": 0.9999999999999999,
									"scaleZ": 0.9999999999999999,
									"rotationX": 126,
									"rotationY": -129.5,
									"rotationZ": -7.4,
									"children": [
										{
											"type": "polygon",
											"name": "SlashFoot",
											"x": 1.1102230246251565e-16,
											"y": 2.862293735361732e-17,
											"scaleX": 0.75,
											"scaleY": 0.75,
											"scaleZ": 0.75,
											"rotationX": 7.016709298534877e-15,
											"rotationY": 180,
											"rotationZ": 2.9034500710020335,
											"kind": 1,
											"args": [
												24,
												259.09,
												0.75,
												4
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
															"emissive": 1
														}
													},
													"diffuseMap": "Fx/Alphas/T_Slash_blurry.png"
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
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"props": {
														"useSourceUVs": true,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 0.5,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Gradients/T_Square02.jpg",
														"onDecal": false
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.5,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/vGrad.png",
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
																	"time": 0.31190187824945104,
																	"value": 0,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0.12898350993794783,
																		"dt": -0.4998174849364267
																	},
																	"nextHandle": {
																		"dv": 0.02907755692715791,
																		"dt": 0.12119947235397059
																	}
																},
																{
																	"time": 0.5616179901265903,
																	"value": 1.0416666666666667,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.9895833333333335,
																		"dt": -0.04999999999999993
																	},
																	"nextHandle": {
																		"dv": 0.01736111111111116,
																		"dt": 0.10630843540074725
																	}
																},
																{
																	"time": 0.7641723960528982,
																	"value": 1.0416666666666667,
																	"mode": 1
																},
																{
																	"time": 0.8483693246576622,
																	"value": 0,
																	"mode": 1
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
														"progress": 0.71,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
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
															0.5176470588235293,
															0.7450980392156863
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"enabled": false,
															"keys": [
																{
																	"time": 0.9833050649565223,
																	"value": 0.9,
																	"mode": 2
																},
																{
																	"time": 1.0633050649565223,
																	"value": 0.2,
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
															0.9098039215686274,
															0.30196078431372547,
															0.4784313725490196
														]
													}
												},
												{
													"type": "curve",
													"name": "rotation.z",
													"keys": [
														{
															"time": 0.3683050649565223,
															"value": -0.37381249999999966,
															"mode": 2
														},
														{
															"time": 0.8507475201226944,
															"value": 2.5080651390861166,
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
									"name": "position.y",
									"keyMode": 1,
									"keys": [
										{
											"time": 0.46341531583919127,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.6017482459404424,
											"value": -0.4810783113752097,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.02689806974190993
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.04149987903037533
											}
										},
										{
											"time": 0.7562200178868395,
											"value": 0.23008093152727396,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.05149059064879902
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.029972134855271098
											}
										},
										{
											"time": 0.8645808131328195,
											"value": 0.23008093152727396,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "position.x",
									"keys": [
										{
											"time": 0.45649866933412875,
											"value": 0,
											"mode": 1
										},
										{
											"time": 0.6639980644860054,
											"value": 1.6182723837306878,
											"mode": 2
										},
										{
											"time": 0.7908032504121523,
											"value": 1.3901851672533732,
											"mode": 2
										},
										{
											"time": 0.889941850318049,
											"value": 1.2761415590147158,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "position.z",
									"keyMode": 1,
									"keys": [
										{
											"time": 0.46572086467421214,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.576387208755213,
											"value": -0.278188762664795,
											"mode": 1,
											"prevHandle": {
												"dv": 0.007422209934670892,
												"dt": -0.03688055164561367
											},
											"nextHandle": {
												"dv": 0.07247549343109128,
												"dt": 0.28852687340665417
											}
										},
										{
											"time": 0.8830252038129863,
											"value": 0.5783397960662844,
											"mode": 0,
											"prevHandle": {
												"dv": 0.03074717903137203,
												"dt": -0.08720189152795477
											},
											"nextHandle": {
												"dv": -0.01846053626957031,
												"dt": 0.05223651816147319
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Start",
							"x": -0.25826,
							"y": 0.04122,
							"scaleX": 0.7,
							"scaleY": 0.7,
							"scaleZ": 0.7,
							"children": [
								{
									"type": "emitter",
									"name": "Distort_Chockwave",
									"props": {
										"instScale_rand": 0,
										"maxCount": 50,
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
											0
										],
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
										"emitType": "Burst",
										"burstDelay": 0.3,
										"emitShape": "Cylinder",
										"emitSurface": true,
										"warmUpTime": -1.18,
										"instWorldAcceleration_rand": [
											0,
											0,
											0
										],
										"instScale": 1.5,
										"lifeTime": 0.75
									},
									"z": -0.2,
									"scaleX": 0.5,
									"scaleY": 0.5,
									"scaleZ": 0.05,
									"children": [
										{
											"type": "model",
											"name": "Ring",
											"source": "Fx/Meshes_Common/DiskFlat.fbx",
											"scaleX": 5,
											"scaleY": 5,
											"scaleZ": 0.1,
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
														"intensity": 0.015
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
								},
								{
									"type": "object",
									"name": "FlareVertical",
									"x": 5.551115123125783e-17,
									"z": 0.3145,
									"children": [
										{
											"type": "lookAt",
											"name": "lookAt_FlareWhite",
											"enabled": false,
											"x": 1.6653345369377348e-16,
											"z": -0.51608,
											"scaleX": 0.5,
											"scaleY": 0.5,
											"scaleZ": 1.1321105205425928,
											"rotationZ": -5.75228976444653,
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
													"scaleY": 13.33,
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
																"texture": "Fx/Gradients/Cyl05v_A.png",
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
																"progress": 0.34,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 0.5,
																"uvScaleY": 2,
																"texture": "Fx/noise/T_Noise_Water_04.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.2,
																	1
																],
																"uvScaleSpeed": [
																	0,
																	0
																]
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
																"texture": "Fx/Gradients/Cyl04v_A.jpg"
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 1.0432168805011865,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.2332168805011865,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.0017958704086967704,
																				"dt": -0.019991355089287063
																			},
																			"nextHandle": {
																				"dv": -0.016666666666666607,
																				"dt": 0.1859797889977044
																			}
																		},
																		{
																			"time": 1.8830236386869217,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.21660225272857833
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.21660225272857833
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
																"power": 2
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
																	0.2,
																	0.5372549019607843
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "amount",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0.7474241760179385,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 1.1131621254534134,
																			"value": 0.25,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.00757687696833834,
																				"dt": -0.06406311509621984
																			},
																			"nextHandle": {
																				"dv": -0.03333333333333333,
																				"dt": 0.28150569319861213
																			}
																		},
																		{
																			"time": 1.8370674432590945,
																			"value": 1,
																			"mode": 0
																		}
																	]
																}
															]
														}
													]
												},
												{
													"type": "curve",
													"name": "scale.z",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.6860182747063535,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 1.2689047981708326e-16,
																"dt": -0.185376816581116
															},
															"nextHandle": {
																"dv": 0.000500000000000167,
																"dt": 0.48216615264372065
															}
														},
														{
															"time": 1.228209093950878,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.5829003056829016,
															"value": 1.8000000000000012,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.22752087249572386
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.22752087249572386
															}
														}
													]
												}
											]
										},
										{
											"type": "lookAt",
											"name": "lookAt_FlareLarge",
											"x": 5.551115123125783e-17,
											"z": 2.3073400000000004,
											"scaleX": 0.65,
											"scaleY": 0.65,
											"scaleZ": 0.65,
											"rotationZ": -11.181673123270484,
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
													"scaleX": 6,
													"scaleY": 40,
													"scaleZ": 2.05,
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
																"texture": "Fx/Gradients/Cyl05v_A.png",
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
																			"time": 0.7043574581620435,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.16476603413671187
																			}
																		},
																		{
																			"time": 1.0476860928259744,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 1.1982918773345965e-17,
																				"dt": -0.02
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.1631845379661978
																			}
																		},
																		{
																			"time": 2.194060547436542,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.16908525475904299
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.16908525475904299
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
																"useSourceUVs": true,
																"onDecal": false,
																"wrap": true,
																"invert": false,
																"replace": false,
																"alpha": 0.65,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_circle2.png"
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
																"wrap": true,
																"invert": false,
																"replace": false,
																"alpha": 0.8,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Gradients/Cyl04v_A.jpg"
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
																"power": 2
															},
															"isInstance": true
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
																				"color": -151464545
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
																	0.984313725490196,
																	0.2392156862745098,
																	0.4666666666666667
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "amount",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0.038629337680399445,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.5349729578631159,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.00757687696833834,
																				"dt": -0.06406311509621984
																			},
																			"nextHandle": {
																				"dv": -0.03333333333333333,
																				"dt": 0.28150569319861213
																			}
																		},
																		{
																			"time": 1.2238383378592481,
																			"value": 1,
																			"mode": 0
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
											"name": "advancedDecal_Green",
											"enabled": false,
											"x": 5.551115123125783e-17,
											"z": -0.89563,
											"scaleX": 5,
											"scaleY": 5,
											"scaleZ": 2.23,
											"albedoMap": "Fx/Alphas/T_circle2.png",
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
																	"time": 0.7043574581620435,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.16476603413671187
																	}
																},
																{
																	"time": 1.0476860928259744,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.1982918773345965e-17,
																		"dt": -0.02
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.1631845379661978
																	}
																},
																{
																	"time": 2.194060547436542,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.16908525475904299
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.16908525475904299
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
															0.38823529411764707,
															0.8941176470588235
														]
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
							"name": "Passive",
							"editorOnly": true,
							"x": -1.1102230246251565e-16,
							"y": 6.938893903907228e-18,
							"scaleX": 0.9,
							"scaleY": 0.9,
							"scaleZ": 0.9,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt",
									"x": 0.05628,
									"y": 0.00233,
									"z": -0.02737,
									"scaleX": 0.9,
									"scaleY": 0.9,
									"scaleZ": 0.9,
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
											"name": "PinkFlames",
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
															"emissive": 2,
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
															0.9529411764705882,
															0.32156862745098036,
															0.615686274509804
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"enabled": false,
															"keys": [
																{
																	"time": 0.9243667237982353,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.2254056951501509,
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
													"time": 1.1314451182330614,
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
													"time": 1.395365018925911,
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
								}
							]
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.Skill.Passive",
							"target": "FXAnimation.FXRoot.Chara.Male01_HarkonnenRabban.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ"
						},
						{
							"type": "emitter",
							"name": "Shockwave",
							"props": {
								"warmUpTime": -1.18,
								"emitType": "Burst",
								"instScale": 8,
								"instRotation_rand": [
									0,
									0,
									360
								]
							},
							"z": 0.1,
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
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.5,
												"sandColorSet": false,
												"envBlend": 0.5,
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
												"width": 0.23,
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
											"value": 0.21666666666666667,
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
						}
					]
				}
			]
		}
	]
}