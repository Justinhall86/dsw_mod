{
	"type": "fx",
	"cullingRadius": 1500,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"enabled": false,
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
			"z": 1,
			"children": [
				{
					"type": "model",
					"name": "Table_Ecaz",
					"source": "UI/ConquestMenu/Assets/Ecaz/Table_Ecaz.fbx",
					"editorOnly": true,
					"z": -2.3877699999999997,
					"scaleX": 0.99,
					"scaleY": 0.99,
					"scaleZ": 0.99,
					"rotationZ": 89.99999999999999,
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
							"diffuseMap": "UI/ConquestMenu/Assets/Ecaz/Table_Ecaz_Albedo.png"
						}
					]
				},
				{
					"type": "polygon",
					"name": "Ground",
					"editorOnly": true,
					"locked": true,
					"z": -1.5,
					"scaleX": 4000,
					"scaleY": 4000,
					"scaleZ": 2,
					"color": -14869219,
					"kind": 0,
					"args": [
						0
					]
				},
				{
					"type": "object",
					"name": "Victory",
					"z": -1.015116,
					"children": [
						{
							"type": "advancedDecal",
							"name": "advancedDecalflashBlack",
							"z": -0.393494,
							"scaleX": 12,
							"scaleY": 12,
							"scaleZ": 9.6,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"renderMode": "AfterTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.8
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"enabled": false,
											"keyMode": 1,
											"keys": [
												{
													"time": 0.5293416162296047,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.558406105734427,
													"value": 1,
													"mode": 1,
													"prevHandle": {
														"dv": -0.9491666666666667,
														"dt": -0.009815703460109293
													},
													"nextHandle": {
														"dv": 0.016666666666666607,
														"dt": 0.11722628443499605
													}
												},
												{
													"time": 0.6833826838763002,
													"value": 0,
													"mode": 0
												}
											]
										},
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 1,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.558406105734427,
													"value": 1,
													"mode": 1,
													"prevHandle": {
														"dv": -0.4542979797979799,
														"dt": -0.12469474633199151
													},
													"nextHandle": {
														"dv": 0.016666666666666607,
														"dt": 0.11722628443499605
													}
												},
												{
													"time": 0.6833826838763002,
													"value": 0,
													"mode": 0
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
							"name": "advancedDecal",
							"enabled": false,
							"z": -0.393494,
							"scaleX": 6.25,
							"scaleY": 6.25,
							"scaleZ": 5,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"emissive": 1,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.45
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"enabled": false,
											"keys": [
												{
													"time": 0.7170474571080954,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.8612585994692992,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5151238238155564,
													"value": 0,
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
													"time": 0.4985,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.5310798092475146,
													"value": 0.5,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.010859936415838212
													},
													"nextHandle": {
														"dv": 0.016666666666666607,
														"dt": 0.09655996531772992
													}
												},
												{
													"time": 0.649585221228365,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.7170474571080954,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.8612585994692992,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5151238238155564,
													"value": 0,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "alpha",
											"enabled": false,
											"keyMode": 1,
											"keys": [
												{
													"time": 0.49157800525389783,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.4985435585580642,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.5276080480628864,
													"value": 1,
													"mode": 1,
													"prevHandle": {
														"dv": -0.9491666666666667,
														"dt": -0.009815703460109293
													},
													"nextHandle": {
														"dv": 0.02319128787878777,
														"dt": 0.1415247124834219
													}
												},
												{
													"time": 0.5310798092475146,
													"value": 0.9997755357198187,
													"mode": 0
												},
												{
													"time": 0.6525846262047597,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.649585221228365,
													"value": 0,
													"mode": 1
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"enabled": false,
									"props": {
										"alpha": 0.35
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
													"mode": 0,
													"prevHandle": {
														"dv": 3.323898806028511e-16,
														"dt": -0.49999944477943
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.5649306508154246
													}
												},
												{
													"time": 0.49313671696387756,
													"value": 1.0166666666666666,
													"mode": 2
												},
												{
													"time": 1.9976878524615154,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.9319444444444444,
														"dt": -0.32463344002438665
													},
													"nextHandle": {
														"dv": -0.5026954750315817,
														"dt": 0.175108894437885
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
													"time": 0.7170474571080954,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.8612585994692992,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.7129138001769002
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.7129138001769002
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": 0.7170474571080954,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.8612585994692992,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5151238238155564,
													"value": 0,
													"mode": 2
												}
											]
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
											0.9450980392156862,
											0.6549019607843137,
											0.34901960784313724
										]
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "advancedDecal",
							"z": -0.393494,
							"scaleX": 6.25,
							"scaleY": 6.25,
							"scaleZ": 5,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"emissive": 1,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.45
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"enabled": false,
											"keyMode": 1,
											"keys": [
												{
													"time": 0.5949787992193818,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.7449787992193817,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.0023848778249737634,
														"dt": -0.1323197199992393
													},
													"nextHandle": {
														"dv": -0.0023848778249737634,
														"dt": 0.1323197199992393
													}
												},
												{
													"time": 2.2764306156383127,
													"value": -0.015421305812691855,
													"mode": 0
												}
											]
										},
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 1,
											"keys": [
												{
													"time": 0.4975911303310801,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.5349104651059111,
													"value": 0.5,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.012439778258277004
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.02002277803782356
													}
												},
												{
													"time": 0.5949787992193818,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.7449787992193817,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.0023848778249737634,
														"dt": -0.1323197199992393
													},
													"nextHandle": {
														"dv": -0.0023848778249737634,
														"dt": 0.1323197199992393
													}
												},
												{
													"time": 2.2764306156383127,
													"value": -0.015421305812691855,
													"mode": 0
												}
											]
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
											0.9450980392156862,
											0.6549019607843137,
											0.34901960784313724
										]
									}
								}
							]
						},
						{
							"type": "object",
							"name": "Floor",
							"z": -0.3408340000000001,
							"children": [
								{
									"type": "model",
									"name": "Elec02",
									"source": "Fx/Meshes_Common/Mesh_Wormsign_modified.fbx",
									"z": -0.09,
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
													"culling": "None",
													"colorMask": 255,
													"emissive": 3
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
												"texture": "Fx/Gradients/Cyl05u_A.jpg"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.5189211918372632,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.5189211918372632,
															"value": 0.5,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666663,
																"dt": -0.861211311637784
															},
															"nextHandle": {
																"dv": 0.006451568043787952,
																"dt": 0.33333114543917053
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
												"saturation": 0,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 1.25,
												"texture": "Fx/noise/Water_01.png",
												"uvShift": [
													0.1,
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
													"keyMode": 0,
													"keys": [
														{
															"time": 0.504831431745417,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.504831431745417,
															"value": -0.25,
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.33,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 4,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/causticTexture_02.png",
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
													"keyMode": 0,
													"keys": [
														{
															"time": 0.504831431745417,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.504831431745417,
															"value": -0.2,
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
																"color": -14991
															},
															{
																"position": 1,
																"color": -3508976
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
													"keys": [
														{
															"time": 0.504831431745417,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 1.504831431745417,
															"value": 0.8,
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.7215686274509804,
													0.4196078431372549,
													0.12156862745098039
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keys": [
														{
															"time": 0.743057350364221,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.2927571140379257,
															"value": 1,
															"mode": 2
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
													"time": 0.5949787992193818,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.7449787992193817,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.0006993833375645853,
														"dt": -0.11577288982603151
													},
													"nextHandle": {
														"dv": 0.0006993833375645853,
														"dt": 0.11577288982603151
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "Bol",
									"props": {
										"emitType": "Burst",
										"instScale": 0.3,
										"lifeTime": 2,
										"instRotation": [
											0,
											180,
											0
										],
										"warmUpTime": -0.3
									},
									"z": -0.35897,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"children": [
										{
											"type": "model",
											"name": "Hemisphere",
											"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 5,
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
														"useSourceUVs": false,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 0.3,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Gradients/GradientSpice_2.png",
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
																	"time": 0.14040999847584212,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.12122382132456926,
																		"dt": -0.4994842701051498
																	},
																	"nextHandle": {
																		"dv": 0.033333333333333326,
																		"dt": 0.13734491693339435
																	}
																},
																{
																	"time": 0.35891327541533313,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.02
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3133333333333333
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
													"name": "ColorMult",
													"source": "shaders/ColorMult.hx",
													"props": {
														"amount": 1,
														"color": [
															0.9764705882352941,
															0.7529411764705882,
															0.5137254901960784
														]
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
														"width": 0.37,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0.4
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.48,
														"saturation": 0,
														"width": 0.4,
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/noise/Water_01.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0.3
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
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 2,
														"power": 2
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "EnvColorMult",
													"source": "shaders/EnvColorMult.hx",
													"enabled": false,
													"props": {
														"sandBlend": 0.7,
														"sandColorSet": false,
														"envBlend": 0.7,
														"envColorSet": false
													},
													"isInstance": true
												}
											]
										},
										{
											"type": "curve",
											"name": "instStretch.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 2.1815539740246592e-16,
														"dt": -0.18535050365489164
													},
													"nextHandle": {
														"dv": 1.1102230246251565e-16,
														"dt": 0.21844688309708893
													}
												},
												{
													"time": 0.28087639079408633,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.9960410845230232,
													"value": 1.3,
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
														"dv": 0.02664527370121003,
														"dt": -0.1853207988671051
													},
													"nextHandle": {
														"dv": -0.02664527370121003,
														"dt": 0.1853207988671051
													}
												},
												{
													"time": 0.28087639079408633,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.9960410845230232,
													"value": 1.3,
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
									"type": "emitter",
									"name": "BolSharp",
									"props": {
										"emitType": "Burst",
										"instScale": 0.3,
										"lifeTime": 2,
										"instRotation": [
											0,
											180,
											0
										],
										"warmUpTime": -0.3
									},
									"z": -0.35897,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"children": [
										{
											"type": "model",
											"name": "Hemisphere",
											"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
											"scaleX": 5,
											"scaleY": 5,
											"scaleZ": 7,
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 0.3,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Gradients/GradientSpice_2.png",
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
																	"time": 0.14040999847584212,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.12122382132456926,
																		"dt": -0.4994842701051498
																	},
																	"nextHandle": {
																		"dv": 0.033333333333333326,
																		"dt": 0.13734491693339435
																	}
																},
																{
																	"time": 0.35891327541533313,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.02
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3133333333333333
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
													"name": "ColorMult",
													"source": "shaders/ColorMult.hx",
													"props": {
														"amount": 1,
														"color": [
															0.9764705882352941,
															0.7529411764705882,
															0.5137254901960784
														]
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
														"width": 0.26,
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0.4
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.34,
														"saturation": 0,
														"width": 0.29,
														"uvScaleX": 4,
														"uvScaleY": 4,
														"texture": "Fx/noise/Water_01.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0.3
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
																	"time": 0.2090824569425393,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.11604552724598342,
																		"dt": -0.49988189441195807
																	},
																	"nextHandle": {
																		"dv": -0.06666666666666665,
																		"dt": 0.2871757354061881
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
														"range": 2,
														"power": 2
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "EnvColorMult",
													"source": "shaders/EnvColorMult.hx",
													"enabled": false,
													"props": {
														"sandBlend": 0.7,
														"sandColorSet": false,
														"envBlend": 0.7,
														"envColorSet": false
													},
													"isInstance": true
												}
											]
										},
										{
											"type": "curve",
											"name": "instStretch.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 2.1815539740246592e-16,
														"dt": -0.18535050365489164
													},
													"nextHandle": {
														"dv": 1.1102230246251565e-16,
														"dt": 0.21844688309708893
													}
												},
												{
													"time": 0.28087639079408633,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.9960410845230232,
													"value": 1.3,
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
														"dv": 0.02664527370121003,
														"dt": -0.1853207988671051
													},
													"nextHandle": {
														"dv": -0.02664527370121003,
														"dt": 0.1853207988671051
													}
												},
												{
													"time": 0.28087639079408633,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.9960410845230232,
													"value": 1.3,
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
								}
							]
						},
						{
							"type": "lookAt",
							"name": "lookAt_Flare",
							"z": -0.29590400000000017,
							"scaleX": 0.2,
							"scaleY": 0.2,
							"scaleZ": 0.36000000000000026,
							"rotationZ": 97.05328607958577,
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
									"scaleX": 17.5,
									"scaleY": 210,
									"scaleZ": 7,
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
													"parallax": 0,
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
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.4,
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
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9764705882352941,
													0.7529411764705882,
													0.5137254901960784
												]
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
												"uvScaleX": 1,
												"uvScaleY": 2,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.6
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
															"time": 0.7670930371869713,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.012345250365260907,
																"dt": -0.49998263979306123
															},
															"nextHandle": {
																"dv": -0.016666666666666607,
																"dt": 0.6750000000000002
															}
														},
														{
															"time": 2.038343037186971,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.17437499999999972
															},
															"nextHandle": {
																"dv": -3.0344026245539974e-16,
																"dt": 0.41812499999999997
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
												"range": 3,
												"power": 2
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "scale.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.550545386175884,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 2.700283463870859e-16,
												"dt": -0.18535535932765834
											},
											"nextHandle": {
												"dv": 0.000500000000000167,
												"dt": 0.22632597243852615
											}
										},
										{
											"time": 0.7691795629845646,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.5152837390795921,
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
							"type": "object",
							"name": "Loop",
							"z": 1.015116,
							"scaleX": 0.15,
							"scaleY": 0.15,
							"scaleZ": 0.15,
							"children": [
								{
									"type": "emitter",
									"name": "Sparks",
									"props": {
										"alignMode": "Screen",
										"instScale": 0.045,
										"lifeTime": 3,
										"burstParticleCount": 30,
										"maxCount": 100,
										"emitShape": "Cylinder",
										"instAcceleration_rand": [
											0,
											0,
											0
										],
										"instScale_rand": 0.03,
										"emitRate": 25,
										"emitAngle": 360,
										"lifeTimeRand": 1,
										"instSpeed": [
											0,
											0,
											0.6
										],
										"instSpeed_rand": [
											0,
											0,
											0.2
										],
										"useRandomColor": true,
										"randomColor1": [
											0.6392156862745098,
											0.34901960784313724,
											0.19215686274509802,
											1
										],
										"randomColor2": [
											0.9764705882352941,
											0.7215686274509804,
											0.396078431372549,
											1
										],
										"frameCount": 4,
										"frameDivisionX": 2,
										"frameDivisionY": 2,
										"animationSpeed": 0,
										"spriteSheet": "Fx/Alphas/T_DustParticles02.png"
									},
									"z": -9.6642,
									"scaleX": 12.5,
									"scaleY": 12.5,
									"scaleZ": 5,
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
															"emissive": 50,
															"drawOrder": "120"
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
														"texture": "Fx/Gradients/circGrad3.jpg"
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
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.16666666666666666
																	}
																},
																{
																	"time": 0.5,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.16666666666666666
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.16666666666666666
																	}
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
																		"dt": 0.16666666666666666
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
														"power": 2
													},
													"isInstance": true
												}
											]
										},
										{
											"type": "curve",
											"name": "emitRate",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6167427365323539,
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
								},
								{
									"type": "emitter",
									"name": "FlarescreenInfinty",
									"props": {
										"alignMode": "Screen",
										"instScale": 25,
										"lifeTime": 2,
										"instOffset": [
											0,
											0,
											1
										],
										"emitRate": 3
									},
									"z": -6.24804,
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
														"texture": "Fx/Alphas/T_circle2.png"
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keys": [
																{
																	"time": -0.0031778692272519393,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.5056226185032769,
																	"value": 1,
																	"mode": 2
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
														"range": 5,
														"power": 1
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "ColorMult",
													"source": "shaders/ColorMult.hx",
													"props": {
														"amount": 1,
														"color": [
															0.9764705882352941,
															0.7529411764705882,
															0.5137254901960784
														]
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
												"amount": 0.05,
												"ATTENUATE": false,
												"emissiveMap": "Fx/Gradients/z_FillGrey50.jpg"
											}
										}
									]
								},
								{
									"type": "lookAt",
									"name": "lookAt",
									"x": 0.06815,
									"y": -0.76453,
									"z": -9.23131,
									"scaleZ": 2,
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
											"scaleX": 12,
											"scaleY": 12,
											"scaleZ": 12,
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
															"culling": "Back",
															"colorMask": 255
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
														"progress": 0.41,
														"saturation": 1,
														"width": 0.7,
														"uvScaleX": 3,
														"uvScaleY": 6,
														"texture": "Fx/Alphas/Dust04.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															-0.14
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
														"width": 0.7,
														"uvScaleX": 3,
														"uvScaleY": 6,
														"texture": "Fx/Alphas/Dust05.png",
														"uvShift": [
															0.05,
															0.1
														],
														"uvShiftSpeed": [
															-0.01,
															-0.12
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
														"width": 0.78,
														"uvScaleX": 2,
														"uvScaleY": 4,
														"texture": "Fx/noise/T_Fire.png",
														"uvShift": [
															0.05,
															0.1
														],
														"uvShiftSpeed": [
															-0.01,
															-0.12
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keys": [
																{
																	"time": 0.5665792901759494,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 1.9240687569934525,
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
															1,
															0.8549019607843137,
															0.611764705882353
														]
													}
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
																		"color": -8174804
																	},
																	{
																		"position": 0.34765625,
																		"color": -319243113
																	},
																	{
																		"position": 1,
																		"color": -205389
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
					]
				},
				{
					"type": "object",
					"name": "HologramsMap",
					"x": -0.02995,
					"y": -0.00038,
					"z": -1.43533,
					"children": [
						{
							"type": "object",
							"name": "Holograms_Circles",
							"z": -0.032,
							"scaleX": 0.97,
							"scaleY": 0.97,
							"scaleZ": 0.97,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"z": 0.10000000000000002,
									"scaleX": 1.672,
									"scaleY": 1.672,
									"scaleZ": 0.9500000000000001,
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
													"culling": "Back",
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false,
													"alphaKill": false,
													"emissive": 8
												}
											},
											"diffuseMap": "Fx/UI/Conquest/T_UI_Circle_Plain_2048_02.png",
											"color": [
												0.027450980392156862,
												0.8784313725490196,
												0.3686274509803922,
												1
											],
											"children": [
												{
													"type": "shader",
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 0.46
													}
												}
											]
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 1,
												"tag": null
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0.9,
															"mode": 2
														},
														{
															"time": 1.4399789667899616,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.9938170309399468,
															"value": 0.5575000000000001,
															"mode": 2
														},
														{
															"time": 3.046109352824919,
															"value": 0.9325,
															"mode": 2
														},
														{
															"time": 4.246091825149887,
															"value": 0.745,
															"mode": 2
														},
														{
															"time": 5.61222571671985,
															"value": 1,
															"mode": 2
														},
														{
															"time": 8.344493499859778,
															"value": 0.6666666666666666,
															"mode": 2
														},
														{
															"time": 9.01276835753199,
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
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"props": {
										"threshold": 0.02,
										"useRGB": false
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
											"keys": [
												{
													"time": 0.7170474571080954,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.8612585994692992,
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
							"type": "model",
							"name": "Hemisphere_Grid",
							"source": "Fx/Meshes_Common/ConquestMap_Dome.fbx",
							"z": -0.0020000000000000018,
							"scaleX": 0.95,
							"scaleY": 0.95,
							"scaleZ": 0.2,
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
											"emissive": 4
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
										"progress": 0.15,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Alphas/T_Grid_Circulard_1024.png",
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
											0.5058823529411764,
											0.43529411764705883,
											0.27058823529411763
										]
									},
									"children": [
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.5058823529411764,
													0.43529411764705883,
													0.27058823529411763
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
										"alpha": 0.2,
										"tag": null
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0.9,
													"mode": 2
												},
												{
													"time": 1.4399789667899616,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.9938170309399468,
													"value": 0.6238750000000003,
													"mode": 2
												},
												{
													"time": 3.046109352824919,
													"value": 0.9325,
													"mode": 2
												},
												{
													"time": 4.246091825149887,
													"value": 0.8113750000000002,
													"mode": 2
												},
												{
													"time": 5.61222571671985,
													"value": 1,
													"mode": 2
												},
												{
													"time": 8.344493499859778,
													"value": 0.7330416666666668,
													"mode": 2
												},
												{
													"time": 9.01276835753199,
													"value": 1,
													"mode": 2
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
										"threshold": 0.02,
										"useRGB": false
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
											"keys": [
												{
													"time": 0.7170474571080954,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.8612585994692992,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5151238238155564,
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
							"type": "shader",
							"name": "ColorSet",
							"source": "shaders/ColorSet.hx",
							"props": {
								"amount": 1,
								"color": [
									0.984313725490196,
									0.8,
									0.5372549019607843
								]
							}
						}
					]
				}
			]
		},
		{
			"type": "object",
			"name": "BackupRelease",
			"enabled": false,
			"z": 1,
			"children": [
				{
					"type": "model",
					"name": "Table_Ecaz",
					"source": "UI/ConquestMenu/Assets/Ecaz/Table_Ecaz.fbx",
					"editorOnly": true,
					"z": -2.3877699999999997,
					"scaleX": 0.99,
					"scaleY": 0.99,
					"scaleZ": 0.99,
					"rotationZ": 89.99999999999999,
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
							"diffuseMap": "UI/ConquestMenu/Assets/Ecaz/Table_Ecaz_Albedo.png"
						}
					]
				},
				{
					"type": "polygon",
					"name": "Ground",
					"editorOnly": true,
					"locked": true,
					"z": -1.5,
					"scaleX": 4000,
					"scaleY": 4000,
					"scaleZ": 2,
					"color": -14869219,
					"kind": 0,
					"args": [
						0
					]
				},
				{
					"type": "object",
					"name": "Loop",
					"scaleX": 0.15,
					"scaleY": 0.15,
					"scaleZ": 0.15,
					"children": [
						{
							"type": "emitter",
							"name": "Sparks",
							"enabled": false,
							"props": {
								"alignMode": "Axis",
								"instScale": 1.2,
								"instStretch": [
									0.7,
									1,
									0.7
								],
								"lifeTime": 2,
								"burstParticleCount": 30,
								"maxCount": 100,
								"emitShape": "Cylinder",
								"instAcceleration": [
									0,
									0,
									15
								],
								"instAcceleration_rand": [
									0,
									0,
									8
								],
								"instScale_rand": 0.5,
								"instStretch_rand": [
									0.2,
									0.7,
									0.2
								],
								"emitRate": 30,
								"emitAngle": 360
							},
							"z": 4.910300000000001,
							"scaleX": 15,
							"scaleY": 15,
							"scaleZ": 20,
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
													"emissive": 10,
													"drawOrder": "120"
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
												"alpha": 0.4,
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
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.19,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.02
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.3133333333333333
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
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9764705882352941,
													0.7529411764705882,
													0.5137254901960784
												]
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
												"width": 0.66,
												"uvScaleX": 1,
												"uvScaleY": 2,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.6
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
												"alpha": 0.7,
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
												"alpha": 1,
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
												"range": 15,
												"power": 2
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"enabled": false,
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.7,
												"envColorSet": false
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Sparks",
							"props": {
								"alignMode": "Screen",
								"instScale": 0.04,
								"lifeTime": 3,
								"burstParticleCount": 30,
								"maxCount": 100,
								"emitShape": "Cylinder",
								"instAcceleration_rand": [
									0,
									0,
									0
								],
								"instScale_rand": 0.03,
								"emitRate": 25,
								"emitAngle": 360,
								"lifeTimeRand": 1,
								"instSpeed": [
									0,
									0,
									0.6
								],
								"instSpeed_rand": [
									0,
									0,
									0.2
								],
								"useRandomColor": true,
								"randomColor1": [
									0.6392156862745098,
									0.34901960784313724,
									0.19215686274509802,
									1
								],
								"randomColor2": [
									0.9764705882352941,
									0.7215686274509804,
									0.396078431372549,
									1
								],
								"frameCount": 4,
								"frameDivisionX": 2,
								"frameDivisionY": 2,
								"animationSpeed": 0,
								"spriteSheet": "Fx/Alphas/T_DustParticles02.png"
							},
							"z": -9.6642,
							"scaleX": 12.5,
							"scaleY": 12.5,
							"scaleZ": 5,
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
													"emissive": 50,
													"drawOrder": "120"
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
												"texture": "Fx/Gradients/circGrad3.jpg"
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
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.16666666666666666
															}
														},
														{
															"time": 0.5,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.16666666666666666
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.16666666666666666
															}
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
																"dt": 0.16666666666666666
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
													0.9137254901960784,
													0.6431372549019607,
													0.2980392156862745
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.4,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_circle3.png",
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
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.19,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.02
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.3133333333333333
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
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													0.9764705882352941,
													0.7529411764705882,
													0.5137254901960784
												]
											},
											"isInstance": true
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
												"progress": 0.34,
												"saturation": 0,
												"width": 0.66,
												"uvScaleX": 1,
												"uvScaleY": 2,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.6
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
											"enabled": false,
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
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"enabled": false,
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
												"range": 15,
												"power": 2
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"enabled": false,
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.7,
												"envColorSet": false
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "FlarescreenInfinty",
							"enabled": false,
							"props": {
								"alignMode": "Screen",
								"instScale": 25,
								"lifeTime": 2,
								"instOffset": [
									0,
									0,
									1
								],
								"emitRate": 3
							},
							"z": -8.43987,
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
												"texture": "Fx/Alphas/T_circle2.png"
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": -0.0031778692272519393,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.5056226185032769,
															"value": 1,
															"mode": 2
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
												"range": 15,
												"power": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9764705882352941,
													0.7529411764705882,
													0.5137254901960784
												]
											},
											"isInstance": true
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
												"progress": 0.34,
												"saturation": 0,
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
													0.6
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
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"enabled": false,
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.7,
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
										"amount": 0.05,
										"ATTENUATE": false,
										"emissiveMap": "Fx/Gradients/z_FillGrey50.jpg"
									}
								}
							]
						},
						{
							"type": "emitter",
							"name": "FlarescreenInfinty",
							"enabled": false,
							"props": {
								"instScale": 75,
								"lifeTime": 2,
								"instOffset": [
									0,
									0,
									1
								],
								"emitRate": 3,
								"alignMode": "Screen"
							},
							"z": -9.43987,
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
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.2,
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
													"keys": [
														{
															"time": -0.0031778692272519393,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.5056226185032769,
															"value": 1,
															"mode": 2
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
												"range": 15,
												"power": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9764705882352941,
													0.7529411764705882,
													0.5137254901960784
												]
											},
											"isInstance": true
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
												"progress": 0.34,
												"saturation": 0,
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
													0.6
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
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"enabled": false,
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.7,
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
										"amount": 1,
										"ATTENUATE": true,
										"emissiveMap": "Fx/Gradients/z_FillBlack.jpg"
									}
								}
							]
						},
						{
							"type": "lookAt",
							"name": "lookAt",
							"x": 0.06815,
							"y": -0.76453,
							"z": -9.23131,
							"scaleZ": 2,
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
									"scaleX": 12,
									"scaleY": 12,
									"scaleZ": 12,
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
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 4,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_UI_Conquest_Flag07.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 3.0858568276078264,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.07337523827101462
															}
														},
														{
															"time": 3.28641697981774,
															"value": 1,
															"mode": 1
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 3.0858568276078264,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.07337523827101462
															}
														},
														{
															"time": 3.2014515231427207,
															"value": 1,
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
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.41,
												"saturation": 1,
												"width": 0.7,
												"uvScaleX": 3,
												"uvScaleY": 6,
												"texture": "Fx/Alphas/Dust04.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													-0.07
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
												"width": 0.7,
												"uvScaleX": 3,
												"uvScaleY": 6,
												"texture": "Fx/Alphas/Dust05.png",
												"uvShift": [
													0.05,
													0.1
												],
												"uvShiftSpeed": [
													-0.01,
													-0.06
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
												"width": 0.78,
												"uvScaleX": 2,
												"uvScaleY": 4,
												"texture": "Fx/noise/T_Fire.png",
												"uvShift": [
													0.05,
													0.1
												],
												"uvShiftSpeed": [
													-0.01,
													-0.06
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
													1,
													0.8549019607843137,
													0.611764705882353
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
													0.8549019607843137,
													0.611764705882353
												]
											}
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
																"color": -8174804
															},
															{
																"position": 0.34765625,
																"color": -319243113
															},
															{
																"position": 1,
																"color": -205389
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
					"type": "lookAt",
					"name": "lookAt_Flare",
					"z": -1.31102,
					"scaleX": 0.2,
					"scaleY": 0.2,
					"scaleZ": 0.2,
					"rotationZ": -101.4,
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
							"scaleX": 17.5,
							"scaleY": 210,
							"scaleZ": 7,
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
											"parallax": 0,
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
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.4,
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
									"name": "ColorMult",
									"source": "shaders/ColorMult.hx",
									"props": {
										"amount": 1,
										"color": [
											0.9764705882352941,
											0.7529411764705882,
											0.5137254901960784
										]
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
										"uvScaleX": 1,
										"uvScaleY": 2,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0.6
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
													"time": 0.72625,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.012345250365260907,
														"dt": -0.49998263979306123
													},
													"nextHandle": {
														"dv": -0.016666666666666607,
														"dt": 0.6750000000000002
													}
												},
												{
													"time": 1.9974999999999998,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.17437499999999972
													},
													"nextHandle": {
														"dv": -3.0344026245539974e-16,
														"dt": 0.41812499999999997
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
										"range": 15,
										"power": 2
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "curve",
							"name": "scale.z",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0.008238709171402767,
										"dt": -0.18537095635656012
									},
									"nextHandle": {
										"dv": -0.029999999999999916,
										"dt": 0.675625
									}
								},
								{
									"time": 0.608125,
									"value": 1,
									"mode": 2
								},
								{
									"time": 1.316666084523023,
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
					"type": "curve",
					"name": "shake",
					"keyMode": 0,
					"keys": [
						{
							"time": 0.542849606056497,
							"value": 0,
							"mode": 2
						},
						{
							"time": 0.606494042628638,
							"value": 1,
							"mode": 2
						},
						{
							"time": 1,
							"value": 0,
							"mode": 0,
							"prevHandle": {
								"dv": 0,
								"dt": -0.13756730710660214
							},
							"nextHandle": {
								"dv": 0,
								"dt": 0.13756730710660214
							}
						}
					]
				},
				{
					"type": "object",
					"name": "Floor",
					"z": -1.35595,
					"children": [
						{
							"type": "emitter",
							"name": "Distort_Chockwave",
							"enabled": false,
							"props": {
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
									360
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
								"emitType": "Burst",
								"burstDelay": 0.3,
								"useRandomColor": true,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"warmUpTime": -0.5,
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instScale": 0.05,
								"emitAngle": 360
							},
							"z": 0.0059499999999999,
							"scaleX": 0.01,
							"scaleY": 0.01,
							"scaleZ": 0.01,
							"children": [
								{
									"type": "model",
									"name": "Ring",
									"source": "Fx/Meshes_Common/DiskFlat.fbx",
									"scaleX": 200,
									"scaleY": 200,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "Distortion",
													"blend": "Alpha",
													"shadows": false,
													"depthTest": "LessEqual",
													"colorMask": 15,
													"enableStencil": false,
													"culling": "None",
													"depthWrite": "On",
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
												"intensity": 1
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
							"type": "model",
							"name": "Elec02",
							"source": "Fx/Meshes_Common/Mesh_Wormsign_modified.fbx",
							"enabled": false,
							"z": -0.02977,
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
											"culling": "None",
											"colorMask": 255,
											"emissive": 3
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
										"texture": "Fx/Gradients/Cyl05u_A.jpg"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.5189211918372632,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5189211918372632,
													"value": 0.5,
													"mode": 0,
													"prevHandle": {
														"dv": -0.016666666666666663,
														"dt": -0.861211311637784
													},
													"nextHandle": {
														"dv": 0.006451568043787952,
														"dt": 0.33333114543917053
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
										"saturation": 0,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 1.25,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0.1,
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
											"keyMode": 0,
											"keys": [
												{
													"time": 0.504831431745417,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.504831431745417,
													"value": -0.25,
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.33,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 4,
										"uvScaleY": 0.5,
										"texture": "Fx/noise/causticTexture_02.png",
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
											"keyMode": 0,
											"keys": [
												{
													"time": 0.504831431745417,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.504831431745417,
													"value": -0.2,
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
														"color": -90062
													},
													{
														"position": 1,
														"color": -11796593
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
											"keys": [
												{
													"time": 0.504831431745417,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1.504831431745417,
													"value": 0.8,
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
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.504831431745417,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -3.100087368767569,
												"dt": -0.14429308231613439
											},
											"nextHandle": {
												"dv": 1,
												"dt": 0.046544843790482515
											}
										},
										{
											"time": 1.504831431745417,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.9017386631089813
											},
											"nextHandle": {
												"dv": -5.262223968825359e-16,
												"dt": 0.33333337795849743
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
													"time": 0.743057350364221,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.2927571140379257,
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
							"type": "emitter",
							"name": "FlareGround",
							"props": {
								"emitType": "Burst",
								"instScale": 20,
								"lifeTime": 2
							},
							"z": 0.05306999999999995,
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
													"emissive": 0.5
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
												"range": 1,
												"power": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9764705882352941,
													0.7529411764705882,
													0.5137254901960784
												]
											},
											"isInstance": true
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
												"progress": 0.34,
												"saturation": 0,
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
													0.6
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
												"alpha": 0.6,
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
															"time": 0.3153236153651962,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -1.4,
																"dt": -0.040379546604235594
															},
															"nextHandle": {
																"dv": 0.614600230694067,
																"dt": 0.01603771273438879
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
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"enabled": false,
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.7,
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
										"amount": 1,
										"ATTENUATE": false,
										"emissiveMap": "Fx/Gradients/z_FillBlack.jpg"
									}
								}
							]
						},
						{
							"type": "emitter",
							"name": "FlareGround",
							"enabled": false,
							"props": {
								"emitType": "Burst",
								"instScale": 10,
								"lifeTime": 0.5
							},
							"z": 0.05306999999999995,
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
													"emissive": 0.5
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
												"range": 1,
												"power": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9764705882352941,
													0.7529411764705882,
													0.5137254901960784
												]
											},
											"isInstance": true
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
												"progress": 0.34,
												"saturation": 0,
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
													0.6
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
															"time": 0.3153236153651962,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -1.4,
																"dt": -0.040379546604235594
															},
															"nextHandle": {
																"dv": 0.614600230694067,
																"dt": 0.01603771273438879
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
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"enabled": false,
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.7,
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
										"amount": 1,
										"ATTENUATE": true,
										"emissiveMap": "Fx/Gradients/z_FillBlack.jpg"
									}
								}
							]
						},
						{
							"type": "emitter",
							"name": "Bol",
							"props": {
								"emitType": "Burst",
								"instScale": 0.4,
								"lifeTime": 2,
								"instRotation": [
									0,
									180,
									0
								]
							},
							"z": -0.2,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"children": [
								{
									"type": "model",
									"name": "Hemisphere",
									"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
									"scaleX": 4,
									"scaleY": 4,
									"scaleZ": 5,
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
												"useSourceUVs": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.3,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/GradientSpice_2.png",
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
															"time": 0.14040999847584212,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.12122382132456926,
																"dt": -0.4994842701051498
															},
															"nextHandle": {
																"dv": 0.033333333333333326,
																"dt": 0.13734491693339435
															}
														},
														{
															"time": 0.35891327541533313,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.02
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.3133333333333333
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
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9764705882352941,
													0.7529411764705882,
													0.5137254901960784
												]
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
												"width": 0.37,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.4
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.48,
												"saturation": 0,
												"width": 0.4,
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/noise/Water_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.3
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
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"enabled": false,
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.7,
												"envColorSet": false
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instStretch.y",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 2.1815539740246592e-16,
												"dt": -0.18535050365489164
											},
											"nextHandle": {
												"dv": 1.1102230246251565e-16,
												"dt": 0.21844688309708893
											}
										},
										{
											"time": 0.28087639079408633,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.9960410845230232,
											"value": 1.3,
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
												"dv": 0.02664527370121003,
												"dt": -0.1853207988671051
											},
											"nextHandle": {
												"dv": -0.02664527370121003,
												"dt": 0.1853207988671051
											}
										},
										{
											"time": 0.28087639079408633,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.9960410845230232,
											"value": 1.3,
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
							"type": "emitter",
							"name": "BolSharp",
							"props": {
								"emitType": "Burst",
								"instScale": 0.4,
								"lifeTime": 2,
								"instRotation": [
									0,
									180,
									0
								]
							},
							"z": -0.2,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"children": [
								{
									"type": "model",
									"name": "Hemisphere",
									"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
									"scaleX": 5,
									"scaleY": 5,
									"scaleZ": 7,
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
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.3,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/GradientSpice_2.png",
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
															"time": 0.14040999847584212,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.12122382132456926,
																"dt": -0.4994842701051498
															},
															"nextHandle": {
																"dv": 0.033333333333333326,
																"dt": 0.13734491693339435
															}
														},
														{
															"time": 0.35891327541533313,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.02
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.3133333333333333
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
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9764705882352941,
													0.7529411764705882,
													0.5137254901960784
												]
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
												"width": 0.26,
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.4
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.34,
												"saturation": 0,
												"width": 0.29,
												"uvScaleX": 4,
												"uvScaleY": 4,
												"texture": "Fx/noise/Water_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.3
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
															"time": 0.2090824569425393,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.11604552724598342,
																"dt": -0.49988189441195807
															},
															"nextHandle": {
																"dv": -0.06666666666666665,
																"dt": 0.2871757354061881
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
												"range": 10,
												"power": 2
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"enabled": false,
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.7,
												"envColorSet": false
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instStretch.y",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 2.1815539740246592e-16,
												"dt": -0.18535050365489164
											},
											"nextHandle": {
												"dv": 1.1102230246251565e-16,
												"dt": 0.21844688309708893
											}
										},
										{
											"time": 0.28087639079408633,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.9960410845230232,
											"value": 1.3,
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
												"dv": 0.02664527370121003,
												"dt": -0.1853207988671051
											},
											"nextHandle": {
												"dv": -0.02664527370121003,
												"dt": 0.1853207988671051
											}
										},
										{
											"time": 0.28087639079408633,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.9960410845230232,
											"value": 1.3,
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
						}
					]
				},
				{
					"type": "advancedDecal",
					"name": "advancedDecal",
					"z": -1.40861,
					"scaleX": 6.25,
					"scaleY": 6.25,
					"scaleZ": 5,
					"albedoMap": "Fx/Alphas/T_circle2.png",
					"emissive": 0.5,
					"renderMode": "BeforeTonemapping",
					"children": [
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.35
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
												"dv": 3.323898806028511e-16,
												"dt": -0.49999944477943
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5649306508154246
											}
										},
										{
											"time": 0.49313671696387756,
											"value": 1.0166666666666666,
											"mode": 2
										},
										{
											"time": 1.9976878524615154,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.9319444444444444,
												"dt": -0.32463344002438665
											},
											"nextHandle": {
												"dv": -0.5026954750315817,
												"dt": 0.175108894437885
											}
										}
									]
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
									0.9450980392156862,
									0.6549019607843137,
									0.34901960784313724
								]
							}
						}
					]
				}
			]
		}
	]
}