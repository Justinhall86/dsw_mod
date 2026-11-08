{
	"type": "fx",
	"cullingRadius": 150,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"z": -4,
			"rotationZ": -90,
			"children": [
				{
					"type": "object",
					"name": "NeuralCore",
					"rotationY": 10,
					"children": [
						{
							"type": "object",
							"name": "PIVOT longer",
							"x": -5.13989,
							"z": 30,
							"children": [
								{
									"type": "object",
									"name": "Pivot",
									"scaleX": 2,
									"scaleY": 2,
									"scaleZ": 2,
									"children": [
										{
											"type": "object",
											"name": "group",
											"x": 7.5,
											"rotationZ": 90,
											"children": [
												{
													"type": "lookAt",
													"name": "lookAt",
													"target": "camera",
													"lockAxis": [
														0,
														1,
														0
													],
													"children": [
														{
															"type": "polygon",
															"name": "polygon",
															"scaleX": 15,
															"scaleY": 0.15,
															"rotationX": 90,
															"rotationZ": -90,
															"kind": 0,
															"args": [
																10
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
																		"texture": "Fx/Gradients/Cyl03u_A.jpg"
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
																	"name": "UVTransform",
																	"source": "shaders/UVTransform.hx",
																	"props": {
																		"scaleX": 3,
																		"scaleY": 1,
																		"shiftX": 0,
																		"shiftY": 0,
																		"shiftSpeedX": -0.05,
																		"shiftSpeedY": 0
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
																		"progress": 0.74,
																		"saturation": 0,
																		"width": 1,
																		"uvScaleX": 1,
																		"uvScaleY": 1,
																		"texture": "Fx/Gradients/uGrad_inv.png",
																		"uvShift": [
																			-0.01,
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
																		"directionalNoise": false,
																		"intensity": 0.63,
																		"scrollSpeed": [
																			-0.5,
																			0
																		],
																		"scale": [
																			2,
																			0.5
																		]
																	}
																}
															]
														},
														{
															"type": "polygon",
															"name": "polygon",
															"scaleX": 15,
															"scaleY": 0.5,
															"rotationX": 90,
															"rotationZ": -90,
															"kind": 0,
															"args": [
																10
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
																		"alpha": 0.2,
																		"uScale": 1,
																		"vScale": 1,
																		"uOffset": 0,
																		"vOffset": 0,
																		"texture": "Fx/Gradients/Cyl03u_A.jpg"
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
																	"name": "UVTransform",
																	"source": "shaders/UVTransform.hx",
																	"props": {
																		"scaleX": 3,
																		"scaleY": 1,
																		"shiftX": 0,
																		"shiftY": 0,
																		"shiftSpeedX": -0.05,
																		"shiftSpeedY": 0
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
																		"progress": 0.74,
																		"saturation": 0,
																		"width": 1,
																		"uvScaleX": 1,
																		"uvScaleY": 1,
																		"texture": "Fx/Gradients/uGrad_inv.png",
																		"uvShift": [
																			-0.01,
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
																		"directionalNoise": false,
																		"intensity": 0.63,
																		"scrollSpeed": [
																			-0.5,
																			0
																		],
																		"scale": [
																			1,
																			0.5
																		]
																	}
																}
															]
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
																"texture": "Fx/Gradients/uGrad.png",
																"uvShift": [
																	-0.01,
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
																			"time": 0.46504063760080505,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.6678281159994215,
																			"value": 1,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.1635565926219277
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": -0.5
																			}
																		}
																	]
																}
															]
														},
														{
															"type": "polygon",
															"name": "polygonElec",
															"enabled": false,
															"scaleX": 15,
															"rotationX": 89.99999999999999,
															"rotationY": 7.352732281927438e-15,
															"rotationZ": -89.99999999999999,
															"kind": 0,
															"args": [
																10
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
																			"emissive": 10
																		}
																	},
																	"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
																},
																{
																	"type": "shader",
																	"name": "AnimatedTexture",
																	"source": "h3d.shader.AnimatedTexture",
																	"props": {
																		"useSourceUVs": false,
																		"blendBetweenFrames": false,
																		"startFrame": 0,
																		"texture": "Fx/Alphas/T_ElectricArc_1x4_13.png",
																		"speed": 15,
																		"frameDivision": [
																			1,
																			4
																		],
																		"totalFrames": 4,
																		"startTime": 0,
																		"loop": true
																	}
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
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"props": {
																		"amount": 1,
																		"color": [
																			0.5686274509803921,
																			0.47058823529411764,
																			1
																		]
																	}
																},
																{
																	"type": "shader",
																	"name": "UVTransform",
																	"source": "shaders/UVTransform.hx",
																	"props": {
																		"scaleX": 3,
																		"scaleY": 1,
																		"shiftX": 0,
																		"shiftY": 0,
																		"shiftSpeedX": -0.05,
																		"shiftSpeedY": 0
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
																		"progress": 0.74,
																		"saturation": 0,
																		"width": 1,
																		"uvScaleX": 1,
																		"uvScaleY": 1,
																		"texture": "Fx/Gradients/uGrad_inv.png",
																		"uvShift": [
																			-0.01,
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
																		"progress": 0.33,
																		"saturation": 1,
																		"width": 1,
																		"uvScaleX": 2,
																		"uvScaleY": 0.5,
																		"texture": "Fx/noise/T_Fire.png",
																		"uvShift": [
																			-0.01,
																			0
																		],
																		"uvShiftSpeed": [
																			-1,
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
																		"texture": "Fx/Gradients/uGrad.png",
																		"uvShift": [
																			-0.01,
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
																					"time": 0.4703766769668404,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.0113148737571431,
																					"value": 1,
																					"prevHandle": {
																						"dv": -0.015828068999619305,
																						"dt": -0.2721380076678208
																					},
																					"nextHandle": {
																						"dv": 0.0161672128995334,
																						"dt": 0.2063853520171111
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
	]
}