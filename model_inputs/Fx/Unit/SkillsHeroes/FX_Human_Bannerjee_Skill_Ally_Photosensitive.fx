{
	"type": "fx",
	"duration": 10,
	"cullingRadius": 150,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"scaleX": 100,
			"scaleY": 100,
			"scaleZ": 100,
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
			"scaleX": 0.9,
			"scaleY": 0.9,
			"scaleZ": 0.9,
			"children": [
				{
					"type": "object",
					"name": "Bannerjee",
					"editorOnly": true,
					"children": [
						{
							"type": "object",
							"name": "Skirmisher",
							"scaleX": 0.9,
							"scaleY": 0.9,
							"scaleZ": 0.9,
							"children": [
								{
									"type": "model",
									"name": "Male01_SmugglerMercenary",
									"source": "Character/Smuggler/Unit/Mercenary/Male01_SmugglerMercenary.fbx",
									"x": -1.32081,
									"scaleX": 1.75,
									"scaleY": 1.75,
									"scaleZ": 1.75,
									"rotationZ": 180,
									"children": [
										{
											"type": "animEvent",
											"name": "animEvent",
											"animation": "Anim/Male01/Anim_Male01_Idle.fbx"
										}
									]
								},
								{
									"type": "model",
									"name": "Male01_SmugglerMercenary",
									"source": "Character/Smuggler/Unit/Mercenary/Male01_SmugglerMercenary.fbx",
									"x": 0.24088,
									"y": -1.57901,
									"scaleX": 1.75,
									"scaleY": 1.75,
									"scaleZ": 1.75,
									"rotationZ": -120,
									"children": [
										{
											"type": "animEvent",
											"name": "animEvent",
											"animation": "Anim/Male01/Anim_Male01_Idle.fbx"
										}
									]
								},
								{
									"type": "model",
									"name": "Male01_SmugglerMercenary",
									"source": "Character/Smuggler/Unit/Mercenary/Male01_SmugglerMercenary.fbx",
									"x": 0.78596,
									"y": 1.37234,
									"scaleX": 1.75,
									"scaleY": 1.75,
									"scaleZ": 1.75,
									"rotationZ": 120,
									"children": [
										{
											"type": "animEvent",
											"name": "animEvent",
											"animation": "Anim/Male01/Anim_Male01_Idle.fbx"
										}
									]
								},
								{
									"type": "model",
									"name": "Male01_SmugglerMercenary",
									"source": "Character/Smuggler/Unit/Mercenary/Male01_SmugglerMercenary.fbx",
									"x": 2.30298,
									"y": -0.21161,
									"scaleX": 1.75,
									"scaleY": 1.75,
									"scaleZ": 1.75,
									"children": [
										{
											"type": "animEvent",
											"name": "animEvent",
											"animation": "Anim/Male01/Anim_Male01_Idle.fbx"
										}
									]
								},
								{
									"type": "curve",
									"name": "scale",
									"keys": [
										{
											"time": 0.05432664317758545,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.17518410936176015,
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
					"name": "Ally",
					"z": 0.14535,
					"children": [
						{
							"type": "object",
							"name": "FlashDecals",
							"enabled": false,
							"z": 1.85863,
							"rotationZ": 90,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Black",
									"enabled": false,
									"scaleX": 6,
									"scaleY": 6,
									"scaleZ": 3.5,
									"albedoMap": "Fx/Gradients/circGrad05.jpg",
									"emissive": 1,
									"renderMode": "BeforeTonemapping",
									"children": [
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 5
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0.02310185881004756,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.07669112839986664,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.1375513265489779,
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
													0,
													0,
													0
												]
											}
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Blue",
									"scaleX": 6,
									"scaleY": 6,
									"scaleZ": 3.5,
									"albedoMap": "Fx/Gradients/circGrad05.jpg",
									"emissive": 1,
									"renderMode": "BeforeTonemapping",
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
													"emissive": 1.5
												}
											}
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 2
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.14948780505274512,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.20488251911683558,
															"value": 0.3,
															"mode": 2
														},
														{
															"time": 0.8471120157159726,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.31988251172550664
															},
															"nextHandle": {
																"dv": 0.21666666666666667,
																"dt": 0.030952001010344565
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
												"envBlend": 0.6,
												"envColorSet": false
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.43529411764705883,
													0.7176470588235294,
													0.984313725490196
												]
											}
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_White",
									"enabled": false,
									"scaleX": 6,
									"scaleY": 6,
									"scaleZ": 3.5,
									"albedoMap": "Fx/Gradients/circGrad05.jpg",
									"emissive": 5,
									"renderMode": "BeforeTonemapping",
									"children": [
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 2
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.07882673798564149,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.1324160075754613,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.36133015587210765,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": -0.050000000000000044,
																"dt": -0.19927400323396371
															},
															"nextHandle": {
																"dv": 0.21666666666666667,
																"dt": 0.030952001010344565
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
													1,
													1
												]
											}
										},
										{
											"type": "material",
											"name": "material",
											"enabled": false,
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 2
												}
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "emitter_Flare",
							"enabled": false,
							"props": {
								"lifeTime": 0.2,
								"alignMode": "Screen",
								"alignLockAxis": "Z",
								"instStretch": [
									10,
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
								"warmUpTime": -0.05,
								"emitType": "Burst",
								"instScale": 2,
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
							"y": -0.05,
							"z": 0.98986,
							"scaleX": 0.10000000000000003,
							"scaleY": 0.10000000000000003,
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
							"type": "lookAt",
							"name": "lookAtUP",
							"z": 1.5,
							"scaleY": 3.5,
							"scaleZ": 1.5,
							"rotationZ": 3.388453267087203,
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
									"scaleX": 0.45,
									"scaleY": 20,
									"scaleZ": 0.7499392354141005,
									"rotationX": 90,
									"rotationZ": 90,
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
													"keys": [
														{
															"time": 0.00626709002148307,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.11961200300211944,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.8576099660939566,
															"value": 0,
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
												"range": 15,
												"power": 0.8
											}
										},
										{
											"type": "curve",
											"name": "scale.z",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.02300615630375069,
													"value": 0.25,
													"prevHandle": {
														"dv": 0.002404241294978398,
														"dt": -0.015494497741857334
													},
													"nextHandle": {
														"dv": -0.01414688773777184,
														"dt": 0.1249143940058296
													}
												},
												{
													"time": 0.1465197081713699,
													"value": 1.75,
													"mode": 2
												}
											]
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.72,
												"ATTENUATE": true,
												"emissiveMap": null
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.3764705882352941,
													0.7607843137254902,
													1
												]
											}
										}
									]
								}
							]
						},
						{
							"type": "lookAt",
							"name": "lookAt_Flare",
							"z": 1.0207499999999998,
							"scaleX": 0.8,
							"scaleY": 0.2,
							"scaleZ": 0.8,
							"rotationX": -2.5943909506258638e-17,
							"rotationY": -16.712112974153342,
							"rotationZ": 0.8155629796091814,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								0
							],
							"children": [
								{
									"type": "polygon",
									"name": "FlareLarge",
									"scaleX": 15,
									"scaleY": 75,
									"scaleZ": 15,
									"rotationX": 90,
									"rotationZ": 90,
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
													"emissive": 0.5
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
													"keyMode": 1,
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
																"dt": 0.16666666666666666
															}
														},
														{
															"time": 0.1708345735903894,
															"value": 1,
															"mode": 1,
															"prevHandle": {
																"dv": -0.8035376968950327,
																"dt": -0.016956242315933956
															},
															"nextHandle": {
																"dv": 0.005620602333900049,
																"dt": 0.16610893781317326
															}
														},
														{
															"time": 1.0469070932469708,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.49999999999999994
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
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_circle2.png"
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 10,
												"power": 2
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.5,
												"sandColorSet": false,
												"envBlend": 0.5,
												"envColorSet": false
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
													0.3764705882352941,
													0.7607843137254902,
													1
												]
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
											"time": 0.14303843364723018,
											"value": 0,
											"prevHandle": {
												"dv": -3.321933238091307,
												"dt": -0.06735525205113772
											},
											"nextHandle": {
												"dv": 1.0855997590896094,
												"dt": 0.02148444229488028
											}
										},
										{
											"time": 1.0564201706158334,
											"value": 1,
											"prevHandle": {
												"dv": -0.007926619448975658,
												"dt": -0.935892228491727
											},
											"nextHandle": {
												"dv": 0.007926619448975658,
												"dt": 0.935892228491727
											}
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
								"amount": 0.8,
								"ATTENUATE": true,
								"emissiveMap": null
							}
						},
						{
							"type": "emitter",
							"name": "emitter_Ondes",
							"props": {
								"lifeTime": 0.8,
								"alignLockAxis": "Z",
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
								"instScale": 13,
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
								},
								"burstDelay": 0.22
							},
							"z": 0.19999999999999998,
							"scaleX": 0.22000000000000017,
							"scaleY": 0.22000000000000017,
							"scaleZ": 0.22000000000000003,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleY": 1.1,
									"scaleZ": 1.1,
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
													"emissive": 0.5
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
												"texture": "Fx/Alphas/T_LensFlare_07.png"
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
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": -0.001803596421044329,
																"dt": -0.7344005148419487
															},
															"nextHandle": {
																"dv": -5.136536362253007e-16,
																"dt": 0.5
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
											"enabled": false,
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 1,
												"saturation": 0.5,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 0.5,
												"texture": "Fx/Gradients/Dissolve_ChockWave.png",
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
													"keyMode": 1,
													"keys": [
														{
															"time": 0.6362655466405217,
															"value": 0.5,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0.29111814826726923,
																"dt": 0.06915880636768901
															}
														},
														{
															"time": 1.1600118732140337,
															"value": 1,
															"prevHandle": {
																"dv": -0.003619090616702847,
																"dt": -0.5207616528940111
															},
															"nextHandle": {
																"dv": 0.003619090616702847,
																"dt": 0.5207616528940111
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
												"useScale": false,
												"wrap": true,
												"progress": 0.27,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 0.5,
												"texture": "Fx/Gradients/Cyl05v_A01.png",
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
													0.3764705882352941,
													0.7607843137254902,
													1
												]
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
											"value": 0,
											"mode": 2
										},
										{
											"time": 1,
											"value": 1,
											"prevHandle": {
												"dv": -0.011878996871929726,
												"dt": -0.6104756850412305
											},
											"nextHandle": {
												"dv": 0.006825528843833996,
												"dt": 0.3513977397384393
											}
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": ".FXRoot.Skill.Call",
					"target": ".FXRoot.Bannerjee.male01_SmugglerBannerjee.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ"
				}
			]
		},
		{
			"type": "object",
			"name": "Backup",
			"enabled": false,
			"children": [
				{
					"type": "object",
					"name": "Bannerjee",
					"editorOnly": true,
					"children": [
						{
							"type": "object",
							"name": "Skirmisher",
							"scaleX": 0.9,
							"scaleY": 0.9,
							"scaleZ": 0.9,
							"children": [
								{
									"type": "model",
									"name": "Male01_SmugglerMercenary",
									"source": "Character/Smuggler/Unit/Mercenary/Male01_SmugglerMercenary.fbx",
									"x": -1.32081,
									"scaleX": 1.75,
									"scaleY": 1.75,
									"scaleZ": 1.75,
									"rotationZ": 180,
									"children": [
										{
											"type": "animEvent",
											"name": "animEvent",
											"animation": "Anim/Male01/Anim_Male01_Idle.fbx"
										}
									]
								},
								{
									"type": "model",
									"name": "Male01_SmugglerMercenary",
									"source": "Character/Smuggler/Unit/Mercenary/Male01_SmugglerMercenary.fbx",
									"x": 0.24088,
									"y": -1.57901,
									"scaleX": 1.75,
									"scaleY": 1.75,
									"scaleZ": 1.75,
									"rotationZ": -120,
									"children": [
										{
											"type": "animEvent",
											"name": "animEvent",
											"animation": "Anim/Male01/Anim_Male01_Idle.fbx"
										}
									]
								},
								{
									"type": "model",
									"name": "Male01_SmugglerMercenary",
									"source": "Character/Smuggler/Unit/Mercenary/Male01_SmugglerMercenary.fbx",
									"x": 0.78596,
									"y": 1.37234,
									"scaleX": 1.75,
									"scaleY": 1.75,
									"scaleZ": 1.75,
									"rotationZ": 120,
									"children": [
										{
											"type": "animEvent",
											"name": "animEvent",
											"animation": "Anim/Male01/Anim_Male01_Idle.fbx"
										}
									]
								},
								{
									"type": "model",
									"name": "Male01_SmugglerMercenary",
									"source": "Character/Smuggler/Unit/Mercenary/Male01_SmugglerMercenary.fbx",
									"x": 2.30298,
									"y": -0.21161,
									"scaleX": 1.75,
									"scaleY": 1.75,
									"scaleZ": 1.75,
									"children": [
										{
											"type": "animEvent",
											"name": "animEvent",
											"animation": "Anim/Male01/Anim_Male01_Idle.fbx"
										}
									]
								},
								{
									"type": "curve",
									"name": "scale",
									"enabled": false,
									"keys": [
										{
											"time": 1.2826205467843215,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.2957807845622553,
											"value": 1,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "scale",
									"keys": [
										{
											"time": 1.211731051002029,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.3325885171862049,
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
					"name": "Ally",
					"z": 0.14535,
					"children": [
						{
							"type": "emitter",
							"name": "emitter_Ondes",
							"enabled": false,
							"props": {
								"lifeTime": 0.8,
								"alignLockAxis": "Z",
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
								"warmUpTime": -0.2,
								"emitType": "Burst",
								"instScale": 15,
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
								},
								"burstCount": 5,
								"burstDelay": 0.22
							},
							"scaleX": 0.2200000000000002,
							"scaleY": 0.2200000000000002,
							"scaleZ": 0.22000000000000006,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleY": 1.1,
									"scaleZ": 1.1,
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
													"emissive": 0.5
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
												"texture": "Fx/Alphas/T_LensFlare_07.png"
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
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": -0.001803596421044329,
																"dt": -0.7344005148419487
															},
															"nextHandle": {
																"dv": -5.136536362253007e-16,
																"dt": 0.5
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
											"enabled": false,
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 1,
												"saturation": 0.5,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 0.5,
												"texture": "Fx/Gradients/Dissolve_ChockWave.png",
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
													"keyMode": 1,
													"keys": [
														{
															"time": 0.6362655466405217,
															"value": 0.5,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0.29111814826726923,
																"dt": 0.06915880636768901
															}
														},
														{
															"time": 1.1600118732140337,
															"value": 1,
															"prevHandle": {
																"dv": -0.003619090616702847,
																"dt": -0.5207616528940111
															},
															"nextHandle": {
																"dv": 0.003619090616702847,
																"dt": 0.5207616528940111
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
												"useScale": false,
												"wrap": true,
												"progress": 0.27,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 0.5,
												"texture": "Fx/Gradients/Cyl05v_A01.png",
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
													0.3764705882352941,
													0.7607843137254902,
													1
												]
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
											"value": 0,
											"mode": 2
										},
										{
											"time": 1,
											"value": 1,
											"prevHandle": {
												"dv": -0.011878996871929726,
												"dt": -0.6104756850412305
											},
											"nextHandle": {
												"dv": 0.006825528843833996,
												"dt": 0.3513977397384393
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "emitter_Ondes",
							"props": {
								"lifeTime": 0.8,
								"alignLockAxis": "Z",
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
								"warmUpTime": -1.15,
								"emitType": "Burst",
								"instScale": 13,
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
								},
								"burstDelay": 0.22
							},
							"z": 0.2,
							"scaleX": 0.2200000000000002,
							"scaleY": 0.2200000000000002,
							"scaleZ": 0.22000000000000006,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleY": 1.1,
									"scaleZ": 1.1,
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
													"emissive": 0.5
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
												"texture": "Fx/Alphas/T_LensFlare_07.png"
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
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": -0.001803596421044329,
																"dt": -0.7344005148419487
															},
															"nextHandle": {
																"dv": -5.136536362253007e-16,
																"dt": 0.5
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
											"enabled": false,
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 1,
												"saturation": 0.5,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 0.5,
												"texture": "Fx/Gradients/Dissolve_ChockWave.png",
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
													"keyMode": 1,
													"keys": [
														{
															"time": 0.6362655466405217,
															"value": 0.5,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0.29111814826726923,
																"dt": 0.06915880636768901
															}
														},
														{
															"time": 1.1600118732140337,
															"value": 1,
															"prevHandle": {
																"dv": -0.003619090616702847,
																"dt": -0.5207616528940111
															},
															"nextHandle": {
																"dv": 0.003619090616702847,
																"dt": 0.5207616528940111
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
												"useScale": false,
												"wrap": true,
												"progress": 0.27,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 0.5,
												"texture": "Fx/Gradients/Cyl05v_A01.png",
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
													0.3764705882352941,
													0.7607843137254902,
													1
												]
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
											"value": 0,
											"mode": 2
										},
										{
											"time": 1,
											"value": 1,
											"prevHandle": {
												"dv": -0.011878996871929726,
												"dt": -0.6104756850412305
											},
											"nextHandle": {
												"dv": 0.006825528843833996,
												"dt": 0.3513977397384393
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "FlashDecals",
							"z": 1.85863,
							"rotationZ": 90,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Black",
									"scaleX": 6,
									"scaleY": 6,
									"scaleZ": 3.5,
									"albedoMap": "Fx/Gradients/circGrad05.jpg",
									"emissive": 1,
									"renderMode": "BeforeTonemapping",
									"children": [
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 5
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 1.1805062666344903,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.2340955362243105,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2949557343734222,
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
													0,
													0,
													0
												]
											}
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Blue",
									"scaleX": 6,
									"scaleY": 6,
									"scaleZ": 3.5,
									"albedoMap": "Fx/Gradients/circGrad05.jpg",
									"emissive": 1,
									"renderMode": "BeforeTonemapping",
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
													"emissive": 1.5
												}
											}
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 2
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.3068922128771894,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3622869269412807,
															"value": 0.3,
															"mode": 2
														},
														{
															"time": 2.0045164235404247,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.31988251172550664
															},
															"nextHandle": {
																"dv": 0.21666666666666667,
																"dt": 0.030952001010344565
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
												"envBlend": 0.6,
												"envColorSet": false
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.43529411764705883,
													0.7176470588235294,
													0.984313725490196
												]
											}
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_White",
									"scaleX": 6,
									"scaleY": 6,
									"scaleZ": 3.5,
									"albedoMap": "Fx/Gradients/circGrad05.jpg",
									"emissive": 5,
									"renderMode": "BeforeTonemapping",
									"children": [
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 2
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.2362311458100854,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.2898204153999056,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.5187345636965541,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": -0.050000000000000044,
																"dt": -0.19927400323396371
															},
															"nextHandle": {
																"dv": 0.21666666666666667,
																"dt": 0.030952001010344565
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
													1,
													1
												]
											}
										},
										{
											"type": "material",
											"name": "material",
											"enabled": false,
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 2
												}
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
								"instStretch": [
									10,
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
								"warmUpTime": -1.2,
								"emitType": "Burst",
								"instScale": 2,
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
							"y": -0.05,
							"z": 0.98986,
							"scaleX": 0.10000000000000003,
							"scaleY": 0.10000000000000003,
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
							"type": "object",
							"name": "Tornado",
							"enabled": false,
							"z": 2.03171,
							"scaleX": 0.8,
							"scaleY": 0.8,
							"scaleZ": 0.8,
							"children": [
								{
									"type": "model",
									"name": "spiraleSand",
									"source": "Fx/Meshes_Common/Spirale02_mirrorBig.fbx",
									"scaleX": 1.0000000000000002,
									"scaleY": 1.0000000000000002,
									"scaleZ": 0.76,
									"rotationZ": -132,
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
													"emissive": 0.5
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
												"progress": 0.32,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Cyl03v_A.jpg",
												"uvShift": [
													0,
													0.02
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
												"progress": 0.22,
												"saturation": 0.5,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0,
													0.02
												],
												"uvShiftSpeed": [
													0,
													0
												]
											}
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 0.5,
												"scaleY": 0.75,
												"shiftX": 0,
												"shiftY": 1,
												"shiftSpeedX": -1,
												"shiftSpeedY": 0
											},
											"children": [
												{
													"type": "curve",
													"name": "shiftY",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.9054203175497193,
															"value": -0.4948720932006838,
															"prevHandle": {
																"dv": 5.71953178782954e-16,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 5.551115123125783e-17,
																"dt": 0.5567216291312178
															}
														},
														{
															"time": 1.6431728427146735,
															"value": 0.85,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "shiftY",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.9054203175497193,
															"value": -0.4948720932006838,
															"prevHandle": {
																"dv": 5.71953178782954e-16,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 5.551115123125783e-17,
																"dt": 0.5567216291312178
															}
														},
														{
															"time": 1.7480873579567116,
															"value": 0.85,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "shiftY",
													"enabled": false,
													"keys": [
														{
															"time": 1.145008725586385,
															"value": -0.4948720932006838,
															"mode": 2
														},
														{
															"time": 1.937675765993378,
															"value": 0.85,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "shiftY",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.9054203175497193,
															"value": -0.4948720932006838,
															"prevHandle": {
																"dv": 5.71953178782954e-16,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 5.551115123125783e-17,
																"dt": 0.5567216291312178
															}
														},
														{
															"time": 2.4753294001014514,
															"value": 0.85,
															"prevHandle": {
																"dv": -0.00884912545066785,
																"dt": -0.570995442864431
															},
															"nextHandle": {
																"dv": 0.015494864233032216,
																"dt": 0.49998142196294887
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
												"useSourceUVs": false,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 2,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Wave.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.2556449357833017,
															"value": 0,
															"prevHandle": {
																"dv": -0.8181222043870895,
																"dt": -0.4501626227043787
															},
															"nextHandle": {
																"dv": 0.1742460963956094,
																"dt": 0.0983726115211403
															}
														},
														{
															"time": 1.4496105662392158,
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
											"props": {
												"sandBlend": 0.6,
												"sandColorSet": false,
												"envBlend": 0.5,
												"envColorSet": false
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
												"progress": 0.4,
												"saturation": 0.5,
												"width": 0.65,
												"uvScaleX": 0.2,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Grunge_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.15,
													0.15
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
													"name": "progress",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 1.3049289832214073,
															"value": 0.8948601617813111,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": -0.006957521412106371
															}
														},
														{
															"time": 1.3818085893798637,
															"value": 0.8948601617813111,
															"mode": 1,
															"prevHandle": {
																"dv": -0.22616915345191968,
																"dt": -0.039999999999999925
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.49344094974729225
															}
														},
														{
															"time": 2.686410660287397,
															"value": -0.014914336029688502,
															"prevHandle": {
																"dv": 0.015162908296849964,
																"dt": -1.1299093125850823
															},
															"nextHandle": {
																"dv": -0.0064241497665561455,
																"dt": 0.4815334017558196
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
															"time": 1.3509360251435447,
															"value": 0.8948601617813111,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": -0.006957521412106371
															}
														},
														{
															"time": 5.354478485947719,
															"value": 0,
															"prevHandle": {
																"dv": 0.0007442731918721468,
																"dt": -0.7338927659453209
															},
															"nextHandle": {
																"dv": -1.5119282697350795e-16,
																"dt": 0.4815594802394449
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
												"range": 2,
												"power": 0.8
											}
										}
									]
								},
								{
									"type": "model",
									"name": "spiraleSand",
									"source": "Fx/Meshes_Common/Spirale02_mirrorBig.fbx",
									"scaleX": 1.0000000000000002,
									"scaleY": 1.0000000000000002,
									"scaleZ": 0.76,
									"rotationZ": -132,
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
													"emissive": 0.5
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
												"progress": 0.32,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Cyl03v_A.jpg",
												"uvShift": [
													0,
													0.02
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
												"progress": 0.22,
												"saturation": 0.5,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0,
													0.02
												],
												"uvShiftSpeed": [
													0,
													0
												]
											}
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 0.5,
												"scaleY": 0.75,
												"shiftX": 0,
												"shiftY": 1,
												"shiftSpeedX": -1,
												"shiftSpeedY": 0
											},
											"children": [
												{
													"type": "curve",
													"name": "shiftY",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.9054203175497193,
															"value": -0.4948720932006838,
															"prevHandle": {
																"dv": 5.71953178782954e-16,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 5.551115123125783e-17,
																"dt": 0.5567216291312178
															}
														},
														{
															"time": 1.6431728427146735,
															"value": 0.85,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "shiftY",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.9054203175497193,
															"value": -0.4948720932006838,
															"prevHandle": {
																"dv": 5.71953178782954e-16,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 5.551115123125783e-17,
																"dt": 0.5567216291312178
															}
														},
														{
															"time": 1.7480873579567116,
															"value": 0.85,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "shiftY",
													"enabled": false,
													"keys": [
														{
															"time": 1.145008725586385,
															"value": -0.4948720932006838,
															"mode": 2
														},
														{
															"time": 1.937675765993378,
															"value": 0.85,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "shiftY",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.9054203175497193,
															"value": -0.4948720932006838,
															"prevHandle": {
																"dv": 5.71953178782954e-16,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 5.551115123125783e-17,
																"dt": 0.5567216291312178
															}
														},
														{
															"time": 2.4753294001014514,
															"value": 0.85,
															"prevHandle": {
																"dv": -0.00884912545066785,
																"dt": -0.570995442864431
															},
															"nextHandle": {
																"dv": 0.015494864233032216,
																"dt": 0.49998142196294887
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
												"envBlend": 0.5,
												"envColorSet": false
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
												"progress": 0.4,
												"saturation": 0.5,
												"width": 0.65,
												"uvScaleX": 0.2,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Grunge_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.15,
													0.15
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
													"name": "progress",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 1.3049289832214073,
															"value": 0.8948601617813111,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": -0.006957521412106371
															}
														},
														{
															"time": 1.3818085893798637,
															"value": 0.8948601617813111,
															"mode": 1,
															"prevHandle": {
																"dv": -0.22616915345191968,
																"dt": -0.039999999999999925
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.49344094974729225
															}
														},
														{
															"time": 2.686410660287397,
															"value": -0.014914336029688502,
															"prevHandle": {
																"dv": 0.015162908296849964,
																"dt": -1.1299093125850823
															},
															"nextHandle": {
																"dv": -0.0064241497665561455,
																"dt": 0.4815334017558196
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
															"time": 1.3509360251435447,
															"value": 0.8948601617813111,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": -0.006957521412106371
															}
														},
														{
															"time": 4.413240747699414,
															"value": 0,
															"prevHandle": {
																"dv": 0.009584678049055162,
																"dt": -2.251821930745909
															},
															"nextHandle": {
																"dv": -0.0032660472019664325,
																"dt": 0.48155273981546975
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
												"range": 2,
												"power": 0.8
											}
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
													"keyMode": 1,
													"keys": [
														{
															"time": 1.44064153470359,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.5757746884854948,
															"value": 1,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.045044384593967944
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.3771380493252639
															}
														},
														{
															"time": 2.498087357956711,
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
						},
						{
							"type": "object",
							"name": "Tornado",
							"enabled": false,
							"x": 0.57371,
							"y": -0.07348,
							"z": 2.03171,
							"children": [
								{
									"type": "model",
									"name": "spiraleSand",
									"source": "Fx/Meshes_Common/Spirale02_mirrorBig.fbx",
									"scaleX": 1.0000000000000002,
									"scaleY": 1.0000000000000002,
									"scaleZ": 0.76,
									"rotationZ": -132,
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
													"emissive": 2
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
												"progress": 0.32,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Cyl03v_A.jpg",
												"uvShift": [
													0,
													0.02
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
												"progress": 0.22,
												"saturation": 0.5,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0,
													0.02
												],
												"uvShiftSpeed": [
													0,
													0
												]
											}
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 0.5,
												"scaleY": 0.75,
												"shiftX": 0,
												"shiftY": 1,
												"shiftSpeedX": -1,
												"shiftSpeedY": 0
											},
											"children": [
												{
													"type": "curve",
													"name": "shiftY",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.8689164101540219,
															"value": -0.4948720932006838,
															"prevHandle": {
																"dv": 5.71953178782954e-16,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 5.551115123125783e-17,
																"dt": 0.5567216291312178
															}
														},
														{
															"time": 1.6066689353189758,
															"value": 0.85,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "shiftY",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.8689164101540219,
															"value": -0.4948720932006838,
															"prevHandle": {
																"dv": 5.71953178782954e-16,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 5.551115123125783e-17,
																"dt": 0.5567216291312178
															}
														},
														{
															"time": 1.711583450561014,
															"value": 0.85,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "shiftY",
													"enabled": false,
													"keys": [
														{
															"time": 1.1085048181906874,
															"value": -0.4948720932006838,
															"mode": 2
														},
														{
															"time": 1.9011718585976802,
															"value": 0.85,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "shiftY",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.8689164101540219,
															"value": -0.4948720932006838,
															"prevHandle": {
																"dv": 5.71953178782954e-16,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 5.551115123125783e-17,
																"dt": 0.5567216291312178
															}
														},
														{
															"time": 2.4388254927057527,
															"value": 0.85,
															"prevHandle": {
																"dv": -0.00884912545066785,
																"dt": -0.570995442864431
															},
															"nextHandle": {
																"dv": 0.015494864233032216,
																"dt": 0.49998142196294887
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
												"useSourceUVs": false,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 2,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Wave.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.219141028387604,
															"value": 0,
															"prevHandle": {
																"dv": -0.8181222043870895,
																"dt": -0.4501626227043787
															},
															"nextHandle": {
																"dv": 0.1742460963956094,
																"dt": 0.0983726115211403
															}
														},
														{
															"time": 1.4131066588435182,
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
											"props": {
												"sandBlend": 0.6,
												"sandColorSet": false,
												"envBlend": 0.5,
												"envColorSet": false
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
												"progress": 0.4,
												"saturation": 0.5,
												"width": 0.65,
												"uvScaleX": 0.5,
												"uvScaleY": 2,
												"texture": "Fx/noise/T_Fire.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.15,
													0.5
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
													"name": "progress",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 1.2684250758257096,
															"value": 0.8948601617813111,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": -0.006957521412106371
															}
														},
														{
															"time": 1.345304681984166,
															"value": 0.8948601617813111,
															"mode": 1,
															"prevHandle": {
																"dv": -0.22616915345191968,
																"dt": -0.039999999999999925
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.49344094974729225
															}
														},
														{
															"time": 2.6499067528916993,
															"value": -0.014914336029688502,
															"prevHandle": {
																"dv": 0.015162908296849964,
																"dt": -1.1299093125850823
															},
															"nextHandle": {
																"dv": -0.0064241497665561455,
																"dt": 0.4815334017558196
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
															"time": 1.314432117747847,
															"value": 0.8948601617813111,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": -0.006957521412106371
															}
														},
														{
															"time": 5.317974578552019,
															"value": 0,
															"prevHandle": {
																"dv": 0.0007442731918721468,
																"dt": -0.7338927659453209
															},
															"nextHandle": {
																"dv": -1.5119282697350795e-16,
																"dt": 0.4815594802394449
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
												"range": 2,
												"power": 0.8
											}
										}
									]
								},
								{
									"type": "model",
									"name": "spiraleSand",
									"source": "Fx/Meshes_Common/Spirale02_mirrorBig.fbx",
									"scaleX": 1.0000000000000002,
									"scaleY": 1.0000000000000002,
									"scaleZ": 0.76,
									"rotationZ": -132,
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
													"emissive": 2
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
												"progress": 0.32,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Cyl03v_A.jpg",
												"uvShift": [
													0,
													0.02
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
												"progress": 0.22,
												"saturation": 0.5,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0,
													0.02
												],
												"uvShiftSpeed": [
													0,
													0
												]
											}
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 0.5,
												"scaleY": 0.75,
												"shiftX": 0,
												"shiftY": 1,
												"shiftSpeedX": -1,
												"shiftSpeedY": 0
											},
											"children": [
												{
													"type": "curve",
													"name": "shiftY",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.8689164101540219,
															"value": -0.4948720932006838,
															"prevHandle": {
																"dv": 5.71953178782954e-16,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 5.551115123125783e-17,
																"dt": 0.5567216291312178
															}
														},
														{
															"time": 1.6066689353189758,
															"value": 0.85,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "shiftY",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.8689164101540219,
															"value": -0.4948720932006838,
															"prevHandle": {
																"dv": 5.71953178782954e-16,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 5.551115123125783e-17,
																"dt": 0.5567216291312178
															}
														},
														{
															"time": 1.711583450561014,
															"value": 0.85,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "shiftY",
													"enabled": false,
													"keys": [
														{
															"time": 1.1085048181906874,
															"value": -0.4948720932006838,
															"mode": 2
														},
														{
															"time": 1.9011718585976802,
															"value": 0.85,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "shiftY",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.8689164101540219,
															"value": -0.4948720932006838,
															"prevHandle": {
																"dv": 5.71953178782954e-16,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 5.551115123125783e-17,
																"dt": 0.5567216291312178
															}
														},
														{
															"time": 2.4388254927057527,
															"value": 0.85,
															"prevHandle": {
																"dv": -0.00884912545066785,
																"dt": -0.570995442864431
															},
															"nextHandle": {
																"dv": 0.015494864233032216,
																"dt": 0.49998142196294887
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
												"envBlend": 0.5,
												"envColorSet": false
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
												"progress": 0.4,
												"saturation": 0.5,
												"width": 0.65,
												"uvScaleX": 0.5,
												"uvScaleY": 2,
												"texture": "Fx/noise/T_Fire.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.1,
													0.5
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
													"name": "progress",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 1.2684250758257096,
															"value": 0.8948601617813111,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": -0.006957521412106371
															}
														},
														{
															"time": 1.345304681984166,
															"value": 0.8948601617813111,
															"mode": 1,
															"prevHandle": {
																"dv": -0.22616915345191968,
																"dt": -0.039999999999999925
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.49344094974729225
															}
														},
														{
															"time": 2.6499067528916993,
															"value": -0.014914336029688502,
															"prevHandle": {
																"dv": 0.015162908296849964,
																"dt": -1.1299093125850823
															},
															"nextHandle": {
																"dv": -0.0064241497665561455,
																"dt": 0.4815334017558196
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
															"time": 1.314432117747847,
															"value": 0.8948601617813111,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": -0.006957521412106371
															}
														},
														{
															"time": 4.3767368403037175,
															"value": 0,
															"prevHandle": {
																"dv": 0.009584678049055162,
																"dt": -2.251821930745909
															},
															"nextHandle": {
																"dv": -0.0032660472019664325,
																"dt": 0.48155273981546975
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
												"range": 2,
												"power": 0.8
											}
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
													"keyMode": 1,
													"keys": [
														{
															"time": 1.4041376273078923,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.5392707810897972,
															"value": 1,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.045044384593967944
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.3771380493252639
															}
														},
														{
															"time": 2.461583450561012,
															"value": 0,
															"mode": 2
														}
													]
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
											0.7176470588235294,
											0.984313725490196
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
										"bias": 0.8,
										"scale": 1,
										"power": 1,
										"color": [
											1,
											0,
											0
										]
									}
								}
							]
						},
						{
							"type": "lookAt",
							"name": "lookAtUP",
							"z": 1.5,
							"scaleY": 3.5,
							"scaleZ": 1.5,
							"rotationZ": 3.388453267087203,
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
									"scaleX": 0.45,
									"scaleY": 20,
									"scaleZ": 0.7499392354141005,
									"rotationX": 90,
									"rotationZ": 90,
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
													"emissive": 2,
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
													"keys": [
														{
															"time": 1.1636714978459255,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.2770164108265636,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.015014373918409,
															"value": 0,
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
												"range": 15,
												"power": 0.8
											}
										},
										{
											"type": "curve",
											"name": "scale.z",
											"keyMode": 0,
											"keys": [
												{
													"time": 1.1804105641281935,
													"value": 0.25,
													"prevHandle": {
														"dv": 0.002404241294978398,
														"dt": -0.015494497741857334
													},
													"nextHandle": {
														"dv": -0.01414688773777184,
														"dt": 0.1249143940058296
													}
												},
												{
													"time": 1.3039241159958141,
													"value": 1.75,
													"mode": 2
												}
											]
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.72,
												"ATTENUATE": true,
												"emissiveMap": null
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.3764705882352941,
													0.7607843137254902,
													1
												]
											}
										}
									]
								}
							]
						},
						{
							"type": "lookAt",
							"name": "lookAt_Flare",
							"z": 1.0207499999999998,
							"scaleX": 0.8,
							"scaleY": 0.2,
							"scaleZ": 0.8,
							"rotationX": -2.5943909506258638e-17,
							"rotationY": -16.712112974153342,
							"rotationZ": 0.8155629796091814,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								0
							],
							"children": [
								{
									"type": "polygon",
									"name": "FlareLarge",
									"scaleX": 15,
									"scaleY": 75,
									"scaleZ": 15,
									"rotationX": 90,
									"rotationZ": 90,
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
													"emissive": 0.75
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
													"keyMode": 1,
													"keys": [
														{
															"time": 1.1247640736236255,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.16666666666666666
															}
														},
														{
															"time": 1.328238981414834,
															"value": 1,
															"mode": 1,
															"prevHandle": {
																"dv": -0.8035376968950327,
																"dt": -0.016956242315933956
															},
															"nextHandle": {
																"dv": 0.005620602333900049,
																"dt": 0.16610893781317326
															}
														},
														{
															"time": 2.2043115010714267,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.49999999999999994
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
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_circle2.png"
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 10,
												"power": 2
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.5,
												"sandColorSet": false,
												"envBlend": 0.5,
												"envColorSet": false
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
													0.3764705882352941,
													0.7607843137254902,
													1
												]
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
											"time": 1.3004428414716744,
											"value": 0,
											"prevHandle": {
												"dv": -3.321933238091307,
												"dt": -0.06735525205113772
											},
											"nextHandle": {
												"dv": 1.0855997590896094,
												"dt": 0.02148444229488028
											}
										},
										{
											"time": 2.2138245784402892,
											"value": 1,
											"prevHandle": {
												"dv": -0.007926619448975658,
												"dt": -0.935892228491727
											},
											"nextHandle": {
												"dv": 0.007926619448975658,
												"dt": 0.935892228491727
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "SmokePuff",
							"enabled": false,
							"props": {
								"lifeTime": 0.75,
								"lifeTimeRand": 0.25,
								"emitType": "Burst",
								"burstParticleCount": 6,
								"simulationSpace": "World",
								"emitOrientation": "Normal",
								"emitShape": "Cylinder",
								"emitRad1": 0.61,
								"emitSurface": true,
								"alignMode": "Screen",
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"animationSpeed": 0,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_04.png",
								"instScale": 14,
								"instSpeed": [
									5,
									0,
									0
								],
								"instSpeed_rand": [
									1,
									0,
									0
								],
								"instRotation_rand": [
									0,
									0,
									360
								],
								"instScale_rand": 5,
								"instAcceleration": [
									-3,
									0,
									0
								],
								"instAcceleration_rand": [
									1,
									0,
									0
								],
								"instWorldAcceleration": [
									0,
									0,
									2
								],
								"instWorldAcceleration_rand": [
									0,
									0,
									1
								],
								"speedFactor": 0.5,
								"emitAngle": 360,
								"warmUpTime": -0.55,
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
							"scaleX": 0.25,
							"scaleY": 0.25,
							"scaleZ": 0.03,
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
													"emissive": 0.1
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												0.27058823529411763
											]
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1.2
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
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
																"dt": 0.16666666666666666
															}
														},
														{
															"time": 0.15,
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
													1,
													1,
													1
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.7,
												"saturation": 0,
												"width": 0.4,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.02
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
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.9,
															"prevHandle": {
																"dv": 1.250468545740539,
																"dt": -0.330632361246651
															},
															"nextHandle": {
																"dv": -0.9833333333333334,
																"dt": 0.26
															}
														},
														{
															"time": 1.5,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.25,
											"topSpan": 0.24,
											"dirIntensity": 0.1,
											"dirSpan": 0,
											"sandBlend": 0.7,
											"envBlend": 0.7
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 19.7,
												"power": 14.39
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
					"type": "constraint",
					"name": "constraint",
					"object": ".FXRoot.Skill.Call",
					"target": ".FXRoot.Bannerjee.male01_SmugglerBannerjee.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ"
				}
			]
		}
	]
}