{
	"cullingRadius": 150,
	"type": "fx",
	"children": [
		{
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"x": 15,
			"scaleX": 200,
			"scaleY": 200,
			"scaleZ": 140,
			"rotationZ": 180,
			"kind": 0,
			"args": [
				0
			],
			"type": "polygon",
			"children": [
				{
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
					"diffuseMap": "Fx/Test/Map_Albedo_VFXTest.png",
					"type": "material"
				}
			]
		},
		{
			"name": "FXRoot",
			"type": "object",
			"children": [
				{
					"name": "VerniusBase",
					"source": "Structure/Base/Vernius/VerniusBase.fbx",
					"editorOnly": true,
					"type": "model"
				},
				{
					"name": "BaseIdle",
					"x": -1.33827,
					"y": 5.81533,
					"z": 0.15,
					"scaleX": 0.55,
					"scaleY": 0.55,
					"scaleZ": 0.55,
					"rotationZ": -179.4,
					"type": "object",
					"children": [
						{
							"name": "ELECTESTS_STYLE",
							"enabled": false,
							"x": 41.62177,
							"y": 4.8158,
							"z": 21.77505,
							"rotationZ": 6.6,
							"type": "object",
							"children": [
								{
									"name": "Test01-stylised",
									"x": -0.5205300000000008,
									"y": 42.7263,
									"z": -9.195473333333332,
									"type": "object",
									"children": [
										{
											"name": "haut",
											"x": 0.39543,
											"y": 0.64922,
											"z": 2.93782,
											"scaleX": 0.4,
											"scaleY": 0.4,
											"scaleZ": 0.4,
											"type": "object",
											"children": [
												{
													"name": "lookAt",
													"scaleX": 2,
													"scaleY": 2,
													"scaleZ": 2,
													"target": "camera",
													"lockAxis": [
														0,
														0,
														0
													],
													"type": "lookAt",
													"children": [
														{
															"name": "polygon",
															"z": -7.105427357601002e-15,
															"scaleX": 15,
															"scaleY": 15,
															"scaleZ": 15,
															"rotationX": 1.0315964937488239e-15,
															"rotationY": 89.99999999999999,
															"kind": 0,
															"args": [
																0
															],
															"type": "polygon",
															"children": [
																{
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
																	"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
																	"type": "material"
																},
																{
																	"name": "AlphaMap",
																	"source": "shaders/AlphaMap.hx",
																	"props": {
																		"useSourceUVs": true,
																		"onDecal": false,
																		"wrap": true,
																		"invert": false,
																		"replace": false,
																		"alpha": 0.25,
																		"uScale": 1,
																		"vScale": 1,
																		"uOffset": 0,
																		"vOffset": 0,
																		"texture": "Fx/Alphas/T_circle2.png"
																	},
																	"type": "shader"
																},
																{
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
																						"position": 0.46484375,
																						"color": -16735241
																					}
																				],
																				"resolution": 64,
																				"isVertical": false,
																				"interpolation": "Linear",
																				"colorMode": 0
																			}
																		}
																	},
																	"type": "shader"
																}
															]
														}
													]
												},
												{
													"name": "scale",
													"keys": [
														{
															"time": 0,
															"value": 0.2,
															"mode": 2
														},
														{
															"time": 0.1,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.2,
															"value": 0.2,
															"mode": 2
														}
													],
													"loop": true,
													"type": "curve"
												},
												{
													"name": "emitter",
													"props": {
														"lifeTime": 0.1,
														"alignMode": "Screen",
														"emitRate": 4,
														"maxCount": 8,
														"instScale": 22,
														"instScale_rand": 8,
														"instRotation_rand": [
															0,
															0,
															360
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
													"scaleX": 0.1,
													"scaleY": 0.1,
													"scaleZ": 0.1,
													"type": "emitter",
													"children": [
														{
															"name": "polygon",
															"kind": 0,
															"args": [
																0
															],
															"type": "polygon",
															"children": [
																{
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
																	"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
																	"type": "material"
																},
																{
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
																		"texture": "Fx/Alphas/T_CircleSparks.png"
																	},
																	"type": "shader"
																},
																{
																	"name": "GradientMap",
																	"source": "shaders/GradientMap.hx",
																	"props": {
																		"USE_ALPHA": true,
																		"gradient": {
																			"type": "gradient",
																			"data": {
																				"stops": [
																					{
																						"position": 0.2890625,
																						"color": -12444212
																					},
																					{
																						"position": 0.51171875,
																						"color": -16735241
																					},
																					{
																						"position": 1,
																						"color": -15597542
																					}
																				],
																				"resolution": 64,
																				"isVertical": false,
																				"interpolation": "Linear",
																				"colorMode": 0
																			}
																		}
																	},
																	"type": "shader"
																},
																{
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"props": {
																		"amount": 1,
																		"color": [
																			0.33725490196078434,
																			0.27058823529411763,
																			0.984313725490196
																		]
																	},
																	"type": "shader"
																}
															]
														},
														{
															"name": "instScale",
															"keys": [
																{
																	"time": 0,
																	"value": 0.2,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 1,
																	"mode": 2
																}
															],
															"type": "curve"
														},
														{
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.7568627450980392,
																	0.9176470588235294,
																	1
																]
															},
															"type": "shader"
														}
													]
												},
												{
													"name": "emitter",
													"props": {
														"lifeTime": 0.1,
														"alignMode": "Screen",
														"emitRate": 4,
														"maxCount": 8,
														"instScale": 15,
														"instScale_rand": 5,
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
													"type": "emitter",
													"children": [
														{
															"name": "polygon",
															"kind": 0,
															"args": [
																0
															],
															"type": "polygon",
															"children": [
																{
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
																	"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
																	"type": "material"
																},
																{
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
																		"texture": "Fx/Alphas/T_Flare05.png"
																	},
																	"type": "shader"
																},
																{
																	"name": "GradientMap",
																	"source": "shaders/GradientMap.hx",
																	"props": {
																		"USE_ALPHA": true,
																		"gradient": {
																			"type": "gradient",
																			"data": {
																				"stops": [
																					{
																						"position": 0.2890625,
																						"color": -12444212
																					},
																					{
																						"position": 0.51171875,
																						"color": -16735241
																					},
																					{
																						"position": 1,
																						"color": -15597542
																					}
																				],
																				"resolution": 64,
																				"isVertical": false,
																				"interpolation": "Linear",
																				"colorMode": 0
																			}
																		}
																	},
																	"type": "shader"
																},
																{
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"props": {
																		"amount": 1,
																		"color": [
																			0.47058823529411764,
																			0.807843137254902,
																			0.984313725490196
																		]
																	},
																	"type": "shader"
																},
																{
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"props": {
																		"amount": 1,
																		"color": [
																			0.7568627450980392,
																			0.9176470588235294,
																			1
																		]
																	},
																	"type": "shader"
																}
															]
														},
														{
															"name": "instScale",
															"keys": [
																{
																	"time": 0,
																	"value": 0.2,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 1,
																	"mode": 2
																}
															],
															"type": "curve"
														}
													]
												},
												{
													"name": "advancedDecal",
													"scaleX": 6,
													"scaleY": 6,
													"scaleZ": 10,
													"rotationY": 90,
													"albedoMap": "Fx/Alphas/T_circle2.png",
													"renderMode": "BeforeTonemapping",
													"type": "advancedDecal",
													"children": [
														{
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
															"type": "material"
														},
														{
															"name": "AutoAlpha",
															"source": "shaders/AutoAlpha.hx",
															"enabled": false,
															"props": {
																"scale": 1
															},
															"type": "shader"
														},
														{
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.27058823529411763,
																	0.5058823529411764,
																	0.984313725490196
																]
															},
															"type": "shader"
														}
													]
												}
											]
										},
										{
											"name": "bas",
											"x": 0.19522,
											"y": -0.85884,
											"z": -2.57639,
											"scaleX": 0.4,
											"scaleY": 0.4,
											"scaleZ": 0.4,
											"type": "object",
											"children": [
												{
													"name": "lookAt",
													"scaleX": 2,
													"scaleY": 2,
													"scaleZ": 2,
													"target": "camera",
													"lockAxis": [
														0,
														0,
														0
													],
													"type": "lookAt",
													"children": [
														{
															"name": "polygon",
															"z": -7.105427357601002e-15,
															"scaleX": 10,
															"scaleY": 10,
															"scaleZ": 10,
															"rotationX": 1.0315964937488239e-15,
															"rotationY": 89.99999999999999,
															"kind": 0,
															"args": [
																0
															],
															"type": "polygon",
															"children": [
																{
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
																	"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
																	"type": "material"
																},
																{
																	"name": "AlphaMap",
																	"source": "shaders/AlphaMap.hx",
																	"props": {
																		"useSourceUVs": true,
																		"onDecal": false,
																		"wrap": true,
																		"invert": false,
																		"replace": false,
																		"alpha": 0.25,
																		"uScale": 1,
																		"vScale": 1,
																		"uOffset": 0,
																		"vOffset": 0,
																		"texture": "Fx/Alphas/T_circle2.png"
																	},
																	"type": "shader"
																},
																{
																	"name": "AlphaMap",
																	"source": "shaders/AlphaMap.hx",
																	"enabled": false,
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
																		"texture": "Fx/Alphas/T_Flare07_glow.png"
																	},
																	"type": "shader"
																},
																{
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
																						"position": 0.46484375,
																						"color": -16735241
																					}
																				],
																				"resolution": 64,
																				"isVertical": false,
																				"interpolation": "Linear",
																				"colorMode": 0
																			}
																		}
																	},
																	"type": "shader"
																}
															]
														},
														{
															"name": "polygon",
															"enabled": false,
															"scaleX": 6,
															"scaleY": 6,
															"scaleZ": 6,
															"rotationY": 90,
															"kind": 0,
															"args": [
																0
															],
															"type": "polygon",
															"children": [
																{
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
																	"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
																	"type": "material"
																},
																{
																	"name": "AlphaMap",
																	"source": "shaders/AlphaMap.hx",
																	"enabled": false,
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
																		"texture": "Fx/Alphas/T_Flare07_glow.png"
																	},
																	"type": "shader"
																},
																{
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
																		"texture": "Fx/Alphas/T_CircleSparks.png"
																	},
																	"type": "shader"
																}
															]
														},
														{
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"enabled": false,
															"props": {
																"amount": 1,
																"color": [
																	0.33725490196078434,
																	0.27058823529411763,
																	0.984313725490196
																]
															},
															"type": "shader"
														}
													]
												},
												{
													"name": "scale",
													"keys": [
														{
															"time": 0,
															"value": 0.2,
															"mode": 2
														},
														{
															"time": 0.1,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.2,
															"value": 0.2,
															"mode": 2
														}
													],
													"loop": true,
													"type": "curve"
												},
												{
													"name": "emitter",
													"props": {
														"lifeTime": 0.1,
														"alignMode": "Screen",
														"emitRate": 4,
														"maxCount": 8,
														"instScale": 20,
														"instScale_rand": 8,
														"instRotation_rand": [
															0,
															0,
															360
														],
														"seedGroup": 2,
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
													"type": "emitter",
													"children": [
														{
															"name": "polygon",
															"kind": 0,
															"args": [
																0
															],
															"type": "polygon",
															"children": [
																{
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
																	"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
																	"type": "material"
																},
																{
																	"name": "AlphaMap",
																	"source": "shaders/AlphaMap.hx",
																	"enabled": false,
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
																		"texture": "Fx/Alphas/T_Flare05.png"
																	},
																	"type": "shader"
																},
																{
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
																		"texture": "Fx/Alphas/T_CircleSparks.png"
																	},
																	"type": "shader"
																},
																{
																	"name": "GradientMap",
																	"source": "shaders/GradientMap.hx",
																	"props": {
																		"USE_ALPHA": true,
																		"gradient": {
																			"type": "gradient",
																			"data": {
																				"stops": [
																					{
																						"position": 0.2890625,
																						"color": -12444212
																					},
																					{
																						"position": 0.51171875,
																						"color": -16735241
																					},
																					{
																						"position": 1,
																						"color": -15597542
																					}
																				],
																				"resolution": 64,
																				"isVertical": false,
																				"interpolation": "Linear",
																				"colorMode": 0
																			}
																		}
																	},
																	"type": "shader"
																},
																{
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"props": {
																		"amount": 1,
																		"color": [
																			0.33725490196078434,
																			0.27058823529411763,
																			0.984313725490196
																		]
																	},
																	"type": "shader"
																},
																{
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"props": {
																		"amount": 1,
																		"color": [
																			0.47058823529411764,
																			0.807843137254902,
																			0.984313725490196
																		]
																	},
																	"type": "shader"
																}
															]
														},
														{
															"name": "instScale",
															"keys": [
																{
																	"time": 0,
																	"value": 0.2,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 1,
																	"mode": 2
																}
															],
															"type": "curve"
														}
													]
												},
												{
													"name": "emitter",
													"props": {
														"lifeTime": 0.1,
														"alignMode": "Screen",
														"emitRate": 4,
														"maxCount": 8,
														"instScale": 15,
														"instScale_rand": 8,
														"instRotation_rand": [
															0,
															0,
															360
														],
														"seedGroup": 3,
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
													"type": "emitter",
													"children": [
														{
															"name": "polygon",
															"kind": 0,
															"args": [
																0
															],
															"type": "polygon",
															"children": [
																{
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
																	"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
																	"type": "material"
																},
																{
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
																		"texture": "Fx/Alphas/T_Flare05.png"
																	},
																	"type": "shader"
																},
																{
																	"name": "GradientMap",
																	"source": "shaders/GradientMap.hx",
																	"props": {
																		"USE_ALPHA": true,
																		"gradient": {
																			"type": "gradient",
																			"data": {
																				"stops": [
																					{
																						"position": 0.2890625,
																						"color": -12444212
																					},
																					{
																						"position": 0.51171875,
																						"color": -16735241
																					},
																					{
																						"position": 1,
																						"color": -15597542
																					}
																				],
																				"resolution": 64,
																				"isVertical": false,
																				"interpolation": "Linear",
																				"colorMode": 0
																			}
																		}
																	},
																	"type": "shader"
																},
																{
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"enabled": false,
																	"props": {
																		"amount": 1,
																		"color": [
																			0.33725490196078434,
																			0.27058823529411763,
																			0.984313725490196
																		]
																	},
																	"type": "shader"
																},
																{
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"props": {
																		"amount": 1,
																		"color": [
																			0.47058823529411764,
																			0.807843137254902,
																			0.984313725490196
																		]
																	},
																	"type": "shader"
																},
																{
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"props": {
																		"amount": 1,
																		"color": [
																			0.7568627450980392,
																			0.9176470588235294,
																			1
																		]
																	},
																	"type": "shader"
																}
															]
														},
														{
															"name": "instScale",
															"keys": [
																{
																	"time": 0,
																	"value": 0.2,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 1,
																	"mode": 2
																}
															],
															"type": "curve"
														}
													]
												},
												{
													"name": "advancedDecal",
													"scaleX": 6,
													"scaleY": 6,
													"scaleZ": 10,
													"rotationY": 90,
													"albedoMap": "Fx/Alphas/T_circle2.png",
													"renderMode": "BeforeTonemapping",
													"type": "advancedDecal",
													"children": [
														{
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
															"type": "material"
														},
														{
															"name": "AutoAlpha",
															"source": "shaders/AutoAlpha.hx",
															"enabled": false,
															"props": {
																"scale": 1
															},
															"type": "shader"
														},
														{
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.27058823529411763,
																	0.5058823529411764,
																	0.984313725490196
																]
															},
															"type": "shader"
														}
													]
												}
											]
										},
										{
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 1,
												"power": 0.8
											},
											"type": "shader"
										},
										{
											"name": "TestAnimelec01",
											"x": -0.41296,
											"y": 0.15053,
											"z": -0.37727,
											"scaleX": 8,
											"scaleY": 8,
											"scaleZ": 8,
											"rotationX": 70,
											"rotationY": -33.29999999999997,
											"rotationZ": 11.299999999999983,
											"kind": 0,
											"args": [
												0
											],
											"type": "polygon",
											"children": [
												{
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
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
													"type": "material"
												},
												{
													"name": "AnimatedTexture",
													"source": "h3d.shader.AnimatedTexture",
													"props": {
														"useSourceUVs": true,
														"blendBetweenFrames": false,
														"startFrame": 0,
														"texture": "Fx/Alphas/T_ElectricArc_2x2_07.png",
														"speed": 15,
														"frameDivision": [
															2,
															2
														],
														"totalFrames": 4,
														"startTime": 0,
														"loop": true
													},
													"type": "shader"
												},
												{
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 1
													},
													"type": "shader"
												},
												{
													"name": "GradientMap",
													"source": "shaders/GradientMap.hx",
													"props": {
														"USE_ALPHA": true,
														"gradient": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0.234375,
																		"color": -12444212
																	},
																	{
																		"position": 0.7890625,
																		"color": -16735241
																	},
																	{
																		"position": 0.95703125,
																		"color": -15597542
																	}
																],
																"resolution": 64,
																"isVertical": false,
																"interpolation": "Linear",
																"colorMode": 0
															}
														}
													},
													"type": "shader"
												},
												{
													"name": "MaskColorAlpha",
													"source": "hrt.shader.MaskColorAlpha",
													"props": {
														"UVScale": [
															0.25,
															0.25
														],
														"alpha": 1,
														"MULTIPLY": false,
														"color": [
															1,
															1,
															1,
															1
														],
														"mask": "Fx/Alphas/T_ElectricArc_1x4_14.png",
														"UVOffset": [
															0,
															0
														]
													},
													"type": "shader",
													"children": [
														{
															"name": "UVOffset.x",
															"enabled": false,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 1,
																	"mode": 2
																}
															],
															"type": "curve"
														},
														{
															"name": "UVOffset.y",
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": -3,
																	"mode": 2
																}
															],
															"loop": true,
															"type": "curve"
														}
													]
												}
											]
										}
									]
								},
								{
									"name": "Test03-filament",
									"x": -10.68591,
									"y": 42.74847,
									"z": -9.1082,
									"type": "object",
									"children": [
										{
											"name": "testFilament",
											"x": 0.1583,
											"y": -0.24983,
											"z": 0.12345,
											"scaleX": 5.5,
											"scaleY": 5.999999999999999,
											"scaleZ": 6.000000000000001,
											"rotationX": 28.2,
											"rotationY": -106.5,
											"rotationZ": -113.9,
											"kind": 0,
											"args": [
												0
											],
											"type": "polygon",
											"children": [
												{
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
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
													"type": "material"
												},
												{
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
														"texture": "Fx/Alphas/T_Wave02.png"
													},
													"type": "shader"
												},
												{
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.33725490196078434,
															0.27058823529411763,
															0.984313725490196
														]
													},
													"type": "shader"
												},
												{
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.35,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/FireMask.png",
														"uvShift": [
															0.5,
															0
														],
														"uvShiftSpeed": [
															-3,
															0
														]
													},
													"type": "shader"
												},
												{
													"name": "UVDistortion",
													"source": "shaders/UVDistortion.hx",
													"props": {
														"noiseTexture": "Fx/Gradients/circGrad01.png",
														"directionalNoise": false,
														"intensity": 0.4,
														"scrollSpeed": [
															0,
															2
														],
														"scale": [
															1,
															1
														]
													},
													"type": "shader"
												},
												{
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
													},
													"type": "shader"
												}
											]
										},
										{
											"name": "testFilament",
											"x": 0.098,
											"y": -0.22907,
											"z": 0.22506,
											"scaleX": 5.5,
											"scaleY": 6,
											"scaleZ": 6.000000000000001,
											"rotationX": 28.2,
											"rotationY": -106.5,
											"rotationZ": -113.9,
											"kind": 0,
											"args": [
												0
											],
											"type": "polygon",
											"children": [
												{
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
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
													"type": "material"
												},
												{
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
														"texture": "Fx/Alphas/T_Wave02.png"
													},
													"type": "shader"
												},
												{
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.33725490196078434,
															0.27058823529411763,
															0.984313725490196
														]
													},
													"type": "shader"
												},
												{
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.35,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/FireMask.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															-3,
															0
														]
													},
													"type": "shader"
												},
												{
													"name": "UVDistortion",
													"source": "shaders/UVDistortion.hx",
													"props": {
														"noiseTexture": "Fx/Gradients/circGrad01.png",
														"directionalNoise": false,
														"intensity": 0.35,
														"scrollSpeed": [
															0,
															6
														],
														"scale": [
															1,
															1
														]
													},
													"type": "shader"
												},
												{
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
													},
													"type": "shader"
												}
											]
										},
										{
											"name": "TestAnimelecfil",
											"x": -0.95177,
											"y": -0.17172,
											"z": 0.32545,
											"scaleX": 6.5,
											"scaleY": 3.5,
											"scaleZ": 7,
											"rotationX": -22.099999999999984,
											"rotationY": 71.30000000000001,
											"rotationZ": -102.19999999999997,
											"kind": 0,
											"args": [
												0
											],
											"type": "polygon",
											"children": [
												{
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
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
													"type": "material"
												},
												{
													"name": "AnimatedTexture",
													"source": "h3d.shader.AnimatedTexture",
													"props": {
														"useSourceUVs": true,
														"blendBetweenFrames": false,
														"startFrame": 0,
														"texture": "Fx/Alphas/T_ElectricArc_4x2_04.png",
														"speed": 15,
														"frameDivision": [
															4,
															2
														],
														"totalFrames": 6,
														"startTime": 0,
														"loop": true
													},
													"type": "shader"
												},
												{
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 1
													},
													"type": "shader"
												},
												{
													"name": "GradientMap",
													"source": "shaders/GradientMap.hx",
													"props": {
														"USE_ALPHA": true,
														"gradient": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0.18359375,
																		"color": -9741057
																	},
																	{
																		"position": 0.44140625,
																		"color": -16735241
																	},
																	{
																		"position": 0.8203125,
																		"color": 4278232055
																	},
																	{
																		"position": 0.90234375,
																		"color": -15400929
																	}
																],
																"resolution": 64,
																"isVertical": false,
																"interpolation": "Linear",
																"colorMode": 0
															}
														}
													},
													"type": "shader"
												},
												{
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.33725490196078434,
															0.27058823529411763,
															0.984313725490196
														]
													},
													"type": "shader"
												},
												{
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
													},
													"type": "shader"
												}
											]
										},
										{
											"name": "haut",
											"x": 0.21672199999999986,
											"y": 0.620196,
											"z": 2.8625039999999995,
											"rotationZ": -6.599999999999992,
											"type": "object",
											"children": [
												{
													"name": "lookAt",
													"scaleX": 0.8,
													"scaleY": 0.8,
													"scaleZ": 0.8,
													"target": "camera",
													"lockAxis": [
														0,
														0,
														0
													],
													"type": "lookAt",
													"children": [
														{
															"name": "polygon",
															"z": -7.105427357601002e-15,
															"scaleX": 8,
															"scaleY": 8,
															"scaleZ": 8,
															"rotationX": 1.0315964937488239e-15,
															"rotationY": 89.99999999999999,
															"kind": 0,
															"args": [
																0
															],
															"type": "polygon",
															"children": [
																{
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
																	"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
																	"type": "material"
																},
																{
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
																	"type": "shader"
																},
																{
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
																	},
																	"type": "shader"
																},
																{
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
																	},
																	"type": "shader"
																},
																{
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
																	"loop": true,
																	"type": "curve"
																}
															]
														}
													]
												},
												{
													"name": "advancedDecal",
													"x": -0.37274,
													"y": 0.00122,
													"scaleX": 2.25,
													"scaleY": 2.25,
													"scaleZ": 7,
													"rotationX": 3,
													"rotationY": 90,
													"albedoMap": "Fx/Alphas/T_circle2.png",
													"renderMode": "BeforeTonemapping",
													"type": "advancedDecal",
													"children": [
														{
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
															"type": "material"
														},
														{
															"name": "GradientMap",
															"source": "shaders/GradientMap.hx",
															"props": {
																"USE_ALPHA": true,
																"gradient": {
																	"type": "gradient",
																	"data": {
																		"stops": [
																			{
																				"position": 0.29296875,
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
															},
															"type": "shader"
														}
													]
												},
												{
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 1.2,
														"power": 0.8
													},
													"type": "shader"
												}
											]
										},
										{
											"name": "bas",
											"x": -0.09318,
											"y": -0.89819,
											"z": -2.69993,
											"rotationZ": -6.599999999999992,
											"type": "object",
											"children": [
												{
													"name": "lookAt",
													"scaleX": 0.8,
													"scaleY": 0.8,
													"scaleZ": 0.8,
													"target": "camera",
													"lockAxis": [
														0,
														0,
														0
													],
													"type": "lookAt",
													"children": [
														{
															"name": "polygon",
															"z": -7.105427357601002e-15,
															"scaleX": 8,
															"scaleY": 8,
															"scaleZ": 8,
															"rotationX": 1.0315964937488239e-15,
															"rotationY": 89.99999999999999,
															"kind": 0,
															"args": [
																0
															],
															"type": "polygon",
															"children": [
																{
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
																	"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
																	"type": "material"
																},
																{
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
																	"type": "shader"
																},
																{
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
																	},
																	"type": "shader"
																},
																{
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
																	},
																	"type": "shader"
																},
																{
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
																	"loop": true,
																	"type": "curve"
																}
															]
														}
													]
												},
												{
													"name": "emitter",
													"enabled": false,
													"props": {
														"lifeTime": 0.1,
														"alignMode": "Screen",
														"emitRate": 4,
														"maxCount": 8,
														"instScale": 50,
														"instScale_rand": 10,
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
													"type": "emitter",
													"children": [
														{
															"name": "polygon",
															"kind": 0,
															"args": [
																0
															],
															"type": "polygon",
															"children": [
																{
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
																	"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
																	"type": "material"
																},
																{
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
																		"texture": "Fx/Alphas/T_Flare05.png"
																	},
																	"type": "shader"
																},
																{
																	"name": "GradientMap",
																	"source": "shaders/GradientMap.hx",
																	"props": {
																		"USE_ALPHA": true,
																		"gradient": {
																			"type": "gradient",
																			"data": {
																				"stops": [
																					{
																						"position": 0.2890625,
																						"color": -12444212
																					},
																					{
																						"position": 0.51171875,
																						"color": -16735241
																					},
																					{
																						"position": 1,
																						"color": -15597542
																					}
																				],
																				"resolution": 64,
																				"isVertical": false,
																				"interpolation": "Linear",
																				"colorMode": 0
																			}
																		}
																	},
																	"type": "shader"
																},
																{
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"enabled": false,
																	"props": {
																		"amount": 1,
																		"color": [
																			0.33725490196078434,
																			0.27058823529411763,
																			0.984313725490196
																		]
																	},
																	"type": "shader"
																},
																{
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"props": {
																		"amount": 1,
																		"color": [
																			0.47058823529411764,
																			0.807843137254902,
																			0.984313725490196
																		]
																	},
																	"type": "shader"
																},
																{
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"enabled": false,
																	"props": {
																		"amount": 1,
																		"color": [
																			0.7568627450980392,
																			0.9176470588235294,
																			1
																		]
																	},
																	"type": "shader"
																},
																{
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"props": {
																		"amount": 1,
																		"color": [
																			1,
																			0.8470588235294118,
																			0.6823529411764706
																		]
																	},
																	"type": "shader"
																}
															]
														},
														{
															"name": "instScale",
															"keys": [
																{
																	"time": 0,
																	"value": 0.2,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 1,
																	"mode": 2
																}
															],
															"type": "curve"
														}
													]
												},
												{
													"name": "emitter",
													"enabled": false,
													"props": {
														"lifeTime": 0.1,
														"alignMode": "Screen",
														"emitRate": 4,
														"maxCount": 8,
														"instScale": 5,
														"instScale_rand": 1,
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
													"type": "emitter",
													"children": [
														{
															"name": "polygon",
															"kind": 0,
															"args": [
																0
															],
															"type": "polygon",
															"children": [
																{
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
																	"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
																	"type": "material"
																},
																{
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
																		"texture": "Fx/Alphas/T_Flare07.png"
																	},
																	"type": "shader"
																},
																{
																	"name": "GradientMap",
																	"source": "shaders/GradientMap.hx",
																	"props": {
																		"USE_ALPHA": true,
																		"gradient": {
																			"type": "gradient",
																			"data": {
																				"stops": [
																					{
																						"position": 0.2890625,
																						"color": -12444212
																					},
																					{
																						"position": 0.51171875,
																						"color": -16735241
																					},
																					{
																						"position": 1,
																						"color": -15597542
																					}
																				],
																				"resolution": 64,
																				"isVertical": false,
																				"interpolation": "Linear",
																				"colorMode": 0
																			}
																		}
																	},
																	"type": "shader"
																},
																{
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"enabled": false,
																	"props": {
																		"amount": 1,
																		"color": [
																			0.33725490196078434,
																			0.27058823529411763,
																			0.984313725490196
																		]
																	},
																	"type": "shader"
																},
																{
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"enabled": false,
																	"props": {
																		"amount": 1,
																		"color": [
																			0.47058823529411764,
																			0.807843137254902,
																			0.984313725490196
																		]
																	},
																	"type": "shader"
																},
																{
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"enabled": false,
																	"props": {
																		"amount": 1,
																		"color": [
																			0.7568627450980392,
																			0.9176470588235294,
																			1
																		]
																	},
																	"type": "shader"
																},
																{
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"props": {
																		"amount": 1,
																		"color": [
																			1,
																			0.8470588235294118,
																			0.6823529411764706
																		]
																	},
																	"type": "shader"
																}
															]
														},
														{
															"name": "instScale",
															"keys": [
																{
																	"time": 0,
																	"value": 0.2,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 1,
																	"mode": 2
																}
															],
															"type": "curve"
														}
													]
												},
												{
													"name": "advancedDecal",
													"x": -0.37274,
													"y": 0.00122,
													"scaleX": 2.25,
													"scaleY": 2.25,
													"scaleZ": 7,
													"rotationX": 3,
													"rotationY": 90,
													"albedoMap": "Fx/Alphas/T_circle2.png",
													"renderMode": "BeforeTonemapping",
													"type": "advancedDecal",
													"children": [
														{
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
															"type": "material"
														},
														{
															"name": "GradientMap",
															"source": "shaders/GradientMap.hx",
															"props": {
																"USE_ALPHA": true,
																"gradient": {
																	"type": "gradient",
																	"data": {
																		"stops": [
																			{
																				"position": 0.29296875,
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
															},
															"type": "shader"
														}
													]
												},
												{
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 1.2,
														"power": 0.8
													},
													"type": "shader"
												}
											]
										}
									]
								}
							]
						},
						{
							"name": "Lights",
							"x": 0.07334,
							"y": 0.33092666666666615,
							"z": 14.290090000000001,
							"rotationZ": 9.93923337957349e-17,
							"type": "object",
							"children": [
								{
									"name": "ViernusBaseLights",
									"source": "Fx/Meshes_Common/ViernusBaseLights.fbx",
									"x": 0.02416999999999997,
									"y": -0.08202666666666669,
									"z": -12.055380000000005,
									"scaleX": 1.8300000000000003,
									"scaleY": 1.8300000000000003,
									"scaleZ": 1.8300000000000003,
									"rotationZ": -90.5,
									"type": "model",
									"children": [
										{
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
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"type": "material"
										},
										{
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.3,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 150,
												"uvScaleY": 1,
												"texture": "Fx/Alphas/T_circle.png",
												"uvShift": [
													0,
													0.05
												],
												"uvShiftSpeed": [
													0,
													0
												]
											},
											"type": "shader"
										},
										{
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.25,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 1,
												"texture": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -16777216
															},
															{
																"position": 0.42578125,
																"color": -1
															},
															{
																"position": 0.63671875,
																"color": -1
															},
															{
																"position": 1,
																"color": -16777216
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												},
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.15,
													0
												]
											},
											"type": "shader"
										}
									]
								},
								{
									"name": "Triangle",
									"x": -0.04833999999999991,
									"y": 0.16405333333333294,
									"z": 24.110760000000006,
									"scaleX": 2.5000000000000004,
									"scaleY": 2.5000000000000004,
									"scaleZ": 2.5,
									"rotationX": 0.9999999999999996,
									"rotationY": 2.2069531490250796e-32,
									"rotationZ": -1.2722218725854065e-14,
									"kind": 0,
									"args": [
										0
									],
									"type": "polygon",
									"children": [
										{
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 40
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"type": "material"
										},
										{
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
												"texture": "Fx/Alphas/T_Triangle_128.png"
											},
											"type": "shader"
										},
										{
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"props": {
												"minAlpha": 0,
												"maxAlpha": 1,
												"frequency": 0.5
											},
											"type": "shader"
										}
									]
								},
								{
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.33725490196078434,
											0.27058823529411763,
											0.984313725490196
										]
									},
									"type": "shader"
								},
								{
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.8,
										"ATTENUATE": true,
										"emissiveMap": null
									},
									"type": "shader"
								}
							]
						},
						{
							"name": "ElectricPolls_Left",
							"z": 22.4813,
							"rotationZ": -43.4,
							"type": "object",
							"children": [
								{
									"name": "VerniusBase_FilamentElectricity",
									"source": "Fx/Structure/Vernius/VerniusBase_FilamentElectricity.fx",
									"x": 9.70082,
									"y": 42.28597,
									"z": -9.30836,
									"rotationX": 31.4,
									"rotationZ": 169,
									"time": 0.69056,
									"type": "subFX"
								},
								{
									"name": "VerniusBase_FilamentElectricity",
									"source": "Fx/Structure/Vernius/VerniusBase_FilamentElectricity.fx",
									"x": -0.23514,
									"y": 43.89258,
									"z": -9.23648,
									"rotationX": 0.4,
									"rotationY": 6.3,
									"rotationZ": -2.6,
									"time": 0.69056,
									"type": "subFX"
								},
								{
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.85,
										"ATTENUATE": true,
										"emissiveMap": null
									},
									"type": "shader"
								},
								{
									"name": "Poteau_lights",
									"x": 4.50834,
									"y": 40.35547,
									"z": -8.96223,
									"rotationX": 1.9,
									"type": "object",
									"children": [
										{
											"name": "lightPOTO",
											"x": 0.43149,
											"y": 1.06006,
											"z": 1.75364,
											"scaleX": 6.6,
											"scaleY": 0.5,
											"scaleZ": 3,
											"rotationY": -62.1,
											"rotationZ": 83.4,
											"kind": 0,
											"args": [
												0
											],
											"type": "polygon",
											"children": [
												{
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
													"type": "material"
												},
												{
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.3,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl05u_A.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0
														]
													},
													"type": "shader"
												},
												{
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 0.15
													},
													"type": "shader"
												}
											]
										},
										{
											"name": "lightPOTO_leds",
											"x": 0.43149,
											"y": 1.06006,
											"z": 1.75364,
											"scaleX": 6.6,
											"scaleY": 0.5,
											"scaleZ": 3,
											"rotationY": -62.1,
											"rotationZ": 83.4,
											"kind": 0,
											"args": [
												0
											],
											"type": "polygon",
											"children": [
												{
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
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
													"type": "material"
												},
												{
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.3,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 15,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/T_circle.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0
														]
													},
													"type": "shader"
												},
												{
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.3,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl05u_A.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0
														]
													},
													"type": "shader"
												},
												{
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.75,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl05v_A.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															-0.5,
															0
														]
													},
													"type": "shader"
												}
											]
										},
										{
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.33725490196078434,
													0.27058823529411763,
													0.984313725490196
												]
											},
											"type": "shader"
										},
										{
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.9,
												"ATTENUATE": true,
												"emissiveMap": null
											},
											"type": "shader"
										}
									]
								}
							]
						},
						{
							"name": "ElectricPolls_Middle",
							"z": 22.4813,
							"rotationZ": 6.3,
							"type": "object",
							"children": [
								{
									"name": "VerniusBase_FilamentElectricity",
									"source": "Fx/Structure/Vernius/VerniusBase_FilamentElectricity.fx",
									"x": 9.70082,
									"y": 42.28597,
									"z": -9.30836,
									"rotationX": 31.4,
									"rotationZ": 169,
									"time": 6.300179978339948,
									"type": "subFX"
								},
								{
									"name": "VerniusBase_FilamentElectricity",
									"source": "Fx/Structure/Vernius/VerniusBase_FilamentElectricity.fx",
									"x": -0.23514,
									"y": 43.89258,
									"z": -9.23648,
									"rotationX": 0.4,
									"rotationY": 6.3,
									"rotationZ": -2.6,
									"time": 6.305179978339948,
									"type": "subFX"
								},
								{
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.85,
										"ATTENUATE": true,
										"emissiveMap": null
									},
									"type": "shader"
								},
								{
									"name": "Poteau_lights",
									"x": 4.57792,
									"y": 40.39927,
									"z": -8.96078,
									"rotationX": 1.9,
									"type": "object",
									"children": [
										{
											"name": "lightPOTO",
											"x": 0.43149,
											"y": 1.06006,
											"z": 1.75364,
											"scaleX": 6.6,
											"scaleY": 0.5,
											"scaleZ": 3,
											"rotationY": -62.1,
											"rotationZ": 83.4,
											"kind": 0,
											"args": [
												0
											],
											"type": "polygon",
											"children": [
												{
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
													"type": "material"
												},
												{
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.3,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl05u_A.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0
														]
													},
													"type": "shader"
												},
												{
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 0.15
													},
													"type": "shader"
												}
											]
										},
										{
											"name": "lightPOTO_leds",
											"x": 0.43149,
											"y": 1.06006,
											"z": 1.75364,
											"scaleX": 6.6,
											"scaleY": 0.5,
											"scaleZ": 3,
											"rotationY": -62.1,
											"rotationZ": 83.4,
											"kind": 0,
											"args": [
												0
											],
											"type": "polygon",
											"children": [
												{
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
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
													"type": "material"
												},
												{
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.3,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 15,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/T_circle.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0
														]
													},
													"type": "shader"
												},
												{
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.3,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl05u_A.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0
														]
													},
													"type": "shader"
												},
												{
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.75,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl05v_A.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															-0.5,
															0
														]
													},
													"type": "shader"
												}
											]
										},
										{
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.33725490196078434,
													0.27058823529411763,
													0.984313725490196
												]
											},
											"type": "shader"
										},
										{
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.9,
												"ATTENUATE": true,
												"emissiveMap": null
											},
											"type": "shader"
										}
									]
								}
							]
						},
						{
							"name": "ElectricPolls_Right",
							"z": 22.4813,
							"rotationZ": 56,
							"type": "object",
							"children": [
								{
									"name": "VerniusBase_FilamentElectricity",
									"source": "Fx/Structure/Vernius/VerniusBase_FilamentElectricity.fx",
									"x": 9.67568,
									"y": 42.15663,
									"z": -9.22793,
									"rotationX": 31.4,
									"rotationZ": 169,
									"time": 2.410343017578124,
									"type": "subFX"
								},
								{
									"name": "VerniusBase_FilamentElectricity",
									"source": "Fx/Structure/Vernius/VerniusBase_FilamentElectricity.fx",
									"x": -0.23665,
									"y": 43.65281,
									"z": -9.15188,
									"rotationX": 0.6,
									"rotationY": 8.4,
									"rotationZ": -2.6,
									"time": 2.410343017578124,
									"type": "subFX"
								},
								{
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.85,
										"ATTENUATE": true,
										"emissiveMap": null
									},
									"type": "shader"
								},
								{
									"name": "Poteau_lights",
									"x": 4.57792,
									"y": 40.26136,
									"z": -8.96535,
									"rotationX": 1.9,
									"type": "object",
									"children": [
										{
											"name": "lightPOTO",
											"x": 0.43149,
											"y": 1.06006,
											"z": 1.75364,
											"scaleX": 6.6,
											"scaleY": 0.5,
											"scaleZ": 3,
											"rotationY": -62.1,
											"rotationZ": 83.4,
											"kind": 0,
											"args": [
												0
											],
											"type": "polygon",
											"children": [
												{
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
													"type": "material"
												},
												{
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.3,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl05u_A.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0
														]
													},
													"type": "shader"
												},
												{
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 0.15
													},
													"type": "shader"
												}
											]
										},
										{
											"name": "lightPOTO_leds",
											"x": 0.43149,
											"y": 1.06006,
											"z": 1.75364,
											"scaleX": 6.6,
											"scaleY": 0.5,
											"scaleZ": 3,
											"rotationY": -62.1,
											"rotationZ": 83.4,
											"kind": 0,
											"args": [
												0
											],
											"type": "polygon",
											"children": [
												{
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
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
													"type": "material"
												},
												{
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.3,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 15,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/T_circle.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0
														]
													},
													"type": "shader"
												},
												{
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.3,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl05u_A.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0
														]
													},
													"type": "shader"
												},
												{
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.75,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl05v_A.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															-0.5,
															0
														]
													},
													"type": "shader"
												}
											]
										},
										{
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.33725490196078434,
													0.27058823529411763,
													0.984313725490196
												]
											},
											"type": "shader"
										},
										{
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.9,
												"ATTENUATE": true,
												"emissiveMap": null
											},
											"type": "shader"
										}
									]
								}
							]
						},
						{
							"name": "emitter_Slide",
							"props": {
								"alignMode": "Screen",
								"lifeTime": 0.4,
								"lifeTimeRand": 0.05,
								"maxCount": 40,
								"frameCount": 4,
								"frameDivisionX": 2,
								"frameDivisionY": 2,
								"animationLoop": false,
								"instScale": 2.6,
								"spriteSheet": "Fx/Alphas/T_ElectricArc_2x2_03.png",
								"instRotation_rand": [
									0,
									0,
									360
								],
								"instOffset_rand": [
									0,
									0,
									0
								],
								"instScale_rand": 1,
								"animationBlendBetweenFrames": false,
								"emitRate": 20,
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"emitShape": "Cylinder",
								"emitAngle": 360,
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
							"z": 0.22314,
							"scaleX": 12.5,
							"scaleY": 12.5,
							"scaleZ": 1.75,
							"type": "emitter",
							"children": [
								{
									"name": "polygon",
									"scaleX": 1.5,
									"scaleY": 1.5,
									"scaleZ": 1.5,
									"kind": 0,
									"args": [
										0
									],
									"type": "polygon",
									"children": [
										{
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
											"type": "material"
										},
										{
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											},
											"type": "shader"
										},
										{
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
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
											"type": "shader",
											"children": [
												{
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
													"type": "curve"
												}
											]
										},
										{
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
											},
											"type": "shader"
										}
									]
								},
								{
									"name": "position.z",
									"keys": [
										{
											"time": 0.1,
											"value": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.6666666666666666
											}
										},
										{
											"time": 2,
											"value": 30,
											"mode": 2
										}
									],
									"loop": true,
									"type": "curve"
								},
								{
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1.5,
											"prevHandle": {
												"dv": -0.005283080514001015,
												"dt": -0.501902278083384
											},
											"nextHandle": {
												"dv": 0.009336519767737972,
												"dt": 1.3133880651343448
											}
										},
										{
											"time": 2,
											"value": 0.7,
											"prevHandle": {
												"dv": -0.00734484572083538,
												"dt": -0.8697258596569748
											},
											"nextHandle": {
												"dv": 0.0043858030696355705,
												"dt": 0.4999911425256196
											}
										}
									],
									"type": "curve"
								}
							]
						},
						{
							"name": "OrbitalDrones",
							"z": 7.60492,
							"type": "object",
							"children": [
								{
									"name": "Bottom",
									"z": -0.01427,
									"scaleX": 1.2,
									"scaleY": 1.2,
									"scaleZ": 1.2,
									"type": "object",
									"children": [
										{
											"name": "OrbitalDrones",
											"props": {
												"emitShape": "Cylinder",
												"instScale_rand": 2.4,
												"instWorldAcceleration_rand": [
													0,
													0,
													0
												],
												"instStretch_rand": [
													0,
													0,
													0
												],
												"emitRad2": 0.7,
												"lifeTime": 1000000,
												"instOrbitSpeed_rand": [
													0,
													0,
													0.4
												],
												"emitRad1": 1.3,
												"emitOrientation": "Speed",
												"emitRate": 8,
												"simulationSpace": "World",
												"alignAxis": [
													10,
													0,
													0
												],
												"instRotation": [
													0,
													0,
													180
												],
												"maxCount": 8,
												"instScale": 6,
												"speedFactor": 0.7,
												"emitAngle": 360,
												"lifeTimeRand": 800000,
												"emitSurface": true,
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
											"scaleX": 60,
											"scaleY": 60,
											"scaleZ": 3.76,
											"type": "emitter",
											"children": [
												{
													"name": "SM_Drone01",
													"source": "Fx/Structure/Arrakeen/SM_Drone01.fbx",
													"scaleX": 0.12,
													"scaleY": 0.12,
													"scaleZ": 0.12,
													"type": "model"
												},
												{
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.10588235294117647,
															0.09019607843137255,
															0.12156862745098039
														]
													},
													"type": "shader"
												}
											]
										},
										{
											"name": "OrbitalDrones_lights",
											"props": {
												"emitShape": "Cylinder",
												"instScale_rand": 0.06,
												"instWorldAcceleration_rand": [
													0,
													0,
													0
												],
												"instStretch_rand": [
													0,
													0,
													0
												],
												"emitRad2": 0.7,
												"lifeTime": 1000000,
												"instOrbitSpeed_rand": [
													0,
													0,
													0.4
												],
												"emitRad1": 1.3,
												"emitOrientation": "Speed",
												"emitRate": 8,
												"simulationSpace": "World",
												"alignAxis": [
													10,
													0,
													0
												],
												"instRotation": [
													0,
													0,
													180
												],
												"maxCount": 8,
												"instScale": 0.18,
												"speedFactor": 0.7,
												"emitAngle": 360,
												"instOffset": [
													0,
													0,
													0.4
												],
												"instOffset_rand": [
													0,
													0,
													0
												],
												"lifeTimeRand": 800000,
												"emitSurface": true,
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
											"scaleX": 60,
											"scaleY": 60,
											"scaleZ": 3.8,
											"type": "emitter",
											"children": [
												{
													"name": "top",
													"scaleX": 4,
													"scaleY": 4,
													"scaleZ": 4,
													"rotationX": 1,
													"rotationZ": 180,
													"kind": 0,
													"args": [
														0
													],
													"type": "polygon",
													"children": [
														{
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
															"type": "material"
														},
														{
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
																"texture": "Fx/Alphas/T_ChocWave_Contrast02.png"
															},
															"type": "shader"
														},
														{
															"name": "GradientMap",
															"source": "shaders/GradientMap.hx",
															"props": {
																"USE_ALPHA": true,
																"gradient": {
																	"type": "gradient",
																	"data": {
																		"stops": [
																			{
																				"position": 0.48828125,
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
															},
															"type": "shader"
														}
													]
												}
											]
										},
										{
											"name": "OrbitalDrones ui",
											"props": {
												"emitShape": "Cylinder",
												"instScale_rand": 0.24,
												"instWorldAcceleration_rand": [
													0,
													0,
													0
												],
												"instStretch_rand": [
													0,
													0,
													0
												],
												"emitRad2": 0.7,
												"lifeTime": 1000000,
												"instOrbitSpeed_rand": [
													0,
													0,
													0.4
												],
												"emitRad1": 1.3,
												"emitOrientation": "Speed",
												"emitRate": 8,
												"simulationSpace": "World",
												"alignAxis": [
													10,
													0,
													0
												],
												"instRotation": [
													0,
													0,
													180
												],
												"maxCount": 8,
												"instScale": 0.7,
												"speedFactor": 0.7,
												"emitAngle": 360,
												"lifeTimeRand": 800000,
												"alignMode": "Screen",
												"instOffset": [
													0,
													-0.2,
													0
												],
												"emitSurface": true,
												"randomColor1": [
													0.33725490196078434,
													0.27058823529411763,
													0.984313725490196,
													1
												],
												"randomColor2": [
													0.27058823529411763,
													0.984313725490196,
													0.8235294117647058,
													1
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
											"scaleX": 60,
											"scaleY": 60,
											"scaleZ": 3.75,
											"type": "emitter",
											"children": [
												{
													"name": "top",
													"scaleX": 4,
													"scaleY": 4,
													"scaleZ": 4,
													"rotationX": 1,
													"rotationZ": 180,
													"kind": 0,
													"args": [
														0
													],
													"type": "polygon",
													"children": [
														{
															"name": "material",
															"props": {
																"PBR": {
																	"mode": "BeforeTonemapping",
																	"blend": "Alpha",
																	"shadows": false,
																	"culling": "Back",
																	"colorMask": 255,
																	"emissive": 6
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
															"type": "material"
														},
														{
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
																"texture": "Fx/Alphas/T_Ping_Cursor06-1.png"
															},
															"type": "shader"
														},
														{
															"name": "AlphaMult",
															"source": "shaders/AlphaMult.hx",
															"props": {
																"alpha": 1
															},
															"type": "shader",
															"children": [
																{
																	"name": "alpha",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 7.778746732779829e-8,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1.6306832013632634e-7,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.549092385455104e-7,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 3.4675015695469453e-7,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 4.295709851629767e-7,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 5.148518379715048e-7,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.0000012960420341069413,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.0000014022140221402214,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.0000015202952029520295,
																			"value": 0.75,
																			"mode": 2
																		},
																		{
																			"time": 0.0000017859778597785977,
																			"value": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -7.38007380073801e-8
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 7.527675276752766e-7
																			}
																		},
																		{
																			"time": 0.000004,
																			"value": 0,
																			"mode": 2
																		}
																	],
																	"loop": true,
																	"type": "curve"
																}
															]
														},
														{
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.33725490196078434,
																	0.27058823529411763,
																	0.984313725490196
																]
															},
															"type": "shader"
														}
													]
												}
											]
										},
										{
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.8,
												"ATTENUATE": true,
												"emissiveMap": null
											},
											"type": "shader"
										}
									]
								},
								{
									"name": "Tower",
									"z": 13.095469999999999,
									"type": "object",
									"children": [
										{
											"name": "OrbitalDrones",
											"props": {
												"emitShape": "Cylinder",
												"instScale_rand": 2.4,
												"instWorldAcceleration_rand": [
													0,
													0,
													0
												],
												"instStretch_rand": [
													0,
													0,
													0
												],
												"emitRad2": 0.4,
												"lifeTime": 1000000,
												"instOrbitSpeed_rand": [
													0,
													0,
													0.4
												],
												"emitRad1": 0.75,
												"emitOrientation": "Speed",
												"simulationSpace": "World",
												"alignAxis": [
													10,
													0,
													0
												],
												"instRotation": [
													0,
													0,
													180
												],
												"maxCount": 5,
												"instScale": 6,
												"speedFactor": 0.7,
												"emitAngle": 360,
												"emitSurface": true,
												"lifeTimeRand": 800000,
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
											"scaleX": 45,
											"scaleY": 45,
											"scaleZ": 22.5,
											"type": "emitter",
											"children": [
												{
													"name": "SM_Drone01",
													"source": "Fx/Structure/Arrakeen/SM_Drone01.fbx",
													"scaleX": 0.1,
													"scaleY": 0.1,
													"scaleZ": 0.1,
													"type": "model",
													"children": [
														{
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.10588235294117647,
																	0.09019607843137255,
																	0.12156862745098039
																]
															},
															"type": "shader"
														}
													]
												}
											]
										},
										{
											"name": "OrbitalDrones_lights",
											"props": {
												"emitShape": "Cylinder",
												"instScale_rand": 0.06,
												"instWorldAcceleration_rand": [
													0,
													0,
													0
												],
												"instStretch_rand": [
													0,
													0,
													0
												],
												"emitRad2": 0.4,
												"lifeTime": 1000000,
												"instOrbitSpeed_rand": [
													0,
													0,
													0.4
												],
												"emitRad1": 0.75,
												"emitOrientation": "Speed",
												"simulationSpace": "World",
												"alignAxis": [
													10,
													0,
													0
												],
												"instRotation": [
													0,
													0,
													180
												],
												"maxCount": 5,
												"instScale": 0.18,
												"speedFactor": 0.7,
												"emitAngle": 360,
												"emitSurface": true,
												"instOffset": [
													0,
													0,
													0.4
												],
												"lifeTimeRand": 800000,
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
											"scaleX": 45,
											"scaleY": 45,
											"scaleZ": 22.5,
											"type": "emitter",
											"children": [
												{
													"name": "top",
													"scaleX": 4,
													"scaleY": 4,
													"scaleZ": 4,
													"rotationX": 1,
													"rotationZ": 180,
													"kind": 0,
													"args": [
														0
													],
													"type": "polygon",
													"children": [
														{
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
															"type": "material"
														},
														{
															"name": "AlphaMap",
															"source": "shaders/AlphaMap.hx",
															"enabled": false,
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
																"texture": "Fx/Gradients/circGrad05.jpg"
															},
															"type": "shader"
														},
														{
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
																"texture": "Fx/Alphas/T_ChocWave_Contrast02.png"
															},
															"type": "shader"
														},
														{
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"enabled": false,
															"props": {
																"amount": 1,
																"color": [
																	0.33725490196078434,
																	0.27058823529411763,
																	0.984313725490196
																]
															},
															"type": "shader"
														},
														{
															"name": "AlphaMult",
															"source": "shaders/AlphaMult.hx",
															"enabled": false,
															"props": {
																"alpha": 1
															},
															"type": "shader",
															"children": [
																{
																	"name": "alpha",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 5.806941581388243e-7,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.0000012960420341069413,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.000002,
																			"value": 0,
																			"prevHandle": {
																				"dv": 0.002121688701488038,
																				"dt": -2.6004577474840324e-7
																			},
																			"nextHandle": {
																				"dv": -0.007168580718800515,
																				"dt": 4.999489873997548e-7
																			}
																		},
																		{
																			"time": 0.000004,
																			"value": 0,
																			"mode": 2
																		}
																	],
																	"loop": true,
																	"type": "curve"
																}
															]
														},
														{
															"name": "GradientMap",
															"source": "shaders/GradientMap.hx",
															"props": {
																"USE_ALPHA": true,
																"gradient": {
																	"type": "gradient",
																	"data": {
																		"stops": [
																			{
																				"position": 0.48828125,
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
															},
															"type": "shader"
														}
													]
												}
											]
										},
										{
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.8,
												"ATTENUATE": true,
												"emissiveMap": null
											},
											"type": "shader"
										}
									]
								}
							]
						},
						{
							"name": "MagneticFieldTest",
							"enabled": false,
							"z": 2.69769,
							"type": "object",
							"children": [
								{
									"name": "TestBobine",
									"scaleX": 20,
									"scaleY": 20,
									"scaleZ": 20,
									"kind": 1,
									"args": [
										24,
										360,
										0,
										4
									],
									"type": "polygon",
									"children": [
										{
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
											"type": "material"
										},
										{
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.36,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Cyl16u_A01.png",
												"uvShift": [
													0,
													0.05
												],
												"uvShiftSpeed": [
													1,
													0
												]
											},
											"type": "shader"
										},
										{
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.33725490196078434,
													0.27058823529411763,
													0.984313725490196
												]
											},
											"type": "shader"
										},
										{
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
																"color": -13754522
															},
															{
																"position": 0.5390625,
																"color": -12444212
															},
															{
																"position": 1,
																"color": -5276929
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
											},
											"type": "shader"
										},
										{
											"name": "UVDistortion",
											"source": "shaders/UVDistortion.hx",
											"props": {
												"noiseTexture": "Fx/noise/Water_03.png",
												"directionalNoise": false,
												"intensity": 0.1,
												"scrollSpeed": [
													1,
													0
												],
												"scale": [
													1,
													0.25
												]
											},
											"type": "shader"
										},
										{
											"name": "UVDistortion",
											"source": "shaders/UVDistortion.hx",
											"props": {
												"noiseTexture": "Fx/noise/T_ElecNoise01.png",
												"directionalNoise": false,
												"intensity": 0.14,
												"scrollSpeed": [
													1,
													0
												],
												"scale": [
													1,
													0.25
												]
											},
											"type": "shader"
										},
										{
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 1,
												"power": 0.8
											},
											"type": "shader"
										}
									]
								},
								{
									"name": "TestBobine",
									"scaleX": 19.999999999999996,
									"scaleY": 19.999999999999996,
									"scaleZ": 20,
									"rotationZ": -117.2951722981503,
									"kind": 1,
									"args": [
										24,
										360,
										0,
										4
									],
									"type": "polygon",
									"children": [
										{
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
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"type": "material"
										},
										{
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.34,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Cyl16u_A01.png",
												"uvShift": [
													0,
													0.05
												],
												"uvShiftSpeed": [
													1,
													0
												]
											},
											"type": "shader"
										},
										{
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.33725490196078434,
													0.27058823529411763,
													0.984313725490196
												]
											},
											"type": "shader"
										},
										{
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
																"color": -13754522
															},
															{
																"position": 0.5390625,
																"color": -12444212
															},
															{
																"position": 1,
																"color": -5276929
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
											},
											"type": "shader"
										},
										{
											"name": "UVDistortion",
											"source": "shaders/UVDistortion.hx",
											"props": {
												"noiseTexture": "Fx/Alphas/TS_Dust_01_1024.png",
												"directionalNoise": false,
												"intensity": 0.64,
												"scrollSpeed": [
													0,
													0
												],
												"scale": [
													2,
													1
												]
											},
											"type": "shader"
										},
										{
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 1,
												"power": 0.8
											},
											"type": "shader"
										}
									]
								}
							]
						},
						{
							"name": "Viernus_CentralTower",
							"source": "Fx/Meshes_Common/Viernus_CentralTower.fbx",
							"z": -17.34292,
							"scaleX": 1.9,
							"scaleY": 1.9,
							"scaleZ": 2.2,
							"type": "model",
							"children": [
								{
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
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
									"type": "material"
								},
								{
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.36,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 2,
										"texture": "Fx/Gradients/Cyl16u_A.png",
										"uvShift": [
											0,
											0.05
										],
										"uvShiftSpeed": [
											0,
											1
										]
									},
									"type": "shader"
								},
								{
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.27,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 2,
										"texture": "Fx/noise/clouds_Dissolve.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											1
										]
									},
									"type": "shader"
								},
								{
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 1,
										"power": 0.8
									},
									"type": "shader"
								},
								{
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
														"color": -15727340
													},
													{
														"position": 0.5390625,
														"color": -12444212
													},
													{
														"position": 1,
														"color": -13421
													}
												],
												"resolution": 64,
												"isVertical": false,
												"interpolation": "Linear",
												"colorMode": 0
											}
										}
									},
									"type": "shader"
								},
								{
									"name": "Fresnel",
									"source": "shaders/Fresnel.hx",
									"props": {
										"RGB": false,
										"ALPHA": true,
										"REVERSE": false,
										"bias": 0.05,
										"scale": 0.65,
										"power": 1,
										"color": [
											0,
											0,
											0
										]
									},
									"type": "shader"
								},
								{
									"name": "UVSweep",
									"source": "shaders/UVSweep.hx",
									"props": {
										"saturation": 0.42,
										"width": 1,
										"useU": false,
										"progress": 1
									},
									"type": "shader",
									"children": [
										{
											"name": "progress",
											"keys": [
												{
													"time": 0.1,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.6666666666666666
													}
												},
												{
													"time": 2,
													"value": 1,
													"mode": 2
												}
											],
											"loop": true,
											"type": "curve"
										}
									]
								},
								{
									"name": "UVDistortion",
									"source": "shaders/UVDistortion.hx",
									"props": {
										"noiseTexture": "Fx/noise/Water_03.png",
										"directionalNoise": false,
										"intensity": 0.2,
										"scrollSpeed": [
											0,
											0
										],
										"scale": [
											1,
											2
										]
									},
									"type": "shader"
								}
							]
						},
						{
							"name": "CylinderStraight_mult",
							"source": "Fx/Meshes_Common/CylinderStraight.fbx",
							"x": 0.31762,
							"y": 29.58665,
							"z": 4.73512,
							"scaleX": 0.55,
							"scaleY": 0.55,
							"scaleZ": 7,
							"rotationX": 90,
							"rotationY": 180,
							"type": "model",
							"children": [
								{
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
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
									"type": "material"
								},
								{
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
										"uvScaleY": 3,
										"texture": "Fx/Alphas/T_circle3.png",
										"uvShift": [
											0.25,
											0
										],
										"uvShiftSpeed": [
											0,
											0.75
										]
									},
									"type": "shader"
								},
								{
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
														"color": -13754522
													},
													{
														"position": 0.65625,
														"color": -12444212
													},
													{
														"position": 1,
														"color": -9154057
													}
												],
												"resolution": 64,
												"isVertical": false,
												"interpolation": "Linear",
												"colorMode": 0
											}
										}
									},
									"type": "shader"
								}
							]
						},
						{
							"name": "CylinderStraight-InOut",
							"source": "Fx/Meshes_Common/CylinderStraight.fbx",
							"x": 0.31762,
							"y": 29.58665,
							"z": 4.73512,
							"scaleX": 0.55,
							"scaleY": 0.55,
							"scaleZ": 7,
							"rotationX": 90,
							"rotationY": 180,
							"type": "model",
							"children": [
								{
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
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
									"type": "material"
								},
								{
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.76,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/Cyl05u_A.jpg",
										"uvShift": [
											0.1,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										]
									},
									"type": "shader"
								},
								{
									"name": "GradientMap",
									"source": "shaders/GradientMap.hx",
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0.15234375,
														"color": -13754522
													},
													{
														"position": 0.59375,
														"color": -9757236
													},
													{
														"position": 1,
														"color": -74613
													}
												],
												"resolution": 64,
												"isVertical": false,
												"interpolation": "Linear",
												"colorMode": 0
											}
										}
									},
									"type": "shader"
								},
								{
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.5
									},
									"type": "shader"
								}
							]
						},
						{
							"name": "PatternLights02",
							"x": -0.15240999999999927,
							"y": 1.9558199999999974,
							"z": 3.1866499999999984,
							"scaleX": 0.9999999999999998,
							"scaleY": 0.9999999999999998,
							"scaleZ": 0.9999999999999998,
							"rotationZ": 9.939233379573491e-17,
							"type": "object",
							"children": [
								{
									"name": "polygon",
									"x": -8.881784197001252e-16,
									"z": 1.3322676295501878e-15,
									"scaleX": 75.20000000000003,
									"scaleY": 75.20000000000003,
									"scaleZ": 75.20000000000003,
									"rotationZ": -1.691784405033785e-16,
									"kind": 0,
									"args": [
										0
									],
									"type": "polygon",
									"children": [
										{
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
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"type": "material"
										},
										{
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.3,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Alphas/T_CircuitPattern_VerniusBase07.png",
												"uvShift": [
													0,
													0.05
												],
												"uvShiftSpeed": [
													0,
													0
												]
											},
											"type": "shader"
										},
										{
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.33725490196078434,
													0.27058823529411763,
													0.984313725490196
												]
											},
											"type": "shader"
										},
										{
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
																"color": -13754522
															},
															{
																"position": 0.30859375,
																"color": -12444212
															},
															{
																"position": 1,
																"color": -4033215
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
											},
											"type": "shader"
										},
										{
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.3,
												"saturation": 0.5,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 1,
												"texture": "Fx/noise/DissolveCircuit.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.01,
													-0.04
												]
											},
											"type": "shader"
										},
										{
											"name": "AlphaKill",
											"source": "shaders/AlphaKill.hx",
											"props": {
												"threshold": 0.001,
												"useRGB": false
											},
											"type": "shader"
										},
										{
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.6
											},
											"type": "shader"
										}
									]
								},
								{
									"name": "polygon",
									"x": -1.3322676295501878e-15,
									"y": 1.7763568394002505e-15,
									"z": 4.440892098500626e-16,
									"scaleX": 75.2,
									"scaleY": 75.2,
									"scaleZ": 75.19999999999996,
									"rotationZ": 2.5376766075506784e-16,
									"kind": 0,
									"args": [
										0
									],
									"type": "polygon",
									"children": [
										{
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
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"type": "material"
										},
										{
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.3,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Alphas/T_CircuitPattern_VerniusBase07.png",
												"uvShift": [
													0,
													0.05
												],
												"uvShiftSpeed": [
													0,
													0
												]
											},
											"type": "shader"
										},
										{
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.33725490196078434,
													0.27058823529411763,
													0.984313725490196
												]
											},
											"type": "shader"
										},
										{
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.4
											},
											"type": "shader"
										},
										{
											"name": "AlphaKill",
											"source": "shaders/AlphaKill.hx",
											"props": {
												"threshold": 0.001,
												"useRGB": false
											},
											"type": "shader"
										},
										{
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.35,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 1,
												"texture": "Fx/noise/DissolveCircuit.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.01,
													-0.04
												]
											},
											"type": "shader"
										}
									]
								}
							]
						},
						{
							"name": "PatternLights02",
							"x": -0.15241,
							"y": 32.56895,
							"z": 6.90985,
							"scaleX": 0.9999999999999998,
							"scaleY": 0.9999999999999998,
							"scaleZ": 0.9999999999999998,
							"rotationZ": 9.939233379573491e-17,
							"type": "object",
							"children": [
								{
									"name": "polygon",
									"x": 0.50884,
									"y": -30.56718,
									"z": -3.33922,
									"scaleX": 75.20000000000003,
									"scaleY": 75.20000000000003,
									"scaleZ": 75.20000000000003,
									"rotationZ": -1.691784405033785e-16,
									"kind": 0,
									"args": [
										0
									],
									"type": "polygon",
									"children": [
										{
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
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"type": "material"
										},
										{
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.3,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Alphas/T_CircuitPattern_VerniusBase06.png",
												"uvShift": [
													0,
													0.05
												],
												"uvShiftSpeed": [
													0,
													0
												]
											},
											"type": "shader"
										},
										{
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.33725490196078434,
													0.27058823529411763,
													0.984313725490196
												]
											},
											"type": "shader"
										},
										{
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
																"color": -13754522
															},
															{
																"position": 0.30859375,
																"color": -12444212
															},
															{
																"position": 1,
																"color": -4033215
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
											},
											"type": "shader"
										},
										{
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.3,
												"saturation": 0.5,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 1,
												"texture": "Fx/noise/DissolveCircuit.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.01,
													-0.04
												]
											},
											"type": "shader"
										},
										{
											"name": "AlphaKill",
											"source": "shaders/AlphaKill.hx",
											"props": {
												"threshold": 0.001,
												"useRGB": false
											},
											"type": "shader"
										},
										{
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.6
											},
											"type": "shader"
										}
									]
								},
								{
									"name": "polygon",
									"x": 0.50884,
									"y": -30.56718,
									"z": -3.33922,
									"scaleX": 75.20000000000003,
									"scaleY": 75.20000000000003,
									"scaleZ": 75.20000000000003,
									"rotationZ": -1.691784405033785e-16,
									"kind": 0,
									"args": [
										0
									],
									"type": "polygon",
									"children": [
										{
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
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"type": "material"
										},
										{
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.3,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Alphas/T_CircuitPattern_VerniusBase06.png",
												"uvShift": [
													0,
													0.05
												],
												"uvShiftSpeed": [
													0,
													0
												]
											},
											"type": "shader"
										},
										{
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.33725490196078434,
													0.27058823529411763,
													0.984313725490196
												]
											},
											"type": "shader"
										},
										{
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.4
											},
											"type": "shader"
										},
										{
											"name": "AlphaKill",
											"source": "shaders/AlphaKill.hx",
											"props": {
												"threshold": 0.001,
												"useRGB": false
											},
											"type": "shader"
										},
										{
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.35,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 1,
												"texture": "Fx/noise/DissolveCircuit.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.01,
													-0.04
												]
											},
											"type": "shader"
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