{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "polygon",
			"name": "Ground",
			"editorOnly": true,
			"x": -0.2375,
			"y": -0.24402,
			"z": 0.02,
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
			"name": "FXRoot",
			"scaleX": 1.25,
			"scaleY": 1.25,
			"scaleZ": 1.25,
			"children": [
				{
					"type": "object",
					"name": "group",
					"z": 4.6670911111111115,
					"children": [
						{
							"type": "emitter",
							"name": "FlareGround",
							"enabled": false,
							"props": {
								"emitType": "Burst",
								"instScale": 25,
								"instOffset": [
									0,
									0,
									1
								],
								"lifeTime": 2,
								"warmUpTime": -0.45
							},
							"x": 0.07094888888888892,
							"y": -0.056225,
							"z": -3.6670911111111115,
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
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 1,
												"power": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													0.9764705882352941,
													0.7529411764705882,
													0.5137254901960784
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.6627450980392157,
													0.22352941176470587,
													0.13725490196078433
												]
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
												"progress": 0.34,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 2,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.6
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
												"alpha": 0.7,
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
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"enabled": false,
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.7,
												"envColorSet": false
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 1,
										"ATTENUATE": true,
										"emissiveMap": "Fx/Gradients/z_FillBlack.jpg"
									}
								}
							]
						},
						{
							"type": "emitter",
							"name": "FlareGround",
							"props": {
								"emitType": "Burst",
								"instScale": 100,
								"instOffset": [
									0,
									0,
									1
								],
								"lifeTime": 0.1,
								"warmUpTime": -1
							},
							"x": 0.07094888888888892,
							"y": -0.056225,
							"z": -3.6670911111111115,
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
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"enableStencil": false,
													"parallax": 0,
													"emissive": 10
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 1,
												"power": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.6627450980392157,
													0.22352941176470587,
													0.13725490196078433
												]
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
												"progress": 0.34,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 2,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.6
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
												"alpha": 0.7,
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
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"enabled": false,
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.7,
												"envColorSet": false
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 1,
										"ATTENUATE": true,
										"emissiveMap": "Fx/Gradients/z_FillBlack.jpg"
									}
								}
							]
						},
						{
							"type": "emitter",
							"name": "Flarescreen",
							"props": {
								"emitType": "Burst",
								"alignMode": "Screen",
								"instScale": 150,
								"lifeTime": 2,
								"instOffset": [
									0,
									0,
									1
								],
								"warmUpTime": -0.45
							},
							"x": 0.07094888888888892,
							"y": -0.056225,
							"z": 3.694358888888888,
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
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 15,
												"power": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													0.9764705882352941,
													0.7529411764705882,
													0.5137254901960784
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.6627450980392157,
													0.22352941176470587,
													0.13725490196078433
												]
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
												"progress": 0.34,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 2,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.6
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
												"alpha": 0.5,
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
															"time": 0.337436981201172,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -1.1333333333333333,
																"dt": -0.050000000000000044
															},
															"nextHandle": {
																"dv": 0.6141901939981789,
																"dt": 0.029366779035477106
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
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"enabled": false,
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.7,
												"envColorSet": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 1,
												"ATTENUATE": true,
												"emissiveMap": "Fx/Gradients/z_FillBlack.jpg"
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Bol",
							"props": {
								"emitType": "Burst",
								"instScale": 7,
								"lifeTime": 1.5,
								"instRotation": [
									0,
									180,
									0
								],
								"warmUpTime": -0.65
							},
							"x": 1.3953988888888889,
							"y": -0.209015,
							"z": -7.8967511111111115,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"children": [
								{
									"type": "model",
									"name": "Hemisphere",
									"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
									"scaleX": 4,
									"scaleY": 4,
									"scaleZ": 5,
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
												"useSourceUVs": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/GradientSpice_2.png",
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
															"time": 0.20040999847584218,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.12122382132456926,
																"dt": -0.4994842701051498
															},
															"nextHandle": {
																"dv": 0.033333333333333326,
																"dt": 0.13734491693339435
															}
														},
														{
															"time": 0.4189132754153332,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.0019599367734594968,
																"dt": -0.019991355089287063
															},
															"nextHandle": {
																"dv": 0.016666666666666607,
																"dt": 0.17108672458466678
															}
														},
														{
															"time": 0.7649999999999997,
															"value": 0,
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
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													0.9764705882352941,
													0.7529411764705882,
													0.5137254901960784
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.6627450980392157,
													0.22352941176470587,
													0.13725490196078433
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "color.h",
													"keys": [
														{
															"time": 0,
															"value": 0.6141459322807113,
															"mode": 2
														},
														{
															"time": 0.9949999999999999,
															"value": 0.17192795616660556,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "color.s",
													"keys": [
														{
															"time": 0,
															"value": 0.7869822485207102,
															"mode": 2
														},
														{
															"time": 0.9949999999999999,
															"value": 0.6568627450980391,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "color.l",
													"keys": [
														{
															"time": 0,
															"value": 0.6686274509803922,
															"mode": 2
														},
														{
															"time": 0.9949999999999999,
															"value": 0.4,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "color.h",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.6141459322807113,
															"mode": 2
														},
														{
															"time": 0.9932664397364901,
															"value": 0.17192795616660556,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01474059920380355,
																"dt": -0.9349999999999998
															},
															"nextHandle": {
																"dv": 0.005228540972693557,
																"dt": 0.3316476991116548
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "color.s",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.7869822485207102,
															"mode": 2
														},
														{
															"time": 0.9932664397364901,
															"value": 0.6568627450980391,
															"mode": 0,
															"prevHandle": {
																"dv": -0.002168658390377831,
																"dt": -0.9899999999999999
															},
															"nextHandle": {
																"dv": 0.0007265278042454077,
																"dt": 0.3316624367370449
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "color.l",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.6686274509803922,
															"mode": 2
														},
														{
															"time": 0.9932664397364901,
															"value": 0.4,
															"mode": 0,
															"prevHandle": {
																"dv": 5.551115123125783e-17,
																"dt": -0.8899999999999999
															},
															"nextHandle": {
																"dv": -7.273975094804857e-17,
																"dt": 0.33166666666666667
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.48,
												"saturation": 0.51,
												"width": 0.84,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.4
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.62,
												"saturation": 0,
												"width": 0.87,
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/noise/Water_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.3
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
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 15,
												"power": 2
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"enabled": false,
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.7,
												"envColorSet": false
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instStretch.z",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 2.1815539740246592e-16,
												"dt": -0.18535050365489164
											},
											"nextHandle": {
												"dv": 1.1102230246251565e-16,
												"dt": 0.21844688309708893
											}
										},
										{
											"time": 0.28087639079408633,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.9960410845230232,
											"value": 1.3,
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
								},
								{
									"type": "curve",
									"name": "instStretch.y",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 2.1815539740246592e-16,
												"dt": -0.18535050365489164
											},
											"nextHandle": {
												"dv": 1.1102230246251565e-16,
												"dt": 0.21844688309708893
											}
										},
										{
											"time": 0.2758763907940863,
											"value": 0.8266666666666668,
											"mode": 2
										},
										{
											"time": 0.9910410845230231,
											"value": 1.126666666666667,
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
								},
								{
									"type": "curve",
									"name": "instStretch.y",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 2.1815539740246592e-16,
												"dt": -0.18535050365489164
											},
											"nextHandle": {
												"dv": 1.1102230246251565e-16,
												"dt": 0.21844688309708893
											}
										},
										{
											"time": 0.2758763907940863,
											"value": 0.8266666666666668,
											"mode": 2
										},
										{
											"time": 0.9910410845230231,
											"value": 1.126666666666667,
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
								},
								{
									"type": "curve",
									"name": "instStretch.x",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.02664527370121003,
												"dt": -0.1853207988671051
											},
											"nextHandle": {
												"dv": -0.02664527370121003,
												"dt": 0.1853207988671051
											}
										},
										{
											"time": 0.28087639079408633,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.9960410845230232,
											"value": 1.3,
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
							"type": "emitter",
							"name": "BolSharp",
							"props": {
								"emitType": "Burst",
								"instScale": 7,
								"lifeTime": 1.75,
								"instRotation": [
									0,
									180,
									0
								],
								"warmUpTime": -0.68
							},
							"x": 1.3953988888888889,
							"y": -0.209015,
							"z": -7.8967511111111115,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"children": [
								{
									"type": "model",
									"name": "Hemisphere",
									"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
									"scaleX": 5,
									"scaleY": 5,
									"scaleZ": 15,
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
												"useSourceUVs": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1.5,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/GradientSpice_2.png",
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
															"time": 0.20040999847584218,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.12122382132456926,
																"dt": -0.4994842701051498
															},
															"nextHandle": {
																"dv": 0.033333333333333326,
																"dt": 0.13734491693339435
															}
														},
														{
															"time": 0.4189132754153332,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.0022974850559852626,
																"dt": -0.01998811998707175
															},
															"nextHandle": {
																"dv": -0.016666666666666607,
																"dt": 0.14608672458466676
															}
														},
														{
															"time": 0.7649999999999997,
															"value": 0,
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
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													0.9764705882352941,
													0.7529411764705882,
													0.5137254901960784
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.6627450980392157,
													0.22352941176470587,
													0.13725490196078433
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "color.h",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.6141459322807113,
															"mode": 2
														},
														{
															"time": 0.635,
															"value": 0.17192795616660556,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01474059920380355,
																"dt": -0.9349999999999998
															},
															"nextHandle": {
																"dv": 0.005228540972693557,
																"dt": 0.3316476991116548
															}
														},
														{
															"time": 0.9800000000000004,
															"value": 0,
															"mode": 0
														}
													]
												},
												{
													"type": "curve",
													"name": "color.s",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.7869822485207102,
															"mode": 2
														},
														{
															"time": 0.635,
															"value": 0.6568627450980391,
															"mode": 0,
															"prevHandle": {
																"dv": -0.002168658390377831,
																"dt": -0.9899999999999999
															},
															"nextHandle": {
																"dv": 0.0007265278042454077,
																"dt": 0.3316624367370449
															}
														},
														{
															"time": 0.9800000000000004,
															"value": 0.05555555555555555,
															"mode": 0
														}
													]
												},
												{
													"type": "curve",
													"name": "color.l",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.6686274509803922,
															"mode": 2
														},
														{
															"time": 0.635,
															"value": 0.4,
															"mode": 0,
															"prevHandle": {
																"dv": 5.551115123125783e-17,
																"dt": -0.8899999999999999
															},
															"nextHandle": {
																"dv": -7.273975094804857e-17,
																"dt": 0.33166666666666667
															}
														},
														{
															"time": 0.9800000000000004,
															"value": 0.07058823529411765,
															"mode": 0
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.48,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.4
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.34,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.3
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
															"time": 0.2090824569425393,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.11604552724598342,
																"dt": -0.49988189441195807
															},
															"nextHandle": {
																"dv": -0.06666666666666665,
																"dt": 0.2871757354061881
															}
														},
														{
															"time": 0.915,
															"value": 0,
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
												"range": 15,
												"power": 2
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"enabled": false,
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.7,
												"envColorSet": false
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instStretch.y",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 2.1815539740246592e-16,
												"dt": -0.18535050365489164
											},
											"nextHandle": {
												"dv": 1.1102230246251565e-16,
												"dt": 0.21844688309708893
											}
										},
										{
											"time": 0.22000000000000003,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.9960410845230232,
											"value": 1.3,
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
								},
								{
									"type": "curve",
									"name": "instStretch.x",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.02664527370121003,
												"dt": -0.1853207988671051
											},
											"nextHandle": {
												"dv": -0.02664527370121003,
												"dt": 0.1853207988671051
											}
										},
										{
											"time": 0.22000000000000003,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.9960410845230232,
											"value": 1.3,
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
								},
								{
									"type": "curve",
									"name": "instStretch.x",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 2.1815539740246592e-16,
												"dt": -0.18535050365489164
											},
											"nextHandle": {
												"dv": 1.1102230246251565e-16,
												"dt": 0.21844688309708893
											}
										},
										{
											"time": 0.2758763907940863,
											"value": 0.8266666666666668,
											"mode": 2
										},
										{
											"time": 0.9910410845230231,
											"value": 1.126666666666667,
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
								},
								{
									"type": "curve",
									"name": "instStretch.z",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 2.1815539740246592e-16,
												"dt": -0.18535050365489164
											},
											"nextHandle": {
												"dv": 1.1102230246251565e-16,
												"dt": 0.21844688309708893
											}
										},
										{
											"time": 0.28087639079408633,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.9960410845230232,
											"value": 1.3,
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
								},
								{
									"type": "curve",
									"name": "instStretch.y",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 2.1815539740246592e-16,
												"dt": -0.18535050365489164
											},
											"nextHandle": {
												"dv": 1.1102230246251565e-16,
												"dt": 0.21844688309708893
											}
										},
										{
											"time": 0.2758763907940863,
											"value": 0.8266666666666668,
											"mode": 2
										},
										{
											"time": 0.9910410845230231,
											"value": 1.126666666666667,
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
							"type": "emitter",
							"name": "BolSharp",
							"props": {
								"emitType": "Burst",
								"instScale": 10,
								"lifeTime": 1.75,
								"instRotation": [
									0,
									180,
									0
								],
								"warmUpTime": -0.68
							},
							"x": 1.3953988888888889,
							"y": -0.209015,
							"z": -7.8967511111111115,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"children": [
								{
									"type": "model",
									"name": "Hemisphere",
									"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
									"scaleX": 5,
									"scaleY": 5,
									"scaleZ": 5,
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
												"useSourceUVs": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/GradientSpice_2.png",
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
															"time": 0.20040999847584218,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.12122382132456926,
																"dt": -0.4994842701051498
															},
															"nextHandle": {
																"dv": 0.033333333333333326,
																"dt": 0.13734491693339435
															}
														},
														{
															"time": 0.4189132754153332,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.0018011440898610185,
																"dt": -0.01999269939745707
															},
															"nextHandle": {
																"dv": -0.016666666666666607,
																"dt": 0.1860867245846668
															}
														},
														{
															"time": 0.7649999999999997,
															"value": 0,
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
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													0.9764705882352941,
													0.7529411764705882,
													0.5137254901960784
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.6627450980392157,
													0.22352941176470587,
													0.13725490196078433
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "color.h",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.6141459322807113,
															"mode": 2
														},
														{
															"time": 0.9949999999999999,
															"value": 0.17192795616660556,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01474059920380355,
																"dt": -0.9349999999999998
															},
															"nextHandle": {
																"dv": 0.005228540972693557,
																"dt": 0.3316476991116548
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "color.s",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.7869822485207102,
															"mode": 2
														},
														{
															"time": 0.9949999999999999,
															"value": 0.6568627450980391,
															"mode": 0,
															"prevHandle": {
																"dv": -0.002168658390377831,
																"dt": -0.9899999999999999
															},
															"nextHandle": {
																"dv": 0.0007265278042454077,
																"dt": 0.3316624367370449
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "color.l",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.6686274509803922,
															"mode": 2
														},
														{
															"time": 0.9949999999999999,
															"value": 0.4,
															"mode": 0,
															"prevHandle": {
																"dv": 5.551115123125783e-17,
																"dt": -0.8899999999999999
															},
															"nextHandle": {
																"dv": -7.273975094804857e-17,
																"dt": 0.33166666666666667
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "color.h",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.6141459322807113,
															"mode": 2
														},
														{
															"time": 0.615,
															"value": 0.17192795616660556,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01474059920380355,
																"dt": -0.9349999999999998
															},
															"nextHandle": {
																"dv": 0.005228540972693557,
																"dt": 0.3316476991116548
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0
														}
													]
												},
												{
													"type": "curve",
													"name": "color.s",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.7869822485207102,
															"mode": 2
														},
														{
															"time": 0.615,
															"value": 0.6568627450980391,
															"mode": 0,
															"prevHandle": {
																"dv": -0.002168658390377831,
																"dt": -0.9899999999999999
															},
															"nextHandle": {
																"dv": 0.0007265278042454077,
																"dt": 0.3316624367370449
															}
														},
														{
															"time": 1,
															"value": 0.05555555555555555,
															"mode": 0
														}
													]
												},
												{
													"type": "curve",
													"name": "color.l",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.6686274509803922,
															"mode": 2
														},
														{
															"time": 0.615,
															"value": 0.4,
															"mode": 0,
															"prevHandle": {
																"dv": 5.551115123125783e-17,
																"dt": -0.8899999999999999
															},
															"nextHandle": {
																"dv": -7.273975094804857e-17,
																"dt": 0.33166666666666667
															}
														},
														{
															"time": 1,
															"value": 0.07058823529411765,
															"mode": 0
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.47,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.4
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.34,
												"saturation": 0,
												"width": 0.56,
												"uvScaleX": 4,
												"uvScaleY": 4,
												"texture": "Fx/noise/Water_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.3
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
															"time": 0.2090824569425393,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.11604552724598342,
																"dt": -0.49988189441195807
															},
															"nextHandle": {
																"dv": -0.06666666666666665,
																"dt": 0.2871757354061881
															}
														},
														{
															"time": 0.915,
															"value": 0,
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
												"range": 15,
												"power": 2
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"enabled": false,
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.7,
												"envColorSet": false
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instStretch.y",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 2.1815539740246592e-16,
												"dt": -0.18535050365489164
											},
											"nextHandle": {
												"dv": 1.1102230246251565e-16,
												"dt": 0.21844688309708893
											}
										},
										{
											"time": 0.22000000000000003,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.9960410845230232,
											"value": 1.3,
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
								},
								{
									"type": "curve",
									"name": "instStretch.x",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.02664527370121003,
												"dt": -0.1853207988671051
											},
											"nextHandle": {
												"dv": -0.02664527370121003,
												"dt": 0.1853207988671051
											}
										},
										{
											"time": 0.22000000000000003,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.9960410845230232,
											"value": 1.3,
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
								},
								{
									"type": "curve",
									"name": "instStretch.x",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 2.1815539740246592e-16,
												"dt": -0.18535050365489164
											},
											"nextHandle": {
												"dv": 1.1102230246251565e-16,
												"dt": 0.21844688309708893
											}
										},
										{
											"time": 0.2758763907940863,
											"value": 0.8266666666666668,
											"mode": 2
										},
										{
											"time": 0.9910410845230231,
											"value": 1.126666666666667,
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
								},
								{
									"type": "curve",
									"name": "instStretch.z",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 2.1815539740246592e-16,
												"dt": -0.18535050365489164
											},
											"nextHandle": {
												"dv": 1.1102230246251565e-16,
												"dt": 0.21844688309708893
											}
										},
										{
											"time": 0.28087639079408633,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.9960410845230232,
											"value": 1.3,
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
								},
								{
									"type": "curve",
									"name": "instStretch.y",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 2.1815539740246592e-16,
												"dt": -0.18535050365489164
											},
											"nextHandle": {
												"dv": 1.1102230246251565e-16,
												"dt": 0.21844688309708893
											}
										},
										{
											"time": 0.2758763907940863,
											"value": 0.8266666666666668,
											"mode": 2
										},
										{
											"time": 0.9910410845230231,
											"value": 1.126666666666667,
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
							"type": "object",
							"name": "group",
							"enabled": false,
							"x": 0.07094888888888894,
							"y": -0.056225,
							"z": -4.6670911111111115,
							"scaleX": 3,
							"scaleY": 3,
							"scaleZ": 3,
							"children": [
								{
									"type": "emitter",
									"name": "Flare",
									"props": {
										"emitType": "Burst",
										"instScale": 70,
										"lifeTime": 2,
										"warmUpTime": -0.45
									},
									"x": -2.2936125,
									"z": 10,
									"scaleX": 0.125,
									"scaleY": 0.125,
									"scaleZ": 0.125,
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
														"alpha": 2,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_LensFlare_05.png",
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
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.003887512018776604,
																		"dt": -0.1854343232956407
																	},
																	"nextHandle": {
																		"dv": -0.01666666666666672,
																		"dt": 0.7949999999999999
																	}
																},
																{
																	"time": 0.28087639079408633,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 0,
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
													"name": "ColorMult",
													"source": "shaders/ColorMult.hx",
													"props": {
														"amount": 1,
														"color": [
															0.6627450980392157,
															0.22352941176470587,
															0.13725490196078433
														]
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 15,
														"power": 2
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
							"name": "group",
							"enabled": false,
							"x": 0.07094888888888894,
							"y": -0.056225,
							"z": 6.179278888888889,
							"scaleX": 0.5,
							"scaleY": 0.5,
							"scaleZ": 0.5,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal",
									"x": -0.07094888888888895,
									"y": 0.056225,
									"z": -10.84637,
									"scaleX": 0.8,
									"scaleY": 0.8,
									"scaleZ": 0.8,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"fadePower": 2,
									"fadeStart": 1,
									"renderMode": "BeforeTonemapping",
									"children": [
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
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 2.076553949692814e-16,
																"dt": -0.5003513053119821
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.725
															}
														},
														{
															"time": 1,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.48,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.397611644566377
															},
															"nextHandle": {
																"dv": -2.633703423021238e-16,
																"dt": 0.19808819793730628
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
													0,
													0,
													0
												]
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
						"ATTENUATE": true,
						"emissiveMap": "Fx/Gradients/z_FillOrange.png"
					}
				},
				{
					"type": "object",
					"name": "group",
					"z": 15,
					"scaleX": 0.35,
					"scaleY": 0.35,
					"scaleZ": 0.35,
					"children": [
						{
							"type": "emitter",
							"name": "Distort_Chockwave",
							"props": {
								"instScale_rand": 0,
								"maxCount": 50,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"randomColor2": [
									0.9098039215686274,
									0.615686274509804,
									1,
									0.8509803921568627
								],
								"emitRate": 10,
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									360
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
								"emitType": "Burst",
								"burstDelay": 0.3,
								"useRandomColor": true,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"warmUpTime": -1,
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instScale": 1.8,
								"alignMode": "Screen",
								"instOffset": [
									0,
									0,
									30
								],
								"lifeTime": 2
							},
							"scaleX": 0.25,
							"scaleY": 0.25,
							"scaleZ": 0.05,
							"children": [
								{
									"type": "model",
									"name": "Ring",
									"source": "Fx/Meshes_Common/DiskFlat.fbx",
									"scaleX": 200,
									"scaleY": 200,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "Distortion",
													"blend": "Alpha",
													"shadows": false,
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false,
													"culling": "None",
													"depthWrite": "On",
													"drawOrder": "-100",
													"emissive": 2.2
												}
											},
											"diffuseMap": "Fx/noise/causticTexture_03-2.png"
										},
										{
											"type": "shader",
											"name": "DistortionMap",
											"source": "shaders/DistortionMap.hx",
											"props": {
												"distortionDir": "Fx/DistortionMaps/water-normal.png",
												"intensity": 0.01
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "intensity",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.8043636363636364,
															"mode": 0,
															"prevHandle": {
																"dv": 0.5969588995728569,
																"dt": -0.2623791435549754
															},
															"nextHandle": {
																"dv": -0.5969588995728569,
																"dt": 0.2623791435549754
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.08425454545454536,
																"dt": -0.2350000000000001
															},
															"nextHandle": {
																"dv": -0.08425454545454536,
																"dt": 0.2350000000000001
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 0.5,
												"scaleY": 0.5,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": -0.01
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
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/noise/Water_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
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
													"name": "width",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.5350976805491343,
															"value": 0.9422222222222223,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.03695353771889259
															},
															"nextHandle": {
																"dv": -6.922428196740585e-16,
																"dt": 0.24478506621704163
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.5,
																"dt": -0.18500000000000005
															},
															"nextHandle": {
																"dv": -0.8474237452673484,
																"dt": 0.3135467857489186
															}
														},
														{
															"time": 2.0100000000000002,
															"value": 0,
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
									"name": "instScale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.0049999999999999975,
											"value": 0.0402048299726524,
											"mode": 0,
											"prevHandle": {
												"dv": -0.9239350146379692,
												"dt": -0.3456633226416698
											},
											"nextHandle": {
												"dv": 0.12028199966650588,
												"dt": 0.045000000000000005
											}
										},
										{
											"time": 1,
											"value": 1.0158254939343108,
											"mode": 0,
											"prevHandle": {
												"dv": -0.026729333259223442,
												"dt": -0.865
											},
											"nextHandle": {
												"dv": 0.0103433736750329,
												"dt": 0.33472657705803693
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
					"name": "LightBright",
					"z": 1.1586360000000013,
					"scaleX": 50,
					"scaleY": 50,
					"scaleZ": 20,
					"rotationZ": 89.99999999999999,
					"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
					"normalMap": "Fx/DistortionMaps/sand-normal.png",
					"fadeStart": 1,
					"emissive": 1,
					"renderMode": "BeforeTonemapping",
					"centered": false,
					"children": [
						{
							"type": "shader",
							"name": "AlphaMap",
							"source": "shaders/AlphaMap.hx",
							"props": {
								"useSourceUVs": true,
								"onDecal": true,
								"wrap": true,
								"invert": false,
								"replace": false,
								"alpha": 0.5,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Alphas/T_circle4.png"
							},
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.8454099984758421,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.12122382132456926,
												"dt": -0.4994842701051498
											},
											"nextHandle": {
												"dv": 0.033333333333333326,
												"dt": 0.13734491693339435
											}
										},
										{
											"time": 1.063913275415333,
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
											"time": 1.645,
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
									1,
									1,
									1
								]
							},
							"children": [
								{
									"type": "curve",
									"name": "color.h",
									"keys": [
										{
											"time": 0.7549999999999994,
											"value": 0.6140973294054123,
											"mode": 2
										},
										{
											"time": 1.1699999999999995,
											"value": 0.17192795616660556,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "color.s",
									"keys": [
										{
											"time": 0.7549999999999994,
											"value": 0.9310344827586208,
											"mode": 0
										},
										{
											"time": 1.1699999999999995,
											"value": 0.6568627450980391,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "color.l",
									"keys": [
										{
											"time": 0.7549999999999994,
											"value": 0.6588235294117647,
											"mode": 0
										},
										{
											"time": 1.1699999999999995,
											"value": 0.4,
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
								"sandBlend": 0.8,
								"sandColorSet": false,
								"envBlend": 0.5,
								"envColorSet": false
							}
						},
						{
							"type": "shader",
							"name": "AlphaMap",
							"source": "shaders/AlphaMap.hx",
							"enabled": false,
							"props": {
								"useSourceUVs": false,
								"onDecal": true,
								"wrap": true,
								"invert": false,
								"replace": false,
								"alpha": 2,
								"uScale": 5,
								"vScale": 5,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Alphas/sand.png"
							}
						},
						{
							"type": "shader",
							"name": "UVTransform",
							"source": "shaders/UVTransform.hx",
							"enabled": false,
							"props": {
								"scaleX": 10,
								"scaleY": 10,
								"shiftX": 0,
								"shiftY": 0,
								"shiftSpeedX": 0,
								"shiftSpeedY": 0
							}
						},
						{
							"type": "curve",
							"name": "scale",
							"keyMode": 0,
							"keys": [
								{
									"time": 0.8454099984758421,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": -0.12122382132456926,
										"dt": -0.4994842701051498
									},
									"nextHandle": {
										"dv": 0.033333333333333326,
										"dt": 0.13734491693339435
									}
								},
								{
									"time": 1.063913275415333,
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
				}
			]
		}
	]
}