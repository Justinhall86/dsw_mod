{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "Characters",
					"editorOnly": true,
					"x": -1.77,
					"children": [
						{
							"type": "model",
							"name": "Male01_HeavyWeaponSquad",
							"source": "Character/Atreide/Unit/HeavyWeaponSquad/Male01_HeavyWeaponSquad.fbx",
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 2
						},
						{
							"type": "model",
							"name": "Male01_HeavyWeaponSquad",
							"source": "Character/Atreide/Unit/HeavyWeaponSquad/Male01_HeavyWeaponSquad.fbx",
							"x": 3.25,
							"y": -1.59,
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 2
						},
						{
							"type": "model",
							"name": "Male01_HeavyWeaponSquad",
							"source": "Character/Atreide/Unit/HeavyWeaponSquad/Male01_HeavyWeaponSquad.fbx",
							"x": 2.71,
							"y": 2.06,
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 2
						}
					]
				},
				{
					"type": "object",
					"name": "Heal_1",
					"z": 1.5366666666666664,
					"children": [
						{
							"type": "emitter",
							"name": "Ground_Circle",
							"props": {
								"lifeTime": 3,
								"emitRate": 1,
								"instScale": 15
							},
							"z": -1.3966666666666665,
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
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.5,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_ChocWave_Contrast02.png"
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
															"mode": 2
														},
														{
															"time": 0.47000000000000003,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.033333333333333326,
																"dt": -0.21500000000000002
															},
															"nextHandle": {
																"dv": 0.043880210499553325,
																"dt": 0.2830273577221186
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.016666666666666663,
																"dt": -0.32000000000000006
															},
															"nextHandle": {
																"dv": -0.00920026587809701,
																"dt": 0.17664510485946283
															}
														}
													]
												}
											],
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
													0.9176470588235294,
													0.7254901960784313
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
												"dv": 1.0835992283701599,
												"dt": -0.4728432996524334
											},
											"nextHandle": {
												"dv": -0.7333333333333334,
												"dt": 0.32
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
							"type": "emitter",
							"name": "Line",
							"props": {
								"lifeTime": 2,
								"lifeTimeRand": 0.5,
								"emitShape": "Cylinder",
								"emitRad1": 0.12,
								"emitRad2": 0.89,
								"emitSurface": true,
								"alignMode": "Screen",
								"instScale_rand": 0.5,
								"instWorldSpeed_rand": [
									0,
									0,
									0.5
								],
								"instWorldSpeed": [
									0,
									0,
									2
								],
								"seedGroup": 2,
								"maxCount": 30,
								"instRotation": [
									0,
									0,
									90
								],
								"instStretch_rand": [
									0.5,
									0.5,
									0.5
								],
								"instStretch": [
									1,
									1,
									2
								]
							},
							"z": 0.5533333333333332,
							"scaleX": 10,
							"scaleY": 10,
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
													"colorMask": 255,
													"depthTest": "LessEqual",
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
												"useSourceUVs": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.5,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Flare04.png"
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
															"mode": 2
														},
														{
															"time": 0.15999999999999998,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.002906700538151769,
																"dt": -0.1151053413108112
															},
															"nextHandle": {
																"dv": -0.016666666666666607,
																"dt": 0.6599999999999999
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
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
													0.9176470588235294,
													0.7254901960784313
												]
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "CrossHeal",
							"props": {
								"lifeTime": 3,
								"lifeTimeRand": 0.5,
								"emitRate": 2,
								"emitShape": "Cylinder",
								"emitRad1": 0.52,
								"emitRad2": 0.83,
								"emitSurface": true,
								"alignMode": "Screen",
								"instScale_rand": 0.3,
								"instScale": 0.6,
								"instOrbitSpeed_rand": [
									0,
									0,
									1
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0.5
								],
								"instWorldSpeed": [
									0,
									0,
									0.7
								]
							},
							"z": 0.8433333333333333,
							"scaleX": 10,
							"scaleY": 10,
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
													"colorMask": 255,
													"depthTest": "LessEqual",
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
												"useSourceUVs": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_CrossHeal.png"
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
															"mode": 2
														},
														{
															"time": 0.15999999999999998,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.002906700538151769,
																"dt": -0.1151053413108112
															},
															"nextHandle": {
																"dv": -0.016666666666666607,
																"dt": 0.6599999999999999
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.5529411764705883,
													0.8862745098039215,
													0.6
												]
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
					"name": "Heal_2",
					"enabled": false,
					"z": 1.5366666666666664,
					"children": [
						{
							"type": "emitter",
							"name": "CrossHeal",
							"props": {
								"lifeTime": 2,
								"emitRate": 2,
								"emitShape": "Cylinder",
								"emitRad1": 0.52,
								"emitRad2": 0.83,
								"emitSurface": true,
								"alignMode": "Screen",
								"instScale_rand": 0,
								"instScale": 2,
								"instOrbitSpeed_rand": [
									0,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"instWorldSpeed": [
									0,
									0,
									1
								]
							},
							"z": 2.36,
							"scaleX": 0.01,
							"scaleY": 0.01,
							"scaleZ": 0.01,
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
													"colorMask": 255,
													"depthTest": "LessEqual",
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
												"useSourceUVs": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_CrossHeal.png"
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
															"mode": 2
														},
														{
															"time": 0.14500000000000002,
															"value": 0.9666666666666667,
															"mode": 1,
															"prevHandle": {
																"dv": 0.19999999999999984,
																"dt": -0.10000000000000002
															},
															"nextHandle": {
																"dv": -0.7833333333333333,
																"dt": 0.285
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.06666666666666665,
																"dt": -0.3400000000000001
															},
															"nextHandle": {
																"dv": -0.05578592085389713,
																"dt": 0.2845081963548738
															}
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.5529411764705883,
													0.8862745098039215,
													0.6
												]
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Ground_Circle",
							"props": {
								"lifeTime": 3,
								"emitRate": 1,
								"instScale": 15
							},
							"z": -1.3966666666666665,
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
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.5,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_ChocWave_Contrast02.png"
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
															"mode": 2
														},
														{
															"time": 0.47000000000000003,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.033333333333333326,
																"dt": -0.21500000000000002
															},
															"nextHandle": {
																"dv": 0.043880210499553325,
																"dt": 0.2830273577221186
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.016666666666666663,
																"dt": -0.32000000000000006
															},
															"nextHandle": {
																"dv": -0.00920026587809701,
																"dt": 0.17664510485946283
															}
														}
													]
												}
											],
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
													0.9176470588235294,
													0.7254901960784313
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
												"dv": 1.0835992283701599,
												"dt": -0.4728432996524334
											},
											"nextHandle": {
												"dv": -0.7333333333333334,
												"dt": 0.32
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
						}
					]
				}
			]
		}
	]
}