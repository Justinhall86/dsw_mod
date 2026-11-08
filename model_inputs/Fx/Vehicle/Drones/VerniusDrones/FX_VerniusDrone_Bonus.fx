{
	"type": "fx",
	"cullingRadius": 30,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"enabled": false,
			"editorOnly": true,
			"locked": true,
			"z": -1,
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
			"enabled": false,
			"children": [
				{
					"type": "model",
					"name": "Railgun",
					"source": "Vehicle/Vernius/DroneRailGun/DroneRailGun.fbx",
					"editorOnly": true,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Kraken/Anim_Kraken_Idle.fbx"
						}
					]
				},
				{
					"type": "model",
					"name": "Railgun",
					"source": "Vehicle/Vernius/AutomatedMilitia/AutomatedMilitia.fbx",
					"enabled": false,
					"editorOnly": true,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Kraken/Anim_Kraken_Idle.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "Test",
					"y": 0.11780249999999981,
					"z": 0.08382749999999999,
					"scaleX": 1.5,
					"scaleY": 1.5,
					"scaleZ": 1.5,
					"children": [
						{
							"type": "object",
							"name": "FlashDecals",
							"y": 0.35340749999999943,
							"z": 0.001482499999999956,
							"scaleX": 1.5,
							"scaleY": 1.5,
							"scaleZ": 0.5,
							"rotationX": 90,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Purple",
									"scaleX": 4,
									"scaleY": 4,
									"scaleZ": 4,
									"rotationZ": 90,
									"albedoMap": "Fx/Gradients/circGrad05.jpg",
									"fadePower": 3,
									"emissive": 1,
									"renderMode": "AfterTonemapping",
									"children": [
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
															"time": 0.25,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.2509382163368004,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.0490674210599766,
															"value": 0,
															"prevHandle": {
																"dv": -0.003251919125525249,
																"dt": -0.42266141964660975
															},
															"nextHandle": {
																"dv": -3.9315606214746946e-17,
																"dt": 0.026052550476966443
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
													0.6901960784313725,
													0.5098039215686274,
													0.9882352941176471
												]
											}
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "advancedDecal_White",
							"y": 1.1743,
							"z": 0.16617,
							"scaleX": 6,
							"scaleY": 6,
							"scaleZ": 3.5,
							"rotationX": 90,
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
										"alpha": 0.5
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
													"time": 1.1,
													"value": 1,
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
											0.3137254901960784,
											0.1568627450980392,
											1
										]
									}
								},
								{
									"type": "shader",
									"name": "AlphaCycle",
									"source": "shaders/AlphaCycle.hx",
									"props": {
										"minAlpha": 0.5,
										"maxAlpha": 1,
										"frequency": 0.5
									}
								}
							]
						},
						{
							"type": "lookAt",
							"name": "lookAt_FlareWhite",
							"enabled": false,
							"y": -0.11780249999999981,
							"z": -0.08382749999999999,
							"scaleX": 0.8,
							"scaleY": 0.8,
							"scaleZ": 0.8,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								0
							],
							"children": [
								{
									"type": "object",
									"name": "TestAnticipation/flammes",
									"rotationY": 90,
									"children": [
										{
											"type": "model",
											"name": "FX_Mesh_Wormsign",
											"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign.fbx",
											"enabled": false,
											"scaleX": 11.999999999999998,
											"scaleY": 11.999999999999998,
											"scaleZ": 12,
											"rotationZ": 29.999999999999993,
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
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
													"children": [
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
																"texture": "Fx/Gradients/Cyl01u_A.jpg"
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
																			"prevHandle": {
																				"dv": 0.06801310782103939,
																				"dt": -0.49993702374179955
																			},
																			"nextHandle": {
																				"dv": -0.01666666666666672,
																				"dt": 0.1225099689747229
																			}
																		},
																		{
																			"time": 0.2001840863976259,
																			"value": 1,
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
																"progress": 0.18,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/Water_01.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.1,
																	0
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"enabled": false,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.3,
																			"value": 1,
																			"mode": 2
																		}
																	],
																	"loop": true
																},
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.45,
																			"value": 0,
																			"mode": 2
																		}
																	],
																	"loop": true
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
															"name": "DissolveMap_Gradient",
															"source": "shaders/DissolveMap.hx",
															"props": {
																"useSourceUVs": false,
																"useScale": true,
																"wrap": true,
																"progress": 0.23,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 3,
																"uvScaleY": 0.5,
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
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.06666666666666667
																			}
																		},
																		{
																			"time": 0.2,
																			"value": 0.23,
																			"mode": 2
																		},
																		{
																			"time": 0.415051602115371,
																			"value": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.07168386737179033
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.07168386737179033
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
																				"position": 0.4296875,
																				"color": -46254969
																			},
																			{
																				"position": 1,
																				"color": -242713346
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
										},
										{
											"type": "model",
											"name": "FX_Mesh_Wormsign",
											"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign.fbx",
											"scaleX": 11.999999999999998,
											"scaleY": 11.999999999999998,
											"scaleZ": 12,
											"rotationZ": 29.999999999999993,
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
														"texture": "Fx/Gradients/Cyl01u_A.jpg"
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
																	"prevHandle": {
																		"dv": 0.06801310782103939,
																		"dt": -0.49993702374179955
																	},
																	"nextHandle": {
																		"dv": -0.01666666666666672,
																		"dt": 0.1225099689747229
																	}
																},
																{
																	"time": 0.2001840863976259,
																	"value": 1,
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
														"progress": 0.18,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 0.5,
														"texture": "Fx/noise/Water_01.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.1,
															-0.25
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "uvShift.y",
															"enabled": false,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.9,
																	"value": 0,
																	"mode": 2
																}
															],
															"loop": true
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
													"name": "DissolveMap_Gradient",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.23,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 3,
														"uvScaleY": 0.5,
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
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.06666666666666667
																	}
																},
																{
																	"time": 0.2,
																	"value": 0.23,
																	"mode": 2
																},
																{
																	"time": 0.415051602115371,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.07168386737179033
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.07168386737179033
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
																		"position": 0.4296875,
																		"color": -46254969
																	},
																	{
																		"position": 1,
																		"color": -242713346
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
											"type": "model",
											"name": "FX_Mesh_Wormsign",
											"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign.fbx",
											"scaleX": 11.999999999999998,
											"scaleY": 11.999999999999998,
											"scaleZ": 12,
											"rotationZ": -113.6,
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
														"texture": "Fx/Gradients/Cyl01u_A.jpg"
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
																	"prevHandle": {
																		"dv": 0.06801310782103939,
																		"dt": -0.49993702374179955
																	},
																	"nextHandle": {
																		"dv": -0.01666666666666672,
																		"dt": 0.1225099689747229
																	}
																},
																{
																	"time": 0.2001840863976259,
																	"value": 1,
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
														"progress": 0.18,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 0.5,
														"texture": "Fx/noise/Water_01.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.08,
															-0.5
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "uvShift.y",
															"enabled": false,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.9,
																	"value": 0,
																	"mode": 2
																}
															],
															"loop": true
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
													"name": "DissolveMap_Gradient",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.23,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 3,
														"uvScaleY": 0.5,
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
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.06666666666666667
																	}
																},
																{
																	"time": 0.2,
																	"value": 0.23,
																	"mode": 2
																},
																{
																	"time": 0.415051602115371,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.07168386737179033
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.07168386737179033
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
																		"position": 0.4296875,
																		"color": -46254969
																	},
																	{
																		"position": 1,
																		"color": -242713346
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
											"type": "model",
											"name": "FX_Mesh_Wormsign",
											"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign.fbx",
											"enabled": false,
											"scaleX": 7,
											"scaleY": 7,
											"scaleZ": 7,
											"rotationZ": 29.999999999999993,
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
															"emissive": 5
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
													"children": [
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
																"alpha": 0.5,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Gradients/Cyl01u_A.jpg"
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
																			"prevHandle": {
																				"dv": 0.06801310782103939,
																				"dt": -0.49993702374179955
																			},
																			"nextHandle": {
																				"dv": -0.01666666666666672,
																				"dt": 0.1225099689747229
																			}
																		},
																		{
																			"time": 0.2001840863976259,
																			"value": 1,
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
																"progress": 0.18,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 3,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/Water_01.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.1,
																	0
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"enabled": false,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.3,
																			"value": 1,
																			"mode": 2
																		}
																	],
																	"loop": true
																},
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.45,
																			"value": 1,
																			"mode": 2
																		}
																	],
																	"loop": true
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
															"name": "DissolveMap_Gradient",
															"source": "shaders/DissolveMap.hx",
															"enabled": false,
															"props": {
																"useSourceUVs": false,
																"useScale": true,
																"wrap": true,
																"progress": 1,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 3,
																"uvScaleY": 0.5,
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
																			"value": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.06666666666666667
																			}
																		},
																		{
																			"time": 0.2,
																			"value": 0.23,
																			"mode": 2
																		},
																		{
																			"time": 0.415051602115371,
																			"value": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.07168386737179033
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.07168386737179033
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
																"useScale": true,
																"wrap": true,
																"progress": 0.23,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 2,
																"uvScaleY": 0.5,
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
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.06666666666666667
																			}
																		},
																		{
																			"time": 0.2,
																			"value": 0.23,
																			"mode": 2
																		},
																		{
																			"time": 0.415051602115371,
																			"value": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.07168386737179033
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.07168386737179033
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
																				"position": 0.4296875,
																				"color": -46254969
																			},
																			{
																				"position": 1,
																				"color": -242713346
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
																	0.7019607843137254,
																	0.38431372549019605,
																	0.996078431372549
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
																	0.5568627450980392,
																	0.38431372549019605,
																	0.996078431372549
																]
															}
														}
													]
												}
											]
										},
										{
											"type": "model",
											"name": "FX_Mesh_Wormsign",
											"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign.fbx",
											"enabled": false,
											"scaleX": 8,
											"scaleY": 8,
											"scaleZ": 8,
											"rotationZ": 29.999999999999993,
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
															"drawOrder": "100",
															"emissive": 15
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
													"children": [
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
																"alpha": 12,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Gradients/Cyl01u_A.jpg"
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
																			"prevHandle": {
																				"dv": 0.06801310782103939,
																				"dt": -0.49993702374179955
																			},
																			"nextHandle": {
																				"dv": -0.01666666666666672,
																				"dt": 0.1225099689747229
																			}
																		},
																		{
																			"time": 0.2001840863976259,
																			"value": 1,
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
																"progress": 0.18,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 8,
																"uvScaleY": 1,
																"texture": "Fx/noise/Water_01.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.1,
																	0
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.45,
																			"value": 0,
																			"mode": 2
																		}
																	],
																	"loop": true
																}
															]
														},
														{
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"enabled": false,
															"props": {
																"useSourceUVs": true,
																"useScale": true,
																"wrap": true,
																"progress": 0.3,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 3,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/T_ElecNoise01.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.1,
																	0
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.45,
																			"value": 0,
																			"mode": 2
																		}
																	],
																	"loop": true
																}
															]
														},
														{
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"enabled": false,
															"props": {
																"useSourceUVs": true,
																"useScale": true,
																"wrap": true,
																"progress": 0.26,
																"saturation": 1,
																"width": 0.77,
																"uvScaleX": 2,
																"uvScaleY": 2,
																"texture": "Fx/noise/Water_01.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.1,
																	0
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.45,
																			"value": 0,
																			"mode": 2
																		}
																	],
																	"loop": true
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
																	0.054901960784313725,
																	0.054901960784313725,
																	0.07058823529411765
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
																	0.6470588235294118,
																	0.6,
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
																	0.6549019607843137,
																	0.4823529411764706,
																	1
																]
															}
														},
														{
															"type": "shader",
															"name": "DissolveMap_Gradient",
															"source": "shaders/DissolveMap.hx",
															"props": {
																"useSourceUVs": false,
																"useScale": true,
																"wrap": true,
																"progress": 0.17,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 3,
																"uvScaleY": 0.5,
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
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.06666666666666667
																			}
																		},
																		{
																			"time": 0.2,
																			"value": 0.23,
																			"mode": 2
																		},
																		{
																			"time": 0.415051602115371,
																			"value": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.07168386737179033
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.07168386737179033
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
																"progress": 0.18,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/Water_01.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.1,
																	0
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"enabled": false,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.3,
																			"value": 1,
																			"mode": 2
																		}
																	],
																	"loop": true
																},
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.45,
																			"value": 0,
																			"mode": 2
																		}
																	],
																	"loop": true
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "model",
											"name": "FX_Mesh_Wormsign_elec01",
											"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign.fbx",
											"enabled": false,
											"scaleX": 8,
											"scaleY": 8,
											"scaleZ": 8,
											"rotationZ": 29.999999999999993,
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
															"drawOrder": "100",
															"emissive": 25
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
													"children": [
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
																"alpha": 12,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Gradients/Cyl01u_A.jpg"
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
																			"prevHandle": {
																				"dv": 0.06801310782103939,
																				"dt": -0.49993702374179955
																			},
																			"nextHandle": {
																				"dv": -0.01666666666666672,
																				"dt": 0.1225099689747229
																			}
																		},
																		{
																			"time": 0.2001840863976259,
																			"value": 1,
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
																"progress": 0.18,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 8,
																"uvScaleY": 1,
																"texture": "Fx/noise/Water_01.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.1,
																	0
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.45,
																			"value": 0,
																			"mode": 2
																		}
																	],
																	"loop": true
																}
															]
														},
														{
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"enabled": false,
															"props": {
																"useSourceUVs": true,
																"useScale": true,
																"wrap": true,
																"progress": 0.3,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 3,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/T_ElecNoise01.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.1,
																	0
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.45,
																			"value": 0,
																			"mode": 2
																		}
																	],
																	"loop": true
																}
															]
														},
														{
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"enabled": false,
															"props": {
																"useSourceUVs": true,
																"useScale": true,
																"wrap": true,
																"progress": 0.26,
																"saturation": 1,
																"width": 0.77,
																"uvScaleX": 2,
																"uvScaleY": 2,
																"texture": "Fx/noise/Water_01.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.1,
																	0
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.45,
																			"value": 0,
																			"mode": 2
																		}
																	],
																	"loop": true
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
																	0.054901960784313725,
																	0.054901960784313725,
																	0.07058823529411765
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
																	0.6470588235294118,
																	0.6,
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
																	0.6549019607843137,
																	0.4823529411764706,
																	1
																]
															}
														},
														{
															"type": "shader",
															"name": "DissolveMap_Gradient",
															"source": "shaders/DissolveMap.hx",
															"props": {
																"useSourceUVs": false,
																"useScale": true,
																"wrap": true,
																"progress": 0.17,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 3,
																"uvScaleY": 0.5,
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
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.06666666666666667
																			}
																		},
																		{
																			"time": 0.2,
																			"value": 0.23,
																			"mode": 2
																		},
																		{
																			"time": 0.415051602115371,
																			"value": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.07168386737179033
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.07168386737179033
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
																"progress": 0.18,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/Water_01.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.1,
																	0
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"enabled": false,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.3,
																			"value": 1,
																			"mode": 2
																		}
																	],
																	"loop": true
																},
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.45,
																			"value": 0,
																			"mode": 2
																		}
																	],
																	"loop": true
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "model",
											"name": "FX_Mesh_Wormsign",
											"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign.fbx",
											"enabled": false,
											"scaleX": 8,
											"scaleY": 8,
											"scaleZ": 8,
											"rotationZ": 29.999999999999993,
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
															"drawOrder": "100",
															"emissive": 25
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
													"children": [
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
																"alpha": 12,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Gradients/Cyl01u_A.jpg"
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
																			"prevHandle": {
																				"dv": 0.06801310782103939,
																				"dt": -0.49993702374179955
																			},
																			"nextHandle": {
																				"dv": -0.01666666666666672,
																				"dt": 0.1225099689747229
																			}
																		},
																		{
																			"time": 0.2001840863976259,
																			"value": 1,
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
															"enabled": false,
															"props": {
																"useSourceUVs": true,
																"useScale": true,
																"wrap": true,
																"progress": 0.26,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 5,
																"uvScaleY": 0.5,
																"texture": "Fx/Alphas/T_ElectricArc_1x4_13.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.1,
																	0
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.9,
																			"value": 0,
																			"mode": 2
																		}
																	],
																	"loop": true
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
																"progress": 0.25,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 8,
																"uvScaleY": 2,
																"texture": "Fx/Alphas/T_Wave02.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.1,
																	0
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"enabled": false,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.9,
																			"value": 0,
																			"mode": 2
																		}
																	],
																	"loop": true
																},
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.45,
																			"value": 0,
																			"mode": 2
																		}
																	],
																	"loop": true
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
																	0.054901960784313725,
																	0.054901960784313725,
																	0.07058823529411765
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
																	0.6470588235294118,
																	0.6,
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
																	0.6549019607843137,
																	0.4823529411764706,
																	1
																]
															}
														},
														{
															"type": "shader",
															"name": "DissolveMap_Gradient",
															"source": "shaders/DissolveMap.hx",
															"props": {
																"useSourceUVs": false,
																"useScale": true,
																"wrap": true,
																"progress": 0.17,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 3,
																"uvScaleY": 0.5,
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
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.06666666666666667
																			}
																		},
																		{
																			"time": 0.2,
																			"value": 0.23,
																			"mode": 2
																		},
																		{
																			"time": 0.415051602115371,
																			"value": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.07168386737179033
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.07168386737179033
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
																"progress": 0.18,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/Water_01.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.1,
																	0
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"enabled": false,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.3,
																			"value": 1,
																			"mode": 2
																		}
																	],
																	"loop": true
																},
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.45,
																			"value": 0,
																			"mode": 2
																		}
																	],
																	"loop": true
																}
															]
														},
														{
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"enabled": false,
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
																			"value": 1
																		},
																		{
																			"time": 0.5,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.16666666666666666
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": -0.5
																			}
																		}
																	],
																	"loop": true
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
											"enabled": false,
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
																"position": 0.83984375,
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
											"type": "polygon",
											"name": "polygon",
											"enabled": false,
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
															"culling": "Back",
															"colorMask": 255,
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_circle2.png"
													}
												},
												{
													"type": "shader",
													"name": "GradientMap",
													"source": "shaders/GradientMap.hx",
													"enabled": false,
													"props": {
														"USE_ALPHA": true,
														"gradient": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0.4296875,
																		"color": -46254969
																	},
																	{
																		"position": 1,
																		"color": -242713346
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
															0.5333333333333333,
															0.48627450980392156,
															0.996078431372549
														]
													}
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 2,
														"power": 0.8
													}
												},
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0,
															"value": 0.2,
															"mode": 2
														},
														{
															"time": 0.25,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5,
															"value": 0.2,
															"mode": 2
														}
													],
													"loop": true
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
										"power": 0.8
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
													"time": 0.2886419504237939,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.4,
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
					"type": "constraint",
					"name": "constraint",
					"enabled": false,
					"object": "FXAnimation.FXRoot.Test",
					"target": "FXAnimation.FXRoot.Railgun.root.JNT_Root"
				}
			]
		}
	]
}