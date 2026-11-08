{
	"type": "fx",
	"cullingRadius": 100,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "TopLeftCorner",
					"x": -0.7149,
					"scaleX": 0.75,
					"scaleY": 0.75,
					"scaleZ": 0.75,
					"children": [
						{
							"type": "lookAt",
							"name": "lookAt",
							"scaleX": 0.4999999999999999,
							"scaleY": 0.4999999999999999,
							"scaleZ": 0.5,
							"rotationY": -7.6,
							"rotationZ": 108.2,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								0
							],
							"children": [
								{
									"type": "object",
									"name": "group",
									"x": 2.12,
									"y": 2.75519,
									"z": 2.18265,
									"scaleX": 2,
									"scaleY": 2,
									"scaleZ": 2,
									"rotationX": 102,
									"children": [
										{
											"type": "polygon",
											"name": "polygon - Dottedline1",
											"x": 0.00162,
											"y": -0.15313,
											"z": 0.16568,
											"scaleX": 2,
											"scaleY": 0.49999999999999994,
											"scaleZ": 1.2,
											"rotationX": -90,
											"rotationY": 45,
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
														"alpha": 0.75,
														"uScale": 1,
														"vScale": 0.25,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_UI_ArcLines.png"
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
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 1,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/dGrad05.png",
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
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 10,
																	"value": 1,
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
											"type": "object",
											"name": "Line1",
											"x": 0.0016174999999999384,
											"y": -0.07494749999999972,
											"z": 0.08750000000000013,
											"children": [
												{
													"type": "polygon",
													"name": "polygon - line1",
													"x": 1.1102230246251565e-16,
													"y": -2.220446049250313e-16,
													"scaleX": 2.0000000000000004,
													"scaleY": 0.5,
													"scaleZ": 1.2,
													"rotationX": -90,
													"rotationY": 45.00000000000002,
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
																"alpha": 0.5,
																"uScale": 1,
																"vScale": 0.25,
																"uOffset": 0,
																"vOffset": 0.75,
																"texture": "Fx/Alphas/T_UI_ArcLines.png"
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
														}
													]
												},
												{
													"type": "polygon",
													"name": "polygon - line1",
													"x": 1.1102230246251565e-16,
													"y": -2.220446049250313e-16,
													"scaleX": 2.0000000000000004,
													"scaleY": 0.5,
													"scaleZ": 1.2,
													"rotationX": -90,
													"rotationY": 45.00000000000002,
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
																	"depthTest": "LessEqual"
																}
															}
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
																"alpha": 1,
																"uScale": 1,
																"vScale": 0.25,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_UI_WoblyLines.png"
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
																"alpha": 0.75,
																"uScale": 1,
																"vScale": 0.25,
																"uOffset": 0,
																"vOffset": 0.75,
																"texture": "Fx/Alphas/T_UI_ArcLines.png"
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
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"props": {
																"useSourceUVs": true,
																"useScale": false,
																"wrap": true,
																"progress": 0.27,
																"saturation": 1,
																"width": 0.45,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/Cyl05v_A.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.25,
																	0
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
																			"time": 5,
																			"value": 1,
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
								"alpha": 0.8
							}
						}
					]
				}
			]
		}
	]
}