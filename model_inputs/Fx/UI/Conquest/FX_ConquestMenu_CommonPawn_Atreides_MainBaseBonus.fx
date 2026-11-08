{
	"type": "fx",
	"markers": [
		{
			"t": 8.80576
		}
	],
	"cullingRadius": 500,
	"blendFactor": 1,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"scaleX": 1.6,
			"scaleY": 1.6,
			"scaleZ": 1.6,
			"children": [
				{
					"type": "model",
					"name": "Pawn_Mainbase_Corrino",
					"source": "UI/ConquestMenu/Assets/Atreides/Pawn_Mainbase_Atreides.fbx",
					"editorOnly": true,
					"children": [
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
					"type": "polygon",
					"name": "Ground",
					"editorOnly": true,
					"locked": true,
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
					"name": "CorrinoBonus",
					"z": 0.0075,
					"children": [
						{
							"type": "object",
							"name": "PawnEffect",
							"z": 0.007499999999999999,
							"children": [
								{
									"type": "object",
									"name": "Flare",
									"z": -0.015,
									"scaleX": 0.08,
									"scaleY": 0.08,
									"scaleZ": 0.1,
									"children": [
										{
											"type": "lookAt",
											"name": "lookAt_FlareLarge",
											"z": 0.4317,
											"scaleX": 0.4,
											"scaleY": 0.25,
											"scaleZ": 0.3,
											"rotationZ": -105.8,
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
																			"time": 0.3520605097087577,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.3520605097087577,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.3520605097087577,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.3520605097087577,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.3520605097087577,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.3520605097087577,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.3520605097087577,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.3520605097087577,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.3520605097087577,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.3520605097087577,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.3520605097087577,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.3520605097087577,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.3520605097087577,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.3520605097087577,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.3520605097087577,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.3520605097087577,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.3520605097087577,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.3520605097087577,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.3520605097087577,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.3520605097087577,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.3520605097087577,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.3520605097087577,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.3520605097087577,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.3520605097087577,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.3520605097087577,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.3520605097087577,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.3520605097087577,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.3520605097087577,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.3520605097087577,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.3520605097087577,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.06333333333333331
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
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
																			"time": 1.5592490319421366,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.5592490319421366,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.5592490319421366,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.5592490319421366,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.5592490319421366,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.5592490319421366,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.5592490319421366,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.5592490319421366,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.5592490319421366,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.5592490319421366,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.5592490319421366,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.5592490319421366,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.5592490319421366,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.5592490319421366,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.5592490319421366,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.5592490319421366,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.5592490319421366,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.5592490319421366,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.5592490319421366,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.5592490319421366,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.5592490319421366,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.5592490319421366,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.5592490319421366,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.5592490319421366,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.5592490319421366,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.5592490319421366,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.5592490319421366,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.5592490319421366,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.5592490319421366,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.5592490319421366,
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
																"range": 0.2,
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
																"amount": 0.25,
																"color": [
																	0.6431372549019607,
																	0.5019607843137255,
																	0.28627450980392155
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "amount",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.3715914205907058,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.10510787178839882
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.3715914205907058,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.3715914205907058,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.3715914205907058,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.3715914205907058,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.3715914205907058,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.3715914205907058,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.3715914205907058,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.3715914205907058,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.3715914205907058,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.3715914205907058,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.3715914205907058,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.3715914205907058,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.3715914205907058,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.3715914205907058,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.3715914205907058,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.3715914205907058,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.3715914205907058,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.3715914205907058,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.3715914205907058,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.3715914205907058,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.3715914205907058,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.3715914205907058,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.3715914205907058,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.3715914205907058,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.3715914205907058,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.3715914205907058,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.3715914205907058,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.3715914205907058,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.3715914205907058,
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
																			"time": 0.860816975467543,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.16307518495894557
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.860816975467543,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.860816975467543,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.860816975467543,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.860816975467543,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.860816975467543,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.860816975467543,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.860816975467543,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.860816975467543,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.860816975467543,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.860816975467543,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.860816975467543,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.860816975467543,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.860816975467543,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.860816975467543,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.860816975467543,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.860816975467543,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.860816975467543,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.860816975467543,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.860816975467543,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.860816975467543,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.860816975467543,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.860816975467543,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.860816975467543,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.860816975467543,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.860816975467543,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.860816975467543,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.860816975467543,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.860816975467543,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.860816975467543,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": -0.5
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
											"type": "lookAt",
											"name": "lookAt_FlareWhite",
											"z": 0.4317,
											"scaleX": 0.4,
											"scaleY": 0.2,
											"scaleZ": 0.3,
											"rotationZ": -105.8,
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
													"scaleX": 1.5,
													"scaleY": 20,
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
																	"culling": "None",
																	"colorMask": 255,
																	"depthTest": "LessEqual",
																	"enableStencil": false,
																	"parallax": 0,
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
																"wrap": true,
																"invert": false,
																"replace": false,
																"alpha": 0.5,
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
																"alpha": 1,
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
																			"time": 0.36206050970875747,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.36206050970875747,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.36206050970875747,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.36206050970875747,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.36206050970875747,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.36206050970875747,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.36206050970875747,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.36206050970875747,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.36206050970875747,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.36206050970875747,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.36206050970875747,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.36206050970875747,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.36206050970875747,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.36206050970875747,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.36206050970875747,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.36206050970875747,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.36206050970875747,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.36206050970875747,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.36206050970875747,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.36206050970875747,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.36206050970875747,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.36206050970875747,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.36206050970875747,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.36206050970875747,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.37206050970875726,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.37206050970875726,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.37206050970875726,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.37206050970875726,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.37206050970875726,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.37206050970875726,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.05666666666666679
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.5420605097087579,
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
																			"time": 1.5620665370601243,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.3400020091171218
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280171
																			}
																		},
																		{
																			"time": 1.5620665370601243,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280171
																			}
																		},
																		{
																			"time": 1.5620665370601243,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280171
																			}
																		},
																		{
																			"time": 1.5620665370601243,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280171
																			}
																		},
																		{
																			"time": 1.5620665370601243,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280171
																			}
																		},
																		{
																			"time": 1.5620665370601243,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.34000200911712186
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.34000200911712186
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
																"range": 0.2,
																"power": 2
															},
															"isInstance": true
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 0.25,
																"color": [
																	0.7607843137254902,
																	0.596078431372549,
																	0.34509803921568627
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "amount",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.05626780522550932,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.42200575466098456,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.121912649811825
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.42200575466098456,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.42200575466098456,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.42200575466098456,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.42200575466098456,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.42200575466098456,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.42200575466098456,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.42200575466098456,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.42200575466098456,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.42200575466098456,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.42200575466098456,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.42200575466098456,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.42200575466098456,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.42200575466098456,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.42200575466098456,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.42200575466098456,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.42200575466098456,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.42200575466098456,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.42200575466098456,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.42200575466098456,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.42200575466098456,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.42200575466098456,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.42200575466098456,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.42200575466098456,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.42200575466098456,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.42200575466098456,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.42200575466098456,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.42200575466098456,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.42200575466098456,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280097
																			}
																		},
																		{
																			"time": 0.42200575466098456,
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
																			"time": 1.5432463984433966,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.37374688126080363
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280171
																			}
																		},
																		{
																			"time": 1.5432463984433966,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280171
																			}
																		},
																		{
																			"time": 1.5432463984433966,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280171
																			}
																		},
																		{
																			"time": 1.5432463984433966,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280171
																			}
																		},
																		{
																			"time": 1.5432463984433966,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280171
																			}
																		},
																		{
																			"time": 1.5432463984433966,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280171
																			}
																		},
																		{
																			"time": 1.5432463984433966,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280171
																			}
																		},
																		{
																			"time": 1.5432463984433966,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280171
																			}
																		},
																		{
																			"time": 1.5432463984433966,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280171
																			}
																		},
																		{
																			"time": 1.5432463984433966,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280171
																			}
																		},
																		{
																			"time": 1.5432463984433966,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280171
																			}
																		},
																		{
																			"time": 1.5432463984433966,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280171
																			}
																		},
																		{
																			"time": 1.5432463984433966,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280171
																			}
																		},
																		{
																			"time": 1.5432463984433966,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280171
																			}
																		},
																		{
																			"time": 1.5432463984433966,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280171
																			}
																		},
																		{
																			"time": 1.5432463984433966,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280171
																			}
																		},
																		{
																			"time": 1.5432463984433966,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280171
																			}
																		},
																		{
																			"time": 1.5432463984433966,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280171
																			}
																		},
																		{
																			"time": 1.5432463984433966,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280171
																			}
																		},
																		{
																			"time": 1.5432463984433966,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280171
																			}
																		},
																		{
																			"time": 1.5432463984433966,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280171
																			}
																		},
																		{
																			"time": 1.5432463984433966,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280171
																			}
																		},
																		{
																			"time": 1.5432463984433966,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280171
																			}
																		},
																		{
																			"time": 1.5432463984433966,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280171
																			}
																		},
																		{
																			"time": 1.5432463984433966,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280171
																			}
																		},
																		{
																			"time": 1.5432463984433966,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280171
																			}
																		},
																		{
																			"time": 1.5432463984433966,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280171
																			}
																		},
																		{
																			"time": 1.5432463984433966,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280171
																			}
																		},
																		{
																			"time": 1.5432463984433966,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.004561949855280171
																			}
																		},
																		{
																			"time": 1.5432463984433966,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": 0
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": -0.5
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
													"name": "scale.z",
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
																"dt": 0.004561949855280134
															}
														},
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280134
															}
														},
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280134
															}
														},
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280134
															}
														},
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280134
															}
														},
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280134
															}
														},
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280134
															}
														},
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280134
															}
														},
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280134
															}
														},
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280134
															}
														},
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280134
															}
														},
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280134
															}
														},
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280134
															}
														},
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280134
															}
														},
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280134
															}
														},
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280134
															}
														},
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280134
															}
														},
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280134
															}
														},
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280134
															}
														},
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280134
															}
														},
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280134
															}
														},
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280134
															}
														},
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280134
															}
														},
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280134
															}
														},
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280134
															}
														},
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280134
															}
														},
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280134
															}
														},
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280134
															}
														},
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280134
															}
														},
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.04032893849489203,
																"dt": -0.18524618299377818
															},
															"nextHandle": {
																"dv": 0.0920000000000003,
																"dt": 0.42111370979298
															}
														},
														{
															"time": 0.4874059525290704,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4874059525290704,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4874059525290704,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4874059525290704,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4874059525290704,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4874059525290704,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4874059525290704,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4874059525290704,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4874059525290704,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4874059525290704,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4874059525290704,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4874059525290704,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4874059525290704,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4874059525290704,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4874059525290704,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4874059525290704,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4874059525290704,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4874059525290704,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4874059525290704,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4874059525290704,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4874059525290704,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4874059525290704,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4874059525290704,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4874059525290704,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4874059525290704,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4874059525290704,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4874059525290704,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4874059525290704,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4874059525290704,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4874059525290704,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2375756099748112,
															"value": 1.8000000000000012,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.25005655248191316
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280171
															}
														},
														{
															"time": 1.2375756099748112,
															"value": 1.8000000000000012,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280171
															}
														},
														{
															"time": 1.2375756099748112,
															"value": 1.8000000000000012,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280171
															}
														},
														{
															"time": 1.2375756099748112,
															"value": 1.8000000000000012,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280171
															}
														},
														{
															"time": 1.2375756099748112,
															"value": 1.8000000000000012,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280171
															}
														},
														{
															"time": 1.2375756099748112,
															"value": 1.8000000000000012,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280171
															}
														},
														{
															"time": 1.2375756099748112,
															"value": 1.8000000000000012,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280171
															}
														},
														{
															"time": 1.2375756099748112,
															"value": 1.8000000000000012,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280171
															}
														},
														{
															"time": 1.2375756099748112,
															"value": 1.8000000000000012,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280171
															}
														},
														{
															"time": 1.2375756099748112,
															"value": 1.8000000000000012,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280171
															}
														},
														{
															"time": 1.2375756099748112,
															"value": 1.8000000000000012,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280171
															}
														},
														{
															"time": 1.2375756099748112,
															"value": 1.8000000000000012,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280171
															}
														},
														{
															"time": 1.2375756099748112,
															"value": 1.8000000000000012,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280171
															}
														},
														{
															"time": 1.2375756099748112,
															"value": 1.8000000000000012,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280171
															}
														},
														{
															"time": 1.2375756099748112,
															"value": 1.8000000000000012,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280171
															}
														},
														{
															"time": 1.2375756099748112,
															"value": 1.8000000000000012,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280171
															}
														},
														{
															"time": 1.2375756099748112,
															"value": 1.8000000000000012,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280171
															}
														},
														{
															"time": 1.2375756099748112,
															"value": 1.8000000000000012,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280171
															}
														},
														{
															"time": 1.2375756099748112,
															"value": 1.8000000000000012,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280171
															}
														},
														{
															"time": 1.2375756099748112,
															"value": 1.8000000000000012,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280171
															}
														},
														{
															"time": 1.2375756099748112,
															"value": 1.8000000000000012,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280171
															}
														},
														{
															"time": 1.2375756099748112,
															"value": 1.8000000000000012,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280171
															}
														},
														{
															"time": 1.2375756099748112,
															"value": 1.8000000000000012,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280171
															}
														},
														{
															"time": 1.2375756099748112,
															"value": 1.8000000000000012,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280171
															}
														},
														{
															"time": 1.2375756099748112,
															"value": 1.8000000000000012,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280171
															}
														},
														{
															"time": 1.2375756099748112,
															"value": 1.8000000000000012,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280171
															}
														},
														{
															"time": 1.2375756099748112,
															"value": 1.8000000000000012,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280171
															}
														},
														{
															"time": 1.2375756099748112,
															"value": 1.8000000000000012,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280171
															}
														},
														{
															"time": 1.2375756099748112,
															"value": 1.8000000000000012,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280171
															}
														},
														{
															"time": 1.2375756099748112,
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
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "White",
									"z": 0.03,
									"scaleX": 0.125,
									"scaleY": 0.125,
									"scaleZ": 0.085,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
									"fadePower": 3,
									"emissive": 0.5,
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
															"time": 0.28356651823529416,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.4775091006844485,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.5810377832823097,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.9567683341453281
															},
															"nextHandle": {
																"dv": 0.006535301955241471,
																"dt": 0.375400531221125
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
												"envBlend": 1,
												"envColorSet": false
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "object",
									"name": "Duration",
									"z": -0.015,
									"children": [
										{
											"type": "advancedDecal",
											"name": "FloorFlareDuration",
											"scaleX": 0.2383451776093822,
											"scaleY": 0.2383451776093822,
											"scaleZ": 0.047669035521876436,
											"rotationZ": -29.99999999999998,
											"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
											"fadePower": 0.25,
											"emissive": 0.2,
											"renderMode": "BeforeTonemapping",
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
														"alpha": 0.15,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 1,
														"vOffset": 1,
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
																	"time": 0.28356651823529416,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.4775091006844485,
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
													"loop": true,
													"keys": [
														{
															"time": 0.33112613514937195,
															"value": 0.947440719604492,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.25
															}
														},
														{
															"time": 1.081126135149372,
															"value": 1.097440719604492,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.25
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.25
															}
														},
														{
															"time": 1.831126135149372,
															"value": 0.947440719604492,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.25
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.25
															}
														}
													]
												}
											]
										},
										{
											"type": "object",
											"name": "FlareDuration",
											"scaleX": 0.05,
											"scaleY": 0.05,
											"scaleZ": 0.051356399449982194,
											"children": [
												{
													"type": "lookAt",
													"name": "lookAt_FlareLarge",
													"z": 0.4317,
													"scaleX": 0.4,
													"scaleY": 0.25,
													"scaleZ": 0.3,
													"rotationZ": -105.8,
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
																			"parallax": 0,
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
																					"time": 1.1035466405477201,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.1035466405477201,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.1035466405477201,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.1035466405477201,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.1035466405477201,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.1035466405477201,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.1035466405477201,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.1035466405477201,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.1035466405477201,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.1035466405477201,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.1035466405477201,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.1035466405477201,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.1035466405477201,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.1035466405477201,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.1035466405477201,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.1035466405477201,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.1035466405477201,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.1035466405477201,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.1035466405477201,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.1035466405477201,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.1035466405477201,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.1035466405477201,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.1035466405477201,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.1035466405477201,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.1035466405477201,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.1035466405477201,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.1035466405477201,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.1035466405477201,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.1035466405477201,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.1035466405477201,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": -0.15632479906265595
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
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
																		"range": 0.2,
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
																		"amount": 0.25,
																		"color": [
																			0.6431372549019607,
																			0.5019607843137255,
																			0.28627450980392155
																		]
																	},
																	"children": [
																		{
																			"type": "curve",
																			"name": "amount",
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.3715914205907058,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": -0.10510787178839882
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.3715914205907058,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.3715914205907058,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.3715914205907058,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.3715914205907058,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.3715914205907058,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.3715914205907058,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.3715914205907058,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.3715914205907058,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.3715914205907058,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.3715914205907058,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.3715914205907058,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.3715914205907058,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.3715914205907058,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.3715914205907058,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.3715914205907058,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.3715914205907058,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.3715914205907058,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.3715914205907058,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.3715914205907058,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.3715914205907058,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.3715914205907058,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.3715914205907058,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.3715914205907058,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.3715914205907058,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.3715914205907058,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.3715914205907058,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.3715914205907058,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.3715914205907058,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.3715914205907058,
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
																					"time": 0.860816975467543,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": -0.16307518495894557
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.860816975467543,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.860816975467543,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.860816975467543,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.860816975467543,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.860816975467543,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.860816975467543,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.860816975467543,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.860816975467543,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.860816975467543,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.860816975467543,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.860816975467543,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.860816975467543,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.860816975467543,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.860816975467543,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.860816975467543,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.860816975467543,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.860816975467543,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.860816975467543,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.860816975467543,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.860816975467543,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.860816975467543,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.860816975467543,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.860816975467543,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.860816975467543,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.860816975467543,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.860816975467543,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.860816975467543,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.860816975467543,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.860816975467543,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": -0.5
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
													"type": "lookAt",
													"name": "lookAt_FlareWhite",
													"z": 0.4317,
													"scaleX": 0.4,
													"scaleY": 0.2,
													"scaleZ": 0.3,
													"rotationZ": -105.8,
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
															"scaleX": 1.5,
															"scaleY": 20,
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
																			"culling": "None",
																			"colorMask": 255,
																			"depthTest": "LessEqual",
																			"enableStencil": false,
																			"parallax": 0,
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
																		"useSourceUVs": false,
																		"wrap": true,
																		"invert": false,
																		"replace": false,
																		"alpha": 0.5,
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
																	"enabled": false,
																	"props": {
																		"useSourceUVs": true,
																		"useScale": true,
																		"wrap": true,
																		"progress": 0.29,
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
																		"alpha": 1,
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
																					"time": 1.11354664054772,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.11354664054772,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.11354664054772,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.11354664054772,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.11354664054772,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.11354664054772,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.11354664054772,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.11354664054772,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.11354664054772,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.11354664054772,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.11354664054772,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.11354664054772,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.11354664054772,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.11354664054772,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.11354664054772,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.11354664054772,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.11354664054772,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.11354664054772,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.11354664054772,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.11354664054772,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.11354664054772,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.11354664054772,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.11354664054772,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.11354664054772,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.1235466405477197,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.1235466405477197,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.1235466405477197,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.1235466405477197,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.1235466405477197,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.1235466405477197,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": -0.14965813239598943
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5725210377356877,
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
																		"range": 0.2,
																		"power": 2
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"props": {
																		"amount": 0.25,
																		"color": [
																			0.7607843137254902,
																			0.596078431372549,
																			0.34509803921568627
																		]
																	},
																	"children": [
																		{
																			"type": "curve",
																			"name": "amount",
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.05626780522550932,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.42200575466098456,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": -0.121912649811825
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.42200575466098456,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.42200575466098456,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.42200575466098456,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.42200575466098456,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.42200575466098456,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.42200575466098456,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.42200575466098456,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.42200575466098456,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.42200575466098456,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.42200575466098456,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.42200575466098456,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.42200575466098456,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.42200575466098456,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.42200575466098456,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.42200575466098456,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.42200575466098456,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.42200575466098456,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.42200575466098456,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.42200575466098456,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.42200575466098456,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.42200575466098456,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.42200575466098456,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.42200575466098456,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.42200575466098456,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.42200575466098456,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.42200575466098456,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.42200575466098456,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.42200575466098456,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280097
																					}
																				},
																				{
																					"time": 0.42200575466098456,
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
																					"time": 1.5432463984433966,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": -0.37374688126080363
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5432463984433966,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5432463984433966,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5432463984433966,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5432463984433966,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5432463984433966,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5432463984433966,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5432463984433966,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5432463984433966,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5432463984433966,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5432463984433966,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5432463984433966,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5432463984433966,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5432463984433966,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5432463984433966,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5432463984433966,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5432463984433966,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5432463984433966,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5432463984433966,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5432463984433966,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5432463984433966,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5432463984433966,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5432463984433966,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5432463984433966,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5432463984433966,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5432463984433966,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5432463984433966,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5432463984433966,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5432463984433966,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.004561949855280171
																					}
																				},
																				{
																					"time": 1.5432463984433966,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": 0
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": -0.5
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
															"name": "scale.z",
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
																		"dt": 0.004561949855280134
																	}
																},
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280134
																	}
																},
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280134
																	}
																},
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280134
																	}
																},
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280134
																	}
																},
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280134
																	}
																},
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280134
																	}
																},
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280134
																	}
																},
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280134
																	}
																},
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280134
																	}
																},
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280134
																	}
																},
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280134
																	}
																},
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280134
																	}
																},
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280134
																	}
																},
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280134
																	}
																},
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280134
																	}
																},
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280134
																	}
																},
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280134
																	}
																},
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280134
																	}
																},
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280134
																	}
																},
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280134
																	}
																},
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280134
																	}
																},
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280134
																	}
																},
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280134
																	}
																},
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280134
																	}
																},
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280134
																	}
																},
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280134
																	}
																},
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280134
																	}
																},
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280134
																	}
																},
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.04032893849489203,
																		"dt": -0.18524618299377818
																	},
																	"nextHandle": {
																		"dv": 0.0920000000000003,
																		"dt": 0.42111370979298
																	}
																},
																{
																	"time": 0.4874059525290704,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.4874059525290704,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.4874059525290704,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.4874059525290704,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.4874059525290704,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.4874059525290704,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.4874059525290704,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.4874059525290704,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.4874059525290704,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.4874059525290704,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.4874059525290704,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.4874059525290704,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.4874059525290704,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.4874059525290704,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.4874059525290704,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.4874059525290704,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.4874059525290704,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.4874059525290704,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.4874059525290704,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.4874059525290704,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.4874059525290704,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.4874059525290704,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.4874059525290704,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.4874059525290704,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.4874059525290704,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.4874059525290704,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.4874059525290704,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.4874059525290704,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.4874059525290704,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.4874059525290704,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.2375756099748112,
																	"value": 1.8000000000000012,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.25005655248191316
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280171
																	}
																},
																{
																	"time": 1.2375756099748112,
																	"value": 1.8000000000000012,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280171
																	}
																},
																{
																	"time": 1.2375756099748112,
																	"value": 1.8000000000000012,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280171
																	}
																},
																{
																	"time": 1.2375756099748112,
																	"value": 1.8000000000000012,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280171
																	}
																},
																{
																	"time": 1.2375756099748112,
																	"value": 1.8000000000000012,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280171
																	}
																},
																{
																	"time": 1.2375756099748112,
																	"value": 1.8000000000000012,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280171
																	}
																},
																{
																	"time": 1.2375756099748112,
																	"value": 1.8000000000000012,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280171
																	}
																},
																{
																	"time": 1.2375756099748112,
																	"value": 1.8000000000000012,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280171
																	}
																},
																{
																	"time": 1.2375756099748112,
																	"value": 1.8000000000000012,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280171
																	}
																},
																{
																	"time": 1.2375756099748112,
																	"value": 1.8000000000000012,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280171
																	}
																},
																{
																	"time": 1.2375756099748112,
																	"value": 1.8000000000000012,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280171
																	}
																},
																{
																	"time": 1.2375756099748112,
																	"value": 1.8000000000000012,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280171
																	}
																},
																{
																	"time": 1.2375756099748112,
																	"value": 1.8000000000000012,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280171
																	}
																},
																{
																	"time": 1.2375756099748112,
																	"value": 1.8000000000000012,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280171
																	}
																},
																{
																	"time": 1.2375756099748112,
																	"value": 1.8000000000000012,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280171
																	}
																},
																{
																	"time": 1.2375756099748112,
																	"value": 1.8000000000000012,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280171
																	}
																},
																{
																	"time": 1.2375756099748112,
																	"value": 1.8000000000000012,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280171
																	}
																},
																{
																	"time": 1.2375756099748112,
																	"value": 1.8000000000000012,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280171
																	}
																},
																{
																	"time": 1.2375756099748112,
																	"value": 1.8000000000000012,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280171
																	}
																},
																{
																	"time": 1.2375756099748112,
																	"value": 1.8000000000000012,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280171
																	}
																},
																{
																	"time": 1.2375756099748112,
																	"value": 1.8000000000000012,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280171
																	}
																},
																{
																	"time": 1.2375756099748112,
																	"value": 1.8000000000000012,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280171
																	}
																},
																{
																	"time": 1.2375756099748112,
																	"value": 1.8000000000000012,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280171
																	}
																},
																{
																	"time": 1.2375756099748112,
																	"value": 1.8000000000000012,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280171
																	}
																},
																{
																	"time": 1.2375756099748112,
																	"value": 1.8000000000000012,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280171
																	}
																},
																{
																	"time": 1.2375756099748112,
																	"value": 1.8000000000000012,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280171
																	}
																},
																{
																	"time": 1.2375756099748112,
																	"value": 1.8000000000000012,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280171
																	}
																},
																{
																	"time": 1.2375756099748112,
																	"value": 1.8000000000000012,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280171
																	}
																},
																{
																	"time": 1.2375756099748112,
																	"value": 1.8000000000000012,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.004561949855280171
																	}
																},
																{
																	"time": 1.2375756099748112,
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
													"name": "scale.z",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0.85,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.25
															}
														},
														{
															"time": 0.75,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.25
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.25
															}
														},
														{
															"time": 1.5,
															"value": 0.85,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.25
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.25
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
							"name": "FloorGlitch",
							"z": -0.0075000000000000015,
							"scaleX": 1.2,
							"scaleY": 1.2,
							"scaleZ": 1.2,
							"children": [
								{
									"type": "emitter",
									"name": "FlareGround",
									"props": {
										"emitType": "Burst",
										"instScale": 0.1,
										"warmUpTime": -0.75,
										"lifeTime": 1.2
									},
									"z": 0.004518,
									"scaleX": 0.006999999999999998,
									"scaleY": 0.006999999999999998,
									"scaleZ": 0.006999999999999998,
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
															"emissive": 0.2
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
														"alpha": 0.3,
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
																		"color": -151198802
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
															0.5450980392156862,
															0.6941176470588235,
															1
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.04511187146993318,
																		"dt": -0.49965741688338355
																	},
																	"nextHandle": {
																		"dv": -0.01666666666666705,
																		"dt": 0.18767603882889183
																	}
																},
																{
																	"time": 0.2708756768212688,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.2708756768212688,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.2708756768212688,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.2708756768212688,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.2708756768212688,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.45762187905928653,
																	"value": -2.7755575615628914e-16,
																	"mode": 0
																},
																{
																	"time": 0.45762187905928653,
																	"value": -2.7755575615628914e-16,
																	"mode": 0
																},
																{
																	"time": 0.45762187905928653,
																	"value": -2.7755575615628914e-16,
																	"mode": 0
																},
																{
																	"time": 0.45762187905928653,
																	"value": -2.7755575615628914e-16,
																	"mode": 0
																},
																{
																	"time": 0.45762187905928653,
																	"value": -2.7755575615628914e-16,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.01666666666666672,
																		"dt": -0.10334430583115584
																	},
																	"nextHandle": {
																		"dv": 0.010028697519592782,
																		"dt": 0.06218452701317666
																	}
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
												"amount": 1,
												"ATTENUATE": false,
												"emissiveMap": "Fx/Gradients/z_FillBlack.jpg"
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon",
									"z": 0.001,
									"scaleX": 0.13,
									"scaleY": 0.13,
									"scaleZ": 0.13,
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
												"texture": "Fx/Alphas/T_circle.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.3208147677007309,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.3208147677007309,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.3208147677007309,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.5147573501498852,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5147573501498852,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5147573501498852,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.6182860327477464,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.3678428941992867
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280171
															}
														},
														{
															"time": 1.6182860327477464,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280171
															}
														},
														{
															"time": 1.6182860327477464,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.9567683341453281
															},
															"nextHandle": {
																"dv": 0.006535301955241471,
																"dt": 0.375400531221125
															}
														}
													],
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"keys": [
																{
																	"time": 1.1082713278899936,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.1082713278899936,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.1082713278899936,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.3022139103391477,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.3022139103391477,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.3022139103391477,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 2.405742592937008,
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 2.405742592937008,
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 2.405742592937008,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.01666666666666672,
																		"dt": -0.9567683341453281
																	},
																	"nextHandle": {
																		"dv": 0.006535301955241471,
																		"dt": 0.375400531221125
																	}
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "WorldUV",
											"source": "shaders/WorldUV.hx",
											"props": {
												"useNormalMap": false,
												"onDecal": false,
												"scale": 14,
												"rotation": 0
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
												"progress": 0.23,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 0.8,
												"uvScaleY": 0.8,
												"texture": "Fx/Alphas/T_Grid10_Thick.png",
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
													0.9490196078431372,
													0.8549019607843137
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
												"intensity": 0.5,
												"scrollSpeed": [
													0,
													1
												],
												"scale": [
													1.5,
													1.5
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "intensity",
													"keys": [
														{
															"time": 0.3342531223646086,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.3342531223646086,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.3342531223646086,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.5798569896556092,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5798569896556092,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5798569896556092,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5798569896556092,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5798569896556092,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5798569896556092,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5798569896556092,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5798569896556092,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5798569896556092,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5798569896556092,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5798569896556092,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5798569896556092,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5798569896556092,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5798569896556092,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5798569896556092,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.6841656052587972,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.6841656052587972,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.6841656052587972,
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
													0.5450980392156862,
													0.6941176470588235,
													1
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.313863803299661,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280097
															}
														},
														{
															"time": 0.313863803299661,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280097
															}
														},
														{
															"time": 0.313863803299661,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.04511187146993318,
																"dt": -0.49965741688338355
															},
															"nextHandle": {
																"dv": -0.01666666666666705,
																"dt": 0.18767603882889183
															}
														},
														{
															"time": 0.5109348339340272,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5109348339340272,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5109348339340272,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5109348339340272,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5109348339340272,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5109348339340272,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5109348339340272,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5109348339340272,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5109348339340272,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5109348339340272,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5109348339340272,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5109348339340272,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5109348339340272,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5109348339340272,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5109348339340272,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.6976810361720449,
															"value": -2.7755575615628914e-16,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.06224873407933925
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280097
															}
														},
														{
															"time": 0.6976810361720449,
															"value": -2.7755575615628914e-16,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280097
															}
														},
														{
															"time": 0.6976810361720449,
															"value": -2.7755575615628914e-16,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280097
															}
														},
														{
															"time": 0.6976810361720449,
															"value": -2.7755575615628914e-16,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280097
															}
														},
														{
															"time": 0.6976810361720449,
															"value": -2.7755575615628914e-16,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280097
															}
														},
														{
															"time": 0.6976810361720449,
															"value": -2.7755575615628914e-16,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280097
															}
														},
														{
															"time": 0.6976810361720449,
															"value": -2.7755575615628914e-16,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280097
															}
														},
														{
															"time": 0.6976810361720449,
															"value": -2.7755575615628914e-16,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280097
															}
														},
														{
															"time": 0.6976810361720449,
															"value": -2.7755575615628914e-16,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280097
															}
														},
														{
															"time": 0.6976810361720449,
															"value": -2.7755575615628914e-16,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280097
															}
														},
														{
															"time": 0.6976810361720449,
															"value": -2.7755575615628914e-16,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280097
															}
														},
														{
															"time": 0.6976810361720449,
															"value": -2.7755575615628914e-16,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280097
															}
														},
														{
															"time": 0.6976810361720449,
															"value": -2.7755575615628914e-16,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280097
															}
														},
														{
															"time": 0.6976810361720449,
															"value": -2.7755575615628914e-16,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": 0
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.004561949855280097
															}
														},
														{
															"time": 0.6976810361720449,
															"value": -2.7755575615628914e-16,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.10334430583115584
															},
															"nextHandle": {
																"dv": 0.010028697519592782,
																"dt": 0.06218452701317666
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
							"name": "AttackMainBase",
							"z": 0.007499999999999999,
							"children": [
								{
									"type": "advancedDecal",
									"name": "ArrowsDuration",
									"z": -0.015,
									"scaleX": 0.16,
									"scaleY": 0.16,
									"scaleZ": 0.22,
									"rotationZ": -29.999999999999993,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
									"fadePower": 3,
									"emissive": 1,
									"renderMode": "BeforeTonemapping",
									"normalFade": true,
									"normalFadeStart": 0.5,
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
												"alpha": 0.75,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 1,
												"vOffset": 1,
												"texture": "Fx/Alphas/T_CirclePattern07.png"
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.43063664430694004,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.8532574180406387,
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
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0.9,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.25
													}
												},
												{
													"time": 0.75,
													"value": 1.0448814392089845,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.25
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.25
													}
												},
												{
													"time": 1.5,
													"value": 0.9,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.25
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.25
													}
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 0.5,
												"color": [
													0.6313725490196078,
													0.44705882352941173,
													0.18823529411764706
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keys": [
														{
															"time": 1.13084098640456,
															"value": 0.9989132380451242,
															"mode": 0
														},
														{
															"time": 1.2069316430335753,
															"value": 0.98,
															"mode": 2
														},
														{
															"time": 2.224120165266953,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.00016203909673984107,
																"dt": -0.9703616803401582
															},
															"nextHandle": {
																"dv": -2.118055713767727e-17,
																"dt": 0.34046853441370317
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
									"name": "FloorFlareDuration",
									"z": -0.015,
									"scaleX": 0.25366754859021834,
									"scaleY": 0.25366754859021834,
									"scaleZ": 0.05073350971804367,
									"rotationZ": -29.999999999999986,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
									"fadePower": 0.25,
									"emissive": 0.2,
									"renderMode": "BeforeTonemapping",
									"normalFade": true,
									"normalFadeStart": 0.5,
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
												"alpha": 0.15,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 1,
												"vOffset": 1,
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
															"time": 1.0750680453679669,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.5750680453679664,
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
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0.947440719604492,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.25
													}
												},
												{
													"time": 0.75,
													"value": 1.097440719604492,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.25
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.25
													}
												},
												{
													"time": 1.5,
													"value": 0.947440719604492,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.25
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.25
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
											1,
											0.8470588235294118,
											0.43137254901960786
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "amount",
											"keyMode": 0,
											"keys": [
												{
													"time": 1.0169316430335753,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.2069316430335753,
													"value": 0,
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
													"time": 2.224120165266953,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "Icon",
									"scaleX": 0.85,
									"scaleY": 0.85,
									"scaleZ": 0.85,
									"children": [
										{
											"type": "lookAt",
											"name": "lookAt-Swords",
											"z": 0.15,
											"scaleX": 0.02,
											"scaleY": 0.02,
											"scaleZ": 0.02,
											"rotationX": 4.9704929940842796e-17,
											"rotationY": 1.075899606759095,
											"rotationZ": 41.51716156899059,
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
													"scaleX": 5.5,
													"scaleY": 4.71,
													"scaleZ": 5.5,
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
																	"alphaKill": true,
																	"drawOrder": "120",
																	"emissive": 1
																}
															},
															"diffuseMap": "Fx/Alphas/T_Logo_Atreides.png"
														},
														{
															"type": "shader",
															"name": "AutoAlpha",
															"source": "shaders/AutoAlpha.hx",
															"props": {
																"scale": 1
															},
															"children": [
																{
																	"type": "curve",
																	"name": "scale",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 1.147465465877566,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.5700862396112638,
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
															"enabled": false,
															"props": {
																"amount": 0.9,
																"color": [
																	0.6431372549019607,
																	0.5372549019607843,
																	0.28627450980392155
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "amount",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 1.0169316430335753,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1.2069316430335753,
																			"value": 0.6359340194891768,
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
																			"time": 2.224120165266953,
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
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0.85,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.25
																	}
																},
																{
																	"time": 0.8532506987586768,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.25
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.25
																	}
																},
																{
																	"time": 1.6032506987586768,
																	"value": 0.85,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.25
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.25
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
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.7848216137439585,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1.2848216137439596,
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
							"type": "object",
							"name": "CirclesFloor",
							"z": -0.007500000000000001,
							"scaleX": 0.014,
							"scaleY": 0.014,
							"scaleZ": 0.014,
							"children": [
								{
									"type": "object",
									"name": "Floor",
									"children": [
										{
											"type": "object",
											"name": "decals",
											"children": [
												{
													"type": "advancedDecal",
													"name": "CIRCLE",
													"scaleX": 15,
													"scaleY": 15,
													"scaleZ": 10,
													"albedoMap": "Fx/Alphas/T_Target1.png",
													"fadeStart": 0.95,
													"emissive": 1,
													"renderMode": "BeforeTonemapping",
													"normalFade": true,
													"normalFadeStart": 0.64,
													"children": [
														{
															"type": "curve",
															"name": "rotation.z",
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 10,
																	"value": -1,
																	"mode": 2
																}
															]
														},
														{
															"type": "shader",
															"name": "AlphaMult",
															"source": "shaders/AlphaMult.hx",
															"props": {
																"alpha": 1
															}
														}
													]
												},
												{
													"type": "advancedDecal",
													"name": "CIRCLE CUT",
													"scaleX": 22,
													"scaleY": 22,
													"scaleZ": 10,
													"albedoMap": "Fx/Alphas/T_circle_2.png",
													"fadeStart": 0.95,
													"emissive": 1,
													"renderMode": "BeforeTonemapping",
													"normalFade": true,
													"normalFadeStart": 0.64,
													"children": [
														{
															"type": "curve",
															"name": "rotation.z",
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 10,
																	"value": 1,
																	"mode": 2
																}
															]
														},
														{
															"type": "shader",
															"name": "AlphaMult",
															"source": "shaders/AlphaMult.hx",
															"props": {
																"alpha": 1
															}
														}
													]
												},
												{
													"type": "advancedDecal",
													"name": "Range",
													"scaleX": 18,
													"scaleY": 18,
													"scaleZ": 10,
													"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
													"fadePower": 3,
													"emissive": 1,
													"renderMode": "BeforeTonemapping",
													"normalFade": true,
													"normalFadeStart": 0.5,
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
																"uOffset": 1,
																"vOffset": 1,
																"texture": "Fx/Alphas/T_UI_InnerGradient_512_test.png"
															},
															"isInstance": true
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
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 0.5,
												"color": [
													0.6313725490196078,
													0.44705882352941173,
													0.18823529411764706
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keys": [
														{
															"time": 0.3433844262152974,
															"value": 0.9989132380451242,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.029925502064951814
															}
														},
														{
															"time": 0.4194750828443128,
															"value": 0.98,
															"mode": 2
														},
														{
															"time": 1.4366636050776918,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.00016203909673984107,
																"dt": -0.9703616803401582
															},
															"nextHandle": {
																"dv": -2.118055713767727e-17,
																"dt": 0.34046853441370317
															}
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
										"alpha": 1
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.3732476900144994,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.7638456243519685,
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
											"time": 0.3732476900144994,
											"value": 0.5,
											"mode": 2
										},
										{
											"time": 0.7638456243519685,
											"value": 1,
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
								"amount": 0.5,
								"color": [
									0.6941176470588235,
									0.5843137254901961,
									0.2901960784313725
								]
							}
						}
					]
				},
				{
					"type": "object",
					"name": "Backup",
					"enabled": false,
					"x": 0.36717,
					"z": 0.0075,
					"children": [
						{
							"type": "object",
							"name": "PawnEffect",
							"z": 0.007499999999999999,
							"children": [
								{
									"type": "object",
									"name": "Flare",
									"z": -0.015,
									"scaleX": 0.08,
									"scaleY": 0.08,
									"scaleZ": 0.1,
									"children": [
										{
											"type": "lookAt",
											"name": "lookAt_FlareLarge",
											"z": 0.4317,
											"scaleX": 0.4,
											"scaleY": 0.25,
											"scaleZ": 0.3,
											"rotationZ": -105.8,
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
																			"time": 1.1395170698980204,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1395170698980204,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1395170698980204,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1395170698980204,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1395170698980204,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1395170698980204,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1395170698980204,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1395170698980204,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1395170698980204,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1395170698980204,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1395170698980204,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1395170698980204,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1395170698980204,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1395170698980204,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1395170698980204,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1395170698980204,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1395170698980204,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1395170698980204,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1395170698980204,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1395170698980204,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1395170698980204,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1395170698980204,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1395170698980204,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1395170698980204,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1395170698980204,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1395170698980204,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1395170698980204,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1395170698980204,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1395170698980204,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1395170698980204,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
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
																			"time": 2.346705592131398,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.346705592131398,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.346705592131398,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.346705592131398,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.346705592131398,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.346705592131398,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.346705592131398,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.346705592131398,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.346705592131398,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.346705592131398,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.346705592131398,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.346705592131398,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.346705592131398,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.346705592131398,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.346705592131398,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.346705592131398,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.346705592131398,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.346705592131398,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.346705592131398,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.346705592131398,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.346705592131398,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.346705592131398,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.346705592131398,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.346705592131398,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.346705592131398,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.346705592131398,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.346705592131398,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.346705592131398,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.346705592131398,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.346705592131398,
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
																"range": 0.2,
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
																"amount": 0.25,
																"color": [
																	0.6431372549019607,
																	0.5019607843137255,
																	0.28627450980392155
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "amount",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1590479807799685,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.1590479807799685,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.1590479807799685,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.1590479807799685,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.1590479807799685,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.1590479807799685,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.1590479807799685,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.1590479807799685,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.1590479807799685,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.1590479807799685,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.1590479807799685,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.1590479807799685,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.1590479807799685,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.1590479807799685,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.1590479807799685,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.1590479807799685,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.1590479807799685,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.1590479807799685,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.1590479807799685,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.1590479807799685,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.1590479807799685,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.1590479807799685,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.1590479807799685,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.1590479807799685,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.1590479807799685,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.1590479807799685,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.1590479807799685,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.1590479807799685,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.1590479807799685,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.1590479807799685,
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
																			"time": 1.6482735356568052,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.6482735356568052,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.6482735356568052,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.6482735356568052,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.6482735356568052,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.6482735356568052,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.6482735356568052,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.6482735356568052,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.6482735356568052,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.6482735356568052,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.6482735356568052,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.6482735356568052,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.6482735356568052,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.6482735356568052,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.6482735356568052,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.6482735356568052,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.6482735356568052,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.6482735356568052,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.6482735356568052,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.6482735356568052,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.6482735356568052,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.6482735356568052,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.6482735356568052,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.6482735356568052,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.6482735356568052,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.6482735356568052,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.6482735356568052,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.6482735356568052,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.6482735356568052,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.6482735356568052,
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
											"type": "lookAt",
											"name": "lookAt_FlareWhite",
											"z": 0.4317,
											"scaleX": 0.4,
											"scaleY": 0.2,
											"scaleZ": 0.3,
											"rotationZ": -105.8,
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
													"scaleX": 1.5,
													"scaleY": 20,
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
																	"culling": "None",
																	"colorMask": 255,
																	"depthTest": "LessEqual",
																	"enableStencil": false,
																	"parallax": 0,
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
																"wrap": true,
																"invert": false,
																"replace": false,
																"alpha": 0.5,
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
																"alpha": 1,
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
																			"time": 1.1495170698980202,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1495170698980202,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1495170698980202,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1495170698980202,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1495170698980202,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1495170698980202,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1495170698980202,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1495170698980202,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1495170698980202,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1495170698980202,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1495170698980202,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1495170698980202,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1495170698980202,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1495170698980202,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1495170698980202,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1495170698980202,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1495170698980202,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1495170698980202,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1495170698980202,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1495170698980202,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1495170698980202,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1495170698980202,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1495170698980202,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.1495170698980202,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.15951706989802,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.15951706989802,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.15951706989802,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.15951706989802,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.15951706989802,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.15951706989802,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 1.3295170698980203,
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
																			"time": 2.349523097249386,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 2.349523097249386,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 2.349523097249386,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 2.349523097249386,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 2.349523097249386,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 2.349523097249386,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.34000200911712186
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.34000200911712186
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
																"range": 0.2,
																"power": 2
															},
															"isInstance": true
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 0.25,
																"color": [
																	0.7607843137254902,
																	0.596078431372549,
																	0.34509803921568627
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "amount",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.8437243654147721,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.209462314850247,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.209462314850247,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.209462314850247,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.209462314850247,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.209462314850247,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.209462314850247,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.209462314850247,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.209462314850247,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.209462314850247,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.209462314850247,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.209462314850247,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.209462314850247,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.209462314850247,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.209462314850247,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.209462314850247,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.209462314850247,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.209462314850247,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.209462314850247,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.209462314850247,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.209462314850247,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.209462314850247,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.209462314850247,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.209462314850247,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.209462314850247,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.209462314850247,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.209462314850247,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.209462314850247,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.209462314850247,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.209462314850247,
																			"value": 0,
																			"mode": 0
																		},
																		{
																			"time": 1.209462314850247,
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
																			"time": 2.330702958632658,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 2.330702958632658,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 2.330702958632658,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 2.330702958632658,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 2.330702958632658,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 2.330702958632658,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 2.330702958632658,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 2.330702958632658,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 2.330702958632658,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 2.330702958632658,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 2.330702958632658,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 2.330702958632658,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 2.330702958632658,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 2.330702958632658,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 2.330702958632658,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 2.330702958632658,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 2.330702958632658,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 2.330702958632658,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 2.330702958632658,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 2.330702958632658,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 2.330702958632658,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 2.330702958632658,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 2.330702958632658,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 2.330702958632658,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 2.330702958632658,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 2.330702958632658,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 2.330702958632658,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 2.330702958632658,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 2.330702958632658,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 2.330702958632658,
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
															"time": 0.7823184641031871,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.7823184641031871,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.7823184641031871,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.7823184641031871,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.7823184641031871,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.7823184641031871,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.7823184641031871,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.7823184641031871,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.7823184641031871,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.7823184641031871,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.7823184641031871,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.7823184641031871,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.7823184641031871,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.7823184641031871,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.7823184641031871,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.7823184641031871,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.7823184641031871,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.7823184641031871,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.7823184641031871,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.7823184641031871,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.7823184641031871,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.7823184641031871,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.7823184641031871,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.7823184641031871,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.7823184641031871,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.7823184641031871,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.7823184641031871,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.7823184641031871,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.7823184641031871,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.7823184641031871,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.04032893849489203,
																"dt": -0.18524618299377818
															},
															"nextHandle": {
																"dv": 0.0920000000000003,
																"dt": 0.42111370979298
															}
														},
														{
															"time": 1.2748625127183328,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2748625127183328,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2748625127183328,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2748625127183328,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2748625127183328,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2748625127183328,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2748625127183328,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2748625127183328,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2748625127183328,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2748625127183328,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2748625127183328,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2748625127183328,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2748625127183328,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2748625127183328,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2748625127183328,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2748625127183328,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2748625127183328,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2748625127183328,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2748625127183328,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2748625127183328,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2748625127183328,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2748625127183328,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2748625127183328,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2748625127183328,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2748625127183328,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2748625127183328,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2748625127183328,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2748625127183328,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2748625127183328,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2748625127183328,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.0250321701640726,
															"value": 1.8000000000000012,
															"mode": 0
														},
														{
															"time": 2.0250321701640726,
															"value": 1.8000000000000012,
															"mode": 0
														},
														{
															"time": 2.0250321701640726,
															"value": 1.8000000000000012,
															"mode": 0
														},
														{
															"time": 2.0250321701640726,
															"value": 1.8000000000000012,
															"mode": 0
														},
														{
															"time": 2.0250321701640726,
															"value": 1.8000000000000012,
															"mode": 0
														},
														{
															"time": 2.0250321701640726,
															"value": 1.8000000000000012,
															"mode": 0
														},
														{
															"time": 2.0250321701640726,
															"value": 1.8000000000000012,
															"mode": 0
														},
														{
															"time": 2.0250321701640726,
															"value": 1.8000000000000012,
															"mode": 0
														},
														{
															"time": 2.0250321701640726,
															"value": 1.8000000000000012,
															"mode": 0
														},
														{
															"time": 2.0250321701640726,
															"value": 1.8000000000000012,
															"mode": 0
														},
														{
															"time": 2.0250321701640726,
															"value": 1.8000000000000012,
															"mode": 0
														},
														{
															"time": 2.0250321701640726,
															"value": 1.8000000000000012,
															"mode": 0
														},
														{
															"time": 2.0250321701640726,
															"value": 1.8000000000000012,
															"mode": 0
														},
														{
															"time": 2.0250321701640726,
															"value": 1.8000000000000012,
															"mode": 0
														},
														{
															"time": 2.0250321701640726,
															"value": 1.8000000000000012,
															"mode": 0
														},
														{
															"time": 2.0250321701640726,
															"value": 1.8000000000000012,
															"mode": 0
														},
														{
															"time": 2.0250321701640726,
															"value": 1.8000000000000012,
															"mode": 0
														},
														{
															"time": 2.0250321701640726,
															"value": 1.8000000000000012,
															"mode": 0
														},
														{
															"time": 2.0250321701640726,
															"value": 1.8000000000000012,
															"mode": 0
														},
														{
															"time": 2.0250321701640726,
															"value": 1.8000000000000012,
															"mode": 0
														},
														{
															"time": 2.0250321701640726,
															"value": 1.8000000000000012,
															"mode": 0
														},
														{
															"time": 2.0250321701640726,
															"value": 1.8000000000000012,
															"mode": 0
														},
														{
															"time": 2.0250321701640726,
															"value": 1.8000000000000012,
															"mode": 0
														},
														{
															"time": 2.0250321701640726,
															"value": 1.8000000000000012,
															"mode": 0
														},
														{
															"time": 2.0250321701640726,
															"value": 1.8000000000000012,
															"mode": 0
														},
														{
															"time": 2.0250321701640726,
															"value": 1.8000000000000012,
															"mode": 0
														},
														{
															"time": 2.0250321701640726,
															"value": 1.8000000000000012,
															"mode": 0
														},
														{
															"time": 2.0250321701640726,
															"value": 1.8000000000000012,
															"mode": 0
														},
														{
															"time": 2.0250321701640726,
															"value": 1.8000000000000012,
															"mode": 0
														},
														{
															"time": 2.0250321701640726,
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
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "White",
									"z": 0.03,
									"scaleX": 0.125,
									"scaleY": 0.125,
									"scaleZ": 0.085,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
									"fadePower": 3,
									"emissive": 0.5,
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
															"time": 1.071023078424557,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.264965660873711,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.3684943434715713,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.9567683341453281
															},
															"nextHandle": {
																"dv": 0.006535301955241471,
																"dt": 0.375400531221125
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
												"envBlend": 1,
												"envColorSet": false
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "object",
									"name": "Duration",
									"z": -0.015,
									"children": [
										{
											"type": "advancedDecal",
											"name": "FloorFlareDuration",
											"scaleX": 0.2383451776093822,
											"scaleY": 0.2383451776093822,
											"scaleZ": 0.047669035521876436,
											"rotationZ": -29.99999999999998,
											"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
											"fadePower": 0.25,
											"emissive": 0.2,
											"renderMode": "BeforeTonemapping",
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
														"alpha": 0.15,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 1,
														"vOffset": 1,
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
																	"time": 1.071023078424557,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.264965660873711,
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
													"loop": true,
													"keys": [
														{
															"time": 0.33112613514937195,
															"value": 0.947440719604492,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.25
															}
														},
														{
															"time": 1.081126135149372,
															"value": 1.097440719604492,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.25
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.25
															}
														},
														{
															"time": 1.831126135149372,
															"value": 0.947440719604492,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.25
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.25
															}
														}
													]
												}
											]
										},
										{
											"type": "object",
											"name": "FlareDuration",
											"scaleX": 0.05,
											"scaleY": 0.05,
											"scaleZ": 0.051356399449982194,
											"children": [
												{
													"type": "lookAt",
													"name": "lookAt_FlareLarge",
													"z": 0.4317,
													"scaleX": 0.4,
													"scaleY": 0.25,
													"scaleZ": 0.3,
													"rotationZ": -105.8,
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
																			"parallax": 0,
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
																					"time": 1.8910032007369812,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.8910032007369812,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.8910032007369812,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.8910032007369812,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.8910032007369812,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.8910032007369812,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.8910032007369812,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.8910032007369812,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.8910032007369812,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.8910032007369812,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.8910032007369812,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.8910032007369812,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.8910032007369812,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.8910032007369812,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.8910032007369812,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.8910032007369812,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.8910032007369812,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.8910032007369812,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.8910032007369812,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.8910032007369812,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.8910032007369812,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.8910032007369812,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.8910032007369812,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.8910032007369812,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.8910032007369812,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.8910032007369812,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.8910032007369812,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.8910032007369812,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.8910032007369812,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.8910032007369812,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
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
																		"range": 0.2,
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
																		"amount": 0.25,
																		"color": [
																			0.6431372549019607,
																			0.5019607843137255,
																			0.28627450980392155
																		]
																	},
																	"children": [
																		{
																			"type": "curve",
																			"name": "amount",
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.1590479807799685,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.1590479807799685,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.1590479807799685,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.1590479807799685,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.1590479807799685,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.1590479807799685,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.1590479807799685,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.1590479807799685,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.1590479807799685,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.1590479807799685,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.1590479807799685,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.1590479807799685,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.1590479807799685,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.1590479807799685,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.1590479807799685,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.1590479807799685,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.1590479807799685,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.1590479807799685,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.1590479807799685,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.1590479807799685,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.1590479807799685,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.1590479807799685,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.1590479807799685,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.1590479807799685,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.1590479807799685,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.1590479807799685,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.1590479807799685,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.1590479807799685,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.1590479807799685,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.1590479807799685,
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
																					"time": 1.6482735356568052,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 1.6482735356568052,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 1.6482735356568052,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 1.6482735356568052,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 1.6482735356568052,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 1.6482735356568052,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 1.6482735356568052,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 1.6482735356568052,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 1.6482735356568052,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 1.6482735356568052,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 1.6482735356568052,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 1.6482735356568052,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 1.6482735356568052,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 1.6482735356568052,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 1.6482735356568052,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 1.6482735356568052,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 1.6482735356568052,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 1.6482735356568052,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 1.6482735356568052,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 1.6482735356568052,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 1.6482735356568052,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 1.6482735356568052,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 1.6482735356568052,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 1.6482735356568052,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 1.6482735356568052,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 1.6482735356568052,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 1.6482735356568052,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 1.6482735356568052,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 1.6482735356568052,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 1.6482735356568052,
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
													"type": "lookAt",
													"name": "lookAt_FlareWhite",
													"z": 0.4317,
													"scaleX": 0.4,
													"scaleY": 0.2,
													"scaleZ": 0.3,
													"rotationZ": -105.8,
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
															"scaleX": 1.5,
															"scaleY": 20,
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
																			"culling": "None",
																			"colorMask": 255,
																			"depthTest": "LessEqual",
																			"enableStencil": false,
																			"parallax": 0,
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
																		"useSourceUVs": false,
																		"wrap": true,
																		"invert": false,
																		"replace": false,
																		"alpha": 0.5,
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
																	"enabled": false,
																	"props": {
																		"useSourceUVs": true,
																		"useScale": true,
																		"wrap": true,
																		"progress": 0.29,
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
																		"alpha": 1,
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
																					"time": 1.901003200736981,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.901003200736981,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.901003200736981,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.901003200736981,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.901003200736981,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.901003200736981,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.901003200736981,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.901003200736981,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.901003200736981,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.901003200736981,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.901003200736981,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.901003200736981,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.901003200736981,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.901003200736981,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.901003200736981,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.901003200736981,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.901003200736981,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.901003200736981,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.901003200736981,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.901003200736981,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.901003200736981,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.901003200736981,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.901003200736981,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.901003200736981,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.9110032007369808,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.9110032007369808,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.9110032007369808,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.9110032007369808,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.9110032007369808,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.9110032007369808,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.3599775979249493,
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
																		"range": 0.2,
																		"power": 2
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"props": {
																		"amount": 0.25,
																		"color": [
																			0.7607843137254902,
																			0.596078431372549,
																			0.34509803921568627
																		]
																	},
																	"children": [
																		{
																			"type": "curve",
																			"name": "amount",
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.8437243654147721,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.209462314850247,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.209462314850247,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.209462314850247,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.209462314850247,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.209462314850247,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.209462314850247,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.209462314850247,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.209462314850247,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.209462314850247,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.209462314850247,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.209462314850247,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.209462314850247,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.209462314850247,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.209462314850247,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.209462314850247,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.209462314850247,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.209462314850247,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.209462314850247,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.209462314850247,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.209462314850247,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.209462314850247,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.209462314850247,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.209462314850247,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.209462314850247,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.209462314850247,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.209462314850247,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.209462314850247,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.209462314850247,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.209462314850247,
																					"value": 0,
																					"mode": 0
																				},
																				{
																					"time": 1.209462314850247,
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
																					"time": 2.330702958632658,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.330702958632658,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.330702958632658,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.330702958632658,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.330702958632658,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.330702958632658,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.330702958632658,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.330702958632658,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.330702958632658,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.330702958632658,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.330702958632658,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.330702958632658,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.330702958632658,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.330702958632658,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.330702958632658,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.330702958632658,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.330702958632658,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.330702958632658,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.330702958632658,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.330702958632658,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.330702958632658,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.330702958632658,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.330702958632658,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.330702958632658,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.330702958632658,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.330702958632658,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.330702958632658,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.330702958632658,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.330702958632658,
																					"value": 1,
																					"mode": 0
																				},
																				{
																					"time": 2.330702958632658,
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
																	"time": 0.7823184641031871,
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.7823184641031871,
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.7823184641031871,
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.7823184641031871,
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.7823184641031871,
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.7823184641031871,
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.7823184641031871,
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.7823184641031871,
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.7823184641031871,
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.7823184641031871,
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.7823184641031871,
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.7823184641031871,
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.7823184641031871,
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.7823184641031871,
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.7823184641031871,
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.7823184641031871,
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.7823184641031871,
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.7823184641031871,
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.7823184641031871,
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.7823184641031871,
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.7823184641031871,
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.7823184641031871,
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.7823184641031871,
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.7823184641031871,
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.7823184641031871,
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.7823184641031871,
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.7823184641031871,
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.7823184641031871,
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.7823184641031871,
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.7823184641031871,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.04032893849489203,
																		"dt": -0.18524618299377818
																	},
																	"nextHandle": {
																		"dv": 0.0920000000000003,
																		"dt": 0.42111370979298
																	}
																},
																{
																	"time": 1.2748625127183328,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.2748625127183328,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.2748625127183328,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.2748625127183328,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.2748625127183328,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.2748625127183328,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.2748625127183328,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.2748625127183328,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.2748625127183328,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.2748625127183328,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.2748625127183328,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.2748625127183328,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.2748625127183328,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.2748625127183328,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.2748625127183328,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.2748625127183328,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.2748625127183328,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.2748625127183328,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.2748625127183328,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.2748625127183328,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.2748625127183328,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.2748625127183328,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.2748625127183328,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.2748625127183328,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.2748625127183328,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.2748625127183328,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.2748625127183328,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.2748625127183328,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.2748625127183328,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.2748625127183328,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 2.0250321701640726,
																	"value": 1.8000000000000012,
																	"mode": 0
																},
																{
																	"time": 2.0250321701640726,
																	"value": 1.8000000000000012,
																	"mode": 0
																},
																{
																	"time": 2.0250321701640726,
																	"value": 1.8000000000000012,
																	"mode": 0
																},
																{
																	"time": 2.0250321701640726,
																	"value": 1.8000000000000012,
																	"mode": 0
																},
																{
																	"time": 2.0250321701640726,
																	"value": 1.8000000000000012,
																	"mode": 0
																},
																{
																	"time": 2.0250321701640726,
																	"value": 1.8000000000000012,
																	"mode": 0
																},
																{
																	"time": 2.0250321701640726,
																	"value": 1.8000000000000012,
																	"mode": 0
																},
																{
																	"time": 2.0250321701640726,
																	"value": 1.8000000000000012,
																	"mode": 0
																},
																{
																	"time": 2.0250321701640726,
																	"value": 1.8000000000000012,
																	"mode": 0
																},
																{
																	"time": 2.0250321701640726,
																	"value": 1.8000000000000012,
																	"mode": 0
																},
																{
																	"time": 2.0250321701640726,
																	"value": 1.8000000000000012,
																	"mode": 0
																},
																{
																	"time": 2.0250321701640726,
																	"value": 1.8000000000000012,
																	"mode": 0
																},
																{
																	"time": 2.0250321701640726,
																	"value": 1.8000000000000012,
																	"mode": 0
																},
																{
																	"time": 2.0250321701640726,
																	"value": 1.8000000000000012,
																	"mode": 0
																},
																{
																	"time": 2.0250321701640726,
																	"value": 1.8000000000000012,
																	"mode": 0
																},
																{
																	"time": 2.0250321701640726,
																	"value": 1.8000000000000012,
																	"mode": 0
																},
																{
																	"time": 2.0250321701640726,
																	"value": 1.8000000000000012,
																	"mode": 0
																},
																{
																	"time": 2.0250321701640726,
																	"value": 1.8000000000000012,
																	"mode": 0
																},
																{
																	"time": 2.0250321701640726,
																	"value": 1.8000000000000012,
																	"mode": 0
																},
																{
																	"time": 2.0250321701640726,
																	"value": 1.8000000000000012,
																	"mode": 0
																},
																{
																	"time": 2.0250321701640726,
																	"value": 1.8000000000000012,
																	"mode": 0
																},
																{
																	"time": 2.0250321701640726,
																	"value": 1.8000000000000012,
																	"mode": 0
																},
																{
																	"time": 2.0250321701640726,
																	"value": 1.8000000000000012,
																	"mode": 0
																},
																{
																	"time": 2.0250321701640726,
																	"value": 1.8000000000000012,
																	"mode": 0
																},
																{
																	"time": 2.0250321701640726,
																	"value": 1.8000000000000012,
																	"mode": 0
																},
																{
																	"time": 2.0250321701640726,
																	"value": 1.8000000000000012,
																	"mode": 0
																},
																{
																	"time": 2.0250321701640726,
																	"value": 1.8000000000000012,
																	"mode": 0
																},
																{
																	"time": 2.0250321701640726,
																	"value": 1.8000000000000012,
																	"mode": 0
																},
																{
																	"time": 2.0250321701640726,
																	"value": 1.8000000000000012,
																	"mode": 0
																},
																{
																	"time": 2.0250321701640726,
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
															"loop": true,
															"keys": [
																{
																	"time": -1.5790686791539983,
																	"value": 0.75,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.25
																	}
																},
																{
																	"time": -0.8290686791539983,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.25
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.25
																	}
																},
																{
																	"time": 0.25205745599537366,
																	"value": 0.75,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.25
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.25
																	}
																}
															]
														}
													]
												},
												{
													"type": "curve",
													"name": "scale.z",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0.85,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.25
															}
														},
														{
															"time": 0.75,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.25
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.25
															}
														},
														{
															"time": 1.5,
															"value": 0.85,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.25
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.25
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
							"name": "FloorGlitch",
							"z": -0.0075000000000000015,
							"scaleX": 1.2,
							"scaleY": 1.2,
							"scaleZ": 1.2,
							"children": [
								{
									"type": "emitter",
									"name": "FlareGround",
									"props": {
										"emitType": "Burst",
										"instScale": 0.1,
										"warmUpTime": -0.75,
										"lifeTime": 1.2
									},
									"z": 0.004518,
									"scaleX": 0.006999999999999998,
									"scaleY": 0.006999999999999998,
									"scaleZ": 0.006999999999999998,
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
															"emissive": 0.2
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
														"alpha": 0.3,
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
																		"color": -151198802
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
															0.5450980392156862,
															0.6941176470588235,
															1
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.04511187146993318,
																		"dt": -0.49965741688338355
																	},
																	"nextHandle": {
																		"dv": -0.01666666666666705,
																		"dt": 0.18767603882889183
																	}
																},
																{
																	"time": 0.2708756768212688,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.2708756768212688,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.2708756768212688,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.2708756768212688,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.2708756768212688,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.45762187905928653,
																	"value": -2.7755575615628914e-16,
																	"mode": 0
																},
																{
																	"time": 0.45762187905928653,
																	"value": -2.7755575615628914e-16,
																	"mode": 0
																},
																{
																	"time": 0.45762187905928653,
																	"value": -2.7755575615628914e-16,
																	"mode": 0
																},
																{
																	"time": 0.45762187905928653,
																	"value": -2.7755575615628914e-16,
																	"mode": 0
																},
																{
																	"time": 0.45762187905928653,
																	"value": -2.7755575615628914e-16,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.01666666666666672,
																		"dt": -0.10334430583115584
																	},
																	"nextHandle": {
																		"dv": 0.010028697519592782,
																		"dt": 0.06218452701317666
																	}
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
												"amount": 1,
												"ATTENUATE": false,
												"emissiveMap": "Fx/Gradients/z_FillBlack.jpg"
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon",
									"z": 0.001,
									"scaleX": 0.13,
									"scaleY": 0.13,
									"scaleZ": 0.13,
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
												"texture": "Fx/Alphas/T_circle.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.1082713278899936,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.1082713278899936,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.1082713278899936,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3022139103391477,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.3022139103391477,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.3022139103391477,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.405742592937008,
															"value": 0,
															"mode": 0
														},
														{
															"time": 2.405742592937008,
															"value": 0,
															"mode": 0
														},
														{
															"time": 2.405742592937008,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.9567683341453281
															},
															"nextHandle": {
																"dv": 0.006535301955241471,
																"dt": 0.375400531221125
															}
														}
													],
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"keys": [
																{
																	"time": 1.1082713278899936,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.1082713278899936,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.1082713278899936,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.3022139103391477,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.3022139103391477,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.3022139103391477,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 2.405742592937008,
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 2.405742592937008,
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 2.405742592937008,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.01666666666666672,
																		"dt": -0.9567683341453281
																	},
																	"nextHandle": {
																		"dv": 0.006535301955241471,
																		"dt": 0.375400531221125
																	}
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "WorldUV",
											"source": "shaders/WorldUV.hx",
											"props": {
												"useNormalMap": false,
												"onDecal": false,
												"scale": 14,
												"rotation": 0
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
												"progress": 0.23,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 0.8,
												"uvScaleY": 0.8,
												"texture": "Fx/Alphas/T_Grid10_Thick.png",
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
													0.9490196078431372,
													0.8549019607843137
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
												"intensity": 0.5,
												"scrollSpeed": [
													0,
													1
												],
												"scale": [
													1.5,
													1.5
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "intensity",
													"keys": [
														{
															"time": 1.1217096825538713,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.1217096825538713,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.1217096825538713,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3673135498448716,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.3673135498448716,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.3673135498448716,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.3673135498448716,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.3673135498448716,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.3673135498448716,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.3673135498448716,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.3673135498448716,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.3673135498448716,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.3673135498448716,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.3673135498448716,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.3673135498448716,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.3673135498448716,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.3673135498448716,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.3673135498448716,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.4716221654480597,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4716221654480597,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4716221654480597,
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
													0.5450980392156862,
													0.6941176470588235,
													1
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.1013203634889237,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.1013203634889237,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.1013203634889237,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.04511187146993318,
																"dt": -0.49965741688338355
															},
															"nextHandle": {
																"dv": -0.01666666666666705,
																"dt": 0.18767603882889183
															}
														},
														{
															"time": 1.2983913941232896,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2983913941232896,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2983913941232896,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2983913941232896,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2983913941232896,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2983913941232896,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2983913941232896,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2983913941232896,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2983913941232896,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2983913941232896,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2983913941232896,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2983913941232896,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2983913941232896,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2983913941232896,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2983913941232896,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.4851375963613074,
															"value": -2.7755575615628914e-16,
															"mode": 0
														},
														{
															"time": 1.4851375963613074,
															"value": -2.7755575615628914e-16,
															"mode": 0
														},
														{
															"time": 1.4851375963613074,
															"value": -2.7755575615628914e-16,
															"mode": 0
														},
														{
															"time": 1.4851375963613074,
															"value": -2.7755575615628914e-16,
															"mode": 0
														},
														{
															"time": 1.4851375963613074,
															"value": -2.7755575615628914e-16,
															"mode": 0
														},
														{
															"time": 1.4851375963613074,
															"value": -2.7755575615628914e-16,
															"mode": 0
														},
														{
															"time": 1.4851375963613074,
															"value": -2.7755575615628914e-16,
															"mode": 0
														},
														{
															"time": 1.4851375963613074,
															"value": -2.7755575615628914e-16,
															"mode": 0
														},
														{
															"time": 1.4851375963613074,
															"value": -2.7755575615628914e-16,
															"mode": 0
														},
														{
															"time": 1.4851375963613074,
															"value": -2.7755575615628914e-16,
															"mode": 0
														},
														{
															"time": 1.4851375963613074,
															"value": -2.7755575615628914e-16,
															"mode": 0
														},
														{
															"time": 1.4851375963613074,
															"value": -2.7755575615628914e-16,
															"mode": 0
														},
														{
															"time": 1.4851375963613074,
															"value": -2.7755575615628914e-16,
															"mode": 0
														},
														{
															"time": 1.4851375963613074,
															"value": -2.7755575615628914e-16,
															"mode": 0
														},
														{
															"time": 1.4851375963613074,
															"value": -2.7755575615628914e-16,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.10334430583115584
															},
															"nextHandle": {
																"dv": 0.010028697519592782,
																"dt": 0.06218452701317666
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
							"name": "AttackMainBase",
							"z": 0.007499999999999999,
							"children": [
								{
									"type": "advancedDecal",
									"name": "ArrowsDuration",
									"z": -0.015,
									"scaleX": 0.16,
									"scaleY": 0.16,
									"scaleZ": 0.22,
									"rotationZ": -29.999999999999993,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
									"fadePower": 3,
									"emissive": 1,
									"renderMode": "BeforeTonemapping",
									"normalFade": true,
									"normalFadeStart": 0.5,
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
												"alpha": 0.75,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 1,
												"vOffset": 1,
												"texture": "Fx/Alphas/T_CirclePattern07.png"
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.2180932044962025,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.640713978229901,
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
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0.9,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.25
													}
												},
												{
													"time": 0.75,
													"value": 1.0448814392089845,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.25
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.25
													}
												},
												{
													"time": 1.5,
													"value": 0.9,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.25
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.25
													}
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 0.5,
												"color": [
													0.6313725490196078,
													0.44705882352941173,
													0.18823529411764706
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keys": [
														{
															"time": 1.13084098640456,
															"value": 0.9989132380451242,
															"mode": 0
														},
														{
															"time": 1.2069316430335753,
															"value": 0.98,
															"mode": 2
														},
														{
															"time": 2.224120165266953,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.00016203909673984107,
																"dt": -0.9703616803401582
															},
															"nextHandle": {
																"dv": -2.118055713767727e-17,
																"dt": 0.34046853441370317
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
									"name": "FloorFlareDuration",
									"z": -0.015,
									"scaleX": 0.25366754859021834,
									"scaleY": 0.25366754859021834,
									"scaleZ": 0.05073350971804367,
									"rotationZ": -29.999999999999986,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
									"fadePower": 0.25,
									"emissive": 0.2,
									"renderMode": "BeforeTonemapping",
									"normalFade": true,
									"normalFadeStart": 0.5,
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
												"alpha": 0.15,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 1,
												"vOffset": 1,
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
															"time": 1.862524605557228,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.362524605557228,
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
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0.947440719604492,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.25
													}
												},
												{
													"time": 0.75,
													"value": 1.097440719604492,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.25
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.25
													}
												},
												{
													"time": 1.5,
													"value": 0.947440719604492,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.25
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.25
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
											1,
											0.8470588235294118,
											0.43137254901960786
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "amount",
											"keyMode": 0,
											"keys": [
												{
													"time": 1.0169316430335753,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.2069316430335753,
													"value": 0,
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
													"time": 2.224120165266953,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "Icon",
									"scaleX": 0.85,
									"scaleY": 0.85,
									"scaleZ": 0.85,
									"children": [
										{
											"type": "lookAt",
											"name": "lookAt-Swords",
											"z": 0.15,
											"scaleX": 0.02,
											"scaleY": 0.02,
											"scaleZ": 0.02,
											"rotationX": 4.9704929940842796e-17,
											"rotationY": 1.075899606759095,
											"rotationZ": 41.51716156899059,
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
													"scaleX": 5.5,
													"scaleY": 4.71,
													"scaleZ": 5.5,
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
																	"alphaKill": true,
																	"drawOrder": "120",
																	"emissive": 1
																}
															},
															"diffuseMap": "Fx/Alphas/T_Logo_Atreides.png"
														},
														{
															"type": "shader",
															"name": "AutoAlpha",
															"source": "shaders/AutoAlpha.hx",
															"props": {
																"scale": 1
															},
															"children": [
																{
																	"type": "curve",
																	"name": "scale",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 1.9349220260668272,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.3575427998005254,
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
															"enabled": false,
															"props": {
																"amount": 0.9,
																"color": [
																	0.6431372549019607,
																	0.5372549019607843,
																	0.28627450980392155
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "amount",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 1.0169316430335753,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1.2069316430335753,
																			"value": 0.6359340194891768,
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
																			"time": 2.224120165266953,
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
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0.85,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.25
																	}
																},
																{
																	"time": 0.8532506987586768,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.25
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.25
																	}
																},
																{
																	"time": 1.6032506987586768,
																	"value": 0.85,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.25
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.25
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
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": 1.572278173933221,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 2.072278173933221,
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
							"type": "object",
							"name": "CirclesFloor",
							"z": -0.007500000000000001,
							"scaleX": 0.014,
							"scaleY": 0.014,
							"scaleZ": 0.014,
							"children": [
								{
									"type": "object",
									"name": "Floor",
									"children": [
										{
											"type": "object",
											"name": "decals",
											"children": [
												{
													"type": "advancedDecal",
													"name": "CIRCLE",
													"scaleX": 15,
													"scaleY": 15,
													"scaleZ": 10,
													"albedoMap": "Fx/Alphas/T_Target1.png",
													"fadeStart": 0.95,
													"emissive": 1,
													"renderMode": "BeforeTonemapping",
													"normalFade": true,
													"normalFadeStart": 0.64,
													"children": [
														{
															"type": "curve",
															"name": "rotation.z",
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 10,
																	"value": -1,
																	"mode": 2
																}
															]
														},
														{
															"type": "shader",
															"name": "AlphaMult",
															"source": "shaders/AlphaMult.hx",
															"props": {
																"alpha": 1
															}
														}
													]
												},
												{
													"type": "advancedDecal",
													"name": "CIRCLE CUT",
													"scaleX": 22,
													"scaleY": 22,
													"scaleZ": 10,
													"albedoMap": "Fx/Alphas/T_circle_2.png",
													"fadeStart": 0.95,
													"emissive": 1,
													"renderMode": "BeforeTonemapping",
													"normalFade": true,
													"normalFadeStart": 0.64,
													"children": [
														{
															"type": "curve",
															"name": "rotation.z",
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 10,
																	"value": 1,
																	"mode": 2
																}
															]
														},
														{
															"type": "shader",
															"name": "AlphaMult",
															"source": "shaders/AlphaMult.hx",
															"props": {
																"alpha": 1
															}
														}
													]
												},
												{
													"type": "advancedDecal",
													"name": "Range",
													"scaleX": 18,
													"scaleY": 18,
													"scaleZ": 10,
													"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
													"fadePower": 3,
													"emissive": 1,
													"renderMode": "BeforeTonemapping",
													"normalFade": true,
													"normalFadeStart": 0.5,
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
																"uOffset": 1,
																"vOffset": 1,
																"texture": "Fx/Alphas/T_UI_InnerGradient_512_test.png"
															},
															"isInstance": true
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
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 0.5,
												"color": [
													0.6313725490196078,
													0.44705882352941173,
													0.18823529411764706
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keys": [
														{
															"time": 1.13084098640456,
															"value": 0.9989132380451242,
															"mode": 0
														},
														{
															"time": 1.2069316430335753,
															"value": 0.98,
															"mode": 2
														},
														{
															"time": 2.224120165266953,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.00016203909673984107,
																"dt": -0.9703616803401582
															},
															"nextHandle": {
																"dv": -2.118055713767727e-17,
																"dt": 0.34046853441370317
															}
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
										"alpha": 1
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 1.1607042502037621,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.551302184541231,
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
											"time": 1.1607042502037621,
											"value": 0.5,
											"mode": 2
										},
										{
											"time": 1.551302184541231,
											"value": 1,
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
								"amount": 0.5,
								"color": [
									0.6941176470588235,
									0.5843137254901961,
									0.2901960784313725
								]
							}
						}
					]
				}
			]
		}
	]
}