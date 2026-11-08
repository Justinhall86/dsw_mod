{
	"type": "fx",
	"cullingRadius": 100,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"scaleX": 1.01,
			"scaleY": 1.01,
			"scaleZ": 1.01,
			"children": [
				{
					"type": "object",
					"name": "PulseCountDown",
					"scaleX": 1.1,
					"scaleY": 1.1,
					"scaleZ": 1.1,
					"children": [
						{
							"type": "object",
							"name": "PulseSmall",
							"scaleX": 1.08,
							"scaleY": 1.08,
							"scaleZ": 1.1,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt",
									"rotationX": 1.6721165498415313e-15,
									"rotationY": -18,
									"rotationZ": 44.6562253229215,
									"target": "camera",
									"lockAxis": [
										0,
										0,
										0
									],
									"children": [
										{
											"type": "polygon",
											"name": "polygon_Circle",
											"scaleX": 1.2,
											"scaleY": 1.2,
											"scaleZ": 1.2,
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
														"texture": "Fx/Alphas/T_UI_Circle_Plain_2048.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.013101749002796195,
																		"dt": -0.49994431761216657
																	},
																	"nextHandle": {
																		"dv": 0.012499999999999956,
																		"dt": 0.47681640625000005
																	}
																},
																{
																	"time": 0.5,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.012500000000000011,
																		"dt": -0.46623046874999996
																	},
																	"nextHandle": {
																		"dv": 0.009453350040267882,
																		"dt": 0.3499585872328905
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
															0.5490196078431373,
															0.2901960784313725,
															0.1803921568627451
														]
													}
												},
												{
													"type": "curve",
													"name": "scale",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0.95,
															"mode": 0,
															"prevHandle": {
																"dv": -0.0008527475489023193,
																"dt": -0.4999328272986826
															},
															"nextHandle": {
																"dv": 0.0008333333333333526,
																"dt": 0.488551025390625
															}
														},
														{
															"time": 0.5,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.997879638671876,
															"value": 0.95,
															"mode": 0,
															"prevHandle": {
																"dv": -0.0008333333333333526,
																"dt": -0.45326538085937595
															},
															"nextHandle": {
																"dv": 0.0006388001709488119,
																"dt": 0.34994614970350457
															}
														},
														{
															"time": 1,
															"value": 0.95,
															"mode": 0
														}
													]
												},
												{
													"type": "curve",
													"name": "rotation.x",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 300,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -50
															},
															"nextHandle": {
																"dv": 0,
																"dt": 50
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
							"name": "PulseBig",
							"scaleX": 1.5,
							"scaleY": 1.5,
							"scaleZ": 1.5,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt",
									"scaleY": 0.9999999999999999,
									"rotationX": 1.6841764469393999e-15,
									"rotationY": -19.222652143119696,
									"rotationZ": 44.6562253229215,
									"target": "camera",
									"lockAxis": [
										0,
										0,
										0
									],
									"children": [
										{
											"type": "polygon",
											"name": "polygon_2",
											"rotationX": -89.99999999999997,
											"rotationY": -26.323708890336036,
											"rotationZ": -90.00000000000004,
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
														"alpha": 0.9,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_UI_Circle_2_2048.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.5490196078431373,
															0.2901960784313725,
															0.1803921568627451
														]
													}
												},
												{
													"type": "curve",
													"name": "rotation.x",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 150,
															"value": 1,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "scale",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0.95,
															"mode": 0,
															"prevHandle": {
																"dv": -0.0008527475489023193,
																"dt": -0.4999328272986826
															},
															"nextHandle": {
																"dv": 0.0008333333333333526,
																"dt": 0.488551025390625
															}
														},
														{
															"time": 0.5,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.997879638671876,
															"value": 0.95,
															"mode": 0,
															"prevHandle": {
																"dv": -0.0008333333333333526,
																"dt": -0.45326538085937595
															},
															"nextHandle": {
																"dv": 0.0006388001709488119,
																"dt": 0.34994614970350457
															}
														},
														{
															"time": 1,
															"value": 0.95,
															"mode": 0
														}
													]
												}
											]
										},
										{
											"type": "polygon",
											"name": "polygon_DottedLines",
											"scaleX": 1.11,
											"scaleY": 1.11,
											"scaleZ": 1.11,
											"rotationX": -7.061204112370308e-15,
											"rotationY": 89.568,
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
														"alpha": 0.8,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_UI_Circle_DottedLines_2048.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.5490196078431373,
															0.2901960784313725,
															0.1803921568627451
														]
													}
												},
												{
													"type": "curve",
													"name": "rotation.x",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 500,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "scale",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0.95,
															"mode": 0,
															"prevHandle": {
																"dv": -0.0008527475489023193,
																"dt": -0.4999328272986826
															},
															"nextHandle": {
																"dv": 0.0008333333333333526,
																"dt": 0.488551025390625
															}
														},
														{
															"time": 0.5,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.997879638671876,
															"value": 0.95,
															"mode": 0,
															"prevHandle": {
																"dv": -0.0008333333333333526,
																"dt": -0.45326538085937595
															},
															"nextHandle": {
																"dv": 0.0006388001709488119,
																"dt": 0.34994614970350457
															}
														},
														{
															"time": 1,
															"value": 0.95,
															"mode": 0
														}
													]
												}
											]
										},
										{
											"type": "polygon",
											"name": "polygon_Circle",
											"scaleX": 1.22,
											"scaleY": 1.2,
											"scaleZ": 1.2,
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
														"texture": "Fx/Alphas/T_UI_Circle_1_2048.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.013101749002796195,
																		"dt": -0.49994431761216657
																	},
																	"nextHandle": {
																		"dv": 0.012499999999999956,
																		"dt": 0.47681640625000005
																	}
																},
																{
																	"time": 0.5,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.012500000000000011,
																		"dt": -0.46623046874999996
																	},
																	"nextHandle": {
																		"dv": 0.009453350040267882,
																		"dt": 0.3499585872328905
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
															0.5490196078431373,
															0.2901960784313725,
															0.1803921568627451
														]
													}
												},
												{
													"type": "curve",
													"name": "rotation.x",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 300,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -50
															},
															"nextHandle": {
																"dv": 0,
																"dt": 50
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
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.75
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
					}
				}
			]
		}
	]
}