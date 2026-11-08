{
	"type": "fx",
	"duration": 5,
	"cullingRadius": 150,
	"children": [
		{
			"type": "polygon",
			"name": "Ground",
			"enabled": false,
			"editorOnly": true,
			"x": 1.59326,
			"y": 0.05298,
			"z": 0.02,
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
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"z": -0.5,
			"scaleX": 1000,
			"scaleY": 1000,
			"scaleZ": 1000,
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
					"type": "object",
					"name": "Floor",
					"z": 1,
					"scaleX": 1.5,
					"scaleY": 1.5,
					"scaleZ": 1.5,
					"children": [
						{
							"type": "object",
							"name": "SandFloor",
							"children": [
								{
									"type": "model",
									"name": "DiskFlatStraight01_MoreVrtx",
									"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
									"scaleX": 125,
									"scaleY": 125,
									"scaleZ": 125,
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
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"children": [
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
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.007525315302651606,
																		"dt": -0.49999914897890235
																	},
																	"nextHandle": {
																		"dv": -0.01666666666666672,
																		"dt": 1.1073714275749365
																	}
																},
																{
																	"time": 2.9898648306835613,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.016666666666666607,
																		"dt": -0.4331415915975767
																	},
																	"nextHandle": {
																		"dv": -0.016954738005083275,
																		"dt": 0.4406281322784504
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
														"progress": 0.35,
														"saturation": 0.5,
														"width": 1,
														"uvScaleX": 3,
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
																	"value": -5,
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
																	"value": -2,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.2966345278513924,
																		"dt": -0.737658311996833
																	},
																	"nextHandle": {
																		"dv": -1.2966345278513924,
																		"dt": 0.737658311996833
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
																	"time": 0.004086241430165817,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.003508648383247387,
																		"dt": -0.4999936232216757
																	},
																	"nextHandle": {
																		"dv": 0.008383268754121598,
																		"dt": 1.1965899333409389
																	}
																},
																{
																	"time": 2,
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
														}
													]
												},
												{
													"type": "shader",
													"name": "EnvColorMult",
													"source": "shaders/EnvColorMult.hx",
													"props": {
														"sandBlend": 0.6,
														"sandColorSet": false,
														"envBlend": 0.7,
														"envColorSet": false
													},
													"isInstance": true
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "ElecFloor",
							"children": [
								{
									"type": "model",
									"name": "FX_Mesh_Wormsign",
									"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign.fbx",
									"enabled": false,
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
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.2,
														"saturation": 0,
														"width": 0.87,
														"uvScaleX": 3,
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
																		"color": -16497480
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
													"name": "MaskColorAlpha",
													"source": "hrt.shader.MaskColorAlpha",
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
									"enabled": false,
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
														"alpha": 0.8,
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
														"uvScaleX": 4,
														"uvScaleY": 1,
														"texture": "Fx/noise/T_ElecNoise01.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.05,
															1
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
														"uvScaleX": 4,
														"uvScaleY": 0.5,
														"texture": "Fx/noise/causticTexture_02.png",
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
									"type": "curve",
									"name": "scale",
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
								}
							]
						},
						{
							"type": "object",
							"name": "Orb",
							"enabled": false,
							"scaleX": 0.8,
							"scaleY": 0.8,
							"scaleZ": 0.8,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal",
									"enabled": false,
									"scaleX": 200,
									"scaleY": 200,
									"scaleZ": 200,
									"albedoMap": "Fx/Gradients/circGrad01.png",
									"renderMode": "BeforeTonemapping",
									"blendMode": 2,
									"children": [
										{
											"type": "shader",
											"name": "GradientMap",
											"source": "hrt.shader.GradientMap",
											"props": {
												"USE_ALPHA": false,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -11261006
															},
															{
																"position": 1,
																"color": -8734765
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
											"type": "curve",
											"name": "scale",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 0.125,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.25,
													"value": 0.5,
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
													0.5764705882352941,
													0.5725490196078431,
													0.8196078431372549
												]
											}
										},
										{
											"type": "curve",
											"name": "visibility",
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.01,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.4627186434277504,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.47271864342775,
													"value": 0,
													"mode": 2
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
										"alpha": 0.5
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 1,
											"keys": [
												{
													"time": 1.4100520841118702,
													"value": 0,
													"mode": 0
												},
												{
													"time": 1.4100520841118702,
													"value": 0,
													"mode": 0
												},
												{
													"time": 1.4100520841118702,
													"value": 0,
													"mode": 0
												},
												{
													"time": 1.4100520841118702,
													"value": 0,
													"mode": 0
												},
												{
													"time": 1.4100520841118702,
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
													"time": 1.9100520841118702,
													"value": 1,
													"mode": 1
												},
												{
													"time": 1.9100520841118702,
													"value": 1,
													"mode": 1
												},
												{
													"time": 1.9100520841118702,
													"value": 1,
													"mode": 1
												},
												{
													"time": 1.9100520841118702,
													"value": 1,
													"mode": 1
												},
												{
													"time": 1.9100520841118702,
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
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "scale",
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
						"range": 1.75,
						"power": 0.8
					}
				},
				{
					"type": "object",
					"name": "flare",
					"enabled": false,
					"z": 0.9999999999999998,
					"scaleX": 0.7,
					"scaleY": 0.7,
					"scaleZ": 0.7,
					"children": [
						{
							"type": "emitter",
							"name": "emitter_FlareBlack",
							"props": {
								"lifeTime": 0.1,
								"alignMode": "Screen",
								"alignLockAxis": "Z",
								"burstDelay": 0.05,
								"instScale": 20,
								"instStretch": [
									20,
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
								"warmUpTime": -3,
								"emitType": "Burst"
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
													"depthTest": "LessEqual"
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
								"burstDelay": 0.05,
								"instScale": 15,
								"instStretch": [
									40,
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
								"warmUpTime": -3.05,
								"emitType": "Burst"
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
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.43529411764705883,
													0.6196078431372549,
													1
												]
											},
											"isInstance": true
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
							"name": "emittermult_smallFlare",
							"props": {
								"lifeTime": 0.2,
								"alignMode": "Screen",
								"alignLockAxis": "Z",
								"burstDelay": 0.1,
								"instScale": 15,
								"instStretch": [
									35,
									4,
									1
								],
								"instRotation_rand": [
									0,
									0,
									0
								],
								"instStretch_rand": [
									7,
									1,
									0
								],
								"instScale_rand": 2,
								"useRandomColor": true,
								"randomColor1": [
									0.48627450980392156,
									0.48627450980392156,
									0.48627450980392156,
									1
								],
								"warmUpTime": -1.9,
								"emitDuration": 1.3
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
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.7058823529411764,
													0.8,
													1
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaKill",
											"source": "shaders/AlphaKill.hx",
											"props": {
												"threshold": 0.1,
												"useRGB": false
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
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.005472004642191,
											"value": 2,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.4382921746860441
											},
											"nextHandle": {
												"dv": -9.212527315659379e-18,
												"dt": 0.003333333333333336
											}
										},
										{
											"time": 1.015472004642191,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "emittermult_SmallRoundFlare",
							"props": {
								"lifeTime": 0.2,
								"alignMode": "Screen",
								"alignLockAxis": "Z",
								"burstDelay": 0.1,
								"instScale": 80,
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
								"instScale_rand": 25,
								"useRandomColor": true,
								"randomColor1": [
									0.48627450980392156,
									0.48627450980392156,
									0.48627450980392156,
									1
								],
								"warmUpTime": -1.9,
								"emitDuration": 1.3
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
													"mode": "BeforeTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"drawOrder": "100",
													"emissive": 3
												}
											},
											"diffuseMap": "Fx/Gradients/T_circleGradient_color04.png"
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
												"alpha": 1.5,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_LensFlare_06.png"
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
														},
														{
															"time": 0.9994830486111846,
															"value": 0,
															"mode": 0
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
												"range": 3,
												"power": 0.8
											}
										},
										{
											"type": "shader",
											"name": "AlphaKill",
											"source": "shaders/AlphaKill.hx",
											"props": {
												"threshold": 0.015,
												"useRGB": false
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
									"name": "emitRate",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.005472004642191,
											"value": 2,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.4382921746860441
											},
											"nextHandle": {
												"dv": -9.212527315659379e-18,
												"dt": 0.003333333333333336
											}
										},
										{
											"time": 1.015472004642191,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "FlareColored_side",
							"props": {
								"alignMode": "Axis",
								"alignLockAxis": "Z",
								"burstDelay": 0.05,
								"instScale": 90,
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
								"emitType": "Burst",
								"instRotation": [
									-45,
									0,
									0
								],
								"lifeTime": 0.1,
								"warmUpTime": -3.05
							},
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"children": [
								{
									"type": "model",
									"name": "PlanePivBot_NoVrtx",
									"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
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
													"drawOrder": "100"
												}
											},
											"diffuseMap": "Fx/Gradients/T_circleGradient_color04.png"
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
												"alpha": 0.4,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Boquet_straight_circle02.png"
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
																"dv": 0.13831140421273472,
																"dt": -0.4997534846094124
															},
															"nextHandle": {
																"dv": -0.016666666666666663,
																"dt": 0.061224489795918366
															}
														},
														{
															"time": 0.07312925170068027,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.9994830486111846,
															"value": 0,
															"mode": 0
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
												"range": 3,
												"power": 0.8
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 0.7,
												"color": [
													0.6509803921568628,
													0.7411764705882353,
													1
												]
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instStretch.z",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.95,
											"mode": 0,
											"prevHandle": {
												"dv": -0.24752260216006414,
												"dt": -0.4084304599834715
											},
											"nextHandle": {
												"dv": 0.07502654127000485,
												"dt": 0.12414965986394558
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.7589285714285714
											},
											"nextHandle": {
												"dv": -1.0668034339239163e-16,
												"dt": 0.3333333333333333
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
					"name": "emitterWaves",
					"enabled": false,
					"props": {
						"lifeTime": 0.35,
						"alignLockAxis": "Z",
						"burstCount": 3,
						"instScale": 160,
						"instRotation_rand": [
							0,
							0,
							360
						],
						"instStretch_rand": [
							0,
							0,
							0
						],
						"instScale_rand": 0,
						"useRandomColor": true,
						"randomColor1": [
							1,
							0.7843137254901961,
							0.7843137254901961,
							1
						],
						"warmUpTime": -1.9,
						"burstDelay": 0.2,
						"randomColor2": [
							0.8549019607843137,
							0.9490196078431372,
							0.996078431372549,
							1
						],
						"emitDuration": 1.3
					},
					"z": 1,
					"scaleX": 0.1,
					"scaleY": 0.1,
					"scaleZ": 0.1,
					"children": [
						{
							"type": "model",
							"name": "HemiIcosphere",
							"source": "Fx/Meshes_Common/Hemisphere.fbx",
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.78,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 2,
										"texture": "Fx/noise/T_Noise_Water_04.png",
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
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.02694152348851338,
														"dt": -0.49999893719118754
													},
													"nextHandle": {
														"dv": 0.03333333333333344,
														"dt": 0.6186224489795918
													}
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.43,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 0.5,
										"uvScaleY": 1,
										"texture": "Fx/noise/T_ElecNoise01.png",
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
									"enabled": false,
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
											0,
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
										"alpha": 0.15
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
														"dv": -0.02694152348851338,
														"dt": -0.49999893719118754
													},
													"nextHandle": {
														"dv": 0.03333333333333344,
														"dt": 0.6186224489795918
													}
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
							"type": "shader",
							"name": "DissolveMap",
							"source": "shaders/DissolveMap.hx",
							"props": {
								"useSourceUVs": false,
								"useScale": true,
								"wrap": true,
								"progress": 0.82,
								"saturation": 1,
								"width": 0.8,
								"uvScaleX": 0.5,
								"uvScaleY": 0.5,
								"texture": "Fx/noise/T_Fire.png",
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
									"name": "width",
									"enabled": false,
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
										},
										{
											"time": 2.0100000000000002,
											"value": 0,
											"mode": 0
										}
									]
								}
							]
						},
						{
							"type": "curve",
							"name": "emitRate",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 2
								},
								{
									"time": 1.005472004642191,
									"value": 2,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.4382921746860441
									},
									"nextHandle": {
										"dv": -9.212527315659379e-18,
										"dt": 0.003333333333333336
									}
								},
								{
									"time": 1.015472004642191,
									"value": 0,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "emitterWaves",
					"enabled": false,
					"props": {
						"lifeTime": 0.35,
						"alignLockAxis": "Z",
						"burstCount": 3,
						"instScale": 185,
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
							1,
							0.7843137254901961,
							0.7843137254901961,
							1
						],
						"warmUpTime": -1.9,
						"burstDelay": 0.2,
						"randomColor2": [
							0.8549019607843137,
							0.9490196078431372,
							0.996078431372549,
							1
						],
						"emitDuration": 1.3,
						"alignMode": "Screen",
						"instRotation": [
							20,
							0,
							0
						]
					},
					"z": 10,
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
										"alpha": 0.15,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_LensFlare_07.png"
									}
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 1.5,
										"power": 0.8
									}
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"props": {
										"threshold": 0.008,
										"useRGB": false
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
							"type": "shader",
							"name": "DissolveMap",
							"source": "shaders/DissolveMap.hx",
							"props": {
								"useSourceUVs": false,
								"useScale": true,
								"wrap": true,
								"progress": 0.82,
								"saturation": 1,
								"width": 0.8,
								"uvScaleX": 0.5,
								"uvScaleY": 0.5,
								"texture": "Fx/noise/T_Fire.png",
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
									"name": "width",
									"enabled": false,
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
										},
										{
											"time": 2.0100000000000002,
											"value": 0,
											"mode": 0
										}
									]
								}
							]
						},
						{
							"type": "curve",
							"name": "emitRate",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 2
								},
								{
									"time": 1.005472004642191,
									"value": 2,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.4382921746860441
									},
									"nextHandle": {
										"dv": -9.212527315659379e-18,
										"dt": 0.003333333333333336
									}
								},
								{
									"time": 1.015472004642191,
									"value": 0,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Flash",
					"enabled": false,
					"children": [
						{
							"type": "advancedDecal",
							"name": "FlashSmall",
							"scaleX": 200,
							"scaleY": 200,
							"scaleZ": 100,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"fadePower": 2,
							"fadeStart": 1,
							"fadeEnd": 2,
							"renderMode": "AfterTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 1.1
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 1,
											"keys": [
												{
													"time": 2.978546720587011,
													"value": -0.11268055555555556,
													"mode": 1,
													"prevHandle": {
														"dv": -0.04156617094541062,
														"dt": -0.11922045032039578
													},
													"nextHandle": {
														"dv": -0.004418592602338817,
														"dt": 0.07265529819588232
													}
												},
												{
													"time": 3.068068427292652,
													"value": 0.9,
													"mode": 0,
													"prevHandle": {
														"dv": 4.079225330621559e-17,
														"dt": -0.05762613271233638
													},
													"nextHandle": {
														"dv": -4.079225330621559e-17,
														"dt": 0.05762613271233638
													}
												},
												{
													"time": 3.5791561748977325,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.023464007015963004,
														"dt": -0.08822429066642856
													},
													"nextHandle": {
														"dv": 0.023464007015963004,
														"dt": 0.08822429066642856
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
											0.9882352941176471,
											0.7725490196078432,
											0.996078431372549
										]
									}
								},
								{
									"type": "curve",
									"name": "visibility",
									"keys": [
										{
											"time": 2.792730702813631,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.802730702813631,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.8243923154386508,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.8343923154386506,
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
		}
	]
}