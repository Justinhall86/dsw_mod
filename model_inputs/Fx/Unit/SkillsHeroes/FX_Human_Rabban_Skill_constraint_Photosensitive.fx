{
	"type": "fx",
	"cullingRadius": 50,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"scaleX": 75,
			"scaleY": 100,
			"scaleZ": 75,
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
			"name": "Rabban",
			"scaleX": 3,
			"scaleY": 3,
			"scaleZ": 3,
			"children": [
				{
					"type": "model",
					"name": "Male01_HarkonnenRabban",
					"source": "Character/Harkonnen/Unit/Rabban/Male01_HarkonnenRabban.fbx",
					"scaleX": 0.9999999999999999,
					"scaleY": 0.9999999999999999,
					"scaleZ": 0.9999999999999999,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Male01/Rabban/Anim_Male01_Rabban_Skill.fbx"
						}
					]
				}
			]
		},
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "Passsif",
					"enabled": false,
					"children": [
						{
							"type": "lookAt",
							"name": "lookAt_verticalstuff",
							"enabled": false,
							"x": -0.00176,
							"y": 0.25685,
							"z": -0.00028,
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
									"z": 0.65803,
									"scaleY": 2,
									"scaleZ": 2,
									"rotationX": -90,
									"rotationZ": -90,
									"kind": 0,
									"args": [
										5
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
													"emissive": 5,
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
												"alpha": 10,
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
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.7,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/T_Fire.png",
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
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.08,
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
											}
										},
										{
											"type": "shader",
											"name": "UVDistortion",
											"source": "shaders/UVDistortion.hx",
											"props": {
												"noiseTexture": "Fx/noise/T_Fire.png",
												"directionalNoise": true,
												"intensity": 0.57,
												"scrollSpeed": [
													0,
													0.25
												],
												"scale": [
													1.25,
													0.5
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
											"name": "VertexDisplacement",
											"source": "shaders/VertexDisplacement.hx",
											"enabled": false,
											"props": {
												"X": true,
												"Y": true,
												"Z": true,
												"texScaleX": 1,
												"texScaleY": 0.5,
												"tex": "Fx/Gradients/Dissolve_ShieldBase.png",
												"intensity": 2,
												"scrollSpeed": [
													0,
													-0.1
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
													0.8156862745098039,
													0.13333333333333333,
													0
												]
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "polygon",
									"name": "WhiteFlames",
									"y": -0.03953,
									"z": 0.36352,
									"scaleY": 2,
									"scaleZ": 2,
									"rotationX": -90,
									"rotationZ": 90,
									"kind": 0,
									"args": [
										5
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
													"emissive": 5,
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
												"alpha": 10,
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
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.7,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/T_Fire.png",
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
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.08,
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
											}
										},
										{
											"type": "shader",
											"name": "UVDistortion",
											"source": "shaders/UVDistortion.hx",
											"props": {
												"noiseTexture": "Fx/noise/T_Fire.png",
												"directionalNoise": true,
												"intensity": 0.57,
												"scrollSpeed": [
													0,
													0.22
												],
												"scale": [
													1.25,
													0.5
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
											"name": "VertexDisplacement",
											"source": "shaders/VertexDisplacement.hx",
											"enabled": false,
											"props": {
												"X": true,
												"Y": true,
												"Z": true,
												"texScaleX": 1,
												"texScaleY": 0.5,
												"tex": "Fx/Gradients/Dissolve_ShieldBase.png",
												"intensity": 2,
												"scrollSpeed": [
													0,
													-0.1
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
													0.8156862745098039,
													0.13333333333333333,
													0
												]
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "polygon",
									"name": "BlackFlames",
									"enabled": false,
									"x": -0.00322,
									"y": -0.01796,
									"z": 0.4886,
									"scaleX": 1.25,
									"scaleY": 2,
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
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.34,
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
													0.2
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
													0.25
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
										},
										{
											"type": "shader",
											"name": "VertexDisplacement",
											"source": "shaders/VertexDisplacement.hx",
											"props": {
												"X": true,
												"Y": true,
												"Z": true,
												"texScaleX": 1,
												"texScaleY": 0.5,
												"tex": "Fx/Gradients/Dissolve_ShieldBase.png",
												"intensity": 2,
												"scrollSpeed": [
													0,
													-0.1
												]
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "BlackFlamesSmall",
									"enabled": false,
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
											"time": 0.36529144793833346,
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
											"time": 0.6292113486311832,
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
							"type": "lookAt",
							"name": "lookAt",
							"enabled": false,
							"x": -0.00176,
							"y": 0.25685,
							"z": -0.00028,
							"scaleX": 0.8,
							"scaleY": 0.8,
							"scaleZ": 0.8,
							"rotationY": -38.3155323490468,
							"rotationZ": 42.31532939996876,
							"lockAxis": [
								0,
								0,
								0
							],
							"children": [
								{
									"type": "object",
									"name": "ElecFloor_lessdetails",
									"scaleX": 0.07,
									"scaleY": 0.07,
									"scaleZ": 0.07,
									"rotationY": 80,
									"children": [
										{
											"type": "model",
											"name": "FX_Mesh_Wormsign",
											"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign.fbx",
											"scaleX": 170,
											"scaleY": 170,
											"scaleZ": 170,
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
															"emissive": 3
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
																"alpha": 8,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Gradients/Cyl01u_A.jpg"
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
																"progress": 0.2,
																"saturation": 0,
																"width": 0.87,
																"uvScaleX": 2,
																"uvScaleY": 1,
																"texture": "Fx/noise/Water_01.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.1,
																	-0.4
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0.00510204081632653,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.06654832772809262,
																				"dt": -0.49972701833766753
																			},
																			"nextHandle": {
																				"dv": -0.2613168724279835,
																				"dt": 1.9808112942442606
																			}
																		},
																		{
																			"time": 4,
																			"value": -8,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 3.5411522633744856,
																				"dt": -0.5430397500797186
																			},
																			"nextHandle": {
																				"dv": -4.577271049626095,
																				"dt": 0.6943798595279973
																			}
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.06654832772809262,
																				"dt": -0.49972701833766753
																			},
																			"nextHandle": {
																				"dv": -0.2613168724279835,
																				"dt": 1.9808112942442606
																			}
																		},
																		{
																			"time": 4,
																			"value": 10,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -4.60618338773767,
																				"dt": -0.5450801288932983
																			},
																			"nextHandle": {
																				"dv": 5.861172902258597,
																				"dt": 0.6891403504177167
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
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0.9966216102278539,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 1.726336740830053e-16,
																				"dt": -0.49999517199143395
																			},
																			"nextHandle": {
																				"dv": -0.0035086483832473814,
																				"dt": 0.9372988953333387
																			}
																		},
																		{
																			"time": 2.3610440528017014,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 3.988175635797489,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.0023910182595263674,
																				"dt": -1.013391874636774
																			},
																			"nextHandle": {
																				"dv": -1.6650746572083001e-16,
																				"dt": 0.6627252119324963
																			}
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "progress",
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0.9966216102278539,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.007844450110444453,
																				"dt": -0.49998751902980854
																			},
																			"nextHandle": {
																				"dv": 0.007844450110444453,
																				"dt": 0.49998751902980854
																			}
																		},
																		{
																			"time": 2.3610440528017014,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 3.988175635797489,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.0023910182595263674,
																				"dt": -1.013391874636774
																			},
																			"nextHandle": {
																				"dv": -1.6650746572083001e-16,
																				"dt": 0.6627252119324963
																			}
																		}
																	]
																}
															]
														},
														{
															"type": "shader",
															"name": "GradientMap",
															"source": "hrt.shader.GradientMap",
															"props": {
																"USE_ALPHA": true,
																"gradient": {
																	"type": "gradient",
																	"data": {
																		"stops": [
																			{
																				"position": 0,
																				"color": -324660718
																			},
																			{
																				"position": 0.7109375,
																				"color": -1298407
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
															"name": "MaskColorAlpha",
															"source": "hrt.shader.MaskColorAlpha",
															"enabled": false,
															"props": {
																"UVScale": [
																	1,
																	1
																],
																"alpha": 1,
																"MULTIPLY": false,
																"color": [
																	0.9882352941176471,
																	0.7215686274509804,
																	0.7215686274509804,
																	1
																],
																"mask": "Fx/Alphas/T_ElectricArc_1x4_06.png",
																"UVOffset": [
																	0,
																	0
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "UVOffset.y",
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0.00510204081632653,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.06654832772809262,
																				"dt": -0.49972701833766753
																			},
																			"nextHandle": {
																				"dv": -0.2613168724279835,
																				"dt": 1.9808112942442606
																			}
																		},
																		{
																			"time": 4,
																			"value": 5,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -3.3832536190999782,
																				"dt": -0.473227375941339
																			},
																			"nextHandle": {
																				"dv": 5.090866532235594,
																				"dt": 0.6928501145844609
																			}
																		}
																	]
																}
															]
														},
														{
															"type": "shader",
															"name": "AlphaKill",
															"source": "shaders/AlphaKill.hx",
															"props": {
																"threshold": 0.01,
																"useRGB": false
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
											"scaleX": 200,
											"scaleY": 200,
											"scaleZ": 200,
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
															"emissive": 3
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
																"alpha": 1.6,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Gradients/Cyl01u_A.jpg"
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
																"progress": 0.39,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 2,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/T_ElecNoise01.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.05,
																	-0.4
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0.00510204081632653,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.06654832772809262,
																				"dt": -0.49972701833766753
																			},
																			"nextHandle": {
																				"dv": -0.2613168724279835,
																				"dt": 1.9808112942442606
																			}
																		},
																		{
																			"time": 4,
																			"value": -10,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 3.5411522633744856,
																				"dt": -0.5430397500797186
																			},
																			"nextHandle": {
																				"dv": -4.577271049626095,
																				"dt": 0.6943798595279973
																			}
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.06654832772809262,
																				"dt": -0.49972701833766753
																			},
																			"nextHandle": {
																				"dv": -0.2613168724279835,
																				"dt": 1.9808112942442606
																			}
																		},
																		{
																			"time": 4,
																			"value": 10,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -4.60618338773767,
																				"dt": -0.5450801288932983
																			},
																			"nextHandle": {
																				"dv": 5.861172902258597,
																				"dt": 0.6891403504177167
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
																"progress": 0.33,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 2,
																"uvScaleY": 0.25,
																"texture": "Fx/noise/causticTexture_02.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0,
																	-0.25
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0.00510204081632653,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.06654832772809262,
																				"dt": -0.49972701833766753
																			},
																			"nextHandle": {
																				"dv": -0.2613168724279835,
																				"dt": 1.9808112942442606
																			}
																		},
																		{
																			"time": 4,
																			"value": -9,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 3.5411522633744856,
																				"dt": -0.5430397500797186
																			},
																			"nextHandle": {
																				"dv": -4.577271049626095,
																				"dt": 0.6943798595279973
																			}
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.06654832772809262,
																				"dt": -0.49972701833766753
																			},
																			"nextHandle": {
																				"dv": -0.2613168724279835,
																				"dt": 1.9808112942442606
																			}
																		},
																		{
																			"time": 4,
																			"value": 11,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -4.60618338773767,
																				"dt": -0.5450801288932983
																			},
																			"nextHandle": {
																				"dv": 5.861172902258597,
																				"dt": 0.6891403504177167
																			}
																		}
																	]
																}
															]
														},
														{
															"type": "shader",
															"name": "GradientMap",
															"source": "hrt.shader.GradientMap",
															"props": {
																"USE_ALPHA": true,
																"gradient": {
																	"type": "gradient",
																	"data": {
																		"stops": [
																			{
																				"position": 0,
																				"color": -5100757
																			},
																			{
																				"position": 0.67578125,
																				"color": -28853
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
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0.5,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.007844450110444453,
																				"dt": -0.49998751902980854
																			},
																			"nextHandle": {
																				"dv": 0.007844450110444453,
																				"dt": 0.49998751902980854
																			}
																		},
																		{
																			"time": 2.3610440528017014,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 3.988175635797489,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.0023910182595263674,
																				"dt": -1.013391874636774
																			},
																			"nextHandle": {
																				"dv": -1.6650746572083001e-16,
																				"dt": 0.6627252119324963
																			}
																		}
																	]
																}
															]
														},
														{
															"type": "shader",
															"name": "AlphaKill",
															"source": "shaders/AlphaKill.hx",
															"props": {
																"threshold": 0.025,
																"useRGB": false
															}
														}
													]
												}
											]
										},
										{
											"type": "model",
											"name": "Sparks",
											"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
											"enabled": false,
											"scaleX": 95,
											"scaleY": 95,
											"scaleZ": 95,
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
															"emissive": 3
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
																"progress": 0.33,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 7,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/T_Noise_DirectionalSparks.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.05,
																	0
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0.00510204081632653,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.06654832772809262,
																				"dt": -0.49972701833766753
																			},
																			"nextHandle": {
																				"dv": -0.2613168724279835,
																				"dt": 1.9808112942442606
																			}
																		},
																		{
																			"time": 4,
																			"value": -8,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 3.5411522633744856,
																				"dt": -0.5430397500797186
																			},
																			"nextHandle": {
																				"dv": -4.577271049626095,
																				"dt": 0.6943798595279973
																			}
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.06654832772809262,
																				"dt": -0.49972701833766753
																			},
																			"nextHandle": {
																				"dv": -0.2613168724279835,
																				"dt": 1.9808112942442606
																			}
																		},
																		{
																			"time": 4,
																			"value": 10,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -4.60618338773767,
																				"dt": -0.5450801288932983
																			},
																			"nextHandle": {
																				"dv": 5.861172902258597,
																				"dt": 0.6891403504177167
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
																"progress": 0.2,
																"saturation": 1,
																"width": 0.79,
																"uvScaleX": 5,
																"uvScaleY": 2.5,
																"texture": "Fx/noise/Wave_01.jpg",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0,
																	-2
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0.00510204081632653,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.06654832772809262,
																				"dt": -0.49972701833766753
																			},
																			"nextHandle": {
																				"dv": -0.2613168724279835,
																				"dt": 1.9808112942442606
																			}
																		},
																		{
																			"time": 4,
																			"value": -9,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 3.5411522633744856,
																				"dt": -0.5430397500797186
																			},
																			"nextHandle": {
																				"dv": -4.577271049626095,
																				"dt": 0.6943798595279973
																			}
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.06654832772809262,
																				"dt": -0.49972701833766753
																			},
																			"nextHandle": {
																				"dv": -0.2613168724279835,
																				"dt": 1.9808112942442606
																			}
																		},
																		{
																			"time": 4,
																			"value": 11,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -4.60618338773767,
																				"dt": -0.5450801288932983
																			},
																			"nextHandle": {
																				"dv": 5.861172902258597,
																				"dt": 0.6891403504177167
																			}
																		}
																	]
																}
															]
														},
														{
															"type": "shader",
															"name": "GradientMap",
															"source": "hrt.shader.GradientMap",
															"props": {
																"USE_ALPHA": true,
																"gradient": {
																	"type": "gradient",
																	"data": {
																		"stops": [
																			{
																				"position": 0,
																				"color": -11261006
																			},
																			{
																				"position": 0.67578125,
																				"color": -11796492
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
															"name": "DissolveMap_Gradient",
															"source": "shaders/DissolveMap.hx",
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
																			"time": 0.3678008323459937,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.007844450110444453,
																				"dt": -0.49998751902980854
																			},
																			"nextHandle": {
																				"dv": 0.007844450110444453,
																				"dt": 0.49998751902980854
																			}
																		},
																		{
																			"time": 2.0169723064135137,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 3.988175635797489,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.0023910182595263674,
																				"dt": -1.013391874636774
																			},
																			"nextHandle": {
																				"dv": -1.6650746572083001e-16,
																				"dt": 0.6627252119324963
																			}
																		}
																	]
																}
															]
														},
														{
															"type": "shader",
															"name": "AlphaKill",
															"source": "shaders/AlphaKill.hx",
															"props": {
																"threshold": 0.04,
																"useRGB": false
															}
														}
													]
												}
											]
										},
										{
											"type": "model",
											"name": "Sparks",
											"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
											"enabled": false,
											"scaleX": 95,
											"scaleY": 95,
											"scaleZ": 95,
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
															"emissive": 3
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
																"progress": 0.33,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 3,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/T_Noise_DirectionalSparks02.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.05,
																	0
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0.00510204081632653,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.06654832772809262,
																				"dt": -0.49972701833766753
																			},
																			"nextHandle": {
																				"dv": -0.2613168724279835,
																				"dt": 1.9808112942442606
																			}
																		},
																		{
																			"time": 4,
																			"value": -8,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 3.5411522633744856,
																				"dt": -0.5430397500797186
																			},
																			"nextHandle": {
																				"dv": -4.577271049626095,
																				"dt": 0.6943798595279973
																			}
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.06654832772809262,
																				"dt": -0.49972701833766753
																			},
																			"nextHandle": {
																				"dv": -0.2613168724279835,
																				"dt": 1.9808112942442606
																			}
																		},
																		{
																			"time": 4,
																			"value": 10,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -4.60618338773767,
																				"dt": -0.5450801288932983
																			},
																			"nextHandle": {
																				"dv": 5.861172902258597,
																				"dt": 0.6891403504177167
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
																"progress": 0.2,
																"saturation": 1,
																"width": 0.79,
																"uvScaleX": 5,
																"uvScaleY": 2.5,
																"texture": "Fx/noise/Wave_01.jpg",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0,
																	-2
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0.00510204081632653,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.06654832772809262,
																				"dt": -0.49972701833766753
																			},
																			"nextHandle": {
																				"dv": -0.2613168724279835,
																				"dt": 1.9808112942442606
																			}
																		},
																		{
																			"time": 4,
																			"value": -9,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 3.5411522633744856,
																				"dt": -0.5430397500797186
																			},
																			"nextHandle": {
																				"dv": -4.577271049626095,
																				"dt": 0.6943798595279973
																			}
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.06654832772809262,
																				"dt": -0.49972701833766753
																			},
																			"nextHandle": {
																				"dv": -0.2613168724279835,
																				"dt": 1.9808112942442606
																			}
																		},
																		{
																			"time": 4,
																			"value": 11,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -4.60618338773767,
																				"dt": -0.5450801288932983
																			},
																			"nextHandle": {
																				"dv": 5.861172902258597,
																				"dt": 0.6891403504177167
																			}
																		}
																	]
																}
															]
														},
														{
															"type": "shader",
															"name": "GradientMap",
															"source": "hrt.shader.GradientMap",
															"props": {
																"USE_ALPHA": true,
																"gradient": {
																	"type": "gradient",
																	"data": {
																		"stops": [
																			{
																				"position": 0,
																				"color": -11261006
																			},
																			{
																				"position": 0.67578125,
																				"color": -11796492
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
															"name": "DissolveMap_Gradient",
															"source": "shaders/DissolveMap.hx",
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
																			"time": 0.3678008323459937,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.007844450110444453,
																				"dt": -0.49998751902980854
																			},
																			"nextHandle": {
																				"dv": 0.007844450110444453,
																				"dt": 0.49998751902980854
																			}
																		},
																		{
																			"time": 2.0169723064135137,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 3.988175635797489,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.0023910182595263674,
																				"dt": -1.013391874636774
																			},
																			"nextHandle": {
																				"dv": -1.6650746572083001e-16,
																				"dt": 0.6627252119324963
																			}
																		}
																	]
																}
															]
														},
														{
															"type": "shader",
															"name": "AlphaKill",
															"source": "shaders/AlphaKill.hx",
															"props": {
																"threshold": 0.03,
																"useRGB": false
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.6
											}
										},
										{
											"type": "model",
											"name": "FX_Mesh_Wormsign",
											"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign.fbx",
											"enabled": false,
											"y": 2.220446049250313e-16,
											"scaleX": 170.00000000000006,
											"scaleY": 170.00000000000009,
											"scaleZ": 170,
											"rotationX": -4.789541167380353e-15,
											"rotationZ": 70.91,
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
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 10
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
														"progress": 0.3,
														"saturation": 1,
														"width": 0.91,
														"uvScaleX": 2,
														"uvScaleY": 0.25,
														"texture": "Fx/noise/T_Fire.png",
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
													"name": "DissolveMap-gradient",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.32,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
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
												},
												{
													"type": "shader",
													"name": "UVDistortion",
													"source": "shaders/UVDistortion.hx",
													"props": {
														"noiseTexture": "Fx/noise/T_Noise_Water_04.png",
														"directionalNoise": true,
														"intensity": 0.7,
														"scrollSpeed": [
															0,
															-0.22
														],
														"scale": [
															1.25,
															0.5
														]
													}
												},
												{
													"type": "shader",
													"name": "UVDistortion",
													"source": "shaders/UVDistortion.hx",
													"enabled": false,
													"props": {
														"noiseTexture": "Fx/noise/T_Noise_Water_04.png",
														"directionalNoise": true,
														"intensity": 0.57,
														"scrollSpeed": [
															0,
															-0.35
														],
														"scale": [
															1.25,
															0.5
														]
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap-gradient",
													"source": "shaders/DissolveMap.hx",
													"enabled": false,
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.17,
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
														]
													}
												}
											]
										},
										{
											"type": "model",
											"name": "FX_Mesh_Wormsign",
											"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign.fbx",
											"enabled": false,
											"y": 1.1102230246251565e-16,
											"scaleX": 170.00000000000003,
											"scaleY": 170.00000000000006,
											"scaleZ": 170,
											"rotationX": -1.1973852918450882e-15,
											"rotationY": -1.1973852918450886e-15,
											"rotationZ": 29.999999999999996,
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
															"emissive": 2
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "GradientMap",
													"source": "hrt.shader.GradientMap",
													"props": {
														"USE_ALPHA": true,
														"gradient": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0,
																		"color": -324660718
																	},
																	{
																		"position": 0.7109375,
																		"color": -1298407
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
													"name": "DissolveMap-Pattern",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.357,
														"saturation": 1,
														"width": 0.95,
														"uvScaleX": 2,
														"uvScaleY": 0.5,
														"texture": "Fx/noise/T_ElecNoise01.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															-0.1
														]
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap-gradient",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.32,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
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
															0.7529411764705882,
															0.27058823529411763,
															0.16078431372549018
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
													"type": "shader",
													"name": "UVDistortion",
													"source": "shaders/UVDistortion.hx",
													"props": {
														"noiseTexture": "Fx/noise/T_Noise_Water_04.png",
														"directionalNoise": true,
														"intensity": 0.57,
														"scrollSpeed": [
															0,
															-0.35
														],
														"scale": [
															1.25,
															0.5
														]
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "scale",
											"enabled": false,
											"keyMode": 1,
											"keys": [
												{
													"time": 2.1423929325274913,
													"value": 1,
													"mode": 1,
													"prevHandle": {
														"dv": -0.5166666666666666,
														"dt": -0.07982904118832179
													},
													"nextHandle": {
														"dv": -0.016666666666666607,
														"dt": 0.8006906358195711
													}
												},
												{
													"time": 3.234771213594476,
													"value": 0,
													"mode": 0
												}
											]
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 3,
												"power": 0.8
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
											"time": 1.4228431595421727,
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
											"time": 1.8403849861916322,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.005108173076922684,
												"dt": -0.2879242913626796
											},
											"nextHandle": {
												"dv": 0.005108173076922684,
												"dt": 0.2879242913626796
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "FlashDecals",
							"scaleX": 0.9999999999999998,
							"scaleY": 0.9999999999999998,
							"scaleZ": 0.9999999999999998,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Black",
									"scaleX": 3,
									"scaleY": 3,
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
															"time": 1.430664836497738,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4506633672177252,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.4924493191474308,
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
									"scaleX": 3.5,
									"scaleY": 3,
									"scaleZ": 1.75,
									"rotationY": -18,
									"albedoMap": "Fx/Gradients/circGrad05.jpg",
									"fadePower": 0.5,
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
															"time": 1.4907565935953844,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.5226042031796962,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.399096258206216,
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
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keys": [
														{
															"time": 1.5078518943338464,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.9349625456623294,
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
									"type": "advancedDecal",
									"name": "advancedDecal_Slide",
									"enabled": false,
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
															"time": 1.5119875339334932,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.543835143517805,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.965804199987513,
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
															"time": 1.4753801434488722,
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
															"time": 1.7081765119705627,
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
															"time": 1.463578319609634,
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
															"time": 1.980799087926471,
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
									"enabled": false,
									"scaleX": 3.5,
									"scaleY": 3,
									"scaleZ": 1.75,
									"rotationY": -18,
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
															"time": 1.7531155401561986,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.7849631497405105,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.9673979595501139,
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
															"time": 1.8623531873533525,
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
															"time": 1.9673979595501137,
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
							"type": "advancedDecal",
							"name": "advancedDecal_Red",
							"x": 0.30442,
							"z": 0.09891,
							"scaleX": 4.5,
							"scaleY": 3,
							"scaleZ": 1.75,
							"rotationY": -18,
							"albedoMap": "Fx/Gradients/circGrad05.jpg",
							"emissive": 2,
							"renderMode": "BeforeTonemapping",
							"blendMode": 2,
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
											"keys": [
												{
													"time": 1.4907565935953844,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.5226042031796962,
													"value": 1,
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
									},
									"children": [
										{
											"type": "curve",
											"name": "amount",
											"enabled": false,
											"keys": [
												{
													"time": 1.5078518943338464,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.5619833017796372,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaCycle",
									"source": "shaders/AlphaCycle.hx",
									"props": {
										"minAlpha": 0.4,
										"maxAlpha": 0.8,
										"frequency": 1
									}
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Passsif",
					"enabled": false,
					"children": [
						{
							"type": "object",
							"name": "FlashDecals",
							"scaleX": 0.9999999999999998,
							"scaleY": 0.9999999999999998,
							"scaleZ": 0.9999999999999998,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Black",
									"scaleX": 3,
									"scaleY": 3,
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
															"time": 1.430664836497738,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4506633672177252,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.4924493191474308,
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
									"scaleX": 3.5,
									"scaleY": 3,
									"scaleZ": 1.75,
									"rotationY": -18,
									"albedoMap": "Fx/Gradients/circGrad05.jpg",
									"fadePower": 0.5,
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
															"time": 1.4907565935953844,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.5226042031796962,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.399096258206216,
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
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keys": [
														{
															"time": 1.5078518943338464,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.9349625456623294,
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
						}
					]
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Passsif",
					"target": "FXAnimation.Rabban.Male01_HarkonnenRabban.root.B_ROOTJ.B_Spine01J.B_Spine02J"
				}
			]
		}
	]
}