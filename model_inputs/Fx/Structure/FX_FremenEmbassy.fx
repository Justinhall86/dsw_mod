{
	"type": "fx",
	"cullingRadius": 8,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "model",
					"name": "FremenEmbassy",
					"source": "Structure/Buildings/Ambassade/Ambassade.fbx",
					"editorOnly": true,
					"locked": true
				},
				{
					"type": "object",
					"name": "Lights",
					"children": [
						{
							"type": "shader",
							"name": "NightEmissive",
							"source": "shaders/NightEmissive.hx",
							"props": {
								"amount": 0.7,
								"ATTENUATE": true,
								"emissiveMap": null
							}
						},
						{
							"type": "object",
							"name": "TopRow",
							"x": -0.00265,
							"y": 0.6749100000000001,
							"z": 0.51043,
							"children": [
								{
									"type": "polygon",
									"name": "M",
									"x": 0.0009200000000000005,
									"y": -0.050839999999999996,
									"scaleX": 0.14999999999999997,
									"scaleY": 0.19999999999999998,
									"scaleZ": 0.19999999999999998,
									"rotationX": 89.99999999999999,
									"rotationY": -3.975693351829396e-16,
									"rotationZ": 180,
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
													"culling": "Front",
													"colorMask": 255,
													"emissive": 3,
													"alphaKill": true,
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
												"texture": "Fx/Alphas/T_Triangle.png"
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
													0.7725490196078432,
													0.4156862745098039
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "color.h",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.25,
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
															"time": 1.75,
															"value": 0.6395636050932242,
															"mode": 2
														},
														{
															"time": 3.25,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "color.s",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.25,
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
															"time": 1.75,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3.25,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "color.l",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.25,
															"value": 0.1411764705882353,
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
															"time": 1.75,
															"value": 0.7078431372549019,
															"mode": 2
														},
														{
															"time": 3.25,
															"value": 0.1411764705882353,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
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
													0.7725490196078432,
													0.4156862745098039
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "color.h",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.5,
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
															"time": 1.9982013313137754,
															"value": 0.6395636050932242,
															"mode": 2
														},
														{
															"time": 3.5,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "color.s",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.5,
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
															"time": 2,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3.5,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "color.l",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.5,
															"value": 0.1411764705882353,
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
															"time": 2,
															"value": 0.7078431372549019,
															"mode": 2
														},
														{
															"time": 3.5,
															"value": 0.1411764705882353,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
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
													1,
													0.7725490196078432,
													0.4156862745098039
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "color.h",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": -0.003613945578231359,
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
															"time": 1.494587385735544,
															"value": 0.6395636050932242,
															"mode": 2
														},
														{
															"time": 2.9963860544217686,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
															}
														},
														{
															"time": 3.5,
															"value": 0,
															"mode": 0
														}
													]
												},
												{
													"type": "curve",
													"name": "color.s",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": -0.003613945578231359,
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
															"time": 1.4963860544217686,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9963860544217686,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
															}
														},
														{
															"time": 3.5,
															"value": 0,
															"mode": 0
														}
													]
												},
												{
													"type": "curve",
													"name": "color.l",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": -0.003613945578231359,
															"value": 0.1411764705882353,
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
															"time": 1.4963860544217686,
															"value": 0.7078431372549019,
															"mode": 2
														},
														{
															"time": 2.9963860544217686,
															"value": 0.1411764705882353,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
															}
														},
														{
															"time": 3.5,
															"value": 0.1412,
															"mode": 0
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "R",
									"x": -0.23429999999999998,
									"y": -0.012639999999999874,
									"scaleX": 0.15000000000000002,
									"scaleY": 0.19999999999999998,
									"scaleZ": 0.2,
									"rotationX": 90,
									"rotationZ": 156.9,
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
													"culling": "Front",
													"colorMask": 255,
													"emissive": 3,
													"alphaKill": true,
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
												"texture": "Fx/Alphas/T_Triangle.png"
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
													0.7725490196078432,
													0.4156862745098039
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "color.h",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.25,
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
															"time": 1.75,
															"value": 0.6395636050932242,
															"mode": 2
														},
														{
															"time": 3.25,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
															}
														},
														{
															"time": 3.5,
															"value": 0,
															"mode": 0
														}
													]
												},
												{
													"type": "curve",
													"name": "color.s",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.25,
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
															"time": 1.75,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3.25,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
															}
														},
														{
															"time": 3.5,
															"value": 0,
															"mode": 0
														}
													]
												},
												{
													"type": "curve",
													"name": "color.l",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.25,
															"value": 0.1411764705882353,
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
															"time": 1.75,
															"value": 0.7078431372549019,
															"mode": 2
														},
														{
															"time": 3.25,
															"value": 0.1411764705882353,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
															}
														},
														{
															"time": 3.5,
															"value": 0.1412,
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
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													1,
													0.7725490196078432,
													0.4156862745098039
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "color.h",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.5,
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
															"time": 1.9982013313137754,
															"value": 0.6395636050932242,
															"mode": 2
														},
														{
															"time": 3.5,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "color.s",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.5,
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
															"time": 2,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3.5,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "color.l",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.5,
															"value": 0.1411764705882353,
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
															"time": 2,
															"value": 0.7078431372549019,
															"mode": 2
														},
														{
															"time": 3.5,
															"value": 0.1411764705882353,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
															}
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "L",
									"x": 0.23430000000000006,
									"y": -0.012639999999999874,
									"scaleX": 0.15000000000000002,
									"scaleY": 0.19999999999999998,
									"scaleZ": 0.2,
									"rotationX": 90,
									"rotationZ": -156.9,
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
													"culling": "Front",
													"colorMask": 255,
													"emissive": 3,
													"alphaKill": true,
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
												"texture": "Fx/Alphas/T_Triangle.png"
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
													0.7725490196078432,
													0.4156862745098039
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "color.h",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.25,
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
															"time": 1.75,
															"value": 0.6395636050932242,
															"mode": 2
														},
														{
															"time": 3.25,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
															}
														},
														{
															"time": 3.5,
															"value": 0,
															"mode": 0
														}
													]
												},
												{
													"type": "curve",
													"name": "color.s",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.25,
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
															"time": 1.75,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3.25,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
															}
														},
														{
															"time": 3.5,
															"value": 0,
															"mode": 0
														}
													]
												},
												{
													"type": "curve",
													"name": "color.l",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.25,
															"value": 0.1411764705882353,
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
															"time": 1.75,
															"value": 0.7078431372549019,
															"mode": 2
														},
														{
															"time": 3.25,
															"value": 0.1411764705882353,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
															}
														},
														{
															"time": 3.5,
															"value": 0.1412,
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
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													1,
													0.7725490196078432,
													0.4156862745098039
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "color.h",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.5,
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
															"time": 1.9982013313137754,
															"value": 0.6395636050932242,
															"mode": 2
														},
														{
															"time": 3.5,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "color.s",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.5,
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
															"time": 2,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3.5,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "color.l",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.5,
															"value": 0.1411764705882353,
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
															"time": 2,
															"value": 0.7078431372549019,
															"mode": 2
														},
														{
															"time": 3.5,
															"value": 0.1411764705882353,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
															}
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "LL",
									"x": 0.41140999999999994,
									"y": 0.11534000000000011,
									"scaleX": 0.15000000000000002,
									"scaleY": 0.2000000000000001,
									"scaleZ": 0.20000000000000015,
									"rotationX": 90,
									"rotationZ": -127.30000000000003,
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
													"culling": "Front",
													"colorMask": 255,
													"emissive": 3,
													"alphaKill": true,
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
												"texture": "Fx/Alphas/T_Triangle.png"
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
													0.7725490196078432,
													0.4156862745098039
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "color.h",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": -0.003613945578231359,
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
															"time": 1.494587385735544,
															"value": 0.6395636050932242,
															"mode": 2
														},
														{
															"time": 2.9963860544217686,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "color.s",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": -0.003613945578231359,
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
															"time": 1.4963860544217686,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.9963860544217686,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "color.l",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": -0.003613945578231359,
															"value": 0.1411764705882353,
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
															"time": 1.4963860544217686,
															"value": 0.7078431372549019,
															"mode": 2
														},
														{
															"time": 2.9963860544217686,
															"value": 0.1411764705882353,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
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
													1,
													0.7725490196078432,
													0.4156862745098039
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "color.h",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.5,
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
															"time": 1.9982013313137754,
															"value": 0.6395636050932242,
															"mode": 2
														},
														{
															"time": 3.5,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "color.s",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.5,
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
															"time": 2,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3.5,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "color.l",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.5,
															"value": 0.1411764705882353,
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
															"time": 2,
															"value": 0.7078431372549019,
															"mode": 2
														},
														{
															"time": 3.5,
															"value": 0.1411764705882353,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
															}
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "RR",
									"x": -0.41141,
									"y": 0.11534,
									"scaleX": 0.15,
									"scaleY": 0.2,
									"scaleZ": 0.20000000000000012,
									"rotationX": 90,
									"rotationZ": 127.3,
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
													"culling": "Front",
													"colorMask": 255,
													"emissive": 3,
													"alphaKill": true,
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
												"texture": "Fx/Alphas/T_Triangle.png"
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
													0.7725490196078432,
													0.4156862745098039
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "color.h",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.5,
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
															"time": 1.9982013313137754,
															"value": 0.6395636050932242,
															"mode": 2
														},
														{
															"time": 3.5,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "color.s",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.5,
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
															"time": 2,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3.5,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "color.l",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.5,
															"value": 0.1411764705882353,
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
															"time": 2,
															"value": 0.7078431372549019,
															"mode": 2
														},
														{
															"time": 3.5,
															"value": 0.1411764705882353,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
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
							"name": "BottomRow",
							"x": -0.0026499999999999753,
							"y": 0.6749050000000001,
							"z": 0.47974,
							"children": [
								{
									"type": "polygon",
									"name": "LL",
									"x": 0.34906000000000004,
									"y": 0.04041499999999998,
									"z": 5.551115123125783e-17,
									"scaleX": 0.15,
									"scaleY": 0.2,
									"scaleZ": 0.20000000000000012,
									"rotationX": -90,
									"rotationY": -3.180554681463517e-15,
									"rotationZ": -146.5,
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
													"emissive": 3,
													"alphaKill": true,
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
												"texture": "Fx/Alphas/T_Triangle.png"
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
													0.7725490196078432,
													0.4156862745098039
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "color.h",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.5,
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
															"time": 1.9982013313137754,
															"value": 0.6395636050932242,
															"mode": 2
														},
														{
															"time": 3.5,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "color.s",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.5,
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
															"time": 2,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3.5,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "color.l",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.5,
															"value": 0.1411764705882353,
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
															"time": 2,
															"value": 0.7078431372549019,
															"mode": 2
														},
														{
															"time": 3.5,
															"value": 0.1411764705882353,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
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
													1,
													0.7725490196078432,
													0.4156862745098039
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "color.h",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.25,
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
															"time": 1.75,
															"value": 0.6395636050932242,
															"mode": 2
														},
														{
															"time": 3.25,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
															}
														},
														{
															"time": 3.5,
															"value": 0,
															"mode": 0
														}
													]
												},
												{
													"type": "curve",
													"name": "color.s",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.25,
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
															"time": 1.75,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3.25,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
															}
														},
														{
															"time": 3.5,
															"value": 0,
															"mode": 0
														}
													]
												},
												{
													"type": "curve",
													"name": "color.l",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.25,
															"value": 0.1411764705882353,
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
															"time": 1.75,
															"value": 0.7078431372549019,
															"mode": 2
														},
														{
															"time": 3.25,
															"value": 0.1411764705882353,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
															}
														},
														{
															"time": 3.5,
															"value": 0.1412,
															"mode": 0
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "L",
									"x": 0.11358999999999997,
									"y": -0.04119500000000009,
									"z": 5.551115123125783e-17,
									"scaleX": 0.14999999999999997,
									"scaleY": 0.19999999999999998,
									"scaleZ": 0.19999999999999998,
									"rotationX": -89.99999999999999,
									"rotationY": 3.9756933518293965e-16,
									"rotationZ": -174,
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
													"emissive": 3,
													"alphaKill": true,
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
												"texture": "Fx/Alphas/T_Triangle.png"
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
													0.7725490196078432,
													0.4156862745098039
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "color.h",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.125,
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
															"time": 1.625,
															"value": 0.6395636050932242,
															"mode": 2
														},
														{
															"time": 3.125,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
															}
														},
														{
															"time": 3.5,
															"value": 0,
															"mode": 0
														}
													]
												},
												{
													"type": "curve",
													"name": "color.s",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.125,
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
															"time": 1.625,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3.125,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
															}
														},
														{
															"time": 3.5,
															"value": 0,
															"mode": 0
														}
													]
												},
												{
													"type": "curve",
													"name": "color.l",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.125,
															"value": 0.1411764705882353,
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
															"time": 1.625,
															"value": 0.7078431372549019,
															"mode": 2
														},
														{
															"time": 3.125,
															"value": 0.1411764705882353,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
															}
														},
														{
															"time": 3.5,
															"value": 0.1412,
															"mode": 0
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "RR",
									"x": -0.34607,
									"y": 0.0419449999999999,
									"z": 5.551115123125783e-17,
									"scaleX": 0.15,
									"scaleY": 0.2,
									"scaleZ": 0.20000000000000007,
									"rotationX": -90,
									"rotationY": -3.180554681463517e-15,
									"rotationZ": 146.5,
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
													"emissive": 3,
													"alphaKill": true,
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
												"texture": "Fx/Alphas/T_Triangle.png"
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
													0.7725490196078432,
													0.4156862745098039
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "color.h",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.5,
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
															"time": 1.9982013313137754,
															"value": 0.6395636050932242,
															"mode": 2
														},
														{
															"time": 3.5,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "color.s",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.5,
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
															"time": 2,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3.5,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "color.l",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.5,
															"value": 0.1411764705882353,
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
															"time": 2,
															"value": 0.7078431372549019,
															"mode": 2
														},
														{
															"time": 3.5,
															"value": 0.1411764705882353,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
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
													1,
													0.7725490196078432,
													0.4156862745098039
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "color.h",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.25,
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
															"time": 1.75,
															"value": 0.6395636050932242,
															"mode": 2
														},
														{
															"time": 3.25,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
															}
														},
														{
															"time": 3.5,
															"value": 0,
															"mode": 0
														}
													]
												},
												{
													"type": "curve",
													"name": "color.s",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.25,
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
															"time": 1.75,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3.25,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
															}
														},
														{
															"time": 3.5,
															"value": 0,
															"mode": 0
														}
													]
												},
												{
													"type": "curve",
													"name": "color.l",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.25,
															"value": 0.1411764705882353,
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
															"time": 1.75,
															"value": 0.7078431372549019,
															"mode": 2
														},
														{
															"time": 3.25,
															"value": 0.1411764705882353,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
															}
														},
														{
															"time": 3.5,
															"value": 0.1412,
															"mode": 0
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "R",
									"x": -0.11658000000000003,
									"y": -0.04116500000000012,
									"z": 5.551115123125783e-17,
									"scaleX": 0.14999999999999997,
									"scaleY": 0.19999999999999998,
									"scaleZ": 0.19999999999999998,
									"rotationX": -89.99999999999999,
									"rotationY": -3.9756933518293965e-16,
									"rotationZ": 174,
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
													"emissive": 3,
													"alphaKill": true,
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
												"texture": "Fx/Alphas/T_Triangle.png"
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
													0.7725490196078432,
													0.4156862745098039
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "color.h",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.25,
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
															"time": 1.75,
															"value": 0.6395636050932242,
															"mode": 2
														},
														{
															"time": 3.25,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
															}
														},
														{
															"time": 3.5,
															"value": 0,
															"mode": 0
														}
													]
												},
												{
													"type": "curve",
													"name": "color.s",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.25,
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
															"time": 1.75,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3.25,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
															}
														},
														{
															"time": 3.5,
															"value": 0,
															"mode": 0
														}
													]
												},
												{
													"type": "curve",
													"name": "color.l",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.25,
															"value": 0.1411764705882353,
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
															"time": 1.75,
															"value": 0.7078431372549019,
															"mode": 2
														},
														{
															"time": 3.25,
															"value": 0.1411764705882353,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
															}
														},
														{
															"time": 3.5,
															"value": 0.1412,
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
													1,
													0.7725490196078432,
													0.4156862745098039
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "color.h",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.125,
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
															"time": 1.625,
															"value": 0.6395636050932242,
															"mode": 2
														},
														{
															"time": 3.125,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
															}
														},
														{
															"time": 3.5,
															"value": 0,
															"mode": 0
														}
													]
												},
												{
													"type": "curve",
													"name": "color.s",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.125,
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
															"time": 1.625,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3.125,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
															}
														},
														{
															"time": 3.5,
															"value": 0,
															"mode": 0
														}
													]
												},
												{
													"type": "curve",
													"name": "color.l",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.125,
															"value": 0.1411764705882353,
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
															"time": 1.625,
															"value": 0.7078431372549019,
															"mode": 2
														},
														{
															"time": 3.125,
															"value": 0.1411764705882353,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33333333333333326
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33333333333333326
															}
														},
														{
															"time": 3.5,
															"value": 0.1412,
															"mode": 0
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