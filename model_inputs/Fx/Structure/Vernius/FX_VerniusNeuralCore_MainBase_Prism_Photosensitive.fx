{
	"type": "fx",
	"cullingRadius": 150,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"scaleX": 1.005,
			"scaleY": 1.005,
			"scaleZ": 1.005,
			"children": [
				{
					"type": "model",
					"name": "VerniusBase",
					"source": "Structure/Base/Vernius/VerniusBase.fbx",
					"editorOnly": true,
					"locked": true,
					"x": -1.42738,
					"y": -5.43488,
					"rotationZ": -29.999999999999993
				},
				{
					"type": "subFX",
					"name": "VerniusBase_Idle",
					"source": "Fx/Structure/Vernius/VerniusBase_Idle.fx",
					"enabled": false,
					"editorOnly": true,
					"locked": true,
					"x": -1.42738,
					"y": -5.43488,
					"rotationZ": -29.999999999999993
				},
				{
					"type": "object",
					"name": "NeuralCore",
					"x": 0.400561,
					"y": 0.6926884999999999,
					"z": 21.883261,
					"children": [
						{
							"type": "object",
							"name": "AnglesTes",
							"x": -0.37667600000000007,
							"y": -0.6568660000000001,
							"z": -0.0816359999999996,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAtTOP",
									"x": -0.000844999999999943,
									"y": 0.10439350000000014,
									"z": 2.9387149999999984,
									"scaleX": 0.3999999999999998,
									"scaleY": 0.39999999999999986,
									"scaleZ": 0.4,
									"rotationX": 1.7265686822206922e-15,
									"rotationY": -22.918118016649945,
									"rotationZ": 106.3532810860939,
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
											"x": -0.5,
											"y": -3.3306690738754696e-16,
											"z": -7.105427357601002e-15,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationX": -89.99999999999999,
											"rotationY": -1.5687009724754765e-15,
											"rotationZ": -89.99999999999999,
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
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
													"refMatLib": ""
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
														"alpha": 0.99,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_circle.png"
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
																		"color": -12844844
																	},
																	{
																		"position": 1,
																		"color": -5732609
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
													"name": "AlphaCycle",
													"source": "shaders/AlphaCycle.hx",
													"enabled": false,
													"props": {
														"minAlpha": 0.5,
														"maxAlpha": 1,
														"frequency": 2
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "polygon",
											"enabled": false,
											"x": -0.3351192230682116,
											"y": -0.06322503364348797,
											"z": 0.039341874014105827,
											"scaleX": 10,
											"scaleY": 10,
											"scaleZ": 10,
											"rotationY": 90,
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
														"alpha": 0.5,
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
													"props": {
														"USE_ALPHA": true,
														"gradient": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0,
																		"color": -12444212
																	},
																	{
																		"position": 0.5234375,
																		"color": -8008705
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
																		"color": -12444212
																	},
																	{
																		"position": 1,
																		"color": -18584
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
													"keys": [
														{
															"time": 0,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 0.1,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.2,
															"value": 0.5,
															"mode": 2
														}
													],
													"loop": true
												}
											]
										},
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 1,
											"keys": [
												{
													"time": 0.16842082345378787,
													"value": 0,
													"prevHandle": {
														"dv": -0.03467354713704517,
														"dt": -0.4999305700197999
													},
													"nextHandle": {
														"dv": 0.009002752680527859,
														"dt": 0.2596072020860385
													}
												},
												{
													"time": 0.44348946481084695,
													"value": 0.9732427100774028,
													"mode": 1,
													"prevHandle": {
														"dv": -0.19578934715290008,
														"dt": -0.04207741029837353
													},
													"nextHandle": {
														"dv": 1.4296492847548923,
														"dt": 0.008121495161251935
													}
												},
												{
													"time": 0.7829338370410712,
													"value": 1,
													"mode": 1,
													"prevHandle": {
														"dv": 0.00022767763793574147,
														"dt": -0.2565051722404734
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.723751679693135
													}
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "BOTTOMangles",
									"x": -1.0297099999999997,
									"y": 0.011143000000000125,
									"z": -0.8048624999999987,
									"children": [
										{
											"type": "lookAt",
											"name": "lookAt",
											"x": 3.4783399999999998,
											"y": -4.2433629999999996,
											"z": -0.12155750000000154,
											"scaleX": 0.4,
											"scaleY": 0.4,
											"scaleZ": 0.4,
											"rotationX": -7.13181103689818e-15,
											"rotationY": -63.51475551917284,
											"rotationZ": -51.714549676227705,
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
													"x": -0.5,
													"y": -3.3306690738754696e-16,
													"z": -7.105427357601002e-15,
													"scaleX": 4,
													"scaleY": 4,
													"scaleZ": 4,
													"rotationX": -89.99999999999999,
													"rotationY": -1.5687009724754765e-15,
													"rotationZ": -89.99999999999999,
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
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
															"refMatLib": ""
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
																"alpha": 0.99,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_circle.png"
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
																				"position": 0,
																				"color": -12844844
																			},
																			{
																				"position": 1,
																				"color": -3689985
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
															"name": "AlphaCycle",
															"source": "shaders/AlphaCycle.hx",
															"enabled": false,
															"props": {
																"minAlpha": 0.5,
																"maxAlpha": 1,
																"frequency": 2
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
																				"color": -12844844
																			},
																			{
																				"position": 1,
																				"color": -5732609
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
													"type": "polygon",
													"name": "polygon",
													"enabled": false,
													"x": -0.3351192230682116,
													"y": -0.06322503364348797,
													"z": 0.039341874014105827,
													"scaleX": 10,
													"scaleY": 10,
													"scaleZ": 10,
													"rotationY": 90,
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
																"alpha": 0.5,
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
															"props": {
																"USE_ALPHA": true,
																"gradient": {
																	"type": "gradient",
																	"data": {
																		"stops": [
																			{
																				"position": 0,
																				"color": -12444212
																			},
																			{
																				"position": 0.5234375,
																				"color": -8008705
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
																				"color": -12444212
																			},
																			{
																				"position": 1,
																				"color": -18584
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
															"keys": [
																{
																	"time": 0,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 0.1,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.2,
																	"value": 0.5,
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
											"type": "lookAt",
											"name": "lookAt",
											"x": 3.4616,
											"y": 4.144237,
											"z": 0.03873249999999828,
											"scaleX": 0.40000000000000013,
											"scaleY": 0.4,
											"scaleZ": 0.4,
											"rotationX": -5.493753210055895e-15,
											"rotationY": -54.623962302284305,
											"rotationZ": -64.05456229873921,
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
													"x": -0.5,
													"y": -3.3306690738754696e-16,
													"z": -7.105427357601002e-15,
													"scaleX": 4,
													"scaleY": 4,
													"scaleZ": 4,
													"rotationX": -89.99999999999999,
													"rotationY": -1.5687009724754765e-15,
													"rotationZ": -89.99999999999999,
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
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
															"refMatLib": ""
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
																"alpha": 0.99,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_circle.png"
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
																				"position": 0,
																				"color": -12844844
																			},
																			{
																				"position": 1,
																				"color": -3689985
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
															"name": "AlphaCycle",
															"source": "shaders/AlphaCycle.hx",
															"enabled": false,
															"props": {
																"minAlpha": 0.5,
																"maxAlpha": 1,
																"frequency": 2
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
																				"color": -12844844
																			},
																			{
																				"position": 1,
																				"color": -5732609
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
													"type": "polygon",
													"name": "polygon",
													"enabled": false,
													"x": -0.3351192230682116,
													"y": -0.06322503364348797,
													"z": 0.039341874014105827,
													"scaleX": 10,
													"scaleY": 10,
													"scaleZ": 10,
													"rotationY": 90,
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
																"alpha": 0.5,
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
															"props": {
																"USE_ALPHA": true,
																"gradient": {
																	"type": "gradient",
																	"data": {
																		"stops": [
																			{
																				"position": 0,
																				"color": -12444212
																			},
																			{
																				"position": 0.5234375,
																				"color": -8008705
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
																				"color": -12444212
																			},
																			{
																				"position": 1,
																				"color": -18584
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
															"keys": [
																{
																	"time": 0,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 0.1,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.2,
																	"value": 0.5,
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
											"type": "lookAt",
											"name": "lookAt",
											"x": -3.46997,
											"y": 0.049562999999999885,
											"z": 0.04141249999999985,
											"scaleX": 0.39999999999999997,
											"scaleY": 0.4,
											"scaleZ": 0.4,
											"rotationX": -5.3947187975957725e-15,
											"rotationY": -53.87362725061461,
											"rotationZ": -45.27997247203318,
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
													"x": -0.5,
													"y": -3.3306690738754696e-16,
													"z": -7.105427357601002e-15,
													"scaleX": 4,
													"scaleY": 4,
													"scaleZ": 4,
													"rotationX": -89.99999999999999,
													"rotationY": -1.5687009724754765e-15,
													"rotationZ": -89.99999999999999,
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
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
															"refMatLib": ""
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
																"alpha": 0.99,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_circle.png"
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
																				"position": 0,
																				"color": -12844844
																			},
																			{
																				"position": 1,
																				"color": -3689985
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
															"name": "AlphaCycle",
															"source": "shaders/AlphaCycle.hx",
															"enabled": false,
															"props": {
																"minAlpha": 0.5,
																"maxAlpha": 1,
																"frequency": 2
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
																				"color": -12844844
																			},
																			{
																				"position": 1,
																				"color": -5732609
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
													"type": "polygon",
													"name": "polygon",
													"enabled": false,
													"x": -0.3351192230682116,
													"y": -0.06322503364348797,
													"z": 0.039341874014105827,
													"scaleX": 10,
													"scaleY": 10,
													"scaleZ": 10,
													"rotationY": 90,
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
																"alpha": 0.5,
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
															"props": {
																"USE_ALPHA": true,
																"gradient": {
																	"type": "gradient",
																	"data": {
																		"stops": [
																			{
																				"position": 0,
																				"color": -12444212
																			},
																			{
																				"position": 0.5234375,
																				"color": -8008705
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
																				"color": -12444212
																			},
																			{
																				"position": 1,
																				"color": -18584
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
															"keys": [
																{
																	"time": 0,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 0.1,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.2,
																	"value": 0.5,
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
															"time": 0,
															"value": 0,
															"prevHandle": {
																"dv": -0.049813649272402935,
																"dt": -0.4998283554580937
															},
															"nextHandle": {
																"dv": 0.015276566427900429,
																"dt": 0.20033429218980658
															}
														},
														{
															"time": 0.27506864135705916,
															"value": 0.9732427100774028,
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
							"name": "Prism",
							"x": 0.259079,
							"y": 0.44985149999999996,
							"z": -0.9037910000000018,
							"children": [
								{
									"type": "model",
									"name": "V_Prism01_fond",
									"source": "Fx/Meshes_Common/V_Prism01.fbx",
									"rotationZ": 59.99999999999999,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": true,
													"culling": "None",
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false,
													"emissive": 4
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
												"texture": "Fx/Alphas/Prism02_glow02.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.16842082345378787,
															"value": 0,
															"prevHandle": {
																"dv": -0.03467354713704517,
																"dt": -0.4999305700197999
															},
															"nextHandle": {
																"dv": 0.009002752680527859,
																"dt": 0.2596072020860385
															}
														},
														{
															"time": 0.44348946481084695,
															"value": 0.9732427100774028,
															"mode": 1,
															"prevHandle": {
																"dv": -0.19578934715290008,
																"dt": -0.04207741029837353
															},
															"nextHandle": {
																"dv": 1.4296492847548923,
																"dt": 0.008121495161251935
															}
														},
														{
															"time": 0.7829338370410712,
															"value": 1,
															"mode": 1,
															"prevHandle": {
																"dv": 0.00022767763793574147,
																"dt": -0.2565051722404734
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.723751679693135
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
													0.4235294117647059,
													0.2901960784313725,
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
												"bias": 0.24,
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
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"enabled": false,
											"props": {
												"minAlpha": 0.5,
												"maxAlpha": 1,
												"frequency": 6
											}
										}
									]
								},
								{
									"type": "model",
									"name": "V_Prism01_Border",
									"source": "Fx/Meshes_Common/V_Prism01.fbx",
									"rotationZ": 59.99999999999999,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": true,
													"culling": "None",
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false,
													"emissive": 2
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
												"texture": "Fx/Alphas/Prism03_glow.png"
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.4235294117647059,
													0.2901960784313725,
													1
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
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Alphas/T_circle2.png",
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
															"mode": 2
														},
														{
															"time": 0.21017087481060592,
															"value": 0.6228137478132951,
															"prevHandle": {
																"dv": 2.5367451022791095e-17,
																"dt": -0.13790104535590952
															},
															"nextHandle": {
																"dv": 0.0026352221049604774,
																"dt": 0.19448638297902832
															}
														},
														{
															"time": 0.6715106669934173,
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
									"name": "V_Prism01_Bordermove",
									"source": "Fx/Meshes_Common/V_Prism01.fbx",
									"enabled": false,
									"rotationZ": 59.99999999999999,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": true,
													"culling": "None",
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false,
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
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/Prism02.png"
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
												"progress": 0.27,
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
													0.25,
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
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Alphas/T_circle2.png",
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
															"mode": 2
														},
														{
															"time": 0.21017087481060592,
															"value": 0.6228137478132951,
															"prevHandle": {
																"dv": 2.5367451022791095e-17,
																"dt": -0.13790104535590952
															},
															"nextHandle": {
																"dv": 0.0026352221049604774,
																"dt": 0.19448638297902832
															}
														},
														{
															"time": 0.6715106669934173,
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
							"type": "shader",
							"name": "NightEmissive",
							"source": "shaders/NightEmissive.hx",
							"props": {
								"amount": 0.75,
								"ATTENUATE": true,
								"emissiveMap": null
							}
						}
					]
				}
			]
		}
	]
}