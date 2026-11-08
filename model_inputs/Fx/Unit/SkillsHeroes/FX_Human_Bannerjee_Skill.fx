{
	"type": "fx",
	"duration": 2.5,
	"cullingRadius": 150,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"scaleX": 100,
			"scaleY": 100,
			"scaleZ": 100,
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
			"scaleX": 0.92,
			"scaleY": 0.92,
			"scaleZ": 0.92,
			"children": [
				{
					"type": "object",
					"name": "Bannerjee",
					"editorOnly": true,
					"children": [
						{
							"type": "model",
							"name": "male01_SmugglerBannerjee",
							"source": "Character/Smuggler/Unit/Bannerjee/male01_SmugglerBannerjee.fbx",
							"scaleX": 2.2,
							"scaleY": 2.2,
							"scaleZ": 2.2,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Male01/Bannerjee/Anim_Male01_Bannerjee_Skill.fbx"
								}
							]
						},
						{
							"type": "model",
							"name": "BannerjeeWeapon",
							"source": "Character/Smuggler/Weapon/BannerjeeWeapon/Bannerjee_Weapon.fbx",
							"scaleY": 1.0000000000000007,
							"scaleZ": 1.0000000000000007,
							"rotationX": -89.99999999999999
						},
						{
							"type": "constraint",
							"name": "constraint",
							"editorOnly": true,
							"object": ".FXRoot.Bannerjee.BannerjeeWeapon",
							"target": ".FXRoot.Bannerjee.male01_SmugglerBannerjee.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Weapon"
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
					"name": "Skill",
					"children": [
						{
							"type": "object",
							"name": "Call",
							"enabled": false,
							"children": [
								{
									"type": "object",
									"name": "Drone02_appear",
									"y": -0.05161,
									"rotationX": -10.8,
									"children": [
										{
											"type": "object",
											"name": "UI_Window",
											"x": 0.01064,
											"y": -0.11,
											"z": 0.04364,
											"rotationY": 13.7,
											"children": [
												{
													"type": "object",
													"name": "circles",
													"y": 0.03176,
													"scaleX": 1.5,
													"scaleY": 1.5,
													"scaleZ": 1.5,
													"children": [
														{
															"type": "polygon",
															"name": "fond",
															"scaleX": 0.35,
															"scaleY": 0.36,
															"scaleZ": 0.35,
															"rotationX": 89.99999999999999,
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
																			"drawOrder": "100",
																			"emissive": 0.25
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
																		"alpha": 0.5,
																		"uScale": 1,
																		"vScale": 1,
																		"uOffset": 0,
																		"vOffset": 0,
																		"texture": "Fx/Alphas/T_UI_Round_128.png"
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
																		"progress": 0.63,
																		"saturation": 0,
																		"width": 0.89,
																		"uvScaleX": 0.5,
																		"uvScaleY": 0.5,
																		"texture": "Fx/noise/Lines01.png",
																		"uvShift": [
																			0,
																			0
																		],
																		"uvShiftSpeed": [
																			0,
																			0.05
																		]
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
																		"progress": 0.41,
																		"saturation": 1,
																		"width": 1,
																		"uvScaleX": 1,
																		"uvScaleY": 1,
																		"texture": "Fx/Alphas/Dust06.png",
																		"uvShift": [
																			0,
																			0
																		],
																		"uvShiftSpeed": [
																			0,
																			0.1
																		]
																	}
																}
															]
														},
														{
															"type": "polygon",
															"name": "round",
															"scaleX": 0.29999999999999993,
															"scaleY": 0.29999999999999993,
															"scaleZ": 0.3,
															"rotationX": 89.99999999999997,
															"rotationY": 64.23011126564673,
															"rotationZ": -7.315691768701423e-15,
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
																			"emissive": 1,
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
																		"texture": "Fx/Alphas/T_Circle_4.png"
																	}
																},
																{
																	"type": "curve",
																	"name": "rotation.y",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 8,
																			"value": 1,
																			"mode": 2
																		}
																	],
																	"loop": true
																},
																{
																	"type": "shader",
																	"name": "DissolveMap",
																	"source": "shaders/DissolveMap.hx",
																	"props": {
																		"useSourceUVs": true,
																		"useScale": false,
																		"wrap": true,
																		"progress": 0.73,
																		"saturation": 1,
																		"width": 1,
																		"uvScaleX": 1,
																		"uvScaleY": 1,
																		"texture": "Fx/Gradients/cGrad.png",
																		"uvShift": [
																			0,
																			0
																		],
																		"uvShiftSpeed": [
																			0,
																			0
																		]
																	}
																}
															]
														},
														{
															"type": "polygon",
															"name": "round",
															"scaleX": 0.40000000000000013,
															"scaleY": 0.40000000000000013,
															"scaleZ": 0.40000000000000013,
															"rotationX": 89.99999999999997,
															"rotationY": -121.22988873435328,
															"rotationZ": -6.134463682916234e-15,
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
																		"texture": "Fx/Alphas/T_Circle_4.png"
																	}
																},
																{
																	"type": "curve",
																	"name": "rotation.y",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 8,
																			"value": 1,
																			"mode": 2
																		}
																	],
																	"loop": true
																},
																{
																	"type": "shader",
																	"name": "DissolveMap",
																	"source": "shaders/DissolveMap.hx",
																	"props": {
																		"useSourceUVs": true,
																		"useScale": false,
																		"wrap": true,
																		"progress": 0.92,
																		"saturation": 1,
																		"width": 1,
																		"uvScaleX": 1,
																		"uvScaleY": 1,
																		"texture": "Fx/Gradients/cGrad.png",
																		"uvShift": [
																			0,
																			0
																		],
																		"uvShiftSpeed": [
																			0,
																			0
																		]
																	}
																}
															]
														},
														{
															"type": "polygon",
															"name": "round",
															"scaleX": 0.19999999999999998,
															"scaleY": 0.19999999999999998,
															"scaleZ": 0.2,
															"rotationX": 89.99999999999999,
															"rotationY": 172.9068150208623,
															"rotationZ": 8.012710924327613e-16,
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
																			"emissive": 1,
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
																		"texture": "Fx/Alphas/T_Circle_4.png"
																	}
																},
																{
																	"type": "curve",
																	"name": "rotation.y",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 6,
																			"value": 1,
																			"mode": 2
																		}
																	],
																	"loop": true
																},
																{
																	"type": "shader",
																	"name": "DissolveMap",
																	"source": "shaders/DissolveMap.hx",
																	"props": {
																		"useSourceUVs": true,
																		"useScale": false,
																		"wrap": true,
																		"progress": 0.92,
																		"saturation": 1,
																		"width": 1,
																		"uvScaleX": 1,
																		"uvScaleY": 1,
																		"texture": "Fx/Gradients/cGrad.png",
																		"uvShift": [
																			0,
																			0
																		],
																		"uvShiftSpeed": [
																			0,
																			0
																		]
																	}
																}
															]
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
																			"time": 0.14393415988178293,
																			"value": 0,
																			"prevHandle": {
																				"dv": 3.308928844191479e-16,
																				"dt": -0.5001535122639292
																			},
																			"nextHandle": {
																				"dv": -0.003359699606265365,
																				"dt": 0.08177576806066916
																			}
																		},
																		{
																			"time": 0.2257099279424521,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1.1930097402399282,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1.4443503538007438,
																			"value": -0.0008439983003487583,
																			"prevHandle": {
																				"dv": 0.008937403840838631,
																				"dt": -0.1882255615417212
																			},
																			"nextHandle": {
																				"dv": -0.022578241566528132,
																				"dt": 0.49996772006839985
																			}
																		}
																	]
																}
															]
														},
														{
															"type": "curve",
															"name": "scale.x",
															"keys": [
																{
																	"time": 0.08418541032132631,
																	"value": 0,
																	"prevHandle": {
																		"dv": -0.02232458566420491,
																		"dt": -0.49996844131659685
																	},
																	"nextHandle": {
																		"dv": 0.008880039431014008,
																		"dt": 0.16921287855770906
																	}
																},
																{
																	"time": 0.31464312214564133,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.1951137202100897,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.446151310834246,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0.0034108800509956017,
																		"dt": -0.1804950560053955
																	},
																	"nextHandle": {
																		"dv": -4.866779541230375e-16,
																		"dt": 0.5
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
																	0.43529411764705883,
																	0.7176470588235294,
																	0.984313725490196
																]
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
												"instStretch": [
													10,
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
												"warmUpTime": -0.1,
												"emitType": "Burst",
												"instScale": 0.4,
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
											"y": -0.05,
											"scaleX": 0.10000000000000003,
											"scaleY": 0.10000000000000003,
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
											"type": "advancedDecal",
											"name": "advancedDecal_Blue",
											"x": -0.01744,
											"y": 0.01826,
											"z": 0.00265,
											"scaleX": 0.4545454545454545,
											"scaleY": 0.4545454545454542,
											"scaleZ": 0.45454545454545414,
											"rotationX": 134.8,
											"rotationY": -74.1,
											"rotationZ": -35.6,
											"albedoMap": "Fx/Gradients/circGrad05.jpg",
											"emissive": 1,
											"renderMode": "BeforeTonemapping",
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
															"emissive": 1
														}
													}
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 0.4
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keys": [
																{
																	"time": 0.2201822095477777,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.27557692361186875,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.1800609958847892,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.2596441964598764,
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
															0.43529411764705883,
															0.7176470588235294,
															0.984313725490196
														]
													}
												},
												{
													"type": "shader",
													"name": "AlphaCycle",
													"source": "shaders/AlphaCycle.hx",
													"props": {
														"minAlpha": 0.2,
														"maxAlpha": 1,
														"frequency": 4.2
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
							"name": "FlashDecalsSmall",
							"z": 2.21655,
							"rotationZ": 90,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Black",
									"x": 1.59999,
									"y": 0.51758,
									"z": 0.52264,
									"scaleX": 1.5,
									"scaleY": 1.5,
									"scaleZ": 0.8,
									"rotationZ": 19.1,
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
															"time": 0.13202356228533044,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.14738553289489978,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20824573104401078,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.1626572719640051,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.1784757382492297,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2496588365327401,
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
									"name": "advancedDecal_White",
									"x": 1.59999,
									"y": 0.51758,
									"z": 0.52264,
									"scaleX": 1.5,
									"scaleY": 1.5,
									"scaleZ": 0.8,
									"rotationZ": 19.1,
									"albedoMap": "Fx/Gradients/circGrad05.jpg",
									"emissive": 5,
									"renderMode": "BeforeTonemapping",
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
															"time": 0.18766836742809054,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.20311041207049413,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.432024560367141,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": -0.050000000000000044,
																"dt": -0.19927400323396371
															},
															"nextHandle": {
																"dv": 0.007806396484374922,
																"dt": 0.12390995834176133
															}
														},
														{
															"time": 1.2339668055454607,
															"value": 0
														},
														{
															"time": 1.2443581049605803,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.4495862684091936,
															"value": 0,
															"prevHandle": {
																"dv": -0.0003187096637229381,
																"dt": -0.14288036695789508
															},
															"nextHandle": {
																"dv": -3.8302756332946617e-16,
																"dt": 0.5
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
											"type": "material",
											"name": "material",
											"enabled": false,
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 2
												}
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "emitter_Ondes",
							"props": {
								"lifeTime": 0.8,
								"alignLockAxis": "Z",
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
								"randomColor1": [
									0.48627450980392156,
									0.48627450980392156,
									0.48627450980392156,
									1
								],
								"warmUpTime": -0.2,
								"emitType": "Burst",
								"instScale": 13,
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
								},
								"burstCount": 5,
								"burstDelay": 0.22
							},
							"x": -0.64795,
							"y": 1.36148,
							"z": 3.02629,
							"scaleX": 0.2200000000000002,
							"scaleY": 0.2200000000000002,
							"scaleZ": 0.22000000000000006,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleY": 1.1,
									"scaleZ": 1.1,
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
													"emissive": 0.5
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
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_LensFlare_07.png"
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
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": -0.001803596421044329,
																"dt": -0.7344005148419487
															},
															"nextHandle": {
																"dv": -5.136536362253007e-16,
																"dt": 0.5
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DissolveMap_Gradient",
											"source": "shaders/DissolveMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 1,
												"saturation": 0.5,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 0.5,
												"texture": "Fx/Gradients/Dissolve_ChockWave.png",
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
													"keyMode": 1,
													"keys": [
														{
															"time": 0.6362655466405217,
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
															"time": 1.1600118732140337,
															"value": 1,
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
											"type": "shader",
											"name": "DissolveMap_Gradient",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.27,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 0.5,
												"texture": "Fx/Gradients/Cyl05v_A01.png",
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
													0.3764705882352941,
													0.7607843137254902,
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
											"value": 0,
											"mode": 2
										},
										{
											"time": 1,
											"value": 1,
											"prevHandle": {
												"dv": -0.011878996871929726,
												"dt": -0.6104756850412305
											},
											"nextHandle": {
												"dv": 0.006825528843833996,
												"dt": 0.3513977397384393
											}
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "subFX",
					"name": "FX_Human_Bannerjee_Skill_Ally",
					"source": "Fx/Unit/SkillsHeroes/FX_Human_Bannerjee_Skill_Ally.fx",
					"enabled": false,
					"y": 6.61818,
					"scaleX": 0.4,
					"scaleY": 0.4,
					"scaleZ": 0.4
				},
				{
					"type": "subFX",
					"name": "FX_Human_Bannerjee_Skill_Ally",
					"source": "Fx/Unit/SkillsHeroes/FX_Human_Bannerjee_Skill_Ally.fx",
					"enabled": false,
					"y": -5.76684,
					"scaleX": 0.4,
					"scaleY": 0.4,
					"scaleZ": 0.4,
					"time": 0.1,
					"loop": null
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": ".FXRoot.Skill.Call",
					"target": ".FXRoot.Bannerjee.male01_SmugglerBannerjee.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ"
				}
			]
		}
	]
}