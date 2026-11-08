{
	"type": "fx",
	"cullingRadius": 500,
	"markers": [
		{
			"t": 8.80576
		}
	],
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "model",
					"name": "Pawn_Mainbase_Corrino",
					"source": "UI/ConquestMenu/Assets/Pawn_01.fbx",
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
					"name": "PawnEffect",
					"z": 0.015,
					"children": [
						{
							"type": "object",
							"name": "Flare",
							"enabled": false,
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
														"alpha": 0.8,
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
																	"time": 2.769528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.769528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.769528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.769528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.769528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.769528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.769528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.769528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.769528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.769528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.769528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.769528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.769528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.769528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.769528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.769528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.769528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.769528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.769528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.769528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.769528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.769528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.769528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.769528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.769528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.769528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.769528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.769528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.769528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.769528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1,
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
																	"time": 3.976716753616069,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.976716753616069,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.976716753616069,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.976716753616069,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.976716753616069,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.976716753616069,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.976716753616069,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.976716753616069,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.976716753616069,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.976716753616069,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.976716753616069,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.976716753616069,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.976716753616069,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.976716753616069,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.976716753616069,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.976716753616069,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.976716753616069,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.976716753616069,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.976716753616069,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.976716753616069,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.976716753616069,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.976716753616069,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.976716753616069,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.976716753616069,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.976716753616069,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.976716753616069,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.976716753616069,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.976716753616069,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.976716753616069,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.976716753616069,
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
														"amount": 1,
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
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0,
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
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
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
																	"time": 2.779528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.779528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.779528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.779528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.779528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.779528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.779528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.779528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.779528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.779528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.779528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.779528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.779528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.779528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.779528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.779528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.779528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.779528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.779528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.779528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.779528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.779528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.779528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.779528231382691,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.7895282313826906,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.7895282313826906,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.7895282313826906,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.7895282313826906,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.7895282313826906,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.7895282313826906,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1
																},
																{
																	"time": 2.959528231382691,
																	"value": 1,
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
																	"time": 3.9795342587340565,
																	"value": 0
																},
																{
																	"time": 3.9795342587340565,
																	"value": 0
																},
																{
																	"time": 3.9795342587340565,
																	"value": 0
																},
																{
																	"time": 3.9795342587340565,
																	"value": 0
																},
																{
																	"time": 3.9795342587340565,
																	"value": 0
																},
																{
																	"time": 3.9795342587340565,
																	"value": 0,
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
														"amount": 1,
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
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0,
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
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
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
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0,
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
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012,
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
							"type": "object",
							"name": "FlareDuration",
							"z": -0.015,
							"scaleX": 0.05,
							"scaleY": 0.05,
							"scaleZ": 0.06,
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
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1,
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
														},
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
																	"time": 0.49929461931578273,
																	"value": 1,
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
														"amount": 1,
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
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0
																},
																{
																	"time": 2.789059142264639,
																	"value": 0,
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
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
																},
																{
																	"time": 3.278284697141476,
																	"value": 1
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
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5410143622216514,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5410143622216514,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5410143622216514,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5410143622216514,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5410143622216514,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5410143622216514,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1,
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
														},
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
																	"time": 0.49929461931578273,
																	"value": 1,
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
														"amount": 1,
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
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.4737355268994428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0
																},
																{
																	"time": 2.8394734763349176,
																	"value": 0,
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
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
																},
																{
																	"time": 3.960714120117329,
																	"value": 1
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
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0
												},
												{
													"time": 2.4123296255878577,
													"value": 0,
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
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9048736742030035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012
												},
												{
													"time": 3.655043331648743,
													"value": 1.8000000000000012,
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
											"name": "scale.z",
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
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": -0.0025199528420294937,
														"dt": -0.0324176081713078
													},
													"nextHandle": {
														"dv": 0.0010161587690337445,
														"dt": 0.013394049228115816
													}
												},
												{
													"time": 0,
													"value": 0,
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
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": -0.2500565524819132
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
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
											"keys": [
												{
													"time": 0,
													"value": 0.75,
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
													"value": 0.75,
													"prevHandle": {
														"dv": 0,
														"dt": -0.25
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.25
													}
												}
											],
											"loop": true
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
											"value": 0.85,
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
											"prevHandle": {
												"dv": 0,
												"dt": -0.25
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.25
											}
										}
									],
									"loop": true
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "White",
							"enabled": false,
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
													"time": 2.7010342399092275,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.8949768223583816,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.998505504956242,
													"value": 0,
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
							"type": "advancedDecal",
							"name": "outsidecircleDuration",
							"z": -0.015,
							"scaleX": 0.125,
							"scaleY": 0.125,
							"scaleZ": 0.1575,
							"rotationZ": -29.999999999999993,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"emissive": 2,
							"renderMode": "BeforeTonemapping",
							"normalFade": true,
							"normalFadeStart": 0.65,
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
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 2.7010342399092275,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.8949768223583816,
													"value": 1,
													"mode": 2
												}
											]
										},
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
													"time": 0.49929461931578273,
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
											"time": 0,
											"value": 0.8948814392089844,
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
											"value": 0.8948814392089844,
											"prevHandle": {
												"dv": 0,
												"dt": -0.25
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.25
											}
										}
									],
									"loop": true
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "FloorFlareDuration",
							"z": -0.015,
							"scaleX": 0.25,
							"scaleY": 0.25,
							"scaleZ": 0.05,
							"rotationZ": -29.999999999999993,
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
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 2.7010342399092275,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.8949768223583816,
													"value": 1,
													"mode": 2
												}
											]
										},
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
													"time": 0.49929461931578273,
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
											"time": 0,
											"value": 0.947440719604492,
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
											"prevHandle": {
												"dv": 0,
												"dt": -0.25
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.25
											}
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
									0.08235294117647059,
									0.08235294117647059
								]
							}
						}
					]
				},
				{
					"type": "object",
					"name": "FloorGlitch",
					"enabled": false,
					"children": [
						{
							"type": "emitter",
							"name": "FlareGround",
							"props": {
								"emitType": "Burst",
								"instScale": 0.1,
								"warmUpTime": -2.5,
								"lifeTime": 1.2,
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
															"value": 0
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
													0.6666666666666666,
													0.16862745098039217,
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
															"value": -2.7755575615628914e-16
														},
														{
															"time": 0.45762187905928653,
															"value": -2.7755575615628914e-16
														},
														{
															"time": 0.45762187905928653,
															"value": -2.7755575615628914e-16
														},
														{
															"time": 0.45762187905928653,
															"value": -2.7755575615628914e-16
														},
														{
															"time": 0.45762187905928653,
															"value": -2.7755575615628914e-16,
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
													"time": 2.636545797810169,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.636545797810169,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.636545797810169,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.830488380259323,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.830488380259323,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.830488380259323,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.9340170628571833,
													"value": 0
												},
												{
													"time": 3.9340170628571833,
													"value": 0
												},
												{
													"time": 3.9340170628571833,
													"value": 0,
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
															"time": 2.636545797810169,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.636545797810169,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.636545797810169,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.830488380259323,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.830488380259323,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.830488380259323,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3.9340170628571833,
															"value": 0
														},
														{
															"time": 3.9340170628571833,
															"value": 0
														},
														{
															"time": 3.9340170628571833,
															"value": 0,
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
													"time": 2.6499841524740466,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.6499841524740466,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.6499841524740466,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.895588019765047,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.895588019765047,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.895588019765047,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.895588019765047,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.895588019765047,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.895588019765047,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.895588019765047,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.895588019765047,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.895588019765047,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.895588019765047,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.895588019765047,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.895588019765047,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.895588019765047,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.895588019765047,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.895588019765047,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.999896635368235,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.999896635368235,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.999896635368235,
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
											0.6666666666666666,
											0.16862745098039217,
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
													"time": 2.629594833409099,
													"value": 0
												},
												{
													"time": 2.629594833409099,
													"value": 0
												},
												{
													"time": 2.629594833409099,
													"value": 0,
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
													"time": 2.826665864043465,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.826665864043465,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.826665864043465,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.826665864043465,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.826665864043465,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.826665864043465,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.826665864043465,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.826665864043465,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.826665864043465,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.826665864043465,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.826665864043465,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.826665864043465,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.826665864043465,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.826665864043465,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.826665864043465,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.0134120662814827,
													"value": -2.7755575615628914e-16
												},
												{
													"time": 3.0134120662814827,
													"value": -2.7755575615628914e-16
												},
												{
													"time": 3.0134120662814827,
													"value": -2.7755575615628914e-16
												},
												{
													"time": 3.0134120662814827,
													"value": -2.7755575615628914e-16
												},
												{
													"time": 3.0134120662814827,
													"value": -2.7755575615628914e-16
												},
												{
													"time": 3.0134120662814827,
													"value": -2.7755575615628914e-16
												},
												{
													"time": 3.0134120662814827,
													"value": -2.7755575615628914e-16
												},
												{
													"time": 3.0134120662814827,
													"value": -2.7755575615628914e-16
												},
												{
													"time": 3.0134120662814827,
													"value": -2.7755575615628914e-16
												},
												{
													"time": 3.0134120662814827,
													"value": -2.7755575615628914e-16
												},
												{
													"time": 3.0134120662814827,
													"value": -2.7755575615628914e-16
												},
												{
													"time": 3.0134120662814827,
													"value": -2.7755575615628914e-16
												},
												{
													"time": 3.0134120662814827,
													"value": -2.7755575615628914e-16
												},
												{
													"time": 3.0134120662814827,
													"value": -2.7755575615628914e-16
												},
												{
													"time": 3.0134120662814827,
													"value": -2.7755575615628914e-16,
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
					"name": "backup",
					"enabled": false,
					"z": 0.0075,
					"children": [
						{
							"type": "object",
							"name": "FloorGlitch",
							"z": -0.0075,
							"children": [
								{
									"type": "emitter",
									"name": "FlareGround",
									"props": {
										"emitType": "Burst",
										"instScale": 0.1,
										"warmUpTime": -2.5,
										"lifeTime": 1.2,
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
																	"value": 0
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
															0.6666666666666666,
															0.16862745098039217,
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
																	"value": -2.7755575615628914e-16
																},
																{
																	"time": 0.45762187905928653,
																	"value": -2.7755575615628914e-16
																},
																{
																	"time": 0.45762187905928653,
																	"value": -2.7755575615628914e-16
																},
																{
																	"time": 0.45762187905928653,
																	"value": -2.7755575615628914e-16
																},
																{
																	"time": 0.45762187905928653,
																	"value": -2.7755575615628914e-16,
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
															"time": 2.636545797810169,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.636545797810169,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.636545797810169,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.830488380259323,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.830488380259323,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.830488380259323,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3.9340170628571833,
															"value": 0
														},
														{
															"time": 3.9340170628571833,
															"value": 0
														},
														{
															"time": 3.9340170628571833,
															"value": 0,
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
																	"time": 2.636545797810169,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.636545797810169,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.636545797810169,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.830488380259323,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 2.830488380259323,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 2.830488380259323,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 3.9340170628571833,
																	"value": 0
																},
																{
																	"time": 3.9340170628571833,
																	"value": 0
																},
																{
																	"time": 3.9340170628571833,
																	"value": 0,
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
															"time": 2.6499841524740466,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.6499841524740466,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.6499841524740466,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.895588019765047,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.895588019765047,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.895588019765047,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.895588019765047,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.895588019765047,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.895588019765047,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.895588019765047,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.895588019765047,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.895588019765047,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.895588019765047,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.895588019765047,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.895588019765047,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.895588019765047,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.895588019765047,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.895588019765047,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.999896635368235,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.999896635368235,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.999896635368235,
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
													0.6666666666666666,
													0.16862745098039217,
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
															"time": 2.629594833409099,
															"value": 0
														},
														{
															"time": 2.629594833409099,
															"value": 0
														},
														{
															"time": 2.629594833409099,
															"value": 0,
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
															"time": 2.826665864043465,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.826665864043465,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.826665864043465,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.826665864043465,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.826665864043465,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.826665864043465,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.826665864043465,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.826665864043465,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.826665864043465,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.826665864043465,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.826665864043465,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.826665864043465,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.826665864043465,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.826665864043465,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.826665864043465,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3.0134120662814827,
															"value": -2.7755575615628914e-16
														},
														{
															"time": 3.0134120662814827,
															"value": -2.7755575615628914e-16
														},
														{
															"time": 3.0134120662814827,
															"value": -2.7755575615628914e-16
														},
														{
															"time": 3.0134120662814827,
															"value": -2.7755575615628914e-16
														},
														{
															"time": 3.0134120662814827,
															"value": -2.7755575615628914e-16
														},
														{
															"time": 3.0134120662814827,
															"value": -2.7755575615628914e-16
														},
														{
															"time": 3.0134120662814827,
															"value": -2.7755575615628914e-16
														},
														{
															"time": 3.0134120662814827,
															"value": -2.7755575615628914e-16
														},
														{
															"time": 3.0134120662814827,
															"value": -2.7755575615628914e-16
														},
														{
															"time": 3.0134120662814827,
															"value": -2.7755575615628914e-16
														},
														{
															"time": 3.0134120662814827,
															"value": -2.7755575615628914e-16
														},
														{
															"time": 3.0134120662814827,
															"value": -2.7755575615628914e-16
														},
														{
															"time": 3.0134120662814827,
															"value": -2.7755575615628914e-16
														},
														{
															"time": 3.0134120662814827,
															"value": -2.7755575615628914e-16
														},
														{
															"time": 3.0134120662814827,
															"value": -2.7755575615628914e-16,
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
							"name": "PawnEffect",
							"z": 0.0075,
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
																"alpha": 0.8,
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
																			"time": 2.769528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.769528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.769528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.769528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.769528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.769528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.769528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.769528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.769528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.769528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.769528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.769528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.769528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.769528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.769528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.769528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.769528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.769528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.769528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.769528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.769528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.769528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.769528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.769528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.769528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.769528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.769528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.769528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.769528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.769528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1,
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
																			"time": 3.976716753616069,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.976716753616069,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.976716753616069,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.976716753616069,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.976716753616069,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.976716753616069,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.976716753616069,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.976716753616069,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.976716753616069,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.976716753616069,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.976716753616069,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.976716753616069,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.976716753616069,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.976716753616069,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.976716753616069,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.976716753616069,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.976716753616069,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.976716753616069,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.976716753616069,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.976716753616069,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.976716753616069,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.976716753616069,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.976716753616069,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.976716753616069,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.976716753616069,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.976716753616069,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.976716753616069,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.976716753616069,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.976716753616069,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.976716753616069,
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
																"amount": 1,
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
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0,
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
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
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
																			"time": 2.779528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.779528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.779528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.779528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.779528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.779528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.779528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.779528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.779528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.779528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.779528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.779528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.779528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.779528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.779528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.779528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.779528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.779528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.779528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.779528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.779528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.779528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.779528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.779528231382691,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.7895282313826906,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.7895282313826906,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.7895282313826906,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.7895282313826906,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.7895282313826906,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.7895282313826906,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1
																		},
																		{
																			"time": 2.959528231382691,
																			"value": 1,
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
																			"time": 3.9795342587340565,
																			"value": 0
																		},
																		{
																			"time": 3.9795342587340565,
																			"value": 0
																		},
																		{
																			"time": 3.9795342587340565,
																			"value": 0
																		},
																		{
																			"time": 3.9795342587340565,
																			"value": 0
																		},
																		{
																			"time": 3.9795342587340565,
																			"value": 0
																		},
																		{
																			"time": 3.9795342587340565,
																			"value": 0,
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
																"amount": 1,
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
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0,
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
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
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
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0,
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
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012,
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
									"type": "object",
									"name": "FlareDuration",
									"z": -0.015,
									"scaleX": 0.05,
									"scaleY": 0.05,
									"scaleZ": 0.06,
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
																			"time": 3.521014362221652,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.521014362221652,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.521014362221652,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.521014362221652,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.521014362221652,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.521014362221652,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.521014362221652,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.521014362221652,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.521014362221652,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.521014362221652,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.521014362221652,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.521014362221652,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.521014362221652,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.521014362221652,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.521014362221652,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.521014362221652,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.521014362221652,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.521014362221652,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.521014362221652,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.521014362221652,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.521014362221652,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.521014362221652,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.521014362221652,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.521014362221652,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.521014362221652,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.521014362221652,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.521014362221652,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.521014362221652,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.521014362221652,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.521014362221652,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1,
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
																"amount": 1,
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
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0
																		},
																		{
																			"time": 2.789059142264639,
																			"value": 0,
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
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
																		},
																		{
																			"time": 3.278284697141476,
																			"value": 1
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
																			"time": 3.5310143622216517,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.5310143622216517,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.5310143622216517,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.5310143622216517,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.5310143622216517,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.5310143622216517,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.5310143622216517,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.5310143622216517,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.5310143622216517,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.5310143622216517,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.5310143622216517,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.5310143622216517,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.5310143622216517,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.5310143622216517,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.5310143622216517,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.5310143622216517,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.5310143622216517,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.5310143622216517,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.5310143622216517,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.5310143622216517,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.5310143622216517,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.5310143622216517,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.5310143622216517,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.5310143622216517,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.5410143622216514,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.5410143622216514,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.5410143622216514,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.5410143622216514,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.5410143622216514,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.5410143622216514,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1
																		},
																		{
																			"time": 3.98998875940962,
																			"value": 1,
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
																"amount": 1,
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
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.4737355268994428,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0
																		},
																		{
																			"time": 2.8394734763349176,
																			"value": 0,
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
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
																		},
																		{
																			"time": 3.960714120117329,
																			"value": 1
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
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0
														},
														{
															"time": 2.4123296255878577,
															"value": 0,
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
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9048736742030035,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012
														},
														{
															"time": 3.655043331648743,
															"value": 1.8000000000000012,
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
													"keys": [
														{
															"time": 0,
															"value": 0.75,
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
															"value": 0.75,
															"prevHandle": {
																"dv": 0,
																"dt": -0.25
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.25
															}
														}
													],
													"loop": true
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
													"value": 0.85,
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
													"prevHandle": {
														"dv": 0,
														"dt": -0.25
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.25
													}
												}
											],
											"loop": true
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
															"time": 2.7010342399092275,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.8949768223583816,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3.998505504956242,
															"value": 0,
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
									"type": "advancedDecal",
									"name": "outsidecircleDuration",
									"z": -0.015,
									"scaleX": 0.125,
									"scaleY": 0.125,
									"scaleZ": 0.1575,
									"rotationZ": -29.999999999999993,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
									"fadePower": 3,
									"emissive": 2,
									"renderMode": "BeforeTonemapping",
									"normalFade": true,
									"normalFadeStart": 0.65,
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
															"time": 2.7010342399092275,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.8949768223583816,
															"value": 1,
															"mode": 2
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
															"time": 3.2858179738584186,
															"value": 0,
															"mode": 2
														},
														{
															"time": 3.4797605563075726,
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
											"enabled": false,
											"props": {
												"sandBlend": 0.5,
												"sandColorSet": false,
												"envBlend": 1,
												"envColorSet": false
											},
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.8948814392089844,
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
													"value": 0.8948814392089844,
													"prevHandle": {
														"dv": 0,
														"dt": -0.25
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.25
													}
												}
											],
											"loop": true
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "FloorFlareDuration",
									"z": -0.015,
									"scaleX": 0.25,
									"scaleY": 0.25,
									"scaleZ": 0.05,
									"rotationZ": -29.999999999999993,
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
															"time": 2.7010342399092275,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.8949768223583816,
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
													"time": 0,
													"value": 0.947440719604492,
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
													"prevHandle": {
														"dv": 0,
														"dt": -0.25
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.25
													}
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
											0.08235294117647059,
											0.08235294117647059
										]
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